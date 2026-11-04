/**
 * Consultas ciudadanas en línea (participación ciudadana)
 *
 * Gobierno abierto / Ley 1757 de 2015 y MIPG. La E.S.E. publica temas
 * abiertos a consulta; la ciudadanía envía aportes con radicado
 * PC-AAAA-NNNNNN y consulta su estado con documento + radicado. El
 * consolidado de resultados y los aportes autorizados son públicos; los
 * datos personales no se publican.
 *
 * Público (portal):
 *   GET  /participacion/consultas              → consultas abiertas y cerradas
 *   GET  /participacion/consultas/:slug        → una consulta (con resultados y aportes públicos)
 *   POST /participacion/consultas/:id/aportes  → enviar un aporte
 *   POST /participacion/aportes/consulta       → estado de un aporte (documento + radicado)
 * Dashboard (módulo "participacion"):
 *   GET  /participacion/admin/consultas        → listado con conteos
 *   POST /participacion/admin/consultas        → crear
 *   GET  /participacion/admin/consultas/:id    → detalle con aportes
 *   PUT  /participacion/admin/consultas/:id    → editar (estado, fechas, resultados…)
 *   PUT  /participacion/admin/aportes/:id      → clasificar y responder un aporte
 */
const express = require('express');
const { pool, transaccion } = require('./db');
const { requiereSesion } = require('./auth');
const { requiereModulo } = require('./permisos');
const { ErrorApi } = require('./errores');
const c = require('./solicitudes-comun');

const limiteRadicar = c.limiteRadicar();
const limiteConsulta = c.limiteConsulta();

const rutasParticipacion = express.Router();

const ESTADOS_CONSULTA = ['borrador', 'abierta', 'cerrada', 'con_resultados', 'archivada'];
const NOMBRE_CONSULTA = { borrador: 'Borrador', abierta: 'Abierta', cerrada: 'Cerrada', con_resultados: 'Con resultados', archivada: 'Archivada' };
const PUBLICAS = ['abierta', 'cerrada', 'con_resultados', 'archivada']; // visibles para la ciudadanía
const ESTADOS_APORTE = ['recibido', 'en_analisis', 'incorporado', 'no_incorporado'];
const NOMBRE_APORTE = { recibido: 'Recibido', en_analisis: 'En análisis', incorporado: 'Incorporado', no_incorporado: 'No incorporado' };
const POSTURAS = ['a_favor', 'en_contra', 'neutral', 'propuesta'];
const DOCUMENTOS = ['CC', 'CE', 'TI', 'PA', 'PPT', 'NIT', 'OTRO'];
const HIST = 'part_historial';

/** Historial propio (la tabla usa aporte_id, no solicitud_id del helper común) */
async function histAporte(cx, aporteId, usuario, accion, detalle = null) {
  await cx.query(`INSERT INTO ${HIST} (aporte_id, usuario_id, usuario_nombre, accion, detalle) VALUES (?, ?, ?, ?, ?)`, [
    aporteId,
    usuario?.id ?? null,
    usuario?.nombre ?? (usuario ? null : 'Ciudadano (portal web)'),
    accion,
    detalle,
  ]);
}

const slugify = (t) =>
  String(t || '')
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '')
    .slice(0, 180) || 'consulta';

/** ¿Está recibiendo aportes ahora? (abierta y dentro del plazo) */
const recibeAportes = (f) => f.estado === 'abierta' && new Date(f.fecha_fin).getTime() >= Date.now();

function consultaJson(f, aportes) {
  return {
    id: f.id,
    titulo: f.titulo,
    slug: f.slug,
    resumen: f.resumen,
    descripcion: f.descripcion,
    categoria: f.categoria || '',
    documentoUrl: f.documento_url || '',
    documentoNombre: f.documento_nombre || '',
    fechaInicio: f.fecha_inicio,
    fechaFin: f.fecha_fin,
    estado: f.estado,
    estadoNombre: NOMBRE_CONSULTA[f.estado],
    abierta: recibeAportes(f),
    resultado: f.resultado || '',
    fechaResultado: f.fecha_resultado,
    aportes: aportes ?? undefined,
    creadoEn: f.creado_en,
    actualizadoEn: f.actualizado_en,
  };
}

/* ======================= PÚBLICO ======================= */

rutasParticipacion.get('/participacion/consultas', async (_req, res, next) => {
  try {
    const [filas] = await pool.query(
      `SELECT c.*, (SELECT COUNT(*) FROM part_aportes a WHERE a.consulta_id = c.id) AS n_aportes
         FROM part_consultas c
        WHERE c.estado IN (?)
        ORDER BY FIELD(c.estado, 'abierta') DESC, c.fecha_fin DESC, c.id DESC`,
      [PUBLICAS],
    );
    res.json(
      filas.map((f) => ({
        titulo: f.titulo,
        slug: f.slug,
        resumen: f.resumen,
        categoria: f.categoria || '',
        fechaInicio: f.fecha_inicio,
        fechaFin: f.fecha_fin,
        estado: f.estado,
        estadoNombre: NOMBRE_CONSULTA[f.estado],
        abierta: recibeAportes(f),
        tieneResultados: f.estado === 'con_resultados' && !!f.resultado,
        aportes: Number(f.n_aportes),
      })),
    );
  } catch (e) {
    next(e);
  }
});

rutasParticipacion.get('/participacion/consultas/:slug', async (req, res, next) => {
  try {
    const [[f]] = await pool.query('SELECT * FROM part_consultas WHERE slug = ? AND estado IN (?) LIMIT 1', [req.params.slug, PUBLICAS]);
    if (!f) throw new ErrorApi(404, 'La consulta no existe o aún no está publicada.');
    // Aportes públicos: solo los autorizados por la persona y ya clasificados (sin datos personales)
    const [aportes] = await pool.query(
      `SELECT postura, aporte, organizacion, estado, respuesta, creado_en
         FROM part_aportes
        WHERE consulta_id = ? AND publicar = 1 AND estado IN ('incorporado','no_incorporado')
        ORDER BY creado_en`,
      [f.id],
    );
    res.json(
      consultaJson(
        f,
        aportes.map((a) => ({
          postura: a.postura || '',
          aporte: a.aporte,
          organizacion: a.organizacion || '',
          estado: a.estado,
          estadoNombre: NOMBRE_APORTE[a.estado],
          respuesta: a.respuesta || '',
          fecha: a.creado_en,
        })),
      ),
    );
  } catch (e) {
    next(e);
  }
});

function validarAporte(body) {
  const persona = c.opcion(body.tipoPersona, ['natural', 'juridica'], 'tipo de persona', 'natural');
  const fila = {
    tipo_persona: persona,
    tipo_documento: c.opcion(body.tipoDocumento, DOCUMENTOS, 'tipo de documento', persona === 'juridica' ? 'NIT' : 'CC'),
    numero_documento: c.documento(body.numeroDocumento, 'número de documento'),
    nombre: c.texto(body.nombre, 150, persona === 'juridica' ? 'razón social' : 'nombre completo', true),
    organizacion: c.texto(body.organizacion, 150, 'organización') || null,
    correo: c.correo(body.correo, 'correo electrónico', false) || null,
    telefono: c.telefono(body.telefono, 'teléfono') || null,
    postura: body.postura ? c.opcion(body.postura, POSTURAS, 'postura') : null,
    aporte: c.texto(body.aporte, 6000, 'aporte', true),
    publicar: c.verdadero(body.publicar) ? 1 : 0,
    acepta_datos: c.verdadero(body.aceptaDatos) ? 1 : 0,
  };
  if (fila.aporte.length < 10) throw new ErrorApi(400, 'Escriba su aporte con un poco más de detalle.');
  if (!fila.acepta_datos) throw new ErrorApi(400, 'Debe autorizar el tratamiento de sus datos personales para enviar su aporte.');
  return fila;
}

