import { computed, inject, Injectable, signal, WritableSignal } from '@angular/core';
import { Observable, firstValueFrom, forkJoin } from 'rxjs';
import { CMS_CONFIG } from './cms-config';
import { CambioOrdenPagina, CmsDataSource, MetaArchivo } from './cms-datasource';
import {
  CmsEntrada,
  CmsMenu,
  CmsMultimedia,
  CmsPagina,
  CmsPaginaNodo,
  UbicacionMenu,
} from '../../models/cms/cms.models';

/** Resultado de resolver una URL pública contra el CMS */
export interface CmsRutaResuelta {
  pagina: CmsPagina;
  entrada: CmsEntrada | null;
  /**
   * Si la página se movió de lugar (otra sección o fuera del menú), la URL vieja
   * se reconoce por su slug y aquí viene la dirección actual para redirigir.
   */
  canonica?: string;
}

/** Prefijos que nunca maneja el CMS (rutas del sistema) */
export const RUTAS_RESERVADAS = ['admin', 'login', 'home', 'assets', 'buscar', 'pqrsf', 'solicitudes-contractuales', 'seguimiento-solicitudes'];

/**
 * Fachada del CMS: mantiene el estado en signals y delega la
 * persistencia al CmsDataSource configurado (local o API).
 */
@Injectable({ providedIn: 'root' })
export class CmsService {
  private ds = inject(CmsDataSource);
  readonly config = inject(CMS_CONFIG);

  /* ===== Estado ===== */
  readonly menus = signal<CmsMenu[]>([]);
  readonly paginas = signal<CmsPagina[]>([]);
  readonly entradas = signal<CmsEntrada[]>([]);
  readonly multimedia = signal<CmsMultimedia[]>([]);
  readonly cargando = signal(false);
  readonly error = signal<string | null>(null);
  private cargado = false;

  constructor() {
    // Modo local: si el admin guarda en otra pestaña, el sitio público se actualiza solo
    if (typeof window !== 'undefined' && this.config.modo === 'local') {
      window.addEventListener('storage', (e) => {
        if (e.key?.startsWith('cms-')) this.cargar(true);
      });
    }
  }

  /* ===== Derivados ===== */
  readonly multimediaPorId = computed(() => new Map(this.multimedia().map((m) => [m.id, m])));
  readonly paginaPorId = computed(() => new Map(this.paginas().map((p) => [p.id, p])));

  readonly conteoEntradasPorPagina = computed(() => {
    const mapa = new Map<number, number>();
    this.entradas().forEach((e) => mapa.set(e.paginaId, (mapa.get(e.paginaId) || 0) + 1));
    return mapa;
  });

  /** Veces que se usa cada archivo (galería + imagen destacada) */
  readonly usosMultimedia = computed(() => {
    const mapa = new Map<number, number>();
    const sumar = (id: number) => mapa.set(id, (mapa.get(id) || 0) + 1);
    this.entradas().forEach((e) => {
      (e.multimediaIds || []).forEach(sumar);
      if (e.imagenDestacadaId && !(e.multimediaIds || []).includes(e.imagenDestacadaId)) {
        sumar(e.imagenDestacadaId);
      }
    });
    return mapa;
  });

  /* ===== Carga ===== */
  async cargar(forzar = false): Promise<void> {
    if (this.cargado && !forzar) return;
    this.cargando.set(true);
    this.error.set(null);
    try {
      const r = await firstValueFrom(
        forkJoin({
          menus: this.ds.listar<CmsMenu>('menus'),
          paginas: this.ds.listar<CmsPagina>('paginas'),
          entradas: this.ds.listar<CmsEntrada>('entradas'),
          multimedia: this.ds.listar<CmsMultimedia>('multimedia'),
        }),
      );
      this.menus.set(r.menus);
      this.paginas.set(r.paginas);
      this.entradas.set(r.entradas.map((e) => ({ ...e, multimediaIds: e.multimediaIds || [] })));
      this.multimedia.set(r.multimedia);
      this.cargado = true;
    } catch (e) {
      this.error.set(this.mensaje(e));
    } finally {
      this.cargando.set(false);
    }
  }

