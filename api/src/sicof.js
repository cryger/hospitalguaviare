/**
 * Canal anticorrupción — SICOF (Subsistema del Riesgo de Corrupción, Opacidad y Fraude)
 *
 * Público (portal):
 *   POST /sicof   → reporte (multipart, hasta 5 evidencias pdf/jpg/jpeg/png/webp)
 *
 * Cada reporte se guarda (radicado SICOF-AAAA-NNNNNN) y se envía de inmediato por correo
 * al Oficial de Cumplimiento (SICOF_CORREO) con las evidencias adjuntas.
 * Si el correo falla o el SMTP no está configurado, el reporte queda pendiente y se
 * reintenta cada 10 minutos. Si la persona deja su correo, recibe la constancia.
 * El reporte puede ser anónimo: no se piden nombre ni documento.
 */
const fs = require('fs');
const path = require('path');
const express = require('express');
const { pool, transaccion } = require('./db');
const { config } = require('./config');
const { ErrorApi } = require('./errores');
const correo = require('./correo');
const c = require('./solicitudes-comun');

const rutasSicof = express.Router();
const limiteReportar = c.limiteRadicar();

const TIPOS_EVENTO = [
  'Cibercrimen', 'Cohecho', 'Colusión', 'Concusión', 'Conducta irregular', 'Conflicto de interés', 'Corrupción',
  'Estafa', 'Favoritismo', 'Fraude', 'Hurto', 'Opacidad', 'Peculado', 'Piratería', 'Prevaricato por acción',
  'Prevaricato por omisión', 'Soborno', 'Tráfico de influencias', 'Vandalismo', 'Omisión de reporte a la UIAF',
];
const EXT_EVIDENCIAS = ['pdf', 'jpg', 'jpeg', 'png', 'webp'];
const MAX_INTENTOS = 12;

function validar(b) {
  const fecha = c.texto(b.fechaConocimiento, 10, 'fecha en que se dio cuenta', true);
  if (!/^\d{4}-\d{2}-\d{2}$/.test(fecha) || isNaN(Date.parse(fecha))) throw new ErrorApi(400, 'La fecha en que se dio cuenta no es válida.');
  if (Date.parse(fecha) > Date.now() + 24 * 3600 * 1000) throw new ErrorApi(400, 'La fecha en que se dio cuenta no puede ser futura.');
  return {
    descripcion: c.texto(b.descripcion, 6000, 'descripción del acto indebido', true),
    como_se_dio_cuenta: c.texto(b.comoSeDioCuenta, 2000, '¿cómo se dio cuenta?', true),
    tiempo: c.texto(b.tiempo, 200, '¿hace cuánto tiempo se viene presentando?', true),
    fecha_conocimiento: fecha,
    involucrados: c.texto(b.involucrados, 1000, 'servidores o contratistas involucrados') || null,
    area: c.texto(b.area, 300, 'área o proceso', true),
    tipo_evento: c.opcion(b.tipoEvento, TIPOS_EVENTO, 'tipo de evento'),
    correo: c.correo(b.correo, 'correo electrónico', false) || null,
  };
}

/* ===== Correos ===== */

function filaHtml(etiqueta, valor) {
  return `<tr><th style="text-align:left;vertical-align:top;padding:8px 12px;background:#f2f6fc;border:1px solid #d6e2f5;width:34%;font-weight:600">${correo.html(etiqueta)}</th>
    <td style="padding:8px 12px;border:1px solid #d6e2f5">${valor ? correo.html(valor) : '<em style="color:#6b7280">No informado</em>'}</td></tr>`;
}

function correoOficial(r, adjuntos) {
  const fecha = new Date(r.creado_en).toLocaleString('es-CO', { timeZone: 'America/Bogota', dateStyle: 'long', timeStyle: 'short' });
  const html = `<div style="font-family:Arial,Helvetica,sans-serif;color:#1f2937;max-width:720px">
  <div style="background:#004884;color:#fff;padding:16px 20px;border-radius:8px 8px 0 0">
    <div style="font-size:12px;letter-spacing:.06em;text-transform:uppercase;opacity:.85">Canal anticorrupción – SICOF</div>
    <div style="font-size:20px;font-weight:700;margin-top:4px">Nuevo reporte ${correo.html(r.radicado)}</div>
  </div>
  <div style="border:1px solid #d6e2f5;border-top:0;padding:16px 20px;border-radius:0 0 8px 8px">
    <p style="margin:0 0 12px">Se recibió un reporte por el formulario del portal web el <b>${correo.html(fecha)}</b>.</p>
    <table style="border-collapse:collapse;width:100%;font-size:14px">
      ${filaHtml('Radicado', r.radicado)}
      ${filaHtml('Tipo de evento', r.tipo_evento)}
      ${filaHtml('1. Descripción del acto indebido', r.descripcion)}
      ${filaHtml('2. ¿Cómo se dio cuenta?', r.como_se_dio_cuenta)}
      ${filaHtml('3. ¿Hace cuánto se viene presentando?', r.tiempo)}
      ${filaHtml('4. Fecha en que se dio cuenta', String(r.fecha_conocimiento).slice(0, 10))}
      ${filaHtml('5. Servidores o contratistas involucrados', r.involucrados)}
      ${filaHtml('6. Área o proceso', r.area)}
      ${filaHtml('Evidencias adjuntas', adjuntos.length ? adjuntos.map((a) => a.nombre).join('\n') : '')}
      ${filaHtml('Correo de contacto', r.correo || 'Reporte anónimo (sin correo)')}
    </table>
    ${r.correo ? '<p style="margin:12px 0 0;font-size:13px">Puede responder este correo para comunicarse con quien reportó.</p>' : ''}
    <p style="margin:16px 0 0;font-size:12px;color:#6b7280">Información reservada. Este mensaje se generó automáticamente desde el portal web de la E.S.E. Hospital San José del Guaviare.</p>
  </div></div>`;
  return {
    para: config.sicofCorreo,
    asunto: `[SICOF] Nuevo reporte ${r.radicado} – ${r.tipo_evento}`,
    html,
    texto: `Nuevo reporte SICOF ${r.radicado}\nTipo de evento: ${r.tipo_evento}\n\n${r.descripcion}`,
    responderA: r.correo || undefined,
    adjuntos: adjuntos
      .map((a) => ({ filename: a.nombre, path: path.resolve(config.privadoDir, a.ruta), contentType: a.mime }))
      .filter((a) => a.path.startsWith(config.privadoDir + path.sep) && fs.existsSync(a.path)),
  };
}

function correoConstancia(r) {
  return {
    para: r.correo,
    asunto: `Recibimos su reporte ${r.radicado} – Canal anticorrupción SICOF`,
    html: `<div style="font-family:Arial,Helvetica,sans-serif;color:#1f2937;max-width:620px">
      <h2 style="color:#004884;margin:0 0 8px">Recibimos su reporte</h2>
      <p>Su reporte por el Canal anticorrupción (SICOF) de la E.S.E. Hospital San José del Guaviare quedó registrado con el número:</p>
      <p style="font-size:22px;font-weight:700;letter-spacing:.04em;color:#004884">${correo.html(r.radicado)}</p>
      <p>El Oficial de Cumplimiento revisará la información de manera reservada. Si necesita ampliar el reporte, responda este correo indicando el número de radicado.</p>
      <p style="font-size:12px;color:#6b7280">Mensaje automático; por seguridad no incluye el contenido del reporte.</p></div>`,
    texto: `Recibimos su reporte ${r.radicado}. El Oficial de Cumplimiento lo revisará de manera reservada.`,
    responderA: config.sicofCorreo,
  };
}

/** Envía al Oficial de Cumplimiento (y la constancia a quien reportó) y deja registro del resultado */
async function notificar(id) {
  const [[r]] = await pool.query('SELECT * FROM sicof_reportes WHERE id = ?', [id]);
  if (!r || r.correo_enviado_en) return;
  const [adj] = await pool.query('SELECT nombre, ruta, mime FROM sicof_adjuntos WHERE reporte_id = ? ORDER BY id', [id]);
  const res = await correo.enviar(correoOficial(r, adj));
  if (res.enviado) {
    await pool.query('UPDATE sicof_reportes SET correo_enviado_en = UTC_TIMESTAMP(), intentos = intentos + 1, ultimo_error = NULL WHERE id = ?', [id]);
    if (r.correo && !r.constancia_enviada) {
      const c2 = await correo.enviar(correoConstancia(r));
      if (c2.enviado) await pool.query('UPDATE sicof_reportes SET constancia_enviada = 1 WHERE id = ?', [id]);
    }
  } else {
    await pool.query('UPDATE sicof_reportes SET intentos = intentos + 1, ultimo_error = ? WHERE id = ?', [String(res.error).slice(0, 500), id]);
    console.warn(`⚠ SICOF ${r.radicado}: no se pudo enviar el correo (${res.error}). Se reintentará.`);
  }
  return res.enviado;
}

/** Reintenta cada 10 minutos los reportes cuyo correo no se pudo enviar */
function iniciarReintentos() {
  const ciclo = async () => {
    try {
      const [pend] = await pool.query(
        'SELECT id FROM sicof_reportes WHERE correo_enviado_en IS NULL AND intentos < ? ORDER BY id LIMIT 20',
        [MAX_INTENTOS],
      );
      for (const p of pend) await notificar(p.id);
    } catch {
      /* la tabla aún no existe o la base no responde: se intenta en el siguiente ciclo */
    }
  };
  setTimeout(ciclo, 30 * 1000);
  setInterval(ciclo, 10 * 60 * 1000).unref();
}

/* ======================= PÚBLICO ======================= */

rutasSicof.post('/sicof', limiteReportar, c.conArchivos('sicof', EXT_EVIDENCIAS), async (req, res, next) => {
  try {
    if (c.esRobot(req.body)) {
      c.borrarSubidos(req);
      return res.status(201).json({ radicado: 'SICOF-0000-000000', correoEnviado: true });
    }
    const fila = validar(req.body || {});
    if (!c.verdadero(req.body?.declaracion)) throw new ErrorApi(400, 'Debe declarar que la información reportada es veraz.');
    fila.ip_origen = (req.ip || '').slice(0, 45);

    const { id, radicado } = await transaccion(async (cx) => {
      fila.radicado = await c.siguienteRadicado(cx, 'sicof', 'SICOF');
      const [ins] = await cx.query('INSERT INTO sicof_reportes SET ?', [fila]);
      const archivos = (req.files || []).map((f) => [
        ins.insertId,
        f.originalname.slice(0, 255),
        path.relative(config.privadoDir, f.path).split(path.sep).join('/'),
        f.mimetype,
        f.size,
      ]);
      if (archivos.length) await cx.query('INSERT INTO sicof_adjuntos (reporte_id, nombre, ruta, mime, tamano) VALUES ?', [archivos]);
      return { id: ins.insertId, radicado: fila.radicado };
    });

    // El correo se envía de inmediato; si falla, el reporte queda guardado y se reintenta
    const correoEnviado = await notificar(id).catch(() => false);
    res.status(201).json({ radicado, correoEnviado: !!correoEnviado, fecha: new Date() });
  } catch (e) {
    c.borrarSubidos(req);
    next(e);
  }
});

module.exports = { rutasSicof, iniciarReintentos, TIPOS_EVENTO };
