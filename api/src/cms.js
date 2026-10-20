const express = require('express');
const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const multer = require('multer');
const { pool, transaccion } = require('./db');
const { config } = require('./config');
const { definicion, aJson, aFila } = require('./mapeo');
const { sesionOpcional, requiereSesion } = require('./auth');
const { ErrorApi } = require('./errores');

const rutasCms = express.Router();

/* =====================================================================
   LECTURA (pública: solo lo publicado | con sesión: todo)
===================================================================== */

const CONSULTAS_PUBLICAS = {
  menus: 'SELECT * FROM cms_menus WHERE activo = 1',
  paginas: "SELECT * FROM cms_paginas WHERE estado = 'publicada'",
  entradas: `SELECT e.* FROM cms_entradas e
               JOIN cms_paginas p ON p.id = e.pagina_id AND p.estado = 'publicada'
              WHERE e.estado = 'publicada'
                AND (e.fecha_publicacion IS NULL OR e.fecha_publicacion <= UTC_TIMESTAMP())`,
};

async function listarEntradas(sql) {
  const [filas] = await pool.query(`${sql} ORDER BY orden, id`);
  if (!filas.length) return [];
  const ids = filas.map((f) => f.id);
  const [rel] = await pool.query(
    'SELECT entrada_id, multimedia_id FROM cms_entrada_multimedia WHERE entrada_id IN (?) ORDER BY orden',
    [ids],
  );
  const porEntrada = new Map();
  rel.forEach((r) => {
    if (!porEntrada.has(r.entrada_id)) porEntrada.set(r.entrada_id, []);
    porEntrada.get(r.entrada_id).push(r.multimedia_id);
  });
  return filas.map((f) => ({ ...aJson('entradas', f), multimediaIds: porEntrada.get(f.id) || [] }));
}

async function obtenerEntrada(id) {
  const lista = await listarEntradas(`SELECT * FROM cms_entradas WHERE id = ${Number(id)}`);
  return lista[0] || null;
}

rutasCms.get('/:coleccion', sesionOpcional, async (req, res, next) => {
  try {
    const col = req.params.coleccion;
    const d = definicion(col);
    const admin = !!req.usuario;

    if (col === 'entradas') {
      return res.json(await listarEntradas(admin ? 'SELECT * FROM cms_entradas' : CONSULTAS_PUBLICAS.entradas));
    }

    if (col === 'multimedia' && !admin) {
      // Visitantes: solo archivos usados por entradas publicadas
      const [filas] = await pool.query(
        `SELECT DISTINCT m.* FROM cms_multimedia m
          JOIN (
            SELECT em.multimedia_id AS id FROM cms_entrada_multimedia em JOIN (${CONSULTAS_PUBLICAS.entradas}) e ON e.id = em.entrada_id
            UNION
            SELECT e.imagen_destacada_id FROM (${CONSULTAS_PUBLICAS.entradas}) e WHERE e.imagen_destacada_id IS NOT NULL
          ) usados ON usados.id = m.id`,
      );
      return res.json(filas.map((f) => aJson(col, f)));
    }

    const sql = admin ? `SELECT * FROM ${d.tabla}` : CONSULTAS_PUBLICAS[col];
    const [filas] = await pool.query(`${sql} ORDER BY ${col === 'multimedia' ? 'creado_en DESC' : 'id'}`);
    res.json(filas.map((f) => aJson(col, f)));
  } catch (e) {
    next(e);
  }
});

/* =====================================================================
   ESCRITURA (requiere sesión)
===================================================================== */

async function obtener(col, id) {
  if (col === 'entradas') return obtenerEntrada(id);
  const d = definicion(col);
  const [filas] = await pool.query(`SELECT * FROM ${d.tabla} WHERE id = ?`, [id]);
  return filas[0] ? aJson(col, filas[0]) : null;
}

async function guardarRelacionMultimedia(cx, entradaId, ids) {
  if (!Array.isArray(ids)) return;
  await cx.query('DELETE FROM cms_entrada_multimedia WHERE entrada_id = ?', [entradaId]);
  const unicos = [...new Set(ids.map(Number).filter(Boolean))];
  if (unicos.length) {
    await cx.query('INSERT INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) VALUES ?', [
      unicos.map((m, i) => [entradaId, m, i]),
    ]);
  }
}

/** Reordenar árbol de páginas (debe ir antes de PUT /:coleccion/:id) */
rutasCms.put('/paginas/orden', requiereSesion, async (req, res, next) => {
  try {
    const cambios = Array.isArray(req.body) ? req.body : [];
    await transaccion(async (cx) => {
      for (const c of cambios) {
        await cx.query('UPDATE cms_paginas SET menu_id = ?, parent_id = ?, orden = ? WHERE id = ?', [
          c.menuId ?? null,
          c.parentId ?? null,
          Number(c.orden) || 0,
          Number(c.id),
        ]);
      }
    });
    res.status(204).end();
  } catch (e) {
    next(e);
  }
});

rutasCms.post('/:coleccion', requiereSesion, async (req, res, next) => {
  try {
    const col = req.params.coleccion;
    const d = definicion(col);
    const fila = aFila(col, req.body || {});
    if (!Object.keys(fila).length) throw new ErrorApi(400, 'No se enviaron datos.');

    const id = await transaccion(async (cx) => {
      const [r] = await cx.query(`INSERT INTO ${d.tabla} SET ?`, [fila]);
      if (col === 'entradas') await guardarRelacionMultimedia(cx, r.insertId, req.body.multimediaIds);
      return r.insertId;
    });
    res.status(201).json(await obtener(col, id));
  } catch (e) {
    next(e);
  }
});

rutasCms.put('/:coleccion/:id', requiereSesion, async (req, res, next) => {
  try {
    const col = req.params.coleccion;
    const d = definicion(col);
    const id = Number(req.params.id);
    const fila = aFila(col, req.body || {});

    // Evita que una página quede como su propia madre
    if (col === 'paginas' && fila.parent_id && Number(fila.parent_id) === id) {
      throw new ErrorApi(400, 'Una página no puede ser su propia página superior.');
    }

    const existe = await transaccion(async (cx) => {
      const [[actual]] = await cx.query(`SELECT id FROM ${d.tabla} WHERE id = ?`, [id]);
      if (!actual) return false;
      if (Object.keys(fila).length) await cx.query(`UPDATE ${d.tabla} SET ? WHERE id = ?`, [fila, id]);
      if (col === 'entradas') await guardarRelacionMultimedia(cx, id, req.body.multimediaIds);
      return true;
    });
    if (!existe) throw new ErrorApi(404, 'Registro no encontrado.');
    res.json(await obtener(col, id));
  } catch (e) {
    next(e);
  }
});

rutasCms.delete('/:coleccion/:id', requiereSesion, async (req, res, next) => {
  try {
    const col = req.params.coleccion;
    const d = definicion(col);
    const id = Number(req.params.id);
    const archivo = col === 'multimedia' ? await obtener(col, id) : null;

    await pool.query(`DELETE FROM ${d.tabla} WHERE id = ?`, [id]);

    // Borra el archivo físico si fue subido a este servidor
    if (archivo?.url && config.publicUrl && archivo.url.startsWith(`${config.publicUrl}/uploads/`)) {
      const relativo = archivo.url.slice(`${config.publicUrl}/uploads/`.length);
      const ruta = path.resolve(config.uploadDir, relativo);
      if (ruta.startsWith(config.uploadDir)) fs.promises.unlink(ruta).catch(() => {});
    }
    res.status(204).end();
  } catch (e) {
    next(e);
  }
});

/* =====================================================================
   SUBIDA DE ARCHIVOS
===================================================================== */

const EXTENSIONES = {
  imagen: ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg'],
  video: ['mp4', 'webm', 'ogv', 'mov'],
  audio: ['mp3', 'ogg', 'wav', 'm4a'],
  documento: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'odt', 'ods', 'odp', 'csv', 'txt', 'rtf'],
  otro: ['zip', 'rar'],
};

function tipoPorExtension(ext) {
  return Object.keys(EXTENSIONES).find((t) => EXTENSIONES[t].includes(ext)) || null;
}

const almacenamiento = multer.diskStorage({
  destination: (_req, _file, cb) => {
    const ahora = new Date();
    const sub = path.join(String(ahora.getFullYear()), String(ahora.getMonth() + 1).padStart(2, '0'));
    const destino = path.join(config.uploadDir, sub);
    fs.mkdirSync(destino, { recursive: true });
    cb(null, destino);
  },
  filename: (_req, file, cb) => {
    const ext = path.extname(file.originalname).toLowerCase();
    const base = path
      .basename(file.originalname, ext)
      .normalize('NFD')
      .replace(/[̀-ͯ]/g, '')
      .replace(/[^a-zA-Z0-9-_]+/g, '-')
      .slice(0, 60)
      .toLowerCase();
    cb(null, `${base || 'archivo'}-${crypto.randomBytes(4).toString('hex')}${ext}`);
  },
});

const subir = multer({
  storage: almacenamiento,
  limits: { fileSize: config.maxArchivoMb * 1024 * 1024, files: 1 },
  fileFilter: (_req, file, cb) => {
    const ext = path.extname(file.originalname).slice(1).toLowerCase();
    if (!tipoPorExtension(ext)) return cb(new ErrorApi(400, `Tipo de archivo no permitido (.${ext}).`));
    cb(null, true);
  },
});

rutasCms.post('/multimedia/upload', requiereSesion, subir.single('archivo'), async (req, res, next) => {
  try {
    if (!req.file) throw new ErrorApi(400, 'No se recibió ningún archivo.');
    const ext = path.extname(req.file.originalname).slice(1).toLowerCase();
    const relativo = path.relative(config.uploadDir, req.file.path).split(path.sep).join('/');
    const fila = {
      nombre: req.file.originalname.slice(0, 255),
      url: `${config.publicUrl}/uploads/${relativo}`,
      tipo: tipoPorExtension(ext),
      mime: req.file.mimetype,
      tamano: req.file.size,
      titulo: (req.body.titulo || path.basename(req.file.originalname, path.extname(req.file.originalname))).slice(0, 255),
      alt: (req.body.alt || '').slice(0, 255) || null,
      descripcion: req.body.descripcion || null,
    };
    const [r] = await pool.query('INSERT INTO cms_multimedia SET ?', [fila]);
    res.status(201).json(await obtener('multimedia', r.insertId));
  } catch (e) {
    if (req.file) fs.promises.unlink(req.file.path).catch(() => {});
    next(e);
  }
});

module.exports = { rutasCms };