  /* ===== Árbol de páginas ===== */
  arbol(menuId: number | null): CmsPaginaNodo[] {
    const paginas = this.paginas().filter((p) => p.menuId === menuId);
    const ids = new Set(paginas.map((p) => p.id));
    const construir = (parentId: number | null, nivel: number): CmsPaginaNodo[] =>
      paginas
        .filter((p) =>
          parentId === null ? p.parentId === null || !ids.has(p.parentId) : p.parentId === parentId,
        )
        .sort((a, b) => a.orden - b.orden || a.titulo.localeCompare(b.titulo))
        .map((pagina) => ({ pagina, nivel, hijos: construir(pagina.id, nivel + 1) }));
    return construir(null, 0);
  }

  /** Árbol aplanado (orden de lectura) para listas y selects */
  plano(menuId: number | null): CmsPaginaNodo[] {
    const out: CmsPaginaNodo[] = [];
    const recorrer = (nodos: CmsPaginaNodo[]) =>
      nodos.forEach((n) => (out.push(n), recorrer(n.hijos)));
    recorrer(this.arbol(menuId));
    return out;
  }

  /** Ids de una página y todos sus descendientes (para evitar ciclos) */
  descendientes(id: number): Set<number> {
    const set = new Set<number>([id]);
    let creció = true;
    while (creció) {
      creció = false;
      this.paginas().forEach((p) => {
        if (p.parentId !== null && set.has(p.parentId) && !set.has(p.id)) {
          set.add(p.id);
          creció = true;
        }
      });
    }
    return set;
  }

  rutaPagina(id: number): string {
    const partes: string[] = [];
    let actual = this.paginaPorId().get(id);
    let guardia = 0;
    while (actual && guardia++ < 20) {
      partes.unshift(actual.slug);
      actual = actual.parentId ? this.paginaPorId().get(actual.parentId) : undefined;
    }
    return '/' + partes.join('/');
  }

  entradasDe(paginaId: number): CmsEntrada[] {
    return this.entradas()
      .filter((e) => e.paginaId === paginaId)
      .sort((a, b) => a.orden - b.orden || (b.fechaPublicacion || '').localeCompare(a.fechaPublicacion || ''));
  }

  /* ===== Vista pública ===== */

  esPublica(p: CmsPagina): boolean {
    return p.estado === 'publicada';
  }

  esEntradaPublica(e: CmsEntrada): boolean {
    return (
      e.estado === 'publicada' &&
      (!e.fechaPublicacion || new Date(e.fechaPublicacion).getTime() <= Date.now())
    );
  }

  /** URL a la que debe llevar un ítem de menú */
  urlPagina(p: CmsPagina): string {
    return p.plantilla === 'enlace' && p.urlExterna ? p.urlExterna : this.rutaPagina(p.id);
  }

  urlEntrada(e: CmsEntrada): string {
    return `${this.rutaPagina(e.paginaId)}/${e.slug}`;
  }

  esExterna(url: string): boolean {
    return /^(https?:)?\/\//i.test(url) || url.startsWith('mailto:') || url.startsWith('tel:');
  }

  /** Árbol de navegación público para una ubicación (principal, pie…) */
  menuPublico(ubicacion: UbicacionMenu): CmsPaginaNodo[] {
    const menu = this.menus().find((m) => m.ubicacion === ubicacion && m.activo);
    if (!menu) return [];
    const filtrar = (nodos: CmsPaginaNodo[]): CmsPaginaNodo[] =>
      nodos
        .filter((n) => this.esPublica(n.pagina) && n.pagina.visibleEnMenu)
        .map((n) => ({ ...n, hijos: filtrar(n.hijos) }));
    return filtrar(this.arbol(menu.id));
  }

  hijasPublicas(paginaId: number): CmsPagina[] {
    return this.paginas()
      .filter((p) => p.parentId === paginaId && this.esPublica(p))
      .sort((a, b) => a.orden - b.orden);
  }

  /** Entradas visibles de una página, en el orden que corresponde a su plantilla */
  entradasPublicas(pagina: CmsPagina, incluirNoPublicadas = false): CmsEntrada[] {
    const lista = this.entradas().filter(
      (e) => e.paginaId === pagina.id && (incluirNoPublicadas ? e.estado !== 'archivada' : this.esEntradaPublica(e)),
    );
    if (pagina.plantilla === 'listado') {
      // blog: destacadas primero y luego por fecha descendente
      return lista.sort(
        (a, b) =>
          Number(b.destacada) - Number(a.destacada) ||
          (b.fechaPublicacion || b.creadoEn).localeCompare(a.fechaPublicacion || a.creadoEn),
      );
    }
    return lista.sort((a, b) => a.orden - b.orden);
  }

  /**
   * Resuelve una URL (/nuestro-hospital/mision-vision o /noticias/mi-noticia)
   * a una página y, opcionalmente, una entrada.
   */
  resolverRuta(segmentos: string[], incluirNoPublicadas = false): CmsRutaResuelta | null {
    const segs = segmentos.filter(Boolean).map((s) => decodeURIComponent(s).toLowerCase());
    if (!segs.length || RUTAS_RESERVADAS.includes(segs[0])) return null;

    const visible = (p: CmsPagina) => incluirNoPublicadas || this.esPublica(p);
    const buscarPagina = (partes: string[]): CmsPagina | null => {
      const ruta = '/' + partes.join('/');
      const p = this.paginas().find((x) => x.slug === partes[partes.length - 1] && this.rutaPagina(x.id) === ruta);
      return p && visible(p) ? p : null;
    };

    const pagina = buscarPagina(segs);
    if (pagina) return { pagina, entrada: null };

    if (segs.length >= 2) {
      const padre = buscarPagina(segs.slice(0, -1));
      const slug = segs[segs.length - 1];
      const entrada = padre
        ? this.entradas().find(
            (e) =>
              e.paginaId === padre.id &&
              e.slug === slug &&
              (incluirNoPublicadas ? e.estado !== 'archivada' : this.esEntradaPublica(e)),
          )
        : undefined;
      if (padre && entrada) return { pagina: padre, entrada };
    }

    // La página pudo cambiar de ubicación: se busca por su slug (si es único)
    const porSlug = (slug: string): CmsPagina | null => {
      const c = this.paginas().filter((x) => x.slug === slug && visible(x));
      return c.length === 1 ? c[0] : null;
    };
    const ultimo = segs[segs.length - 1];
    const movida = porSlug(ultimo);
    if (movida) return { pagina: movida, entrada: null, canonica: this.rutaPagina(movida.id) };
    if (segs.length >= 2) {
      const padre = porSlug(segs[segs.length - 2]);
      const entrada = padre
        ? this.entradas().find(
            (e) => e.paginaId === padre.id && e.slug === ultimo && (incluirNoPublicadas ? e.estado !== 'archivada' : this.esEntradaPublica(e)),
          )
        : undefined;
      if (padre && entrada) return { pagina: padre, entrada, canonica: this.urlEntrada(entrada) };
    }
    return null;
  }

  /* ===== Menús ===== */
  async guardarMenu(menu: Partial<CmsMenu>): Promise<CmsMenu> {
    return this.upsert('menus', this.menus, menu);
  }

  async eliminarMenu(id: number): Promise<void> {
    await this.run(this.ds.eliminar('menus', id));
    this.menus.update((l) => l.filter((m) => m.id !== id));
    this.paginas.update((l) => l.map((p) => (p.menuId === id ? { ...p, menuId: null } : p)));
  }

  /* ===== Páginas ===== */
  async guardarPagina(pagina: Partial<CmsPagina>): Promise<CmsPagina> {
    const data = { ...pagina, slug: this.slugUnico(pagina.slug || pagina.titulo || 'pagina', 'paginas', pagina.id) };
    if (!data.id && data.orden === undefined) {
      data.orden = this.paginas().filter((p) => p.menuId === data.menuId && p.parentId === data.parentId).length;
    }
    return this.upsert('paginas', this.paginas, data);
  }

  async eliminarPagina(id: number): Promise<void> {
    await this.run(this.ds.eliminar('paginas', id));
    this.paginas.update((l) =>
      l.filter((p) => p.id !== id).map((p) => (p.parentId === id ? { ...p, parentId: null } : p)),
    );
    this.entradas.update((l) => l.filter((e) => e.paginaId !== id));
  }

  async reordenar(cambios: CambioOrdenPagina[]): Promise<void> {
    if (!cambios.length) return;
    await this.run(this.ds.reordenarPaginas(cambios));
    const mapa = new Map(cambios.map((c) => [c.id, c]));
    this.paginas.update((l) =>
      l.map((p) => {
        const c = mapa.get(p.id);
        return c ? { ...p, menuId: c.menuId, parentId: c.parentId, orden: c.orden } : p;
      }),
    );
  }

  /* ===== Entradas ===== */
  async guardarEntrada(entrada: Partial<CmsEntrada>): Promise<CmsEntrada> {
    const data: Partial<CmsEntrada> = {
      ...entrada,
      slug: this.slugUnico(entrada.slug || entrada.titulo || 'entrada', 'entradas', entrada.id, entrada.paginaId),
    };
    if (data.estado === 'publicada' && !data.fechaPublicacion) {
      data.fechaPublicacion = new Date().toISOString();
    }
    if (!data.id && data.orden === undefined) {
      data.orden = this.entradas().filter((e) => e.paginaId === data.paginaId).length;
    }
    return this.upsert('entradas', this.entradas, data);
  }

  async eliminarEntrada(id: number): Promise<void> {
    await this.run(this.ds.eliminar('entradas', id));
    this.entradas.update((l) => l.filter((e) => e.id !== id));
  }

  /* ===== Multimedia ===== */
  async subirArchivos(archivos: File[], meta?: MetaArchivo): Promise<CmsMultimedia[]> {
    const subidos: CmsMultimedia[] = [];
    const errores: string[] = [];
    for (const archivo of archivos) {
      if (archivo.size > this.config.maxArchivoMb * 1024 * 1024) {
        errores.push(`"${archivo.name}" supera ${this.config.maxArchivoMb} MB.`);
        continue;
      }
      try {
        const m = await firstValueFrom(this.ds.subirArchivo(archivo, meta));
        subidos.push(m);
        this.multimedia.update((l) => [m, ...l]);
      } catch (e) {
        errores.push(this.mensaje(e));
      }
    }
    if (errores.length) this.error.set(errores.join(' '));
    return subidos;
  }

  async registrarUrl(data: Partial<CmsMultimedia>): Promise<CmsMultimedia> {
    const m = await this.run(this.ds.registrarUrl(data));
    this.multimedia.update((l) => [m, ...l]);
    return m;
  }

  async guardarMultimedia(m: Partial<CmsMultimedia> & { id: number }): Promise<CmsMultimedia> {
    return this.upsert('multimedia', this.multimedia, m);
  }

  async eliminarMultimedia(id: number): Promise<void> {
    await this.run(this.ds.eliminar('multimedia', id));
    this.multimedia.update((l) => l.filter((m) => m.id !== id));
    this.entradas.update((l) =>
      l.map((e) => ({
        ...e,
        imagenDestacadaId: e.imagenDestacadaId === id ? null : e.imagenDestacadaId,
        multimediaIds: e.multimediaIds.filter((x) => x !== id),
      })),
    );
  }

  /* ===== Utilidades ===== */
  static slugify(texto: string): string {
    return texto
      .normalize('NFD')
      .replace(/[̀-ͯ]/g, '')
      .toLowerCase()
      .trim()
      .replace(/[^a-z0-9\s-]/g, '')
      .replace(/[\s_-]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .slice(0, 180) || 'sin-titulo';
  }

  private slugUnico(base: string, col: 'paginas' | 'entradas', id?: number, paginaId?: number): string {
    const raiz = CmsService.slugify(base);
    const usados = new Set(
      (col === 'paginas'
        ? this.paginas()
        : this.entradas().filter((e) => e.paginaId === paginaId)
      )
        .filter((x) => x.id !== id)
        .map((x) => x.slug),
    );
    let slug = raiz;
    let n = 2;
    while (usados.has(slug)) slug = `${raiz}-${n++}`;
    return slug;
  }

  private async upsert<T extends { id: number }>(
    col: 'menus' | 'paginas' | 'entradas' | 'multimedia',
    estado: WritableSignal<T[]>,
    data: Partial<T>,
  ): Promise<T> {
    const guardado = data.id
      ? await this.run(this.ds.actualizar<T>(col, data.id, data))
      : await this.run(this.ds.crear<T>(col, data));
    estado.update((l) =>
      l.some((x) => x.id === guardado.id) ? l.map((x) => (x.id === guardado.id ? guardado : x)) : [...l, guardado],
    );
    return guardado;
  }

  private async run<T>(obs: Observable<T>): Promise<T> {
    this.error.set(null);
    try {
      return await firstValueFrom(obs, { defaultValue: undefined as T });
    } catch (e) {
      this.error.set(this.mensaje(e));
      throw e;
    }
  }

  private mensaje(e: unknown): string {
    if (e && typeof e === 'object' && 'error' in e && (e as any).error?.mensaje) return (e as any).error.mensaje;
    if (e instanceof Error) return e.message;
    return 'Ocurrió un error inesperado.';
  }
}
