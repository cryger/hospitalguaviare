/**
 * Envío de correos (SMTP) — nodemailer
 * Se configura con las variables SMTP_* del archivo .env.
 * Si no hay SMTP configurado, enviar() responde { enviado: false } sin lanzar error:
 * el módulo que llama decide si reintenta más tarde.
 */
const nodemailer = require('nodemailer');
const { config } = require('./config');

let transporte = null;

function configurado() {
  return !!(config.smtp.host && config.smtp.remitente);
}

function obtenerTransporte() {
  if (!transporte) {
    transporte = nodemailer.createTransport({
      host: config.smtp.host,
      port: config.smtp.port,
      secure: config.smtp.seguro,
      auth: config.smtp.usuario ? { user: config.smtp.usuario, pass: config.smtp.clave } : undefined,
      connectionTimeout: 15000,
      greetingTimeout: 15000,
      socketTimeout: 30000,
    });
  }
  return transporte;
}

/**
 * @param {{ para: string, asunto: string, html: string, texto?: string, responderA?: string,
 *           adjuntos?: { filename: string, path: string, contentType?: string }[] }} m
 * @returns {Promise<{ enviado: boolean, error?: string }>}
 */
async function enviar(m) {
  if (!configurado()) return { enviado: false, error: 'SMTP no configurado (variables SMTP_* del .env)' };
  try {
    await obtenerTransporte().sendMail({
      from: config.smtp.remitente,
      to: m.para,
      subject: m.asunto,
      html: m.html,
      text: m.texto,
      replyTo: m.responderA || undefined,
      attachments: m.adjuntos || [],
    });
    return { enviado: true };
  } catch (e) {
    return { enviado: false, error: e.message };
  }
}

/** Escapa texto para insertarlo en el HTML del correo */
function html(v) {
  return String(v ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/\n/g, '<br>');
}

module.exports = { enviar, configurado, html };