rutasParticipacion.post('/participacion/consultas/:id/aportes', limiteRadicar, async (req, res, next) => {
  try {
    if (c.esRobot(req.body)) return res.status(201).json({ radicado: 'PC-0000-000000' });
    const id = Number(req.params.id);
    const [[consulta]] = await pool.query('SELECT * FROM part_consultas WHERE id = ?', [id]);
    if (!consulta || !PUBLICAS.includes(consulta.estado)) throw new ErrorApi(404, 'La consulta no existe o no está publicada.');
    if (!recibeAportes(consulta)) throw new ErrorApi(409, 'Esta consulta ya no está recibiendo aportes.');

    const fila = validarAporte(req.body || {});
    fila.consulta_id = id;
    fila.ip_origen = (req.ip || '').slice(0, 45);

    const r = await transaccion(async (cx) => {
      fila.radicado = await c.siguienteRadicado(cx, 'participacion', 'PC');
      const [ins] = await cx.query('INSERT INTO part_aportes SET ?', [fila]);
      await histAporte(cx, ins.insertId, null, 'Recibido', `Aporte enviado por el portal a la consulta «${consulta.titulo}».`);
      return { id: ins.insertId, radicado: fila.radicado };
    });
    res.status(201).json({ ...r, consulta: consulta.titulo, fechaRadicacion: new Date().toISOString() });
  } catch (e) {
    next(e);
  }
});

rutasParticipacion.post('/participacion/aportes/consulta', limiteConsulta, async (req, res, next) => {
  try {
    const documento = c.documento(req.body?.numeroDocumento, 'número de documento');
    const radicado = c.texto(req.body?.radicado, 30, 'número de radicado', true).toUpperCase().replace(/\s/g, '');
    const [[a]] = await pool.query(
      `SELECT a.*, co.titulo AS consulta_titulo, co.slug AS consulta_slug
         FROM part_aportes a JOIN part_consultas co ON co.id = a.consulta_id
        WHERE a.radicado = ? AND a.numero_documento = ? LIMIT 1`,
      [radicado, documento],
    );
    if (!a) throw new ErrorApi(404, 'No encontramos un aporte con ese documento y radicado. Revise los datos e intente de nuevo.');
    res.setHeader('Cache-Control', 'private, no-store');
    res.json({
      radicado: a.radicado,
      consulta: a.consulta_titulo,
      consultaSlug: a.consulta_slug,
      estado: a.estado,
      estadoNombre: NOMBRE_APORTE[a.estado],
      fechaRadicacion: a.creado_en,
      respuesta: ['incorporado', 'no_incorporado'].includes(a.estado) ? a.respuesta || '' : '',
    });
  } catch (e) {
    next(e);
  }
});

/* ======================= DASHBOARD ======================= */

const soloParticipacion = [requiereSesion, requiereModulo('participacion')];

rutasParticipacion.get('/participacion/admin/consultas', ...soloParticipacion, async (_req, res, next) => {
  try {
    const [filas] = await pool.query(
      `SELECT c.*, u.nombre AS creado_nombre,
              (SELECT COUNT(*) FROM part_aportes a WHERE a.consulta_id = c.id) AS n_aportes,
              (SELECT COUNT(*) FROM part_aportes a WHERE a.consulta_id = c.id AND a.estado = 'recibido') AS n_pendientes
         FROM part_consultas c LEFT JOIN cms_usuarios u ON u.id = c.creado_por
        ORDER BY c.actualizado_en DESC, c.id DESC`,
    );
    res.json(
      filas.map((f) => ({
        ...consultaJson(f),
        creadoPor: f.creado_nombre || '',
        nAportes: Number(f.n_aportes),
        nPendientes: Number(f.n_pendientes),
      })),
    );
  } catch (e) {
    next(e);
  }
});

