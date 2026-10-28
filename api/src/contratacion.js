/**
 * Solicitudes contractuales (certificaciones de contratos)
 *
 * Público (portal):
 *   POST /contratacion                       → radicar
 *   POST /contratacion/consulta              → estado con cédula + radicado
 *                                              (o solo cédula: lista de sus solicitudes)
 *   POST /contratacion/consulta/archivo      → descargar el certificado / respuesta
 * Dashboard (módulo "contratacion"):
 *   GET  /contratacion                       → listado
 *   POST /contratacion/registrar             → radicar una recibida en ventanilla o por correo
 *   GET  /contratacion/:id                   → detalle
 *   PUT  /contratacion/:id                   → estado, responsable, nota interna
 *   POST /contratacion/:id/respuesta         → responder y adjuntar certificado(s)
 *   GET  /contratacion/:id/adjuntos/:adj     → descargar adjunto
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

const rutasContratacion = express.Router();

/** Solicitud de documentos: 10 días hábiles (Ley 1755 de 2015, art. 14) */
const PLAZO = 10;
const ESTADOS = ['radicada', 'en_tramite', 'respondida', 'rechazada'];
const NOMBRE_ESTADO = { radicada: 'Radicada', en_tramite: 'En trámite', respondida: 'Respondida', rechazada: 'Rechazada' };
const HIST = 'contr_historial';
const PRIMER_ANIO = 2015;

function aJson(f) {
  return {
    id: f.id,
    radicado: f.radicado,
    cedula: f.cedula,
    nombre: f.nombre,
    correo: f.correo,
    telefono: f.telefono,
    tipoEntrega: f.tipo_entrega,
    vigencias: f.vigencias ? String(f.vigencias).split(',').filter(Boolean).map(Number) : [],
    descripcion: f.descripcion,
    estado: f.estado,
    asignadoA: f.asignado_a,
    asignadoNombre: f.asignado_nombre || '',
    plazoDias: f.plazo_dias,
    fechaRadicacion: f.fecha_radicacion,
    fechaVencimiento: f.fecha_vencimiento,
    respuesta: f.respuesta || '',
    fechaRespuesta: f.fecha_respuesta,
    respondidoPor: f.respondido_nombre || '',
    adjuntos: Number(f.adjuntos ?? 0),
    migradoDe: f.migrado_de || '',
    actualizadoEn: f.actualizado_en,
  };
}

const SELECT_LISTA = `SELECT s.*, ua.nombre AS asignado_nombre, ur.nombre AS respondido_nombre,
    (SELECT COUNT(*) FROM contr_adjuntos a WHERE a.solicitud_id = s.id) AS adjuntos
  FROM contr_solicitudes s
  LEFT JOIN cms_usuarios ua ON ua.id = s.asignado_a
  LEFT JOIN cms_usuarios ur ON ur.id = s.respondido_por`;

function validar(body, interno) {
  const anioActual = new Date().getUTCFullYear();
  let vig = body.vigencias;
  if (typeof vig === 'string') vig = vig.split(',');
  if (!Array.isArray(vig)) vig = [];
  const vigencias = [...new Set(vig.map(Number))].filter((a) => a >= PRIMER_ANIO && a <= anioActual).sort();
  if (!vigencias.length) throw new ErrorApi(400, 'Seleccione al menos una vigencia (año del contrato).');

  const fila = {
    cedula: c.documento(body.cedula, 'número de cédula'),
    nombre: c.texto(body.nombre, 150, 'nombre completo', true),
    correo: c.correo(body.correo, 'correo electrónico'),
    telefono: c.telefono(body.telefono, 'teléfono', true),
    tipo_entrega: c.opcion(body.tipoEntrega, ['fisica', 'correo'], 'tipo de entrega'),
    vigencias: vigencias.join(','),
    descripcion: c.texto(body.descripcion, 4000, 'descripción', true),
    acepta_datos: c.verdadero(body.aceptaDatos) ? 1 : 0,
  };
  if (!interno && !fila.acepta_datos) {
    throw new ErrorApi(400, 'Debe autorizar el tratamiento de sus datos personales para radicar la solicitud.');
  }
  return fila;
}

async function radicar(req, res, next, interno) {
  try {
    if (!interno && c.esRobot(req.body)) return res.status(201).json({ radicado: 'SC-0000-000000' });
    const fila = validar(req.body || {}, interno);
    const ahora = new Date();
    fila.plazo_dias = PLAZO;
    fila.fecha_radicacion = ahora;
    fila.fecha_vencimiento = sumarDiasHabiles(ahora, PLAZO);
    fila.ip_origen = interno ? null : (req.ip || '').slice(0, 45);

    const id = await transaccion(async (cx) => {
      fila.radicado = await c.siguienteRadicado(cx, 'contratacion', 'SC');
      const [ins] = await cx.query('INSERT INTO contr_solicitudes SET ?', [fila]);
      await c.registrarHistorial(
        cx, HIST, ins.insertId, interno ? req.usuario : null, 'Radicada',
        `Solicitud de certificación (vigencias ${fila.vigencias.replace(/,/g, ', ')}) recibida por ${interno ? 'ventanilla o correo' : 'el portal web'}.`,
      );
      return ins.insertId;
    });
    res.status(201).json({
      id,
      radicado: fila.radicado,
      plazoDias: PLAZO,
      fechaRadicacion: fila.fecha_radicacion,
      fechaVencimiento: fila.fecha_vencimiento,
    });
  } catch (e) {
    next(e);
  }
}

/* ======================= PÚBLICO ======================= */

rutasContratacion.post('/contratacion', limiteRadicar, (req, res, next) => radicar(req, res, next, false));

function consultaPublica(s, adjuntos) {
  const conRespuesta = ['respondida', 'rechazada'].includes(s.estado);
  return {
    radicado: s.radicado,
    estado: s.estado,
    vigencias: s.vigencias ? String(s.vigencias).split(',').map(Number) : [],
    tipoEntrega: s.tipo_entrega,
    fechaRadicacion: s.fecha_radicacion,
    fechaVencimiento: s.fecha_vencimiento,
    fechaRespuesta: s.fecha_respuesta,
    respuesta: conRespuesta ? s.respuesta || '' : '',
    adjuntos: conRespuesta ? adjuntos.filter((a) => a.solicitud_id === s.id).map((a) => ({ id: a.id, nombre: a.nombre, tamano: a.tamano })) : [],
  };
}

rutasContratacion.post('/contratacion/consulta', limiteConsulta, async (req, res, next) => {
  try {
    const cedula = c.documento(req.body?.cedula, 'número de cédula');
    const radicado = c.texto(req.body?.radicado, 30, 'número de radicado', true).toUpperCase();
    const [filas] = await pool.query('SELECT * FROM contr_solicitudes WHERE cedula = ? AND radicado = ? LIMIT 1', [cedula, radicado]);
    if (!filas.length) {
      throw new ErrorApi(404, 'No encontramos una solicitud con esa cédula y ese radicado. Revise los datos e intente de nuevo.');
    }
    const [adj] = await pool.query("SELECT id, solicitud_id, nombre, tamano FROM contr_adjuntos WHERE solicitud_id = ? AND origen = 'respuesta' ORDER BY id", [
      filas[0].id,
    ]);
    res.json(consultaPublica(filas[0], adj));
  } catch (e) {
    next(e);
  }
});

