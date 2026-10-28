/**
 * Usuarios del dashboard (solo administradores)
 *   GET    /usuarios          → lista (sin contraseñas)
 *   GET    /usuarios/opciones → nombres de usuarios con un módulo (para asignar casos)
 *   POST   /usuarios          → crear
 *   PUT    /usuarios/:id      → editar (la contraseña es opcional)
 *   DELETE /usuarios/:id      → eliminar
 */
const express = require('express');
const bcrypt = require('bcryptjs');
const { pool } = require('./db');
const { requiereSesion } = require('./auth');
const { requiereModulo, modulosDe, normalizarModulos, ROLES, MODULOS } = require('./permisos');
const { ErrorApi } = require('./errores');

const rutasUsuarios = express.Router();

const COLUMNAS = 'id, nombre, correo, area, usuario, rol, modulos, activo, ultimo_acceso, creado_en';

function aJson(u) {
  return {
    id: u.id,
    nombre: u.nombre,
    correo: u.correo || '',
    area: u.area || '',
    usuario: u.usuario,
    rol: u.rol,
    modulos: modulosDe(u),
    activo: !!u.activo,
    ultimoAcceso: u.ultimo_acceso,
    creadoEn: u.creado_en,
  };
}

const texto = (v, max, campo, obligatorio = false) => {
  const s = typeof v === 'string' ? v.trim() : '';
  if (obligatorio && !s) throw new ErrorApi(400, `El campo "${campo}" es obligatorio.`);
  if (s.length > max) throw new ErrorApi(400, `El campo "${campo}" admite máximo ${max} caracteres.`);
  return s;
};

function validarClave(clave) {
  if (clave.length < 8 || clave.length > 72 || !/[A-Za-z]/.test(clave) || !/\d/.test(clave)) {
    throw new ErrorApi(400, 'La contraseña debe tener entre 8 y 72 caracteres e incluir letras y números.');
  }
}

/** Valida el cuerpo y devuelve la fila a guardar */
async function filaDesde(body, esNuevo) {
  const fila = {
    nombre: texto(body.nombre, 150, 'nombre', true),
    usuario: texto(body.usuario, 80, 'usuario', true).toLowerCase(),
    correo: texto(body.correo, 150, 'correo') || null,
    area: texto(body.area, 120, 'área') || null,
    rol: String(body.rol || ''),
    activo: body.activo === false || body.activo === 0 ? 0 : 1,
  };
  if (!/^[a-z0-9._-]{3,80}$/.test(fila.usuario)) {
    throw new ErrorApi(400, 'El usuario solo admite letras minúsculas sin tildes, números, punto, guion y guion bajo (mínimo 3).');
  }
  if (fila.correo && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(fila.correo)) throw new ErrorApi(400, 'El correo no es válido.');
  if (!Object.prototype.hasOwnProperty.call(ROLES, fila.rol)) throw new ErrorApi(400, 'Seleccione un rol válido.');

  if (fila.rol === 'personalizado') {
    const mods = normalizarModulos(body.modulos);
    if (!mods.length) throw new ErrorApi(400, 'Marque al menos un módulo para el rol personalizado.');
    fila.modulos = JSON.stringify(mods);
  } else {
    fila.modulos = null;
  }

  const clave = typeof body.clave === 'string' ? body.clave : '';
  if (esNuevo || clave) {
    if (!clave) throw new ErrorApi(400, 'Ingrese una contraseña inicial.');
    validarClave(clave);
    fila.password_hash = await bcrypt.hash(clave, 10);
  }
  return fila;
}

async function adminsActivos(excluirId = 0) {
  const [[r]] = await pool.query("SELECT COUNT(*) AS n FROM cms_usuarios WHERE rol = 'admin' AND activo = 1 AND id <> ?", [
    excluirId,
  ]);
  return r.n;
}

/** Usuarios activos con un módulo (para asignar responsables). Lo usa cualquiera con ese módulo. */
rutasUsuarios.get('/usuarios/opciones', requiereSesion, async (req, res, next) => {
  try {
    const modulo = String(req.query.modulo || '');
    if (!MODULOS.includes(modulo)) throw new ErrorApi(400, 'Módulo no válido.');
    await new Promise((ok, mal) => requiereModulo(modulo)(req, res, (e) => (e ? mal(e) : ok())));
    const [filas] = await pool.query(`SELECT ${COLUMNAS} FROM cms_usuarios WHERE activo = 1 ORDER BY nombre`);
    res.json(
      filas
        .filter((u) => modulosDe(u).includes(modulo))
        .map((u) => ({ id: u.id, nombre: u.nombre, area: u.area || '' })),
    );
  } catch (e) {
    next(e);
  }
});

rutasUsuarios.get('/usuarios', requiereSesion, requiereModulo('usuarios'), async (_req, res, next) => {
  try {
    const [filas] = await pool.query(`SELECT ${COLUMNAS} FROM cms_usuarios ORDER BY activo DESC, nombre`);
    res.json(filas.map(aJson));
  } catch (e) {
    next(e);
  }
});

rutasUsuarios.post('/usuarios', requiereSesion, requiereModulo('usuarios'), async (req, res, next) => {
  try {
    const fila = await filaDesde(req.body || {}, true);
    const [r] = await pool.query('INSERT INTO cms_usuarios SET ?', [fila]);
    const [[u]] = await pool.query(`SELECT ${COLUMNAS} FROM cms_usuarios WHERE id = ?`, [r.insertId]);
    res.status(201).json(aJson(u));
  } catch (e) {
    if (e.code === 'ER_DUP_ENTRY') return next(new ErrorApi(409, 'Ya existe un usuario con ese nombre de usuario.'));
    next(e);
  }
});

rutasUsuarios.put('/usuarios/:id', requiereSesion, requiereModulo('usuarios'), async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    const [[actual]] = await pool.query('SELECT id, rol, activo FROM cms_usuarios WHERE id = ?', [id]);
    if (!actual) throw new ErrorApi(404, 'Usuario no encontrado.');
    const fila = await filaDesde(req.body || {}, false);

    // Siempre debe quedar al menos un administrador activo
    const dejaDeSerAdmin = actual.rol === 'admin' && actual.activo && (fila.rol !== 'admin' || !fila.activo);
    if (dejaDeSerAdmin && (await adminsActivos(id)) === 0) {
      throw new ErrorApi(400, 'Debe quedar al menos un administrador activo.');
    }
    if (id === req.usuario.id && (fila.rol !== 'admin' || !fila.activo)) {
      throw new ErrorApi(400, 'No puede quitarse a usted mismo el rol de administrador ni desactivarse.');
    }

    await pool.query('UPDATE cms_usuarios SET ? WHERE id = ?', [fila, id]);
    const [[u]] = await pool.query(`SELECT ${COLUMNAS} FROM cms_usuarios WHERE id = ?`, [id]);
    res.json(aJson(u));
  } catch (e) {
    if (e.code === 'ER_DUP_ENTRY') return next(new ErrorApi(409, 'Ya existe un usuario con ese nombre de usuario.'));
    next(e);
  }
});

rutasUsuarios.delete('/usuarios/:id', requiereSesion, requiereModulo('usuarios'), async (req, res, next) => {
  try {
    const id = Number(req.params.id);
    if (id === req.usuario.id) throw new ErrorApi(400, 'No puede eliminar su propio usuario.');
    const [[actual]] = await pool.query('SELECT id, rol, activo FROM cms_usuarios WHERE id = ?', [id]);
    if (!actual) throw new ErrorApi(404, 'Usuario no encontrado.');
    if (actual.rol === 'admin' && actual.activo && (await adminsActivos(id)) === 0) {
      throw new ErrorApi(400, 'Debe quedar al menos un administrador activo.');
    }
    await pool.query('DELETE FROM cms_usuarios WHERE id = ?', [id]);
    res.status(204).end();
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasUsuarios };
