/**
 * PQRSFD — peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias
 *
 * Público (portal):
 *   POST /pqrsfd                      → radicar (multipart, hasta 5 adjuntos)
 *   POST /pqrsfd/consulta             → estado con radicado + código de consulta
 *   POST /pqrsfd/consulta/archivo     → descargar un adjunto de la respuesta
 * Dashboard (módulo "pqrsfd"):
 *   GET  /pqrsfd                      → listado
 *   POST /pqrsfd/registrar            → radicar una recibida por otro canal (correo, ventanilla…)
 *   GET  /pqrsfd/:id                  → detalle con adjuntos e historial
 *   PUT  /pqrsfd/:id                  → estado, dependencia, responsable, nota interna
 *   POST /pqrsfd/:id/respuesta        → responder (multipart)
 *   GET  /pqrsfd/:id/adjuntos/:adj    → descargar adjunto
 */
const express = require('express');
const { pool, transaccion } = require('./db');
const { requiereSesion } = require('./auth');
const { requiereModulo } = require('./permisos');
const { ErrorApi } = require('./errores');
const { sumarDiasHabiles } = require('./dias-habiles');
const c = require('./solicitudes-comun');

const limiteRadicar = c.limiteRadicar();
const limiteConsulta = c.limiteConsulta();

const rutasPqrsfd = express.Router();

/** Plazos de respuesta en días hábiles (Ley 1755 de 2015, art. 14) */
const TIPOS = {
  peticion: { nombre: 'Petición', plazo: 15 },
  queja: { nombre: 'Queja', plazo: 15 },
  reclamo: { nombre: 'Reclamo', plazo: 15 },
  sugerencia: { nombre: 'Sugerencia', plazo: 15 },
  felicitacion: { nombre: 'Felicitación', plazo: 15 },
  denuncia: { nombre: 'Denuncia', plazo: 15 },
  informacion: { nombre: 'Solicitud de información o documentos', plazo: 10 },
  consulta: { nombre: 'Consulta', plazo: 30 },
};
const ESTADOS = ['radicada', 'en_tramite', 'respondida', 'cerrada', 'trasladada'];
const CANALES = ['web', 'correo', 'telefono', 'presencial', 'buzon'];
const DOCUMENTOS = ['CC', 'CE', 'TI', 'RC', 'PA', 'PPT', 'NIT', 'OTRO'];
const HIST = 'pqrsfd_historial';

function aJson(f) {
  return {
    id: f.id,
    radicado: f.radicado,
    tipo: f.tipo,
    anonimo: !!f.anonimo,
    tipoPersona: f.tipo_persona,
    tipoDocumento: f.tipo_documento || '',
    numeroDocumento: f.numero_documento || '',
    nombre: f.nombre || '',
    correo: f.correo || '',
    telefono: f.telefono || '',
    direccion: f.direccion || '',
    municipio: f.municipio || '',
    grupoPoblacional: f.grupo_poblacional || '',
    medioRespuesta: f.medio_respuesta,
    canal: f.canal,
    asunto: f.asunto,
    mensaje: f.mensaje,
    estado: f.estado,
    area: f.area || '',
    asignadoA: f.asignado_a,
    asignadoNombre: f.asignado_nombre || '',
    plazoDias: f.plazo_dias,
    fechaRadicacion: f.fecha_radicacion,
    fechaVencimiento: f.fecha_vencimiento,
    respuesta: f.respuesta || '',
    fechaRespuesta: f.fecha_respuesta,
    respondidoPor: f.respondido_nombre || '',
    adjuntos: Number(f.adjuntos ?? 0),
    actualizadoEn: f.actualizado_en,
  };
}

const SELECT_LISTA = `SELECT s.*, ua.nombre AS asignado_nombre, ur.nombre AS respondido_nombre,
    (SELECT COUNT(*) FROM pqrsfd_adjuntos a WHERE a.solicitud_id = s.id) AS adjuntos
  FROM pqrsfd_solicitudes s
  LEFT JOIN cms_usuarios ua ON ua.id = s.asignado_a
  LEFT JOIN cms_usuarios ur ON ur.id = s.respondido_por`;

/** Valida los datos del formulario */
function validar(body, interno) {
  const tipo = c.opcion(body.tipo, Object.keys(TIPOS), 'tipo de solicitud');
  const anonimo = c.verdadero(body.anonimo);
  if (anonimo && !['queja', 'reclamo', 'sugerencia', 'felicitacion', 'denuncia'].includes(tipo)) {
    throw new ErrorApi(400, 'Las peticiones, consultas y solicitudes de información requieren identificarse para poder responderle.');
  }
  const fila = {
    tipo,
    anonimo: anonimo ? 1 : 0,
    tipo_persona: c.opcion(body.tipoPersona, ['natural', 'juridica'], 'tipo de persona', 'natural'),
    tipo_documento: anonimo ? null : c.opcion(body.tipoDocumento, DOCUMENTOS, 'tipo de documento'),
    numero_documento: anonimo ? null : c.documento(body.numeroDocumento, 'número de documento'),
    nombre: anonimo ? null : c.texto(body.nombre, 150, 'nombre o razón social', true),
    correo: c.correo(body.correo, 'correo electrónico', false) || null,
    telefono: c.telefono(body.telefono, 'teléfono') || null,
    direccion: c.texto(body.direccion, 200, 'dirección') || null,
    municipio: c.texto(body.municipio, 100, 'municipio') || null,
    grupo_poblacional: c.texto(body.grupoPoblacional, 80, 'grupo poblacional') || null,
    medio_respuesta: c.opcion(body.medioRespuesta, ['correo', 'fisica'], 'medio de respuesta', 'correo'),
    canal: interno ? c.opcion(body.canal, CANALES, 'canal de recepción', 'presencial') : 'web',
    asunto: c.texto(body.asunto, 200, 'asunto', true),
    mensaje: c.texto(body.mensaje, 8000, 'descripción', true),
    acepta_datos: c.verdadero(body.aceptaDatos) ? 1 : 0,
  };
  if (!anonimo && fila.medio_respuesta === 'correo' && !fila.correo) {
    throw new ErrorApi(400, 'Ingrese un correo electrónico para enviarle la respuesta, o elija respuesta física.');
  }
  if (!anonimo && fila.medio_respuesta === 'fisica' && !fila.direccion) {
    throw new ErrorApi(400, 'Ingrese la dirección donde quiere recibir la respuesta.');
  }
  if (!interno && !fila.acepta_datos) {
    throw new ErrorApi(400, 'Debe autorizar el tratamiento de sus datos personales para radicar la solicitud.');
  }
  if (fila.mensaje.length < 10) throw new ErrorApi(400, 'Describa su solicitud con un poco más de detalle.');
  return fila;
}

/** Radica (público o interno) */
async function radicar(req, res, next, interno) {
  try {
    if (!interno && c.esRobot(req.body)) {
      c.borrarSubidos(req);
      return res.status(201).json({ radicado: 'PQRSFD-0000-000000', codigo: '00000000' });
    }
    const fila = validar(req.body || {}, interno);
    const plazo = TIPOS[fila.tipo].plazo;
    const ahora = new Date();
    fila.plazo_dias = plazo;
    fila.fecha_radicacion = ahora;
    fila.fecha_vencimiento = sumarDiasHabiles(ahora, plazo);
    fila.codigo_consulta = c.codigoConsulta();
    fila.ip_origen = interno ? null : (req.ip || '').slice(0, 45);

    const r = await transaccion(async (cx) => {
      fila.radicado = await c.siguienteRadicado(cx, 'pqrsfd', 'PQRSFD');
      const [ins] = await cx.query('INSERT INTO pqrsfd_solicitudes SET ?', [fila]);
      const adj = c.filasAdjuntos(req, ins.insertId, 'ciudadano');
      if (adj.length) await cx.query('INSERT INTO pqrsfd_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano) VALUES ?', [adj]);
      await c.registrarHistorial(
        cx, HIST, ins.insertId, interno ? req.usuario : null, 'Radicada',
        `${TIPOS[fila.tipo].nombre} recibida por ${interno ? `canal ${fila.canal}` : 'el portal web'}${adj.length ? ` con ${adj.length} adjunto(s)` : ''}.`,
      );
      return ins.insertId;
    });
    res.status(201).json({
      id: r,
      radicado: fila.radicado,
      codigo: fila.codigo_consulta,
      tipo: fila.tipo,
      tipoNombre: TIPOS[fila.tipo].nombre,
      plazoDias: plazo,
      fechaRadicacion: fila.fecha_radicacion,
      fechaVencimiento: fila.fecha_vencimiento,
    });
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
}

/* ======================= PÚBLICO ======================= */

rutasPqrsfd.post('/pqrsfd', limiteRadicar, c.conArchivos('pqrsfd'), (req, res, next) => radicar(req, res, next, false));

async function buscarPorCodigo(body) {
  const radicado = c.texto(body?.radicado, 30, 'número de radicado', true).toUpperCase();
  const codigo = c.texto(body?.codigo, 12, 'código de consulta', true).toUpperCase().replace(/\s/g, '');
  const [[s]] = await pool.query('SELECT * FROM pqrsfd_solicitudes WHERE radicado = ? LIMIT 1', [radicado]);
  // Mismo mensaje si no existe o si el código no coincide (no revela radicados)
  if (!s || s.codigo_consulta !== codigo) {
    throw new ErrorApi(404, 'No encontramos una solicitud con ese radicado y código. Revise los datos e intente de nuevo.');
  }
  return s;
}

rutasPqrsfd.post('/pqrsfd/consulta', limiteConsulta, async (req, res, next) => {
  try {
    const s = await buscarPorCodigo(req.body);
    const conRespuesta = ['respondida', 'cerrada'].includes(s.estado);
    const [adj] = conRespuesta
      ? await pool.query("SELECT id, nombre, tamano FROM pqrsfd_adjuntos WHERE solicitud_id = ? AND origen = 'respuesta' ORDER BY id", [s.id])
      : [[]];
    res.json({
      radicado: s.radicado,
      tipo: s.tipo,
      tipoNombre: TIPOS[s.tipo].nombre,
      asunto: s.asunto,
      estado: s.estado,
      fechaRadicacion: s.fecha_radicacion,
      fechaVencimiento: s.fecha_vencimiento,
      fechaRespuesta: s.fecha_respuesta,
      respuesta: conRespuesta ? s.respuesta : '',
      adjuntos: adj.map((a) => ({ id: a.id, nombre: a.nombre, tamano: a.tamano })),
    });
  } catch (e) {
    next(e);
  }
});

rutasPqrsfd.post('/pqrsfd/consulta/archivo', limiteConsulta, async (req, res, next) => {
  try {
    const s = await buscarPorCodigo(req.body);
    const [[a]] = await pool.query("SELECT * FROM pqrsfd_adjuntos WHERE id = ? AND solicitud_id = ? AND origen = 'respuesta'", [
      Number(req.body?.id),
      s.id,
    ]);
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

/* ======================= DASHBOARD ======================= */

const soloPqrsfd = [requiereSesion, requiereModulo('pqrsfd')];

rutasPqrsfd.get('/pqrsfd', ...soloPqrsfd, async (_req, res, next) => {
  try {
    const [filas] = await pool.query(`${SELECT_LISTA} ORDER BY s.fecha_radicacion DESC, s.id DESC`);
    res.json(filas.map(aJson));
  } catch (e) {
    next(e);
  }
});

rutasPqrsfd.post('/pqrsfd/registrar', ...soloPqrsfd, c.conArchivos('pqrsfd'), (req, res, next) => radicar(req, res, next, true));

async function detalle(id) {
  const [[s]] = await pool.query(`${SELECT_LISTA} WHERE s.id = ?`, [id]);
  if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');
  const [adj] = await pool.query('SELECT id, origen, nombre, mime, tamano, creado_en FROM pqrsfd_adjuntos WHERE solicitud_id = ? ORDER BY id', [id]);
  const [hist] = await pool.query('SELECT id, usuario_nombre, accion, detalle, creado_en FROM pqrsfd_historial WHERE solicitud_id = ? ORDER BY creado_en, id', [id]);
  return {
    ...aJson(s),
    codigoConsulta: s.codigo_consulta,
    archivos: adj.map((a) => ({ id: a.id, origen: a.origen, nombre: a.nombre, mime: a.mime, tamano: a.tamano, creadoEn: a.creado_en })),
    historial: hist.map((h) => ({ id: h.id, usuario: h.usuario_nombre || '', accion: h.accion, detalle: h.detalle || '', fecha: h.creado_en })),
  };
}

rutasPqrsfd.get('/pqrsfd/:id', ...soloPqrsfd, async (req, res, next) => {
  try {
    res.json(await detalle(Number(req.params.id)));
  } catch (e) {
    next(e);
  }
});

const NOMBRE_ESTADO = { radicada: 'Radicada', en_tramite: 'En trámite', respondida: 'Respondida', cerrada: 'Cerrada', trasladada: 'Trasladada por competencia' };

rutasPqrsfd.put('/pqrsfd/:id', ...soloPqrsfd, async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const b = req.body || {};
    const [[s]] = await pool.query('SELECT * FROM pqrsfd_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');

    const cambios = {};
    const notas = [];
    if (b.estado !== undefined && b.estado !== s.estado) {
      cambios.estado = c.opcion(b.estado, ESTADOS, 'estado');
      if (cambios.estado === 'respondida' && !s.respuesta) throw new ErrorApi(400, 'Para marcarla como respondida registre primero la respuesta.');
      notas.push(['Cambio de estado', `${NOMBRE_ESTADO[s.estado]} → ${NOMBRE_ESTADO[cambios.estado]}`]);
    }
    if (b.area !== undefined && (b.area || null) !== s.area) {
      cambios.area = c.texto(b.area, 120, 'dependencia') || null;
      notas.push(['Dependencia', cambios.area ? `Asignada a ${cambios.area}` : 'Sin dependencia']);
    }
    if (b.asignadoA !== undefined && (Number(b.asignadoA) || null) !== s.asignado_a) {
      const nuevo = Number(b.asignadoA) || null;
      let nombre = 'Sin responsable';
      if (nuevo) {
        const [[u]] = await pool.query('SELECT nombre FROM cms_usuarios WHERE id = ? AND activo = 1', [nuevo]);
        if (!u) throw new ErrorApi(400, 'El responsable seleccionado no existe o está inactivo.');
        nombre = u.nombre;
      }
      cambios.asignado_a = nuevo;
      notas.push(['Responsable', nombre]);
    }
    const nota = c.texto(b.nota, 2000, 'nota interna');
    if (nota) notas.push(['Nota interna', nota]);
    if (!notas.length) return res.json(await detalle(id));

    await transaccion(async (cx) => {
      if (Object.keys(cambios).length) await cx.query('UPDATE pqrsfd_solicitudes SET ? WHERE id = ?', [cambios, id]);
      for (const [accion, det] of notas) await c.registrarHistorial(cx, HIST, id, req.usuario, accion, det);
    });
    res.json(await detalle(id));
  } catch (e) {
    next(e);
  }
});

rutasPqrsfd.post('/pqrsfd/:id/respuesta', ...soloPqrsfd, c.conArchivos('pqrsfd'), async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const respuesta = c.texto(req.body?.respuesta, 10000, 'respuesta', true);
    const cerrar = c.verdadero(req.body?.cerrar);
    const [[s]] = await pool.query('SELECT id, estado, respuesta FROM pqrsfd_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');

    await transaccion(async (cx) => {
      await cx.query(
        'UPDATE pqrsfd_solicitudes SET respuesta = ?, fecha_respuesta = UTC_TIMESTAMP(), respondido_por = ?, estado = ? WHERE id = ?',
        [respuesta, req.usuario.id, cerrar ? 'cerrada' : 'respondida', id],
      );
      const adj = c.filasAdjuntos(req, id, 'respuesta');
      if (adj.length) await cx.query('INSERT INTO pqrsfd_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano) VALUES ?', [adj]);
      await c.registrarHistorial(
        cx, HIST, id, req.usuario, s.respuesta ? 'Respuesta actualizada' : 'Respondida',
        `${respuesta.slice(0, 300)}${respuesta.length > 300 ? '…' : ''}${adj.length ? ` (${adj.length} adjunto(s))` : ''}${cerrar ? ' · Caso cerrado.' : ''}`,
      );
    });
    res.json(await detalle(id));
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
});

rutasPqrsfd.get('/pqrsfd/:id/adjuntos/:adj', ...soloPqrsfd, async (req, res, next) => {
  try {
    const [[a]] = await pool.query('SELECT * FROM pqrsfd_adjuntos WHERE id = ? AND solicitud_id = ?', [
      Number(req.params.adj),
      Number(req.params.id),
    ]);
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasPqrsfd, TIPOS_PQRSFD: TIPOS };
