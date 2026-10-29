/* =====================================================================
   CMS — Modelo de contenido
   Menú  →  Páginas  →  Entradas  →  Multimedia
   (refleja database/cms-schema.sql; la API devuelve camelCase)
===================================================================== */

export type UbicacionMenu = 'principal' | 'superior' | 'pie' | 'lateral';
export type EstadoPagina = 'publicada' | 'borrador' | 'oculta';
export type PlantillaPagina = 'contenido' | 'listado' | 'documentos' | 'galeria' | 'enlace' | 'calendario' | 'historia' | 'servicios' | 'organigrama' | 'sedes' | 'plataforma' | 'directorio';
export type TipoEntrada = 'articulo' | 'noticia' | 'documento' | 'evento' | 'servicio' | 'enlace';
export type EstadoEntrada = 'publicada' | 'borrador' | 'archivada';
export type TipoMultimedia = 'imagen' | 'video' | 'documento' | 'audio' | 'otro';

export interface CmsMenu {
  id: number;
  nombre: string;
  ubicacion: UbicacionMenu;
  activo: boolean;
}

export interface CmsPagina {
  id: number;
  menuId: number | null;
  parentId: number | null;
  titulo: string;
  slug: string;
  descripcion?: string;
  plantilla: PlantillaPagina;
  urlExterna?: string;
  icono?: string;
  orden: number;
  visibleEnMenu: boolean;
  estado: EstadoPagina;
  migradoDe?: string;
  creadoEn: string;
  actualizadoEn: string;
}

export interface CmsEntrada {
  id: number;
  paginaId: number;
  titulo: string;
  slug: string;
  resumen?: string;
  contenido?: string; // HTML
  tipo: TipoEntrada;
  /** Ej. Comunicados, Resoluciones: filtro lateral de Noticias */
  categoria?: string | null;
  /** Ícono nativo GOV.CO ("govco:<nombre>"), usado en las tarjetas de servicios */
  icono?: string | null;
  estado: EstadoEntrada;
  destacada: boolean;
  imagenDestacadaId: number | null;
  multimediaIds: number[]; // orden = posición en el arreglo
  autor?: string;
  fechaPublicacion: string | null;
  orden: number;
  migradoDe?: string;
  creadoEn: string;
  actualizadoEn: string;
}

export interface CmsMultimedia {
  id: number;
  nombre: string;
  url: string;
  tipo: TipoMultimedia;
  mime?: string;
  tamano?: number;
  titulo?: string;
  alt?: string;
  descripcion?: string;
  migradoDe?: string;
  creadoEn: string;
}

/** Nodo de árbol para pintar menús con submenús */
export interface CmsPaginaNodo {
  pagina: CmsPagina;
  nivel: number;
  hijos: CmsPaginaNodo[];
}

/* ===== Catálogos para selects / etiquetas ===== */

export const UBICACIONES_MENU: { valor: UbicacionMenu; etiqueta: string }[] = [
  { valor: 'principal', etiqueta: 'Menú principal' },
  { valor: 'superior', etiqueta: 'Barra superior' },
  { valor: 'pie', etiqueta: 'Pie de página' },
  { valor: 'lateral', etiqueta: 'Lateral' },
];

export const PLANTILLAS_PAGINA: { valor: PlantillaPagina; etiqueta: string; ayuda: string }[] = [
  { valor: 'contenido', etiqueta: 'Contenido', ayuda: 'Muestra las entradas como texto corrido (ej. Misión y visión).' },
  { valor: 'listado', etiqueta: 'Listado / blog', ayuda: 'Tarjetas con resumen e imagen (ej. Noticias).' },
  { valor: 'documentos', etiqueta: 'Documentos', ayuda: 'Tabla de archivos descargables (ej. Transparencia, Normatividad).' },
  { valor: 'galeria', etiqueta: 'Galería', ayuda: 'Cuadrícula de imágenes y videos.' },
  { valor: 'enlace', etiqueta: 'Enlace', ayuda: 'Solo redirige a una URL (interna o externa).' },
  {
    valor: 'historia',
    etiqueta: 'Reseña histórica',
    ayuda: 'Portada, línea de tiempo y galería. La 1.ª entrada es la introducción (su imagen destacada es la portada y sus imágenes adjuntas, la galería). Las entradas cuyo título empieza por un año o por «Hoy» (ej. «1990 · Abre la sede») son los hitos; su imagen destacada es la foto del hito.',
  },
  {
    valor: 'servicios',
    etiqueta: 'Portafolio de servicios',
    ayuda: 'Tarjetas con imagen agrupadas por categoría (ej. Urgencias, Internación). Las entradas marcadas «Destacar en portada» se muestran en «Nuestros servicios» del inicio.',
  },
  {
    valor: 'organigrama',
    etiqueta: 'Organigrama',
    ayuda: 'Árbol visual de la estructura orgánica. Cada dependencia es una entrada con su nivel (Dirección, Gerencia, Asesoría, Control, Subgerencias) e ícono; las entradas con archivos se ofrecen para descargar.',
  },
  {
    valor: 'sedes',
    etiqueta: 'Sedes y horarios',
    ayuda: 'Entradas del grupo «Sede» (resumen = dirección; contenido = lista «Etiqueta: valor» con teléfonos y correos y, opcional, «Coordenadas: lat, lng») se muestran con mapa. Las del grupo «Horario» (resumen = «Lunes a viernes 7:00-12:00, 14:00-18:00; Sábados 8:00-13:00» o «Todos los días 24 horas») muestran si está abierto ahora.',
  },
  {
    valor: 'plataforma',
    etiqueta: 'Plataforma estratégica',
    ayuda: 'Misión y visión destacadas (con sus ejes como etiquetas y el año meta de la visión), valores y principios en tarjetas con ícono, y objetivos, funciones y deberes en listas numeradas. Cada entrada indica su «Sección»; las listas se escriben con viñetas «Nombre: descripción».',
  },
  {
    valor: 'directorio',
    etiqueta: 'Directorio institucional',
    ayuda: 'Las entradas del grupo «Líneas principales» se destacan arriba (conmutador, urgencias, PQRSFD, notificaciones judiciales). Las demás son dependencias con buscador y filtro por área (el grupo). Contenido = líneas «Correo: …», «Teléfono: …», «Celular: …» o «WhatsApp: …»; se vuelven enlaces.',
  },
  { valor: 'calendario', etiqueta: 'Calendario de eventos', ayuda: 'Muestra el calendario institucional (los eventos se administran en Contenido › Calendario de eventos).' },
];

export const TIPOS_ENTRADA: { valor: TipoEntrada; etiqueta: string; icono: string }[] = [
  { valor: 'articulo', etiqueta: 'Artículo', icono: '📝' },
  { valor: 'noticia', etiqueta: 'Noticia', icono: '📰' },
  { valor: 'documento', etiqueta: 'Documento', icono: '📄' },
  { valor: 'evento', etiqueta: 'Evento', icono: '📅' },
  { valor: 'servicio', etiqueta: 'Servicio', icono: '🩺' },
  { valor: 'enlace', etiqueta: 'Enlace', icono: '🔗' },
];

export const ICONOS_MULTIMEDIA: Record<TipoMultimedia, string> = {
  imagen: '🖼️',
  video: '🎬',
  documento: '📄',
  audio: '🎧',
  otro: '📦',
};
