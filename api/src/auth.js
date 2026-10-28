const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const rateLimit = require('express-rate-limit');
const { pool } = require('./db');
const { config } = require('./config');
const { ErrorApi } = require('./errores');
const { modulosDe } = require('./permisos');

/** Lee el token si viene; no exige sesión (para GET públicos) */
function sesionOpcional(req, _res, next) {
  const h = req.get('authorization') || '';
  const token = h.startsWith('Bearer ') ? h.slice(7) : null;
  if (token) {
    try {
      req.usuario = jwt.verify(token, config.jwtSecret);
    } catch {
      /* token inválido o vencido: se trata como visitante */
    }
  }
  next();
}

/** Exige sesión válida */
function requiereSesion(req, _res, next) {
  sesionOpcional(req, _res, () => {
    if (!req.usuario) return next(new ErrorApi(401, 'Sesión expirada o no válida. Inicie sesión de nuevo.'));
    next();
  });
}

const limiteLogin = rateLimit({
  windowMs: 15 * 60 * 1000,
  limit: 10,
  standardHeaders: 'draft-7',
  legacyHeaders: false,
  message: { mensaje: 'Demasiados intentos. Espere 15 minutos e intente de nuevo.' },
});

const rutasAuth = express.Router();

rutasAuth.post('/login', limiteLogin, async (req, res, next) => {
  try {
    const usuario = String(req.body?.usuario || '').trim();
    const clave = String(req.body?.clave || '');
    if (!usuario || !clave) throw new ErrorApi(400, 'Ingrese usuario y contraseña.');

    const [filas] = await pool.query(
      'SELECT id, nombre, usuario, password_hash, rol, modulos, activo FROM cms_usuarios WHERE usuario = ? LIMIT 1',
      [usuario],
    );
    const u = filas[0];
    const ok = u && u.activo && (await bcrypt.compare(clave, u.password_hash));
    if (!ok) throw new ErrorApi(401, 'Usuario o contraseña incorrectos.');

    await pool.query('UPDATE cms_usuarios SET ultimo_acceso = NOW() WHERE id = ?', [u.id]);
    const datos = { id: u.id, nombre: u.nombre, usuario: u.usuario, rol: u.rol };
    const token = jwt.sign(datos, config.jwtSecret, { expiresIn: config.jwtExpira });
    // Los módulos no van en el token: la API los consulta en cada petición
    res.json({ token, usuario: { ...datos, modulos: modulosDe(u) } });
  } catch (e) {
    next(e);
  }
});

rutasAuth.get('/yo', requiereSesion, async (req, res, next) => {
  try {
    const [filas] = await pool.query(
      'SELECT id, nombre, usuario, correo, area, rol, modulos, activo, ultimo_acceso, creado_en FROM cms_usuarios WHERE id = ? LIMIT 1',
      [req.usuario.id],
    );
    const u = filas[0];
    if (!u || !u.activo) throw new ErrorApi(401, 'Sesión expirada o no válida. Inicie sesión de nuevo.');
    res.json({
      usuario: {
        id: u.id,
        nombre: u.nombre,
        usuario: u.usuario,
        correo: u.correo,
        area: u.area,
        rol: u.rol,
        modulos: modulosDe(u),
        ultimoAcceso: u.ultimo_acceso,
        creadoEn: u.creado_en,
        sesionVence: req.usuario.exp ? new Date(req.usuario.exp * 1000).toISOString() : null,
      },
    });
  } catch (e) {
    next(e);
  }
});

/** Cambiar la contraseña del usuario que inició sesión */
rutasAuth.put('/clave', requiereSesion, limiteLogin, async (req, res, next) => {
  try {
    const actual = String(req.body?.actual || '');
    const nueva = String(req.body?.nueva || '');
    if (!actual || !nueva) throw new ErrorApi(400, 'Ingrese la contraseña actual y la nueva.');
    if (nueva.length < 8 || nueva.length > 72 || !/[A-Za-z]/.test(nueva) || !/\d/.test(nueva)) {
      throw new ErrorApi(400, 'La nueva contraseña debe tener entre 8 y 72 caracteres e incluir letras y números.');
    }
    if (nueva === actual) throw new ErrorApi(400, 'La nueva contraseña debe ser diferente de la actual.');

    const [filas] = await pool.query('SELECT password_hash FROM cms_usuarios WHERE id = ? AND activo = 1 LIMIT 1', [req.usuario.id]);
    if (!filas[0] || !(await bcrypt.compare(actual, filas[0].password_hash))) {
      throw new ErrorApi(400, 'La contraseña actual no es correcta.');
    }
    const hash = await bcrypt.hash(nueva, 10);
    await pool.query('UPDATE cms_usuarios SET password_hash = ? WHERE id = ?', [hash, req.usuario.id]);
    res.json({ ok: true });
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasAuth, sesionOpcional, requiereSesion };
