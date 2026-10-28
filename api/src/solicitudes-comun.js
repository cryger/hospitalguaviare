/**
 * Utilidades compartidas por los módulos de solicitudes ciudadanas
 * (PQRSFD y solicitudes contractuales): radicado, adjuntos privados,
 * validación e historial.
 */
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const multer = require('multer');
const rateLimit = require('express-rate-limit');
const { config } = require('./config');
const { ErrorApi } = require('./errores');

/* ===== Radicado consecutivo por año (seguro ante peticiones simultáneas) ===== */
async function siguienteRadicado(cx, serie, prefijo) {
  const anio = Number(new Date(Date.now() - 5 * 3600 * 1000).toISOString().slice(0, 4)); // año en Bogotá
  await cx.query(
    `INSERT INTO cms_consecutivos (serie, anio, valor) VALUES (?, ?, LAST_INSERT_ID(1))
     ON DUPLICATE KEY UPDATE valor = LAST_INSERT_ID(valor + 1)`,
    [serie, anio],
  );
  const [[r]] = await cx.query('SELECT LAST_INSERT_ID() AS n');
  return `${prefijo}-${anio}-${String(r.n).padStart(6, '0')}`;
}

/** Código de consulta: 8 caracteres sin letras ambiguas (0/O, 1/I/L) */
function codigoConsulta() {
  const abc = 'ABCDEFGHJKMNPQRSTUVWXYZ23456789';
  const b = crypto.randomBytes(8);
  return [...b].map((x) => abc[x % abc.length]).join('');
}

/* ===== Validación ===== */
const texto = (v, max, campo, obligatorio = false) => {
  const s = typeof v === 'string' ? v.trim() : v == null ? '' : String(v).trim();
  if (obligatorio && !s) throw new ErrorApi(400, `El campo "${campo}" es obligatorio.`);
  if (s.length > max) throw new ErrorApi(400, `El campo "${campo}" admite máximo ${max} caracteres.`);
  return s;
};
const correo = (v, campo, obligatorio = true) => {
  const s = texto(v, 150, campo, obligatorio);
  if (s && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s)) throw new ErrorApi(400, `El ${campo} no es un correo válido.`);
  return s;
};
const documento = (v, campo, obligatorio = true) => {
  const s = texto(v, 20, campo, obligatorio).replace(/[\s.]/g, '');
  if (s && !/^[0-9A-Za-z-]{4,20}$/.test(s)) throw new ErrorApi(400, `El ${campo} solo admite números, letras y guion.`);
  return s;
};
const telefono = (v, campo, obligatorio = false) => {
  const s = texto(v, 30, campo, obligatorio);
  if (s && !/^[0-9+()\s-]{7,30}$/.test(s)) throw new ErrorApi(400, `El ${campo} no es válido.`);
  return s;
};
const opcion = (v, opciones, campo, porDefecto) => {
  const s = typeof v === 'string' ? v.trim() : '';
  if (!s && porDefecto !== undefined) return porDefecto;
  if (!opciones.includes(s)) throw new ErrorApi(400, `Seleccione un valor válido en "${campo}".`);
  return s;
};
const verdadero = (v) => v === true || v === 1 || v === '1' || v === 'true' || v === 'on';

/* ===== Adjuntos privados (no se publican: se entregan solo por la API) ===== */
const EXT_PERMITIDAS = ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx', 'xls', 'xlsx', 'odt', 'ods'];
const MAX_MB = 10;
const MAX_ARCHIVOS = 5;

function subidaPrivada(carpeta) {
  const almacenamiento = multer.diskStorage({
    destination: (_req, _file, cb) => {
      const ahora = new Date();
      const destino = path.join(config.privadoDir, carpeta, String(ahora.getUTCFullYear()), String(ahora.getUTCMonth() + 1).padStart(2, '0'));
      fs.mkdirSync(destino, { recursive: true });
      cb(null, destino);
    },
    filename: (_req, file, cb) => {
      const ext = path.extname(file.originalname).toLowerCase();
      cb(null, `${Date.now()}-${crypto.randomBytes(8).toString('hex')}${ext}`);
    },
  });
  return multer({
    storage: almacenamiento,
    limits: { fileSize: MAX_MB * 1024 * 1024, files: MAX_ARCHIVOS, fields: 40 },
    fileFilter: (_req, file, cb) => {
      const ext = path.extname(file.originalname).slice(1).toLowerCase();
      if (!EXT_PERMITIDAS.includes(ext)) {
        return cb(new ErrorApi(400, `Tipo de archivo no permitido (.${ext}). Use PDF, imagen JPG/PNG, Word o Excel.`));
      }
      cb(null, true);
    },
  }).array('archivos', MAX_ARCHIVOS);
}

/** Middleware multer que convierte sus errores en mensajes claros */
function conArchivos(carpeta) {
  const subir = subidaPrivada(carpeta);
  return (req, res, next) =>
    subir(req, res, (err) => {
      if (!err) return next();
      if (err.code === 'LIMIT_FILE_SIZE') return next(new ErrorApi(413, `Cada archivo puede pesar máximo ${MAX_MB} MB.`));
      if (err.code === 'LIMIT_FILE_COUNT' || err.code === 'LIMIT_UNEXPECTED_FILE') {
        return next(new ErrorApi(400, `Puede adjuntar máximo ${MAX_ARCHIVOS} archivos.`));
      }
      next(err);
    });
}

function filasAdjuntos(req, solicitudId, origen) {
  return (req.files || []).map((f) => [
    solicitudId,
    origen,
    f.originalname.slice(0, 255),
    path.relative(config.privadoDir, f.path).split(path.sep).join('/'),
    f.mimetype,
    f.size,
  ]);
}

function borrarSubidos(req) {
  (req.files || []).forEach((f) => fs.promises.unlink(f.path).catch(() => {}));
}

/** Envía un adjunto privado como descarga */
function enviarAdjunto(res, adjunto) {
  const ruta = path.resolve(config.privadoDir, adjunto.ruta);
  if (!ruta.startsWith(config.privadoDir + path.sep) || !fs.existsSync(ruta)) {
    throw new ErrorApi(404, 'El archivo ya no está disponible.');
  }
  res.setHeader('Cache-Control', 'private, no-store');
  res.download(ruta, adjunto.nombre);
}

/* ===== Límites para formularios públicos ===== */
/** Cada módulo tiene su propio contador (por IP) */
const limiteRadicar = () =>
  rateLimit({
    windowMs: 60 * 60 * 1000,
    limit: 10,
    standardHeaders: 'draft-7',
    legacyHeaders: false,
    message: { mensaje: 'Ha enviado demasiadas solicitudes. Intente de nuevo en una hora.' },
  });
const limiteConsulta = () =>
  rateLimit({
    windowMs: 15 * 60 * 1000,
    limit: 30,
    standardHeaders: 'draft-7',
    legacyHeaders: false,
    message: { mensaje: 'Demasiadas consultas. Espere 15 minutos e intente de nuevo.' },
  });

/** Campo trampa anti-robots: si viene lleno, se rechaza en silencio */
function esRobot(body) {
  return typeof body?.sitioWeb === 'string' && body.sitioWeb.trim() !== '';
}

async function registrarHistorial(cx, tabla, solicitudId, usuario, accion, detalle = null) {
  await cx.query(`INSERT INTO ${tabla} (solicitud_id, usuario_id, usuario_nombre, accion, detalle) VALUES (?, ?, ?, ?, ?)`, [
    solicitudId,
    usuario?.id ?? null,
    usuario?.nombre ?? (usuario ? null : 'Ciudadano (portal web)'),
    accion,
    detalle,
  ]);
}

module.exports = {
  siguienteRadicado,
  codigoConsulta,
  texto,
  correo,
  documento,
  telefono,
  opcion,
  verdadero,
  conArchivos,
  filasAdjuntos,
  borrarSubidos,
  enviarAdjunto,
  limiteRadicar,
  limiteConsulta,
  esRobot,
  registrarHistorial,
  MAX_MB,
  MAX_ARCHIVOS,
};
