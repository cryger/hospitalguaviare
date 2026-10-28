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
      categoria: 'categoria',
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
  vacantes: {
    tabla: 'cms_vacantes',
    campos: {
      titulo: 'titulo',
      tipoContrato: 'tipo_contrato',
      vacantes: 'vacantes',
      salario: 'salario',
      horario: 'horario',
      ubicacion: 'ubicacion',
      descripcion: 'descripcion',
      requisitos: 'requisitos',
      imagenUrl: 'imagen_url',
      documentoUrl: 'documento_url',
      fechaPublicacion: 'fecha_publicacion',
      fechaCierre: 'fecha_cierre',
      estado: 'estado',
      migradoDe: 'migrado_de',
    },
    booleanos: [],
    fechas: ['fechaPublicacion', 'fechaCierre'],
    json: ['requisitos'],
  },
  cotizaciones: {
    tabla: 'cms_cotizaciones',
    campos: {
      titulo: 'titulo',
      descripcion: 'descripcion',
      dependencia: 'dependencia',
      documentoUrl: 'documento_url',
      documentoNombre: 'documento_nombre',
      fechaPublicacion: 'fecha_publicacion',
      fechaCierre: 'fecha_cierre',
      estado: 'estado',
      migradoDe: 'migrado_de',
    },
    booleanos: [],
    fechas: ['fechaPublicacion', 'fechaCierre'],
  },
  eventos: {
    tabla: 'cms_eventos',
    campos: {
      titulo: 'titulo',
      descripcion: 'descripcion',
      categoria: 'categoria',
      fechaInicio: 'fecha_inicio',
      fechaFin: 'fecha_fin',
      todoElDia: 'todo_el_dia',
      lugar: 'lugar',
      modalidad: 'modalidad',
      enlace: 'enlace',
      dirigidoA: 'dirigido_a',
      responsable: 'responsable',
      estado: 'estado',
      destacado: 'destacado',
      migradoDe: 'migrado_de',
    },
    booleanos: ['todoElDia', 'destacado'],
    fechas: ['fechaInicio', 'fechaFin'],
  },
  banners: {
    tabla: 'cms_banners',
    campos: {
      titulo: 'titulo',
      descripcion: 'descripcion',
      imagenUrl: 'imagen_url',
      imagenMovilUrl: 'imagen_movil_url',
      alt: 'alt',
      enlaceUrl: 'enlace_url',
      textoBoton: 'texto_boton',
      nuevaPestana: 'nueva_pestana',
      orden: 'orden',
      estado: 'estado',
      fechaInicio: 'fecha_inicio',
      fechaFin: 'fecha_fin',
      migradoDe: 'migrado_de',
    },
    booleanos: ['nuevaPestana'],
    fechas: ['fechaInicio', 'fechaFin'],
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
    if (d.json?.includes(camel) && typeof v === 'string') {
      try {
        v = JSON.parse(v);
      } catch {
        v = v.split('\n');
      }
    }
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
    if (d.json?.includes(camel) && v !== null && typeof v !== 'string') v = JSON.stringify(v);
    if (d.fechas?.includes(camel) && v) {
      const f = new Date(v);
      v = isNaN(f.getTime()) ? null : f;
    }
    fila[col] = v;
  }
  return fila;
}

module.exports = { TABLAS, definicion, aJson, aFila };