function validarConsulta(body, parcial) {
  const fila = {};
  const set = (k, v) => {
    if (v !== undefined) fila[k] = v;
  };
  if (!parcial || body.titulo !== undefined) fila.titulo = c.texto(body.titulo, 200, 'título', true);
  if (!parcial || body.resumen !== undefined) fila.resumen = c.texto(body.resumen, 300, 'resumen', true);
  if (!parcial || body.descripcion !== undefined) fila.descripcion = c.texto(body.descripcion, 60000, 'descripción', true);
  if (!parcial || body.categoria !== undefined) set('categoria', c.texto(body.categoria, 80, 'categoría') || null);
  if (!parcial || body.documentoUrl !== undefined) set('documento_url', c.texto(body.documentoUrl, 500, 'documento') || null);
  if (!parcial || body.documentoNombre !== undefined) set('documento_nombre', c.texto(body.documentoNombre, 200, 'nombre del documento') || null);
  if (!parcial || body.fechaFin !== undefined) {
    const f = c.texto(body.fechaFin, 40, 'fecha de cierre', true);
    if (isNaN(Date.parse(f))) throw new ErrorApi(400, 'La fecha de cierre no es válida.');
    fila.fecha_fin = new Date(f);
  }
  if (body.fechaInicio !== undefined) {
    const f = c.texto(body.fechaInicio, 40, 'fecha de inicio');
    if (f && isNaN(Date.parse(f))) throw new ErrorApi(400, 'La fecha de inicio no es válida.');
    if (f) fila.fecha_inicio = new Date(f);
  }
  if (body.estado !== undefined) fila.estado = c.opcion(body.estado, ESTADOS_CONSULTA, 'estado');
  if (body.resultado !== undefined) fila.resultado = c.texto(body.resultado, 60000, 'resultado') || null;
  return fila;
}

rutasParticipacion.post('/participacion/admin/consultas', ...soloParticipacion, async (req, res, next) => {
  try {
    const fila = validarConsulta(req.body || {}, false);
    fila.estado = req.body?.estado ? c.opcion(req.body.estado, ['borrador', 'abierta'], 'estado') : 'borrador';
    fila.creado_por = req.usuario.id;
    // Slug único
    const base = slugify(req.body?.slug || fila.titulo);
    let slug = base;
    for (let i = 2; ; i++) {
      const [[x]] = await pool.query('SELECT 1 FROM part_consultas WHERE slug = ?', [slug]);
      if (!x) break;
      slug = `${base}-${i}`;
    }
    fila.slug = slug;
    const [ins] = await pool.query('INSERT INTO part_consultas SET ?', [fila]);
    const [[f]] = await pool.query('SELECT * FROM part_consultas WHERE id = ?', [ins.insertId]);
    res.status(201).json(consultaJson(f));
  } catch (e) {
    next(e);
  }
});

async function consultaConAportes(id) {
  const [[f]] = await pool.query('SELECT * FROM part_consultas WHERE id = ?', [id]);
  if (!f) throw new ErrorApi(404, 'Consulta no encontrada.');
  const [aportes] = await pool.query(
    `SELECT a.*, u.nombre AS respondido_nombre FROM part_aportes a
       LEFT JOIN cms_usuarios u ON u.id = a.respondido_por
      WHERE a.consulta_id = ? ORDER BY a.creado_en, a.id`,
    [id],
  );
  return {
    ...consultaJson(f),
    listaAportes: aportes.map(aporteJson),
  };
}

function aporteJson(a) {
  return {
    id: a.id,
    radicado: a.radicado,
    tipoPersona: a.tipo_persona,
    tipoDocumento: a.tipo_documento,
    numeroDocumento: a.numero_documento,
    nombre: a.nombre,
    organizacion: a.organizacion || '',
    correo: a.correo || '',
    telefono: a.telefono || '',
    postura: a.postura || '',
    aporte: a.aporte,
    publicar: !!a.publicar,
    estado: a.estado,
    estadoNombre: NOMBRE_APORTE[a.estado],
    respuesta: a.respuesta || '',
    fechaRespuesta: a.fecha_respuesta,
    respondidoPor: a.respondido_nombre || '',
    fechaRadicacion: a.creado_en,
  };
}

