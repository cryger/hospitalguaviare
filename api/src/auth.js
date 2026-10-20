const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const rateLimit = require('express-rate-limit');
const { pool } = require('./db');
const { config } = require('./config');
const { ErrorApi } = require('./errores');

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
      'SELECT id, nombre, usuario, password_hash, rol, activo FROM cms_usuarios WHERE usuario = ? LIMIT 1',
      [usuario],
    );
    const u = filas[0];
    const ok = u && u.activo && (await bcrypt.compare(clave, u.password_hash));
    if (!ok) throw new ErrorApi(401, 'Usuario o contraseña incorrectos.');

    await pool.query('UPDATE cms_usuarios SET ultimo_acceso = NOW() WHERE id = ?', [u.id]);
    const datos = { id: u.id, nombre: u.nombre, usuario: u.usuario, rol: u.rol };
    const token = jwt.sign(datos, config.jwtSecret, { expiresIn: config.jwtExpira });
    res.json({ token, usuario: datos });
  } catch (e) {
    next(e);
  }
});

rutasAuth.get('/yo', requiereSesion, (req, res) => res.json({ usuario: req.usuario }));

module.exports = { rutasAuth, sesionOpcional, requiereSesion };
