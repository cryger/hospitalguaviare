/** Diapositiva del slider (carrusel) del inicio — tabla cms_banners */
export type EstadoBanner = 'publicado' | 'borrador';

export interface Banner {
  id: number;
  /** Título opcional sobre la imagen (BDC: una línea, máx. 38 caracteres) */
  titulo: string | null;
  /** Texto opcional (BDC: máx. 90 caracteres) */
  descripcion: string | null;
  imagenUrl: string;
  /** Imagen alternativa para celulares (opcional) */
  imagenMovilUrl: string | null;
  /** Texto alternativo: obligatorio (describe la imagen o el texto que contiene) */
  alt: string;
  enlaceUrl: string | null;
  /** Texto del botón; si se deja vacío, toda la imagen es el enlace */
  textoBoton: string | null;
  nuevaPestana: boolean;
  orden: number;
  estado: EstadoBanner;
  /** Programación opcional (ISO) */
  fechaInicio: string | null;
  fechaFin: string | null;
  creadoEn?: string;
  actualizadoEn?: string;
}

/** Límites recomendados por la BDC GOV.CO v5 (carrusel) */
export const LIMITE_TITULO = 38;
export const LIMITE_DESCRIPCION = 90;
export const MEDIDA_RECOMENDADA = '1920 × 500 px';

/** ¿Está visible ahora? (publicado y dentro de su programación) */
export function bannerVigente(b: Banner, ahora = Date.now()): boolean {
  if (b.estado !== 'publicado') return false;
  if (b.fechaInicio && new Date(b.fechaInicio).getTime() > ahora) return false;
  if (b.fechaFin && new Date(b.fechaFin).getTime() < ahora) return false;
  return true;
}

export const esEnlaceExterno = (url: string | null | undefined) => !!url && /^(https?:)?\/\//i.test(url);
