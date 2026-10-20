/**
 * Mapeo entre las columnas de MySQL (snake_case) y el JSON que usa Angular (camelCase).
 * Solo los campos listados aquí se pueden escribir desde la API.
 */
const TABLAS = {
  menus: {
    tabla: 'cms_menus',
    campos: { nombre: 'nombre', ubicacion: 'ubicacion', activo: 'activo' },
    booleanos: ['activo'],
  },
  paginas: {
    tabla: 'cms_paginas',
    campos: {
      menuId: 'menu_id',
      parentId: 'parent_id',
      titulo: 'titulo',
      slug: 'slug',
      descripcion: 'descripcion',
      plantilla: 'plantilla',
      urlExterna: 'url_externa',
      icono: 'icono',
      orden: 'orden',
      visibleEnMenu: 'visible_en_menu',
      estado: 'estado',
      migradoDe: 'migrado_de',
    },
    booleanos: ['visibleEnMenu'],
  },
  entradas: {
    tabla: 'cms_entradas',
    campos: {
      paginaId: 'pagina_id',
      titulo: 'titulo',
      slug: 'slug',
      resumen: 'resumen',
      contenido: 'contenido',
      tipo: 'tipo',
      estado: 'estado',
      destacada: 'destacada',
      imagenDestacadaId: 'imagen_destacada_id',
      autor: 'autor',
      fechaPublicacion: 'fecha_publicacion',
      orden: 'orden',
      migradoDe: 'migrado_de',
    },
    booleanos: ['destacada'],
    fechas: ['fechaPublicacion'],
  },
  multimedia: {
    tabla: 'cms_multimedia',
    campos: {
      nombre: 'nombre',
      url: 'url',
      tipo: 'tipo',
      mime: 'mime',
      tamano: 'tamano',
      titulo: 'titulo',
      alt: 'alt',
      descripcion: 'descripcion',
      migradoDe: 'migrado_de',
    },
    booleanos: [],
  },
};

const CAMPOS_SISTEMA = { id: 'id', creadoEn: 'creado_en', actualizadoEn: 'actualizado_en' };

function definicion(coleccion) {
  const d = TABLAS[coleccion];
  if (!d) {
    const e = new Error('Colección no válida');
    e.status = 404;
    throw e;
  }
  return d;
}

/** Fila de MySQL → objeto JSON camelCase */
function aJson(coleccion, fila) {
  const d = definicion(coleccion);
  const out = {};
  for (const [camel, col] of Object.entries({ ...CAMPOS_SISTEMA, ...d.campos })) {
    if (!(col in fila)) continue;
    let v = fila[col];
    if (d.booleanos.includes(camel)) v = Boolean(v);
    if (v instanceof Date) v = v.toISOString();
    out[camel] = v;
  }
  return out;
}

/** Objeto JSON → { columna: valor } solo con campos permitidos */
function aFila(coleccion, json) {
  const d = definicion(coleccion);
  const fila = {};
  for (const [camel, col] of Object.entries(d.campos)) {
    if (!(camel in json)) continue;
    let v = json[camel];
    if (v === undefined) continue;
    if (v === '') v = null;
    if (d.booleanos.includes(camel)) v = v ? 1 : 0;
    if (d.fechas?.includes(camel) && v) {
      const f = new Date(v);
      v = isNaN(f.getTime()) ? null : f;
    }
    fila[col] = v;
  }
  return fila;
}

module.exports = { TABLAS, definicion, aJson, aFila };