rutasContratacion.post('/contratacion/consulta/archivo', limiteConsulta, async (req, res, next) => {
  try {
    const cedula = c.documento(req.body?.cedula, 'número de cédula');
    const radicado = c.texto(req.body?.radicado, 30, 'número de radicado', true).toUpperCase();
    const [[a]] = await pool.query(
      `SELECT a.* FROM contr_adjuntos a JOIN contr_solicitudes s ON s.id = a.solicitud_id
        WHERE a.id = ? AND a.origen = 'respuesta' AND s.cedula = ? AND s.radicado = ?
          AND s.estado IN ('respondida','rechazada')`,
      [Number(req.body?.id), cedula, radicado],
    );
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

/* ======================= DASHBOARD ======================= */

const soloContratacion = [requiereSesion, requiereModulo('contratacion')];

rutasContratacion.get('/contratacion', ...soloContratacion, async (_req, res, next) => {
  try {
    const [filas] = await pool.query(`${SELECT_LISTA} ORDER BY s.fecha_radicacion DESC, s.id DESC`);
    res.json(filas.map(aJson));
  } catch (e) {
    next(e);
  }
});

rutasContratacion.post('/contratacion/registrar', ...soloContratacion, (req, res, next) => radicar(req, res, next, true));

async function detalle(id) {
  const [[s]] = await pool.query(`${SELECT_LISTA} WHERE s.id = ?`, [id]);
  if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');
  const [adj] = await pool.query('SELECT id, origen, nombre, mime, tamano, creado_en FROM contr_adjuntos WHERE solicitud_id = ? ORDER BY id', [id]);
  const [hist] = await pool.query('SELECT id, usuario_nombre, accion, detalle, creado_en FROM contr_historial WHERE solicitud_id = ? ORDER BY creado_en, id', [id]);
  return {
    ...aJson(s),
    archivos: adj.map((a) => ({ id: a.id, origen: a.origen, nombre: a.nombre, mime: a.mime, tamano: a.tamano, creadoEn: a.creado_en })),
    historial: hist.map((h) => ({ id: h.id, usuario: h.usuario_nombre || '', accion: h.accion, detalle: h.detalle || '', fecha: h.creado_en })),
  };
}

rutasContratacion.get('/contratacion/:id', ...soloContratacion, async (req, res, next) => {
  try {
    res.json(await detalle(Number(req.params.id)));
  } catch (e) {
    next(e);
  }
});

rutasContratacion.put('/contratacion/:id', ...soloContratacion, async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const b = req.body || {};
    const [[s]] = await pool.query('SELECT * FROM contr_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');

    const cambios = {};
    const notas = [];
    if (b.estado !== undefined && b.estado !== s.estado) {
      cambios.estado = c.opcion(b.estado, ESTADOS, 'estado');
      if (cambios.estado === 'respondida' && !s.respuesta) throw new ErrorApi(400, 'Para marcarla como respondida registre primero la respuesta.');
      notas.push(['Cambio de estado', `${NOMBRE_ESTADO[s.estado]} → ${NOMBRE_ESTADO[cambios.estado]}`]);
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
      if (Object.keys(cambios).length) await cx.query('UPDATE contr_solicitudes SET ? WHERE id = ?', [cambios, id]);
      for (const [accion, det] of notas) await c.registrarHistorial(cx, HIST, id, req.usuario, accion, det);
    });
    res.json(await detalle(id));
  } catch (e) {
    next(e);
  }
});

rutasContratacion.post('/contratacion/:id/respuesta', ...soloContratacion, c.conArchivos('contratacion'), async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const respuesta = c.texto(req.body?.respuesta, 10000, 'respuesta', true);
    const rechazar = c.verdadero(req.body?.rechazar);
    const [[s]] = await pool.query('SELECT id, respuesta FROM contr_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');

    await transaccion(async (cx) => {
      await cx.query(
        'UPDATE contr_solicitudes SET respuesta = ?, fecha_respuesta = UTC_TIMESTAMP(), respondido_por = ?, estado = ? WHERE id = ?',
        [respuesta, req.usuario.id, rechazar ? 'rechazada' : 'respondida', id],
      );
      const adj = c.filasAdjuntos(req, id, 'respuesta');
      if (adj.length) await cx.query('INSERT INTO contr_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano) VALUES ?', [adj]);
      await c.registrarHistorial(
        cx, HIST, id, req.usuario, rechazar ? 'Rechazada' : s.respuesta ? 'Respuesta actualizada' : 'Respondida',
        `${respuesta.slice(0, 300)}${respuesta.length > 300 ? '…' : ''}${adj.length ? ` (${adj.length} adjunto(s))` : ''}`,
      );
    });
    res.json(await detalle(id));
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
});

rutasContratacion.get('/contratacion/:id/adjuntos/:adj', ...soloContratacion, async (req, res, next) => {
  try {
    const [[a]] = await pool.query('SELECT * FROM contr_adjuntos WHERE id = ? AND solicitud_id = ?', [
      Number(req.params.adj),
      Number(req.params.id),
    ]);
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasContratacion };
