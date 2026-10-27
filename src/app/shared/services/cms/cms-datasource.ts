import { Observable } from 'rxjs';
import { CmsMultimedia } from '../../models/cms/cms.models';

export type CmsColeccion = 'menus' | 'paginas' | 'entradas' | 'multimedia' | 'vacantes' | 'cotizaciones' | 'eventos';

export interface CambioOrdenPagina {
  id: number;
  menuId: number | null;
  parentId: number | null;
  orden: number;
}

export interface MetaArchivo {
  titulo?: string;
  alt?: string;
  descripcion?: string;
}

/**
 * Contrato de acceso a datos del CMS.
 * Hay dos implementaciones: CmsLocalDataSource (localStorage) y CmsHttpDataSource (API).
 */
export abstract class CmsDataSource {
  abstract listar<T>(coleccion: CmsColeccion): Observable<T[]>;
  abstract crear<T>(coleccion: CmsColeccion, data: Partial<T>): Observable<T>;
  abstract actualizar<T>(coleccion: CmsColeccion, id: number, data: Partial<T>): Observable<T>;
  abstract eliminar(coleccion: CmsColeccion, id: number): Observable<void>;
  abstract reordenarPaginas(cambios: CambioOrdenPagina[]): Observable<void>;
  abstract subirArchivo(archivo: File, meta?: MetaArchivo): Observable<CmsMultimedia>;
  /** Registra un recurso externo (YouTube, enlace a documento) sin subir archivo */
  abstract registrarUrl(data: Partial<CmsMultimedia>): Observable<CmsMultimedia>;
}

export function tipoDesdeMime(mime: string, nombre = ''): CmsMultimedia['tipo'] {
  if (mime.startsWith('image/')) return 'imagen';
  if (mime.startsWith('video/')) return 'video';
  if (mime.startsWith('audio/')) return 'audio';
  if (
    mime === 'application/pdf' ||
    mime.includes('word') ||
    mime.includes('excel') ||
    mime.includes('spreadsheet') ||
    mime.includes('presentation') ||
    mime.startsWith('text/') ||
    /\.(pdf|docx?|xlsx?|pptx?|odt|ods|csv|txt)$/i.test(nombre)
  ) {
    return 'documento';
  }
  return 'otro';
}
