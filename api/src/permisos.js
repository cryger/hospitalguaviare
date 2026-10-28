/**
 * Roles y permisos por módulo del dashboard.
 * El rol "admin" ve todo. Los demás roles traen un grupo fijo de módulos;
 * el rol "personalizado" usa los módulos que marque el administrador.
 * "usuarios" y "configuracion" son exclusivos del administrador.
 */
const { pool } = require('./db');
const { ErrorApi } = require('./errores');

const MODULOS = [
  'resumen',        // Inicio del dashboard (indicadores generales)
  'contenido',      // Menús, páginas, entradas y multimedia
  'slider',
  'eventos',
  'cotizaciones',
  'vacantes',
  'pqrsfd',
  'contratacion',
  'accesibilidad',
  'usuarios',
  'configuracion',
];

const SOLO_ADMIN = ['usuarios', 'configuracion'];

const ROLES = {
  admin: MODULOS,
  editor: ['resumen', 'contenido', 'slider', 'eventos', 'cotizaciones', 'vacantes', 'accesibilidad'],
  pqrsfd: ['pqrsfd'],
  contratacion: ['contratacion'],
  personalizado: null, // se toman de la columna modulos
};

function leerJson(v) {
  if (Array.isArray(v)) return v;
  try {
    const r = JSON.parse(v || '[]');
    return Array.isArray(r) ? r : [];
  } catch {
    return [];
  }
}

/** Limpia una lista de módulos que viene del formulario */
function normalizarModulos(lista) {
  return [...new Set(leerJson(lista).map(String))].filter((m) => MODULOS.includes(m) && !SOLO_ADMIN.includes(m));
}

/** Módulos efectivos de un usuario (fila de cms_usuarios o payload) */
function modulosDe(u) {
  if (!u) return [];
  const fijo = ROLES[u.rol];
  if (fijo) return [...fijo];
  return normalizarModulos(u.modulos);
}

/** Lee el usuario actualizado de la base de datos (permisos al día, aunque el token sea anterior) */
async function cargarPermisos(req) {
  if (req.permisos) return req.permisos;
  if (!req.usuario?.id) return new Set();
  const [filas] = await pool.query('SELECT id, nombre, usuario, rol, modulos, activo FROM cms_usuarios WHERE id = ? LIMIT 1', [
    req.usuario.id,
  ]);
  const u = filas[0];
  if (!u || !u.activo) throw new ErrorApi(401, 'Sesión expirada o no válida. Inicie sesión de nuevo.');
  req.usuario = { ...req.usuario, nombre: u.nombre, rol: u.rol };
  req.permisos = new Set(modulosDe(u));
  return req.permisos;
}

/** ¿El usuario tiene al menos uno de los módulos? (no lanza error) */
async function tieneModulo(req, ...mods) {
  if (!req.usuario) return false;
  try {
    const p = await cargarPermisos(req);
    return mods.some((m) => p.has(m));
  } catch {
    return false; // usuario desactivado: se trata como visitante
  }
}

/** Middleware: exige sesión y al menos uno de los módulos indicados */
function requiereModulo(...mods) {
  return async (req, _res, next) => {
    try {
      if (!req.usuario) throw new ErrorApi(401, 'Sesión expirada o no válida. Inicie sesión de nuevo.');
      const p = await cargarPermisos(req);
      if (!mods.some((m) => p.has(m))) {
        throw new ErrorApi(403, 'Su usuario no tiene permiso para este módulo.');
      }
      next();
    } catch (e) {
      next(e);
    }
  };
}

module.exports = { MODULOS, ROLES, SOLO_ADMIN, modulosDe, normalizarModulos, cargarPermisos, tieneModulo, requiereModulo };
