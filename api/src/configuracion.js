/**
 * Configuración del portal y estado del sistema.
 *   GET  /configuracion            → datos públicos (entidad y sesión)
 *   PUT  /configuracion/:clave     → guarda 'entidad' o 'sesion' (solo administradores)
 *   GET  /sistema/estado           → versión, base de datos y migraciones (con sesión)
 */
const express = require('express');
const fs = require('fs');
const path = require('path');
const { pool } = require('./db');
const { requiereSesion } = require('./auth');
const { ErrorApi } = require('./errores');
const { cargarPermisos, requiereModulo } = require('./permisos');

const rutasConfiguracion = express.Router();
const INICIO = Date.now();
const VERSION_API = require('../package.json').version;

/* ===== Validación ===== */
const texto = (v, max, campo, obligatorio = false) => {
  const s = typeof v === 'string' ? v.trim() : '';
  if (obligatorio && !s) throw new ErrorApi(400, `El campo "${campo}" es obligatorio.`);
  if (s.length > max) throw new ErrorApi(400, `El campo "${campo}" admite máximo ${max} caracteres.`);
  return s;
};
const correo = (v, campo) => {
  const s = texto(v, 150, campo, true);
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s)) throw new ErrorApi(400, `El ${campo} no es un correo válido.`);
  return s;
};
const lista = (v, max, campo) => {
  if (!Array.isArray(v)) return [];
  if (v.length > max) throw new ErrorApi(400, `La lista "${campo}" admite máximo ${max} elementos.`);
  return v;
};
const REDES = ['facebook', 'instagram', 'x', 'youtube', 'tiktok', 'linkedin'];

const VALIDADORES = {
  entidad(v = {}) {
    return {
      nombre: texto(v.nombre, 150, 'nombre de la entidad', true),
      lema: texto(v.lema, 150, 'lema'),
      direccion: texto(v.direccion, 200, 'dirección', true),
      ciudad: texto(v.ciudad, 150, 'municipio y departamento', true),
      codigoPostal: texto(v.codigoPostal, 12, 'código postal', true),
      horario: lista(v.horario, 8, 'horario').map((h) => texto(h, 150, 'horario')).filter(Boolean),
      telefonos: lista(v.telefonos, 8, 'teléfonos')
        .map((t) => ({ etiqueta: texto(t?.etiqueta, 80, 'tipo de teléfono'), numero: texto(t?.numero, 40, 'teléfono') }))
        .filter((t) => t.numero),
      lineaAnticorrupcion: texto(v.lineaAnticorrupcion, 60, 'línea anticorrupción'),
      correoInstitucional: correo(v.correoInstitucional, 'correo institucional'),
      correoJudicial: correo(v.correoJudicial, 'correo de notificaciones judiciales'),
      redes: lista(v.redes, 8, 'redes sociales')
        .map((r) => {
          const red = REDES.includes(r?.red) ? r.red : null;
          const url = texto(r?.url, 300, 'enlace de red social');
          if (!red || !url) return null;
          if (!/^https:\/\//i.test(url)) throw new ErrorApi(400, 'Los enlaces de redes sociales deben empezar por https://');
          return { red, usuario: texto(r?.usuario, 100, 'usuario de red social'), url };
        })
        .filter(Boolean),
    };
  },
  sesion(v = {}) {
    const m = Number(v.minutosInactividad);
    if (!Number.isInteger(m) || m < 5 || m > 240) {
      throw new ErrorApi(400, 'Los minutos de inactividad deben estar entre 5 y 240.');
    }
    return { minutosInactividad: m };
  },
};

/** Solo administradores (rol leído de la base de datos, no del token) */
function soloAdmin(req, _res, next) {
  cargarPermisos(req)
    .then((p) => next(p.has('configuracion') ? undefined : new ErrorApi(403, 'Solo un administrador puede cambiar la configuración.')))
    .catch(next);
}

/* ===== Lectura pública ===== */
rutasConfiguracion.get('/configuracion', async (_req, res, next) => {
  try {
    const [filas] = await pool.query('SELECT clave, valor, actualizado_por, actualizado_en FROM cms_configuracion');
    const salida = {};
    for (const f of filas) {
      if (!VALIDADORES[f.clave]) continue;
      try {
        salida[f.clave] = JSON.parse(f.valor);
      } catch {
        /* valor dañado: se ignora y el portal usa los valores por defecto */
      }
    }
    salida.actualizacion = Object.fromEntries(
      filas.map((f) => [f.clave, { por: f.actualizado_por, en: f.actualizado_en }]),
    );
    res.json(salida);
  } catch (e) {
    next(e);
  }
});

/* ===== Escritura (administradores) ===== */
rutasConfiguracion.put('/configuracion/:clave', requiereSesion, soloAdmin, async (req, res, next) => {
  try {
    const validar = VALIDADORES[req.params.clave];
    if (!validar) throw new ErrorApi(404, 'Configuración no encontrada.');
    const valor = validar(req.body);
    await pool.query(
      `INSERT INTO cms_configuracion (clave, valor, actualizado_por) VALUES (?, ?, ?)
       ON DUPLICATE KEY UPDATE valor = VALUES(valor), actualizado_por = VALUES(actualizado_por)`,
      [req.params.clave, JSON.stringify(valor), req.usuario.nombre || req.usuario.usuario],
    );
    res.json(valor);
  } catch (e) {
    next(e);
  }
});

/* ===== Estado del sistema ===== */
rutasConfiguracion.get('/sistema/estado', requiereSesion, requiereModulo('configuracion', 'resumen'), async (_req, res, next) => {
  try {
    const t0 = Date.now();
    const [[bd]] = await pool.query('SELECT VERSION() AS version, DATABASE() AS nombre, UTC_TIMESTAMP() AS hora');
    const latenciaMs = Date.now() - t0;
    const [migraciones] = await pool.query('SELECT nombre, aplicada_en FROM cms_migraciones ORDER BY nombre');
    const [[conteos]] = await pool.query(`SELECT
        (SELECT COUNT(*) FROM cms_paginas)    AS paginas,
        (SELECT COUNT(*) FROM cms_entradas)   AS entradas,
        (SELECT COUNT(*) FROM cms_multimedia) AS multimedia,
        (SELECT COUNT(*) FROM cms_usuarios WHERE activo = 1) AS usuarios`);

    const carpeta = path.join(__dirname, '..', 'migraciones');
    const archivos = fs.existsSync(carpeta) ? fs.readdirSync(carpeta).filter((f) => f.endsWith('.sql')) : [];
    const aplicadas = new Set(migraciones.map((m) => m.nombre));

    res.json({
      api: {
        version: VERSION_API,
        node: process.version,
        entorno: process.env.NODE_ENV || 'development',
        activaDesde: new Date(INICIO).toISOString(),
        horaServidor: new Date().toISOString(),
      },
      baseDatos: { ok: true, nombre: bd.nombre, version: bd.version, latenciaMs },
      migraciones: {
        aplicadas: migraciones,
        pendientes: archivos.filter((f) => !aplicadas.has(f)).sort(),
      },
      conteos,
    });
  } catch (e) {
    next(e);
  }
});

module.exports = { rutasConfiguracion };
