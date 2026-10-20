import { inject, Injectable } from '@angular/core';
import { Observable, defer, of, throwError } from 'rxjs';
import { CMS_CONFIG } from './cms-config';
import {
  CambioOrdenPagina,
  CmsColeccion,
  CmsDataSource,
  MetaArchivo,
  tipoDesdeMime,
} from './cms-datasource';
import { CmsEntrada, CmsMenu, CmsMultimedia, CmsPagina } from '../../models/cms/cms.models';

/**
 * Implementación en localStorage para trabajar el admin sin backend.
 * Emula las reglas de la BD (cascadas y SET NULL) para que el
 * comportamiento sea el mismo cuando se cambie a la API.
 *
 * ⚠️ localStorage tiene ~5 MB: los archivos se guardan como base64
 * y solo sirven para pruebas. Para producción usar modo 'api'.
 */
@Injectable()
export class CmsLocalDataSource extends CmsDataSource {
  private config = inject(CMS_CONFIG);
  private prefijo = 'cms-';
  private limiteLocalMb = 2;

  constructor() {
    super();
    this.sembrarSiVacio();
  }

  /* ===== Helpers de almacenamiento ===== */
  private leer<T>(c: CmsColeccion): T[] {
    try {
      return JSON.parse(localStorage.getItem(this.prefijo + c) || '[]');
    } catch {
      return [];
    }
  }

  private escribir<T>(c: CmsColeccion, data: T[]): void {
    try {
      localStorage.setItem(this.prefijo + c, JSON.stringify(data));
    } catch (e) {
      throw new Error(
        'Se llenó el almacenamiento local del navegador. Elimine archivos de la biblioteca o conecte la API.',
      );
    }
  }

  private nuevoId(lista: { id: number }[]): number {
    return lista.reduce((max, x) => Math.max(max, x.id), 0) + 1;
  }

  private ahora(): string {
    return new Date().toISOString();
  }

  /* ===== CRUD ===== */
  listar<T>(c: CmsColeccion): Observable<T[]> {
    return of(this.leer<T>(c));
  }

  crear<T>(c: CmsColeccion, data: Partial<T>): Observable<T> {
    return defer(() => {
      const lista = this.leer<any>(c);
      const item = { ...data, id: this.nuevoId(lista), creadoEn: this.ahora(), actualizadoEn: this.ahora() };
      lista.push(item);
      this.escribir(c, lista);
      return of(item as T);
    });
  }

  actualizar<T>(c: CmsColeccion, id: number, data: Partial<T>): Observable<T> {
    return defer(() => {
      const lista = this.leer<any>(c);
      const i = lista.findIndex((x) => x.id === id);
      if (i === -1) return throwError(() => new Error('Registro no encontrado'));
      lista[i] = { ...lista[i], ...data, id, actualizadoEn: this.ahora() };
      this.escribir(c, lista);
      return of(lista[i] as T);
    });
  }

  eliminar(c: CmsColeccion, id: number): Observable<void> {
    return defer(() => {
      this.escribir(c, this.leer<any>(c).filter((x) => x.id !== id));

      // Reglas equivalentes a las FOREIGN KEY de MySQL
      if (c === 'menus') {
        this.escribir('paginas', this.leer<CmsPagina>('paginas').map((p) => (p.menuId === id ? { ...p, menuId: null } : p)));
      }
      if (c === 'paginas') {
        this.escribir('paginas', this.leer<CmsPagina>('paginas').map((p) => (p.parentId === id ? { ...p, parentId: null } : p)));
        this.escribir('entradas', this.leer<CmsEntrada>('entradas').filter((e) => e.paginaId !== id));
      }
      if (c === 'multimedia') {
        this.escribir(
          'entradas',
          this.leer<CmsEntrada>('entradas').map((e) => ({
            ...e,
            imagenDestacadaId: e.imagenDestacadaId === id ? null : e.imagenDestacadaId,
            multimediaIds: (e.multimediaIds || []).filter((m) => m !== id),
          })),
        );
      }
      return of(void 0);
    });
  }

  reordenarPaginas(cambios: CambioOrdenPagina[]): Observable<void> {
    return defer(() => {
      const mapa = new Map(cambios.map((c) => [c.id, c]));
      const paginas = this.leer<CmsPagina>('paginas').map((p) => {
        const c = mapa.get(p.id);
        return c ? { ...p, menuId: c.menuId, parentId: c.parentId, orden: c.orden } : p;
      });
      this.escribir('paginas', paginas);
      return of(void 0);
    });
  }

  subirArchivo(archivo: File, meta: MetaArchivo = {}): Observable<CmsMultimedia> {
    const limite = Math.min(this.limiteLocalMb, this.config.maxArchivoMb);
    if (archivo.size > limite * 1024 * 1024) {
      return throwError(
        () => new Error(`En modo local el límite es ${limite} MB por archivo. "${archivo.name}" es más grande.`),
      );
    }
    return new Observable<CmsMultimedia>((sub) => {
      const lector = new FileReader();
      lector.onload = () => {
        this.crear<CmsMultimedia>('multimedia', {
          nombre: archivo.name,
          url: String(lector.result),
          tipo: tipoDesdeMime(archivo.type, archivo.name),
          mime: archivo.type,
          tamano: archivo.size,
          titulo: meta.titulo || archivo.name.replace(/\.[^.]+$/, ''),
          alt: meta.alt || '',
          descripcion: meta.descripcion || '',
        }).subscribe({ next: (m) => (sub.next(m), sub.complete()), error: (e) => sub.error(e) });
      };
      lector.onerror = () => sub.error(new Error('No se pudo leer el archivo'));
      lector.readAsDataURL(archivo);
    });
  }

  registrarUrl(data: Partial<CmsMultimedia>): Observable<CmsMultimedia> {
    return this.crear<CmsMultimedia>('multimedia', data);
  }

  /* ===== Datos de ejemplo (estructura actual del portal) ===== */
  private sembrarSiVacio(): void {
    if (localStorage.getItem(this.prefijo + 'menus')) return;

    const t = this.ahora();
    const menus: CmsMenu[] = [
      { id: 1, nombre: 'Menú principal', ubicacion: 'principal', activo: true },
      { id: 2, nombre: 'Pie de página', ubicacion: 'pie', activo: true },
    ];

    const p = (
      id: number, titulo: string, slug: string, orden: number,
      extra: Partial<CmsPagina> = {},
    ): CmsPagina => ({
      id, menuId: 1, parentId: null, titulo, slug, orden, plantilla: 'contenido',
      visibleEnMenu: true, estado: 'publicada', creadoEn: t, actualizadoEn: t, ...extra,
    });

    const paginas: CmsPagina[] = [
      p(1, 'Nuestro hospital', 'nuestro-hospital', 0),
      p(2, 'Misión y visión', 'mision-vision', 0, { parentId: 1 }),
      p(3, 'Reseña histórica', 'resena-historica', 1, { parentId: 1 }),
      p(4, 'Servicios', 'servicios', 1, { plantilla: 'listado' }),
      p(5, 'Atención al ciudadano', 'atencion-ciudadano', 2),
      p(6, 'Noticias', 'noticias', 3, { plantilla: 'listado' }),
      p(7, 'Transparencia', 'transparencia', 4, { plantilla: 'documentos' }),
      p(8, 'Normatividad', 'normatividad', 5, { plantilla: 'documentos' }),
      p(9, 'Participa', 'participa', 6),
      p(10, 'Políticas de privacidad', 'politicas-privacidad', 0, { menuId: 2 }),
    ];

    const entradas: CmsEntrada[] = [
      {
        id: 1, paginaId: 2, titulo: 'Misión', slug: 'mision', tipo: 'articulo', estado: 'borrador',
        resumen: '', contenido: '<p>Escriba aquí la misión institucional.</p>', destacada: false,
        imagenDestacadaId: null, multimediaIds: [], autor: 'Administrador', fechaPublicacion: null,
        orden: 0, creadoEn: t, actualizadoEn: t,
      },
    ];

    localStorage.setItem(this.prefijo + 'menus', JSON.stringify(menus));
    localStorage.setItem(this.prefijo + 'paginas', JSON.stringify(paginas));
    localStorage.setItem(this.prefijo + 'entradas', JSON.stringify(entradas));
    localStorage.setItem(this.prefijo + 'multimedia', '[]');
  }
}