rutasParticipacion.get('/participacion/admin/consultas/:id', ...soloParticipacion, async (req, res, next) => {
  try {
    res.setHeader('Cache-Control', 'private, no-store');
    res.json(await consultaConAportes(Number(req.params.id)));
  } catch (e) {
    next(e);
  }
});

rutasParticipacion.put('/participacion/admin/consultas/:id', ...soloParticipacion, async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const [[f]] = await pool.query('SELECT * FROM part_consultas WHERE id = ?', [id]);
    if (!f) throw new ErrorApi(404, 'Consulta no encontrada.');
    const fila = validarConsulta(req.body || {}, true);
    if (fila.estado === 'con_resultados' && !(fila.resultado ?? f.resultado)) {
      throw new ErrorApi(400, 'Para publicar resultados, escriba primero el consolidado de resultados.');
    }
    if ('resultado' in fila && fila.resultado && !f.fecha_resultado) fila.fecha_resultado = new Date();
    if (Object.keys(fila).length) await pool.query('UPDATE part_consultas SET ? WHERE id = ?', [fila, id]);
    res.json(await consultaConAportes(id));
  } catch (e) {
    next(e);
  }
});

rutasParticipacion.put('/participacion/admin/aportes/:id', ...soloParticipacion, async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const b = req.body || {};
    const [[a]] = await pool.query('SELECT * FROM part_aportes WHERE id = ?', [id]);
    if (!a) throw new ErrorApi(404, 'Aporte no encontrado.');

    const cambios = {};
    const notas = [];
    if (b.estado !== undefined && b.estado !== a.estado) {
      cambios.estado = c.opcion(b.estado, ESTADOS_APORTE, 'estado');
      notas.push(['Cambio de estado', `${NOMBRE_APORTE[a.estado]} → ${NOMBRE_APORTE[cambios.estado]}`]);
    }
    if (b.respuesta !== undefined) {
      const resp = c.texto(b.respuesta, 10000, 'respuesta');
      if (resp !== (a.respuesta || '')) {
        cambios.respuesta = resp || null;
        cambios.fecha_respuesta = resp ? new Date() : null;
        cambios.respondido_por = resp ? req.usuario.id : null;
        if (resp) notas.push(['Respuesta', `${resp.slice(0, 200)}${resp.length > 200 ? '…' : ''}`]);
      }
    }
    if (b.publicar !== undefined) {
      const pub = c.verdadero(b.publicar) ? 1 : 0;
      if (pub !== a.publicar) {
        cambios.publicar = pub;
        notas.push(['Publicación', pub ? 'Aporte marcado como público' : 'Aporte retirado de lo público']);
      }
    }
    if (['incorporado', 'no_incorporado'].includes(cambios.estado) && !(cambios.respuesta ?? a.respuesta)) {
      throw new ErrorApi(400, 'Para incorporar o no incorporar un aporte, registre la respuesta o motivación.');
    }
    if (!notas.length && !Object.keys(cambios).length) {
      const [[cur]] = await pool.query('SELECT * FROM part_aportes WHERE id = ?', [id]);
      return res.json(aporteJson(cur));
    }
    await transaccion(async (cx) => {
      if (Object.keys(cambios).length) await cx.query('UPDATE part_aportes SET ? WHERE id = ?', [cambios, id]);
      for (const [accion, det] of notas) await histAporte(cx, id, req.usuario, accion, det);
    });
    const [[cur]] = await pool.query('SELECT * FROM part_aportes WHERE id = ?', [id]);
    res.json(aporteJson(cur));
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasParticipacion };
