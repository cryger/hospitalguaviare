/**
 * Solicitud de copia de historia clínica (MIPG RT-05 / RT-06)
 *
 * La historia clínica es un documento privado sometido a reserva (Ley 23 de 1981,
 * art. 34; Res. 1995 de 1999, art. 14). Por eso:
 *   - los soportes (documento de identidad, autorizaciones) y la copia se guardan en
 *     la carpeta privada y solo se entregan por la API;
 *   - la consulta pública pide documento del solicitante + radicado + código de consulta;
 *   - la copia se puede descargar durante DIAS_DESCARGA días después de la respuesta;
 *   - los correos automáticos nunca llevan la historia clínica ni datos de la atención.
 *
 * Público (portal):
 *   POST /historia-clinica                    → radicar (multipart: soportes obligatorios)
 *   POST /historia-clinica/consulta           → estado con documento + radicado + código
 *   POST /historia-clinica/consulta/archivo   → descargar la copia
 * Dashboard (módulo "historias"):
 *   GET  /historia-clinica                    → listado
 *   POST /historia-clinica/registrar          → radicar una recibida en ventanilla o por correo
 *   GET  /historia-clinica/:id                → detalle con soportes e historial
 *   PUT  /historia-clinica/:id                → estado, responsable, nota interna
 *   POST /historia-clinica/:id/respuesta      → responder y adjuntar la copia (PDF)
 *   GET  /historia-clinica/:id/adjuntos/:adj  → descargar un archivo
 */
const express = require('express');
const { pool, transaccion } = require('./db');
const { requiereSesion } = require('./auth');
const { requiereModulo } = require('./permisos');
const { ErrorApi } = require('./errores');
const { sumarDiasHabiles } = require('./dias-habiles');
const { config } = require('./config');
const correo = require('./correo');
const c = require('./solicitudes-comun');

const limiteRadicar = c.limiteRadicar();
const limiteConsulta = c.limiteConsulta();

const rutasHistoriaClinica = express.Router();

/** Solicitud de documentos: 10 días hábiles (Ley 1755 de 2015, art. 14) */
const PLAZO = 10;
/** Días calendario en que la copia queda disponible para descarga en el portal */
const DIAS_DESCARGA = 30;
const ESTADOS = ['radicada', 'en_tramite', 'respondida', 'rechazada'];
const NOMBRE_ESTADO = { radicada: 'Radicada', en_tramite: 'En trámite', respondida: 'Entregada', rechazada: 'No procede' };
const CALIDADES = {
  paciente: 'El paciente',
  representante: 'Representante legal (menor de edad o persona con apoyo judicial)',
  autorizado: 'Tercero autorizado por el paciente',
  familiar: 'Familiar (paciente fallecido)',
};
const ALCANCES = {
  completa: 'Historia clínica completa',
  epicrisis: 'Epicrisis o resumen de egreso',
  resultados: 'Resultados de laboratorio o imágenes',
  otro: 'Otros documentos',
};
const SERVICIOS = ['urgencias', 'hospitalizacion', 'consulta_externa', 'cirugia', 'materno_infantil', 'uci', 'apoyo_diagnostico'];
const DOCUMENTOS = ['CC', 'CE', 'TI', 'RC', 'PA', 'PPT', 'OTRO'];
const CANALES = ['web', 'correo', 'presencial'];
const EXT_SOPORTES = ['pdf', 'jpg', 'jpeg', 'png'];
const HIST = 'hc_historial';

const fechaIso = (d) => (d ? (d instanceof Date ? d.toISOString().slice(0, 10) : String(d).slice(0, 10)) : null);

function aJson(f) {
  return {
    id: f.id,
    radicado: f.radicado,
    calidad: f.calidad,
    tipoDocumento: f.tipo_documento,
    numeroDocumento: f.numero_documento,
    nombre: f.nombre,
    correo: f.correo,
    telefono: f.telefono,
    direccion: f.direccion || '',
    pacienteTipoDoc: f.paciente_tipo_doc || '',
    pacienteDocumento: f.paciente_documento || '',
    pacienteNombre: f.paciente_nombre || '',
    parentesco: f.parentesco || '',
    alcance: f.alcance,
    servicios: f.servicios ? String(f.servicios).split(',').filter(Boolean) : [],
    fechaDesde: fechaIso(f.fecha_desde),
    fechaHasta: fechaIso(f.fecha_hasta),
    observaciones: f.observaciones || '',
    tipoEntrega: f.tipo_entrega,
    canal: f.canal,
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
    actualizadoEn: f.actualizado_en,
  };
}

const SELECT_LISTA = `SELECT s.*, ua.nombre AS asignado_nombre, ur.nombre AS respondido_nombre,
    (SELECT COUNT(*) FROM hc_adjuntos a WHERE a.solicitud_id = s.id) AS adjuntos
  FROM hc_solicitudes s
  LEFT JOIN cms_usuarios ua ON ua.id = s.asignado_a
  LEFT JOIN cms_usuarios ur ON ur.id = s.respondido_por`;

function fecha(v, campo) {
  const s = c.texto(v, 10, campo);
  if (!s) return null;
  if (!/^\d{4}-\d{2}-\d{2}$/.test(s) || isNaN(Date.parse(s))) throw new ErrorApi(400, `La ${campo} no es una fecha válida.`);
  if (s > new Date().toISOString().slice(0, 10)) throw new ErrorApi(400, `La ${campo} no puede ser posterior a hoy.`);
  return s;
}

function validar(body, interno) {
  let serv = body.servicios;
  if (typeof serv === 'string') serv = serv.split(',');
  if (!Array.isArray(serv)) serv = [];
  const servicios = [...new Set(serv.map((x) => String(x).trim()))].filter((x) => SERVICIOS.includes(x));

  const fila = {
    calidad: c.opcion(body.calidad, Object.keys(CALIDADES), 'quién solicita', 'paciente'),
    tipo_documento: c.opcion(body.tipoDocumento, DOCUMENTOS, 'tipo de documento', 'CC'),
    numero_documento: c.documento(body.numeroDocumento, 'número de documento'),
    nombre: c.texto(body.nombre, 150, 'nombre completo', true),
    // En ventanilla la persona puede no tener correo: la respuesta se entrega en físico
    correo: c.correo(body.correo, 'correo electrónico', !interno),
    telefono: c.telefono(body.telefono, 'teléfono', true),
    direccion: c.texto(body.direccion, 200, 'dirección') || null,
    alcance: c.opcion(body.alcance, Object.keys(ALCANCES), 'documentos que necesita', 'completa'),
    servicios: servicios.join(',') || null,
    fecha_desde: fecha(body.fechaDesde, 'fecha inicial'),
    fecha_hasta: fecha(body.fechaHasta, 'fecha final'),
    observaciones: c.texto(body.observaciones, 2000, 'observaciones') || null,
    tipo_entrega: c.opcion(body.tipoEntrega, ['digital', 'fisica'], 'tipo de entrega', 'digital'),
    canal: interno ? c.opcion(body.canal, CANALES, 'canal de recepción', 'presencial') : 'web',
    acepta_datos: c.verdadero(body.aceptaDatos) ? 1 : 0,
    declara_veracidad: c.verdadero(body.declaraVeracidad) ? 1 : 0,
  };
  if (fila.fecha_desde && fila.fecha_hasta && fila.fecha_desde > fila.fecha_hasta) {
    throw new ErrorApi(400, 'La fecha inicial debe ser anterior a la fecha final.');
  }
  if (fila.alcance === 'otro' && !fila.observaciones) {
    throw new ErrorApi(400, 'Indique en observaciones qué documentos de la historia clínica necesita.');
  }
  if (fila.calidad !== 'paciente') {
    fila.paciente_tipo_doc = c.opcion(body.pacienteTipoDoc, DOCUMENTOS, 'tipo de documento del paciente', 'CC');
    fila.paciente_documento = c.documento(body.pacienteDocumento, 'número de documento del paciente');
    fila.paciente_nombre = c.texto(body.pacienteNombre, 150, 'nombre del paciente', true);
    fila.parentesco = c.texto(body.parentesco, 80, 'parentesco o relación con el paciente', true);
  }
  if (!interno) {
    if (!fila.acepta_datos) throw new ErrorApi(400, 'Debe autorizar el tratamiento de sus datos personales para radicar la solicitud.');
    if (!fila.declara_veracidad) throw new ErrorApi(400, 'Debe declarar que la información y los soportes son verídicos.');
  }
  return fila;
}

/** Soportes mínimos (Res. 1995 de 1999, art. 14) */
function validarSoportes(req, fila) {
  const n = (req.files || []).length;
  if (!n) throw new ErrorApi(400, 'Adjunte la copia de su documento de identidad.');
  if (fila.calidad !== 'paciente' && n < 2) {
    throw new ErrorApi(400, 'Adjunte su documento de identidad y el soporte que lo faculta (autorización firmada, registro civil o certificado de defunción, según el caso).');
  }
}

/* ===== Correos automáticos (sin datos clínicos) ===== */
const pie = '<p style="font-size:12px;color:#6b7280">Mensaje automático. Por la reserva de la historia clínica, este correo no incluye documentos ni datos de la atención.</p>';
const marco = (titulo, cuerpo) =>
  `<div style="font-family:Arial,Helvetica,sans-serif;color:#1f2937;max-width:620px"><h2 style="color:#004884;margin:0 0 8px">${titulo}</h2>${cuerpo}${pie}</div>`;
const enlaceConsulta = () => (config.publicUrl ? `${config.publicUrl}/solicitud-historia-clinica?consultar` : '');

function correoConstancia(s) {
  const url = enlaceConsulta();
  return {
    para: s.correo,
    asunto: `Radicamos su solicitud de copia de historia clínica ${s.radicado}`,
    html: marco('Recibimos su solicitud', `
      <p>Su solicitud de copia de historia clínica en la E.S.E. Hospital San José del Guaviare quedó radicada:</p>
      <table style="border-collapse:collapse;margin:8px 0 12px">
        <tr><td style="padding:4px 12px 4px 0">Número de radicado</td><td style="font-size:18px;font-weight:700;color:#004884">${correo.html(s.radicado)}</td></tr>
        <tr><td style="padding:4px 12px 4px 0">Código de consulta</td><td style="font-size:18px;font-weight:700;letter-spacing:.08em">${correo.html(s.codigo_consulta)}</td></tr>
      </table>
      <p>Con su número de documento, el radicado y el código puede consultar el estado${s.tipo_entrega === 'digital' ? ' y descargar la copia cuando esté lista' : ''}${url ? ` en <a href="${url}">${url}</a>` : ' en el portal web, opción «Copia de historia clínica»'}.</p>
      <p>Plazo de respuesta: ${PLAZO} días hábiles.</p>`),
    texto: `Radicado ${s.radicado} · Código de consulta ${s.codigo_consulta}. Consulte el estado en el portal web.`,
    responderA: config.hcCorreo,
  };
}

function correoArea(s, soportes) {
  return {
    para: config.hcCorreo,
    asunto: `Nueva solicitud de copia de historia clínica ${s.radicado}`,
    html: marco(`Nueva solicitud ${correo.html(s.radicado)}`, `
      <p>Se radicó por el portal web una solicitud de copia de historia clínica con ${soportes} soporte(s).</p>
      <p>Gestiónela en el dashboard del portal, módulo <b>Copias de historia clínica</b>. Vence en ${PLAZO} días hábiles.</p>`),
    texto: `Nueva solicitud ${s.radicado}. Gestiónela en el dashboard, módulo Copias de historia clínica.`,
  };
}

function correoRespuesta(s) {
  const url = enlaceConsulta();
  const entregada = s.estado === 'respondida';
  return {
    para: s.correo,
    asunto: `Respuesta a su solicitud de copia de historia clínica ${s.radicado}`,
    html: marco('Su solicitud tiene respuesta', `
      <p>La solicitud <b>${correo.html(s.radicado)}</b> ya tiene respuesta${entregada && s.tipo_entrega === 'digital'
        ? `. Puede descargar la copia durante ${DIAS_DESCARGA} días con su documento, el radicado y el código de consulta`
        : entregada ? '. Puede reclamar la copia en la oficina de Archivo de historias clínicas presentando su documento de identidad original'
        : '. Consulte el motivo en el portal con su documento, el radicado y el código de consulta'}${url ? `: <a href="${url}">${url}</a>` : '.'}</p>`),
    texto: `La solicitud ${s.radicado} tiene respuesta. Consúltela en el portal web con su documento, el radicado y el código.`,
    responderA: config.hcCorreo,
  };
}

/** Envía un correo sin detener la operación y deja constancia en el historial */
async function avisar(id, mensaje, accion) {
  const r = await correo.enviar(mensaje);
  await c
    .registrarHistorial(pool, HIST, id, { id: null, nombre: 'Sistema' }, accion, r.enviado ? `Enviado a ${mensaje.para}.` : `No se envió: ${r.error}`)
    .catch(() => {});
}

async function radicar(req, res, next, interno) {
  try {
    if (!interno && c.esRobot(req.body)) {
      c.borrarSubidos(req);
      return res.status(201).json({ radicado: 'HC-0000-000000', codigo: '00000000' });
    }
    const fila = validar(req.body || {}, interno);
    if (!interno) validarSoportes(req, fila);
    const ahora = new Date();
    fila.plazo_dias = PLAZO;
    fila.fecha_radicacion = ahora;
    fila.fecha_vencimiento = sumarDiasHabiles(ahora, PLAZO);
    fila.codigo_consulta = c.codigoConsulta();
    fila.ip_origen = interno ? null : (req.ip || '').slice(0, 45);

    const id = await transaccion(async (cx) => {
      fila.radicado = await c.siguienteRadicado(cx, 'historia_clinica', 'HC');
      const [ins] = await cx.query('INSERT INTO hc_solicitudes SET ?', [fila]);
      const adj = c.filasAdjuntos(req, ins.insertId, 'ciudadano');
      if (adj.length) await cx.query('INSERT INTO hc_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano) VALUES ?', [adj]);
      await c.registrarHistorial(
        cx, HIST, ins.insertId, interno ? req.usuario : null, 'Radicada',
        `${ALCANCES[fila.alcance]} solicitada por ${CALIDADES[fila.calidad].toLowerCase()}, recibida por ${interno ? `canal ${fila.canal}` : 'el portal web'}${adj.length ? ` con ${adj.length} soporte(s)` : ''}.`,
      );
      return ins.insertId;
    });
    res.status(201).json({
      id,
      radicado: fila.radicado,
      codigo: fila.codigo_consulta,
      plazoDias: PLAZO,
      fechaRadicacion: fila.fecha_radicacion,
      fechaVencimiento: fila.fecha_vencimiento,
    });
    // Después de responder: los correos no demoran ni impiden la radicación
    if (correo.configurado()) {
      if (fila.correo) avisar(id, correoConstancia(fila), 'Constancia por correo');
      if (!interno) avisar(id, correoArea(fila, (req.files || []).length), 'Aviso al área');
    }
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
}

/* ======================= PÚBLICO ======================= */

rutasHistoriaClinica.post('/historia-clinica', limiteRadicar, c.conArchivos('historia-clinica', EXT_SOPORTES), (req, res, next) =>
  radicar(req, res, next, false),
);

async function buscarPublica(body) {
  const documento = c.documento(body?.numeroDocumento, 'número de documento');
  const radicado = c.texto(body?.radicado, 30, 'número de radicado', true).toUpperCase().replace(/\s/g, '');
  const codigo = c.texto(body?.codigo, 12, 'código de consulta', true).toUpperCase().replace(/\s/g, '');
  const [[s]] = await pool.query('SELECT * FROM hc_solicitudes WHERE radicado = ? LIMIT 1', [radicado]);
  // Mismo mensaje si no existe o si algún dato no coincide (no revela radicados)
  if (!s || s.codigo_consulta !== codigo || s.numero_documento !== documento) {
    throw new ErrorApi(404, 'No encontramos una solicitud con esos datos. Revise el documento, el radicado y el código de consulta.');
  }
  return s;
}

/** La copia se puede descargar hasta DIAS_DESCARGA días después de la respuesta */
function descargaHasta(s) {
  if (s.estado !== 'respondida' || !s.fecha_respuesta) return null;
  return new Date(new Date(s.fecha_respuesta).getTime() + DIAS_DESCARGA * 86400000);
}

rutasHistoriaClinica.post('/historia-clinica/consulta', limiteConsulta, async (req, res, next) => {
  try {
    const s = await buscarPublica(req.body);
    const conRespuesta = ['respondida', 'rechazada'].includes(s.estado);
    const hasta = descargaHasta(s);
    const vigente = !!hasta && hasta.getTime() > Date.now();
    const [adj] = vigente
      ? await pool.query("SELECT id, nombre, tamano FROM hc_adjuntos WHERE solicitud_id = ? AND origen = 'respuesta' ORDER BY id", [s.id])
      : [[]];
    res.setHeader('Cache-Control', 'private, no-store');
    res.json({
      radicado: s.radicado,
      estado: s.estado,
      alcance: s.alcance,
      alcanceNombre: ALCANCES[s.alcance],
      tipoEntrega: s.tipo_entrega,
      fechaRadicacion: s.fecha_radicacion,
      fechaVencimiento: s.fecha_vencimiento,
      fechaRespuesta: s.fecha_respuesta,
      respuesta: conRespuesta ? s.respuesta || '' : '',
      descargaHasta: hasta,
      descargaVencida: !!hasta && !vigente,
      adjuntos: adj.map((a) => ({ id: a.id, nombre: a.nombre, tamano: a.tamano })),
    });
  } catch (e) {
    next(e);
  }
});

rutasHistoriaClinica.post('/historia-clinica/consulta/archivo', limiteConsulta, async (req, res, next) => {
  try {
    const s = await buscarPublica(req.body);
    const hasta = descargaHasta(s);
    if (!hasta || hasta.getTime() <= Date.now()) throw new ErrorApi(410, 'El plazo para descargar la copia terminó. Solicítela de nuevo.');
    const [[a]] = await pool.query("SELECT * FROM hc_adjuntos WHERE id = ? AND solicitud_id = ? AND origen = 'respuesta'", [
      Number(req.body?.id),
      s.id,
    ]);
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    await c.registrarHistorial(pool, HIST, s.id, null, 'Descarga en el portal', a.nombre).catch(() => {});
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

/* ======================= DASHBOARD ======================= */

const soloHistorias = [requiereSesion, requiereModulo('historias')];

rutasHistoriaClinica.get('/historia-clinica', ...soloHistorias, async (_req, res, next) => {
  try {
    const [filas] = await pool.query(`${SELECT_LISTA} ORDER BY s.fecha_radicacion DESC, s.id DESC`);
    res.setHeader('Cache-Control', 'private, no-store');
    res.json(filas.map(aJson));
  } catch (e) {
    next(e);
  }
});

rutasHistoriaClinica.post('/historia-clinica/registrar', ...soloHistorias, c.conArchivos('historia-clinica', EXT_SOPORTES), (req, res, next) =>
  radicar(req, res, next, true),
);

async function detalle(id) {
  const [[s]] = await pool.query(`${SELECT_LISTA} WHERE s.id = ?`, [id]);
  if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');
  const [adj] = await pool.query('SELECT id, origen, nombre, mime, tamano, creado_en FROM hc_adjuntos WHERE solicitud_id = ? ORDER BY id', [id]);
  const [hist] = await pool.query('SELECT id, usuario_nombre, accion, detalle, creado_en FROM hc_historial WHERE solicitud_id = ? ORDER BY creado_en, id', [id]);
  return {
    ...aJson(s),
    codigoConsulta: s.codigo_consulta,
    archivos: adj.map((a) => ({ id: a.id, origen: a.origen, nombre: a.nombre, mime: a.mime, tamano: a.tamano, creadoEn: a.creado_en })),
    historial: hist.map((h) => ({ id: h.id, usuario: h.usuario_nombre || '', accion: h.accion, detalle: h.detalle || '', fecha: h.creado_en })),
  };
}

rutasHistoriaClinica.get('/historia-clinica/:id', ...soloHistorias, async (req, res, next) => {
  try {
    res.setHeader('Cache-Control', 'private, no-store');
    res.json(await detalle(Number(req.params.id)));
  } catch (e) {
    next(e);
  }
});

rutasHistoriaClinica.put('/historia-clinica/:id', ...soloHistorias, async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const b = req.body || {};
    const [[s]] = await pool.query('SELECT * FROM hc_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');

    const cambios = {};
    const notas = [];
    if (b.estado !== undefined && b.estado !== s.estado) {
      cambios.estado = c.opcion(b.estado, ESTADOS, 'estado');
      if (['respondida', 'rechazada'].includes(cambios.estado) && !s.respuesta) {
        throw new ErrorApi(400, 'Para cerrar la solicitud registre primero la respuesta.');
      }
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
      if (Object.keys(cambios).length) await cx.query('UPDATE hc_solicitudes SET ? WHERE id = ?', [cambios, id]);
      for (const [accion, det] of notas) await c.registrarHistorial(cx, HIST, id, req.usuario, accion, det);
    });
    res.json(await detalle(id));
  } catch (e) {
    next(e);
  }
});

rutasHistoriaClinica.post('/historia-clinica/:id/respuesta', ...soloHistorias, c.conArchivos('historia-clinica', EXT_SOPORTES), async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const respuesta = c.texto(req.body?.respuesta, 10000, 'respuesta', true);
    const rechazar = c.verdadero(req.body?.rechazar);
    const [[s]] = await pool.query('SELECT * FROM hc_solicitudes WHERE id = ?', [id]);
    if (!s) throw new ErrorApi(404, 'Solicitud no encontrada.');
    if (!rechazar && s.tipo_entrega === 'digital' && !(req.files || []).length) {
      const [[{ n }]] = await pool.query("SELECT COUNT(*) AS n FROM hc_adjuntos WHERE solicitud_id = ? AND origen = 'respuesta'", [id]);
      if (!n) throw new ErrorApi(400, 'Adjunte la copia de la historia clínica (PDF) o marque la solicitud como «No procede».');
    }

    const estado = rechazar ? 'rechazada' : 'respondida';
    await transaccion(async (cx) => {
      await cx.query(
        'UPDATE hc_solicitudes SET respuesta = ?, fecha_respuesta = UTC_TIMESTAMP(), respondido_por = ?, estado = ? WHERE id = ?',
        [respuesta, req.usuario.id, estado, id],
      );
      const adj = c.filasAdjuntos(req, id, 'respuesta');
      if (adj.length) await cx.query('INSERT INTO hc_adjuntos (solicitud_id, origen, nombre, ruta, mime, tamano) VALUES ?', [adj]);
      await c.registrarHistorial(
        cx, HIST, id, req.usuario, rechazar ? 'No procede' : s.respuesta ? 'Respuesta actualizada' : 'Entregada',
        `${respuesta.slice(0, 300)}${respuesta.length > 300 ? '…' : ''}${adj.length ? ` (${adj.length} archivo(s))` : ''}`,
      );
    });
    const d = await detalle(id);
    res.json(d);
    if (correo.configurado() && s.correo && c.verdadero(req.body?.avisar ?? true)) avisar(id, correoRespuesta({ ...s, estado }), 'Aviso de respuesta por correo');
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
});

rutasHistoriaClinica.get('/historia-clinica/:id/adjuntos/:adj', ...soloHistorias, async (req, res, next) => {
  try {
    const [[a]] = await pool.query('SELECT * FROM hc_adjuntos WHERE id = ? AND solicitud_id = ?', [Number(req.params.adj), Number(req.params.id)]);
    if (!a) throw new ErrorApi(404, 'Archivo no encontrado.');
    c.enviarAdjunto(res, a);
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasHistoriaClinica };
