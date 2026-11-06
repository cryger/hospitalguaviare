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
import { Cotizacion } from '../../models/cotizacion/cotizacion/cotizacion-module';
import { COTIZACIONES_SEMILLA, VACANTES_SEMILLA } from './cms-semilla-modulos';
import { ENTRADAS_PIE, EntradaPieSemilla } from './cms-semilla-pie';
import { EVENTOS_SEMILLA } from './cms-semilla-eventos';
import { BANNERS_SEMILLA } from './cms-semilla-slider';
import { ENTRADAS_ENTIDAD } from './cms-semilla-entidad';
import { categoriaSugerida } from '../../utils/categorias';

/** Contenido migrado del portal anterior (public/assets/semillas), en el orden en que se aplica */
const SEMILLAS_ARCHIVO: [clave: string, ruta: string][] = [
  ['noticias-semilla', 'assets/semillas/noticias.json'],
  ['nuestro-hospital-semilla', 'assets/semillas/nuestro-hospital.json'],
  ['atencion-participa-semilla', 'assets/semillas/atencion-y-participa.json'],
  ['tramites-semilla', 'assets/semillas/tramites.json'],
  ['resena-historica-semilla', 'assets/semillas/resena-historica.json'],
  ['portafolio-servicios-semilla', 'assets/semillas/portafolio-servicios.json'],
  ['organigrama-semilla', 'assets/semillas/organigrama.json'],
  ['normatividad-semilla', 'assets/semillas/normatividad.json'],
  ['sedes-semilla', 'assets/semillas/sedes-y-horarios.json'],
  ['directorio-semilla', 'assets/semillas/directorio-institucional.json'],
  ['informacion-de-interes-semilla', 'assets/semillas/informacion-de-interes.json'],
  ['estructura-organica-semilla', 'assets/semillas/estructura-organica.json'],
  ['presupuesto-semilla', 'assets/semillas/presupuesto.json'],
  ['planeacion-semilla', 'assets/semillas/planeacion.json'],
  ['control-semilla', 'assets/semillas/control.json'],
  ['contratacion-semilla', 'assets/semillas/contratacion.json'],
  ['tramites-suit-semilla', 'assets/semillas/tramites-suit.json'],
  ['instrumentos-gestion-semilla', 'assets/semillas/instrumentos-gestion.json'],
  ['esquema-publicacion-semilla', 'assets/semillas/esquema-publicacion.json'],
  ['grupos-gobierno-digital-semilla', 'assets/semillas/grupos-gobierno-digital.json'],
  ['grupos-ordenados-semilla', 'assets/semillas/grupos-gobierno-digital-2.json'],
  ['paginas-por-secciones-semilla', 'assets/semillas/grupos-gobierno-digital-3.json'],
  ['historia-clinica-en-linea-semilla', 'assets/semillas/historia-clinica-en-linea.json'],
  ['transparencia-ley1712-semilla', 'assets/semillas/transparencia-ley1712.json'],
  ['racionalizacion-tramites-semilla', 'assets/semillas/racionalizacion-tramites.json'],
];

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
    this.abrirLote();
    this.sembrarSiVacio();
    this.sembrarModulos();
    this.sembrarEventos();
    this.sembrarColeccion('banners', 'slider-semilla', BANNERS_SEMILLA);
    this.actualizarSemilla();
    this.sembrarEntradasFijas('pie-semilla', ENTRADAS_PIE);
    this.sembrarEntradasFijas('entidad-semilla', ENTRADAS_ENTIDAD);
    this.organizarPlataformaEstrategica();
    // Las semillas se piden una tras otra y con prioridad baja: en un celular con red lenta,
    // pedirlas todas a la vez compite con la página y empeora la carga (probado con Lighthouse)
    this.semillaNoticias = SEMILLAS_ARCHIVO.reduce<Promise<void>>(
      (previa, [clave, ruta]) => previa.then(() => this.sembrarDesdeArchivo(clave, ruta)),
      Promise.resolve(),
    )
      .then(() => this.clasificarPublicaciones())
      .then(() => this.clasificarDocumentosTalentoHumano())
      .then(() => this.organizarComiteConvivencia())
      .then(() => this.ordenarTalentoHumano())
      .finally(() => this.guardarLotePorPartes());
  }

  /**
   * Una sola vez (igual que api/migraciones/035-orden-talento-humano.sql): tipos de documento de
   * Talento humano en orden lógico y reglamento interno de trabajo también en 2.1.5 Políticas.
   */
  private ordenarTalentoHumano(): void {
    const clave = this.prefijo + 'orden-talento-humano-v1';
    if (this.almacen.getItem(clave) === '1') return;
    const paginas = this.leer<CmsPagina>('paginas');
    const th = paginas.find((p) => p.slug === 'talento-humano');
    const politicas = paginas.find((p) => p.slug === 'politicas-lineamientos-y-manuales');
    if (!th) return;
    const ORDEN = ['Manual de funciones', 'Reglamento interno de trabajo', 'Planes', 'Comités y grupos', 'Elecciones y representantes',
      'Convocatorias internas', 'Convocatorias de contratación', 'Acuerdo colectivo', 'Capacitaciones', 'Formatos'];
    const entradas = this.leer<CmsEntrada>('entradas');
    const t = this.ahora();
    for (const e of entradas) {
      if (e.paginaId !== th.id || e.orden >= 1000) continue;
      const i = ORDEN.indexOf(e.categoria ?? '');
      e.orden += 1000 * (i < 0 ? ORDEN.length + 1 : i + 1);
    }
    const slug = 'reglamento-interno-de-trabajo-acuerdo-08-de-2020';
    const url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf';
    const archivo = this.leer<CmsMultimedia>('multimedia').find((m) => m.url === url);
    if (politicas && archivo && !entradas.some((e) => e.paginaId === politicas.id && e.slug === slug)) {
      entradas.push({
        id: this.nuevoId(entradas), paginaId: politicas.id, titulo: 'Reglamento interno de trabajo – Acuerdo 08 de 2020', slug,
        resumen: 'Acuerdo 08 del 27 de octubre de 2020 de la Junta Directiva, por el cual se adopta el reglamento interno de trabajo.',
        contenido: '', tipo: 'documento', categoria: 'Talento humano', icono: null, estado: 'publicada', destacada: false,
        imagenDestacadaId: null, multimediaIds: [archivo.id], autor: 'E.S.E. Hospital San José del Guaviare',
        fechaPublicacion: '2020-10-27T12:00:00.000Z', orden: 5, migradoDe: 'esehospitalguaviare.gov.co (Información de interés)', creadoEn: t, actualizadoEn: t,
      });
    }
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }

  /**
   * Una sola vez: Comité de Convivencia Laboral con los grupos del portal anterior
   * ("Comité de convivencia 2026" y "Anuncios 2026"). Equivale a api/migraciones/029-comite-de-convivencia.sql
   */
  /**
   * Plataforma estratégica (igual que api/migraciones/032-plataforma-estrategica.sql):
   * sección, ícono y ejes (viñetas) de la misión y la visión, si aún no los tienen.
   */
  private organizarPlataformaEstrategica(): void {
    const clave = this.prefijo + 'plataforma-estrategica-v1';
    if (this.almacen.getItem(clave) === '1') return;
    const pagina = this.leer<CmsPagina>('paginas').find((p) => p.slug === 'mision-vision-funciones-y-deberes');
    if (!pagina) return;
    const ejes: Record<string, { categoria: string; icono: string | null; lista: string[] }> = {
      mision: {
        categoria: 'Misión',
        icono: 'govco:bullseye',
        lista: ['Servicios integrales', 'Eficiencia', 'Calidad', 'Enfoque diferencial', 'Calidez humana', 'Desarrollo profesional', 'Bienestar de usuarios, colaboradores y familias'],
      },
      vision: {
        categoria: 'Visión',
        icono: 'govco:eye',
        lista: ['Referente de la región', 'Acreditado', 'Innovador', 'Competitivo', 'Sostenibilidad financiera', 'Cultura organizacional sólida', 'Mediana y alta complejidad', 'Amigable con el medio ambiente'],
      },
      'valores-corporativos': { categoria: 'Valores', icono: null, lista: [] },
    };
    const entradas = this.leer<CmsEntrada>('entradas');
    const t = this.ahora();
    for (const e of entradas) {
      const x = e.paginaId === pagina.id ? ejes[e.slug] : undefined;
      if (!x) continue;
      e.categoria ??= x.categoria;
      e.icono ??= x.icono;
      if (x.lista.length && !(e.contenido ?? '').includes('<ul')) e.contenido = (e.contenido ?? '') + '\n<ul>' + x.lista.map((l) => `<li>${l}</li>`).join('') + '</ul>';
      e.actualizadoEn = t;
    }
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }

  private organizarComiteConvivencia(): void {
    const clave = this.prefijo + 'comite-convivencia-v2';
    if (this.almacen.getItem(clave) === '1') return;
    const paginas = this.leer<CmsPagina>('paginas');
    const pagina = paginas.find((p) => p.slug === 'comite-de-convivencia-laboral');
    const entradas = this.leer<CmsEntrada>('entradas');
    const base = pagina && entradas.find((e) => e.paginaId === pagina.id && e.slug === 'conformacion-comite-convivencia-2026');
    if (!pagina || !base || base.categoria) return;
    const t = this.ahora();
    if (!pagina.descripcion || pagina.descripcion.startsWith('Resoluciones, comunicados y actas del proceso de conformación')) {
      pagina.descripcion =
        'Instancia que promueve un buen ambiente laboral y previene y atiende las situaciones que pueden constituir acoso laboral (Ley 1010 de 2006). Aquí se publican su conformación, comunicados y los documentos de elección de sus integrantes.';
      this.escribir('paginas', paginas);
    }
    const urlsAnuncios = [
      'OFICIO%20DE%20GERENCIA.pdf',
      'ACTA%20DE%20CIERRE%20ELECCI%C3%93N%20COMITE%20DE%20CONVIVENCIA%20LABORAL.pdf',
      'ACTA%20DE%20APERTURA%20ELECCI%C3%93N%20COMITE%20CONVIVENCIA%20LABORAL.pdf',
      'Aspirantes%20Inscritos%20comite%20de%20convivencia%20laboral.pdf',
    ].map((n) => 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/' + n);
    const multimedia = this.leer<CmsMultimedia>('multimedia');
    const idsAnuncios = urlsAnuncios.map((u) => multimedia.find((m) => m.url === u)?.id).filter((x): x is number => x !== undefined);
    Object.assign(base, {
      titulo: 'Comité de Convivencia Laboral 2026',
      resumen: 'Resolución de conformación y comunicados del proceso.',
      categoria: 'Comité de convivencia 2026',
      fechaPublicacion: '2026-08-03T12:00:00.000Z',
      multimediaIds: base.multimediaIds.filter((id) => !idsAnuncios.includes(id)),
      orden: 0,
      actualizadoEn: t,
    });
    entradas.push({
      ...base,
      id: this.nuevoId(entradas),
      titulo: 'Anuncios de la elección 2026',
      slug: 'anuncios-eleccion-comite-convivencia-2026',
      resumen: 'Oficio de Gerencia, actas de apertura y cierre de la elección y aspirantes inscritos.',
      categoria: 'Anuncios 2026',
      multimediaIds: idsAnuncios,
      orden: 1,
      creadoEn: t,
    });
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }

  /**
   * Una sola vez: tipos de documento de "Talento humano" (filtro a la izquierda).
   * Equivale a api/migraciones/027-tipos-documentos-talento-humano.sql
   */
  private clasificarDocumentosTalentoHumano(): void {
    const clave = this.prefijo + 'tipos-talento-humano';
    if (this.almacen.getItem(clave) === '1') return;
    const pagina = this.leer<CmsPagina>('paginas').find((p) => p.slug === 'talento-humano');
    if (!pagina) return;
    const tipos: Record<string, string> = {
      'manual-de-funciones': 'Manual de funciones',
      'comite-de-bienestar-social-e-incentivos': 'Comités y grupos',
      'grupo-geicig': 'Comités y grupos',
      'formato-de-confidencialidad': 'Formatos',
      'plan-de-gestion-gerencial': 'Planes',
    };
    const entradas = this.leer<CmsEntrada>('entradas');
    for (const e of entradas) {
      if (e.paginaId === pagina.id && !e.categoria && tipos[e.slug]) e.categoria = tipos[e.slug];
    }
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }

  /**
   * Una sola vez: asigna categoría (Comunicados, Resoluciones…) a las publicaciones
   * de páginas "Listado" que aún no tienen. Equivale a api/migraciones/023-categorias-publicaciones.sql
   */
  private clasificarPublicaciones(): void {
    const clave = this.prefijo + 'categorias-publicaciones';
    if (this.almacen.getItem(clave) === '1') return;
    const listados = new Set(this.leer<CmsPagina>('paginas').filter((p) => p.plantilla === 'listado').map((p) => p.id));
    const entradas = this.leer<CmsEntrada>('entradas');
    for (const e of entradas) {
      if (listados.has(e.paginaId) && !e.categoria) e.categoria = categoriaSugerida(e.titulo);
    }
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }

  /** Contenido migrado del portal anterior (se descarga una sola vez desde /assets/semillas) */
  private semillaNoticias: Promise<void>;
  private pedirSemilla(ruta: string): Promise<any> {
    return fetch(ruta, { priority: 'low' } as RequestInit)
      .then((r) => (r.ok ? r.json() : null))
      .catch(() => null);
  }

  /* ===== Helpers de almacenamiento ===== */
  /**
   * Lote de escritura: mientras se siembra el contenido inicial (primera visita) las colecciones
   * se leen y escriben en memoria y se guardan en localStorage UNA sola vez al terminar.
   * Antes cada semilla volvía a serializar y guardar todas las entradas y la multimedia
   * (~18 MB escritos en la primera visita, más de 1 s de bloqueo en un celular).
   */
  private lote: { valores: Map<string, unknown>; sucios: Set<string> } | null = null;

  /** localStorage, o el lote en memoria mientras está abierto */
  private readonly almacen = {
    getItem: (k: string): string | null => {
      const v = this.lote?.valores.get(k);
      if (v !== undefined) return typeof v === 'string' ? v : JSON.stringify(v);
      return localStorage.getItem(k);
    },
    setItem: (k: string, v: string): void => {
      if (this.lote) {
        this.lote.valores.set(k, v);
        this.lote.sucios.add(k);
      } else {
        localStorage.setItem(k, v);
      }
    },
  };

  private abrirLote(): void {
    if (this.lote) return;
    this.lote = { valores: new Map(), sucios: new Set() };
    // Si la persona cierra o cambia de pestaña antes de terminar, se guarda lo que haya
    if (typeof window !== 'undefined') window.addEventListener('pagehide', () => this.guardarLote(false));
  }

  /** Guarda en localStorage lo que cambió en el lote; si cerrar, vuelve a escribir directo */
  private guardarLote(cerrar = true): void {
    const lote = this.lote;
    if (!lote) return;
    try {
      for (const k of lote.sucios) {
        const v = lote.valores.get(k);
        localStorage.setItem(k, typeof v === 'string' ? v : JSON.stringify(v));
      }
      lote.sucios.clear();
    } catch {
      console.warn('No se pudo guardar el contenido inicial: el almacenamiento local del navegador está lleno.');
    }
    if (cerrar) this.lote = null;
  }

  /** Como guardarLote, pero una colección por tarea para no bloquear el navegador */
  private async guardarLotePorPartes(): Promise<void> {
    const lote = this.lote;
    if (!lote) return;
    for (const k of [...lote.sucios]) {
      await new Promise((r) => setTimeout(r, 0));
      try {
        const v = lote.valores.get(k);
        localStorage.setItem(k, typeof v === 'string' ? v : JSON.stringify(v));
        lote.sucios.delete(k);
      } catch {
        console.warn('No se pudo guardar el contenido inicial: el almacenamiento local del navegador está lleno.');
        break;
      }
    }
    this.lote = null;
  }

  private leer<T>(c: CmsColeccion): T[] {
    const k = this.prefijo + c;
    try {
      if (this.lote) {
        let v = this.lote.valores.get(k);
        if (typeof v === 'string' || v === undefined) {
          v = JSON.parse((v as string | undefined) ?? localStorage.getItem(k) ?? '[]');
          this.lote.valores.set(k, v);
        }
        return v as T[];
      }
      return JSON.parse(localStorage.getItem(k) || '[]');
    } catch {
      return [];
    }
  }

  private escribir<T>(c: CmsColeccion, data: T[]): void {
    const k = this.prefijo + c;
    if (this.lote) {
      this.lote.valores.set(k, data);
      this.lote.sucios.add(k);
      return;
    }
    try {
      localStorage.setItem(k, JSON.stringify(data));
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
    // Las entradas y la multimedia esperan a que termine la semilla de noticias
    if (c === 'entradas' || c === 'multimedia') {
      return defer(() => this.semillaNoticias.then(() => this.leer<T>(c)));
    }
    // El histórico de invitaciones a cotizar se descarga solo cuando alguien las consulta
    if (c === 'cotizaciones') {
      return defer(() => (this.semillaCotizaciones ??= this.sembrarCotizaciones()).then(() => this.leer<T>(c)));
    }
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

  /* ===== Estructura inicial (Resolución 1519 de 2020) ===== */
  private readonly versionSemilla = 33;

  private sembrarSiVacio(): void {
    if (this.almacen.getItem(this.prefijo + 'menus')) return;
    this.cargarSemilla();
  }

  private cargarSemilla(): void {
    const t = this.ahora();
    const menus: CmsMenu[] = [
      { id: 1, nombre: 'Menú principal', ubicacion: 'principal', activo: true },
      { id: 2, nombre: 'Pie de página', ubicacion: 'pie', activo: true },
    ];
    const paginas: CmsPagina[] = ESTRUCTURA_1519.map((p) => ({
      visibleEnMenu: true,
      estado: 'publicada',
      creadoEn: t,
      actualizadoEn: t,
      ...p,
    }));
    this.almacen.setItem(this.prefijo + 'menus', JSON.stringify(menus));
    this.almacen.setItem(this.prefijo + 'paginas', JSON.stringify(paginas));
    this.almacen.setItem(this.prefijo + 'entradas', '[]');
    if (!this.almacen.getItem(this.prefijo + 'multimedia')) this.almacen.setItem(this.prefijo + 'multimedia', '[]');
    this.almacen.setItem(this.prefijo + 'version', String(this.versionSemilla));
  }

  /** Vacantes e invitaciones a cotizar migradas del portal anterior (solo si están vacías) */
  private sembrarModulos(): void {
    const clave = this.prefijo + 'modulos-semilla';
    if (this.almacen.getItem(clave) === '1') return;
    const t = this.ahora();
    const sembrar = (c: CmsColeccion, datos: object[]) => {
      if (this.leer(c).length) return;
      this.escribir(c, datos.map((d, i) => ({ ...d, id: i + 1, creadoEn: t, actualizadoEn: t })));
    };
    sembrar('vacantes', VACANTES_SEMILLA);
    sembrar('cotizaciones', COTIZACIONES_SEMILLA);
    this.almacen.setItem(clave, '1');
  }

  /**
   * Invitaciones a cotizar del portal anterior (assets/semillas/cotizaciones.json, una sola vez).
   * Cada una se identifica con migradoDe = «url anterior#id»: no se duplican ni se reemplazan las
   * que ya existen. Las 3 sembradas antes (sin #id) se marcan con su id y se cierran.
   */
  private semillaCotizaciones?: Promise<void>;
  private async sembrarCotizaciones(): Promise<void> {
    const clave = this.prefijo + 'cotizaciones-historico-semilla';
    if (localStorage.getItem(clave) === '1' || this.almacen.getItem(clave) === '1') return;
    const datos: { base: string; existentes: Record<string, string>; cotizaciones: Omit<Cotizacion, 'id'>[] } | null =
      await this.pedirSemilla('assets/semillas/cotizaciones.json');
    if (!datos?.cotizaciones?.length) return;
    const lista = this.leer<Cotizacion>('cotizaciones');
    const t = this.ahora();
    for (const [idAnterior, fecha] of Object.entries(datos.existentes)) {
      const c = lista.find((x) => x.migradoDe === datos.base && String(x.fechaPublicacion).slice(0, 10) === fecha);
      if (c) Object.assign(c, { migradoDe: `${datos.base}#${idAnterior}`, estado: c.estado === 'publicada' ? 'cerrada' : c.estado });
    }
    const ya = new Set(lista.map((x) => x.migradoDe));
    let id = this.nuevoId(lista);
    // De la más antigua a la más reciente, para que los id sigan el orden de publicación
    for (const c of [...datos.cotizaciones].reverse()) {
      if (ya.has(c.migradoDe)) continue;
      lista.push({ ...c, id: id++, creadoEn: t, actualizadoEn: t } as Cotizacion);
    }
    // Se guarda directo (no en el lote): esta semilla puede terminar después de cerrarlo
    const k = this.prefijo + 'cotizaciones';
    this.lote?.valores.set(k, lista);
    try {
      localStorage.setItem(k, JSON.stringify(lista));
      localStorage.setItem(clave, '1');
    } catch {
      console.warn('No se pudieron guardar las invitaciones a cotizar: el almacenamiento local del navegador está lleno.');
    }
  }

  /** Siembra una colección una sola vez (si está vacía) */
  private sembrarColeccion(c: CmsColeccion, nombre: string, datos: object[]): void {
    const clave = this.prefijo + nombre;
    if (this.almacen.getItem(clave) === '1') return;
    if (!this.leer(c).length) {
      const t = this.ahora();
      this.escribir(c, datos.map((d, i) => ({ ...d, id: i + 1, creadoEn: t, actualizadoEn: t })));
    }
    this.almacen.setItem(clave, '1');
  }

  /** Eventos del calendario migrados del portal anterior (una sola vez) */
  private sembrarEventos(): void {
    const clave = this.prefijo + 'eventos-semilla';
    if (this.almacen.getItem(clave) === '1') return;
    if (!this.leer('eventos').length) {
      const t = this.ahora();
      this.escribir('eventos', EVENTOS_SEMILLA.map((e, i) => ({ ...e, id: i + 1, creadoEn: t, actualizadoEn: t })));
    }
    this.almacen.setItem(clave, '1');
  }

  /**
   * Modo local: actualiza los datos guardados en el navegador.
   * - Versión 1-2 (estructura anterior a la Res. 1519): se reemplaza la estructura.
   * - Versión 3 en adelante: solo se AGREGAN las páginas nuevas que falten (por slug),
   *   sin borrar ni modificar lo que ya existe.
   */
  private actualizarSemilla(): void {
    const version = Number(this.almacen.getItem(this.prefijo + 'version') || 1);
    if (version >= this.versionSemilla) return;
    if (version < 3) {
      this.cargarSemilla();
      return;
    }

    const paginas = this.leer<CmsPagina>('paginas');
    const menus = this.leer<CmsMenu>('menus');
    const porSlug = new Map(paginas.map((p) => [p.slug, p]));
    const semillaPorId = new Map(ESTRUCTURA_1519.map((p) => [p.id, p]));
    const t = this.ahora();
    let id = this.nuevoId(paginas);

    for (const s of ESTRUCTURA_1519) {
      if (porSlug.has(s.slug)) continue;
      const padreSemilla = s.parentId !== null ? semillaPorId.get(s.parentId) : undefined;
      const padre = padreSemilla ? porSlug.get(padreSemilla.slug) : undefined;
      if (padreSemilla && !padre) continue; // el padre fue eliminado por el usuario
      const ubicacion = s.menuId === 2 ? 'pie' : 'principal';
      const nueva: CmsPagina = {
        visibleEnMenu: true,
        estado: 'publicada',
        creadoEn: t,
        actualizadoEn: t,
        ...s,
        id: id++,
        parentId: padre?.id ?? null,
        menuId: padre?.menuId ?? menus.find((m) => m.ubicacion === ubicacion)?.id ?? null,
      };
      paginas.push(nueva);
      porSlug.set(nueva.slug, nueva);
    }

    // Versión 5: "Información de interés" agrupa Invitaciones a cotizar y Trabaja con nosotros
    const info = porSlug.get('informacion-de-interes');
    if (version < 5 && info) {
      for (const p of paginas) {
        const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug && x.parentId === 83);
        if (s) Object.assign(p, { parentId: info.id, menuId: info.menuId, titulo: s.titulo, plantilla: 'enlace', urlExterna: s.urlExterna, orden: s.orden, visibleEnMenu: true, actualizadoEn: t });
        if (p.slug === 'noticias' && p.parentId === null) p.orden = 5;
      }
    }

    // Versión 9: orden del menú principal
    // Nuestro Hospital · Transparencia · Atención y servicios a la ciudadanía · Participa · Información de interés
    if (version < 9) {
      const orden: Record<string, number> = {
        'nuestro-hospital': 0,
        transparencia: 1,
        'atencion-y-servicios-a-la-ciudadania': 2,
        participa: 3,
        'informacion-de-interes': 4,
      };
      for (const p of paginas) {
        if (p.parentId === null && p.slug in orden) Object.assign(p, { orden: orden[p.slug], actualizadoEn: t });
      }
    }

    // Versión 8: se publican las páginas del pie de página
    if (version < 8) {
      for (const p of paginas) {
        if (['politicas-de-privacidad', 'terminos-y-condiciones'].includes(p.slug) && p.estado === 'borrador') {
          const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug);
          Object.assign(p, { estado: 'publicada', descripcion: p.descripcion || s?.descripcion, actualizadoEn: t });
        }
      }
    }

    // Versión 10: Nuestro Hospital › Misión y visión enlaza a Transparencia 1.1
    if (version < 10) {
      const orden: Record<string, number> = { 'mision-vision': 0, 'resena-historica': 1, 'portafolio-de-servicios': 2, 'sedes-y-horarios': 3 };
      const entradas = this.leer<CmsEntrada>('entradas');
      for (const p of paginas) {
        if (p.slug in orden) p.orden = orden[p.slug];
        if (p.slug === 'mision-vision' && !entradas.some((e) => e.paginaId === p.id)) {
          const s = ESTRUCTURA_1519.find((x) => x.slug === 'mision-vision');
          Object.assign(p, { plantilla: 'enlace', urlExterna: s?.urlExterna, estado: 'publicada', actualizadoEn: t });
        }
        if (p.slug === 'mision-vision-funciones-y-deberes' && !p.descripcion) {
          p.descripcion = ESTRUCTURA_1519.find((x) => x.slug === p.slug)?.descripcion;
        }
      }
    }

    // Versión 11: nuevos elementos del menú Nuestro Hospital (orden del submenú)
    if (version < 11) {
      const orden: Record<string, number> = { 'resena-historica': 1, 'portafolio-de-servicios': 3, 'sedes-y-horarios': 4 };
      for (const p of paginas) if (p.slug in orden) p.orden = orden[p.slug];
    }

    // Versión 12: Atención al ciudadano y Participa (descripciones de las secciones existentes)
    if (version < 12) {
      for (const p of paginas) {
        const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug);
        if (!p.descripcion && s?.descripcion) Object.assign(p, { descripcion: s.descripcion, actualizadoEn: t });
      }
    }
    // Versión 13: 1.11 Calendario de actividades y eventos usa la plantilla "calendario"
    if (version < 13) {
      for (const p of paginas) {
        if (p.slug === 'calendario-de-actividades-y-eventos' && p.plantilla === 'contenido') {
          const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug);
          Object.assign(p, { plantilla: 'calendario', descripcion: p.descripcion || s?.descripcion, actualizadoEn: t });
        }
      }
    }
    // Versión 16: descripciones de "1. Información de la entidad" (tarjetas de subpáginas)
    if (version < 16) {
      for (const p of paginas) {
        const s = ESTRUCTURA_1519.find((x) => x.slug === p.slug);
        if (!p.descripcion && s?.descripcion) Object.assign(p, { descripcion: s.descripcion, actualizadoEn: t });
      }
    }
    // Versión 15: Reseña histórica con portada, línea de tiempo y galería
    if (version < 15) {
      for (const p of paginas) {
        if (p.slug === 'resena-historica' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'historia', actualizadoEn: t });
      }
    }
    // Versión 17: Portafolio de servicios con tarjetas (plantilla "servicios", destacados en el inicio)
    if (version < 17) {
      const s = ESTRUCTURA_1519.find((x) => x.slug === 'portafolio-de-servicios');
      for (const p of paginas) {
        if (p.slug === 'portafolio-de-servicios' && (p.plantilla === 'listado' || p.plantilla === 'contenido')) {
          Object.assign(p, { plantilla: 'servicios', descripcion: p.descripcion || s?.descripcion, actualizadoEn: t });
        }
      }
    }
    // Versión 18: Estructura orgánica con organigrama interactivo
    if (version < 18) {
      for (const p of paginas) {
        if (p.slug === 'estructura-organica-organigrama' && (p.plantilla === 'contenido' || p.plantilla === 'documentos')) {
          Object.assign(p, { plantilla: 'organigrama', actualizadoEn: t });
        }
      }
    }
    // Versión 20: Sedes y horarios con mapa y horarios en vivo (plantilla "sedes")
    if (version < 20) {
      const sd = ESTRUCTURA_1519.find((x) => x.slug === 'sedes-y-horarios');
      for (const p of paginas) {
        if (p.slug === 'sedes-y-horarios' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'sedes', descripcion: p.descripcion || sd?.descripcion, actualizadoEn: t });
      }
    }
    // Versión 21: Misión y visión con la plantilla "plataforma" (misión, visión y valores visuales)
    if (version < 21) {
      for (const p of paginas) {
        if (p.slug === 'mision-vision-funciones-y-deberes' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'plataforma', actualizadoEn: t });
      }
    }
    // Versión 22: Directorio institucional con buscador (plantilla "directorio")
    if (version < 22) {
      for (const p of paginas) {
        if (p.slug === 'directorio-institucional' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'directorio', actualizadoEn: t });
      }
    }
    // Versión 26: 1.13 Entes de control como directorio
    // Versión 28: 7.1.3 con la plantilla «esquema» (estructura del portal anterior)
    if (version < 28) {
      for (const p of paginas) {
        if (p.slug !== 'esquema-de-publicacion-de-la-informacion') continue;
        if (p.plantilla === 'documentos' || p.plantilla === 'contenido') Object.assign(p, { plantilla: 'esquema', actualizadoEn: t });
        if (!p.descripcion || p.descripcion.startsWith('Instrumento que organiza la información pública'))
          Object.assign(p, { descripcion: 'Instrumento para facilitar el acceso organizado, oportuno y transparente a la información pública de la E.S.E. Hospital San José del Guaviare.' });
      }
    }
    // Versión 27: 7.1.3 Esquema de publicación muestra el texto del esquema (plantilla contenido)
    if (version < 27) {
      const DESC: Record<string, string> = {
        'programa-de-gestion-documental': 'Programa de Gestión Documental (PGD), instrumentos archivísticos, inventarios de fondos acumulados y transferencias documentales.',
        'tablas-de-retencion-documental': 'Tablas de Retención Documental (TRD) de la E.S.E. y actos administrativos de aprobación.',
        'esquema-de-publicacion-de-la-informacion': 'Instrumento que organiza la información pública que publica la E.S.E.: responsable, formato y periodicidad.',
      };
      for (const p of paginas) {
        if (p.slug === 'esquema-de-publicacion-de-la-informacion' && p.plantilla === 'documentos') Object.assign(p, { plantilla: 'contenido', actualizadoEn: t });
        if (DESC[p.slug] && !p.descripcion) Object.assign(p, { descripcion: DESC[p.slug], actualizadoEn: t });
      }
    }
    if (version < 26) {
      for (const p of paginas) if (p.slug === 'entes-y-autoridades-que-lo-vigilan' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'directorio', actualizadoEn: t });
    }
    // Versión 25: descripciones de 4.1, 4.2 y 4.6 (presupuesto y estados financieros)
    if (version < 25) {
      const DESC: Record<string, string> = {
        'presupuesto-general-de-ingresos-gastos-e-inversion': 'Presupuesto desagregado de ingresos, gastos e inversión aprobado para cada vigencia fiscal.',
        'ejecucion-presupuestal': 'Informes mensuales de ejecución del presupuesto de ingresos (activa) y de gastos (pasiva), e informes de gestión presupuestal.',
        'informacion-publica-yo-relevante': 'Estados financieros comparativos de la E.S.E. con sus notas y revelaciones.',
      };
      for (const p of paginas) if (DESC[p.slug] && !p.descripcion) Object.assign(p, { descripcion: DESC[p.slug], actualizadoEn: t });
    }
    // Versión 24: 1.3 con mapa de procesos visual; 1.6 y 1.7 como directorios con buscador
    if (version < 24) {
      for (const p of paginas) {
        if (p.slug === 'mapas-y-cartas-descriptivas-de-los-procesos' && (p.plantilla === 'documentos' || p.plantilla === 'contenido')) Object.assign(p, { plantilla: 'procesos', actualizadoEn: t });
        if (['directorio-de-entidades', 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'].includes(p.slug) && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'directorio', actualizadoEn: t });
      }
    }
    // Versión 23: Talento humano incluye convocatorias y comunicados del portal anterior
    if (version < 23) {
      const th = paginas.find((p) => p.slug === 'talento-humano' && p.descripcion === 'Manual de funciones, planes de gestión gerencial y documentos del área de Talento Humano.');
      if (th) Object.assign(th, { descripcion: ESTRUCTURA_1519.find((x) => x.slug === 'talento-humano')?.descripcion, actualizadoEn: t });
    }
    // Versión 23: 7.2 Sección de datos abiertos publica los conjuntos de datos (antes era un enlace)
    if (version < 23) {
      for (const p of paginas) {
        if (p.slug === 'seccion-de-datos-abiertos' && p.plantilla === 'enlace') {
          Object.assign(p, { plantilla: 'documentos', urlExterna: undefined, descripcion: p.descripcion || 'Conjuntos de datos abiertos de la E.S.E. en formatos Excel y CSV, y enlace al portal nacional datos.gov.co.', actualizadoEn: t });
        }
      }
    }
    // Versión 19: el Canal anticorrupción – SICOF lleva al formulario /sicof
    if (version < 19) {
      for (const p of paginas) {
        if (p.slug === 'canal-anticorrupcion-sicof' && p.plantilla === 'contenido') Object.assign(p, { plantilla: 'enlace', urlExterna: '/sicof', actualizadoEn: t });
      }
    }
    // Versión 33: nueva página «Racionalización de trámites» tras «Trámites y otros procedimientos»; reordena «Atención y servicios»
    if (version < 33) {
      const orden: Record<string, number> = {
        'tramites-y-otros-procedimientos': 0,
        'racionalizacion-de-tramites': 1,
        'canales-de-atencion': 2,
        pqrsd: 3,
        'carpeta-ciudadana-digital': 4,
        'informacion-para-poblacion-vulnerable': 5,
        'boletines-de-salud': 6,
        'perfil-epidemiologico': 7,
        'copia-historia-clinica-en-linea': 8,
        'solicitudes-contractuales': 8,
        'preguntas-frecuentes': 9,
        glosario: 10,
      };
      const aYs = porSlug.get('atencion-y-servicios-a-la-ciudadania');
      for (const p of paginas) if (aYs && p.parentId === aYs.id && p.slug in orden && p.orden !== orden[p.slug]) Object.assign(p, { orden: orden[p.slug], actualizadoEn: t });
    }
    this.escribir('paginas', paginas);
    this.almacen.setItem(this.prefijo + 'version', String(this.versionSemilla));
  }

  /**
   * Siembra una sola vez el contenido migrado de un archivo JSON:
   * - noticias.json        → api/migraciones/010-noticias.sql
   * - nuestro-hospital.json → api/migraciones/013-nuestro-hospital.sql
   * - atencion-y-participa.json → api/migraciones/014-atencion-y-participa.sql
   * - tramites.json             → api/migraciones/002-tramites.sql (+ 020: enlaces al portal nuevo)
   * - resena-historica.json     → api/migraciones/021-resena-historica.sql (hitos, fotos y portada)
   * - portafolio-servicios.json → api/migraciones/024-portafolio-de-servicios.sql (12 servicios del portafolio)
   * - organigrama.json          → api/migraciones/026-organigrama.sql (dependencias del organigrama)
   * - normatividad.json         → api/migraciones/028-normatividad.sql (resoluciones, acuerdos, políticas…)
   * - sedes-y-horarios.json     → api/migraciones/031-sedes-y-horarios.sql (sede principal y horarios)
   * - control.json              → api/migraciones/039-control.sql (1.13 entes de control, 4.7 a 4.10)
   * - contratacion.json         → api/migraciones/040-contratacion.sql (3.1 PAA, 3.2 relación de contratos, 3.4 manuales, 3.5 formatos)
   * - tramites-suit.json        → api/migraciones/041-tramites-suit.sql (8 trámites SUIT con ficha GOV.CO y normatividad)
   * - instrumentos-gestion.json → api/migraciones/042-instrumentos-gestion.sql (7.1.3 esquema, 7.1.4 PGD, 7.1.5 TRD, certificado de accesibilidad)
   * - esquema-publicacion.json  → api/migraciones/043-esquema-publicacion.sql (7.1.3 con la estructura del portal anterior)
   * - planeacion.json           → api/migraciones/038-planeacion.sql (4.3, 4.4, 4.5, 4.7, manuales, rendición de cuentas)
   * - directorio-institucional.json → api/migraciones/033-directorio-institucional.sql (1.4 directorio y 1.8 servicio al público)
   * - informacion-de-interes.json → api/migraciones/034-informacion-de-interes.sql (datos abiertos, preguntas frecuentes, glosario, talento humano)
   */
  private async sembrarDesdeArchivo(nombre: string, ruta: string): Promise<void> {
    const clave = this.prefijo + nombre;
    if (this.almacen.getItem(clave) === '1') return;
    try {
      const datos = await this.pedirSemilla(ruta);
      if (!datos) return;
      type Item = {
        paginaSlug?: string;
        titulo: string;
        slug: string;
        resumen: string;
        contenido: string;
        tipo?: CmsEntrada['tipo'];
        orden?: number;
        soloSiVacia?: boolean;
        fecha: string | null;
        adjuntos: string[];
        /** URL de la imagen destacada */
        destacada: string | null;
        categoria?: string;
        icono?: string;
        /** «Destacar en portada» (servicios del inicio) */
        portada?: boolean;
      };
      const semilla: {
        origen: string;
        multimedia: { nombre: string; url: string; tipo: CmsMultimedia['tipo']; mime: string | null; titulo: string; alt: string | null }[];
        noticias?: Item[];
        entradas?: Item[];
        /** Actualiza una entrada existente si nadie la ha editado (ej. introducción de la reseña) */
        intro?: { slug: string; resumen: string; contenido: string; destacada: string | null; adjuntos: string[]; siContiene: string };
        /** Complementa entradas existentes: agrega texto y adjuntos (si aún no tienen siNoContiene) o cambia el orden (si conserva siOrden) */
        ampliar?: { paginaSlug: string; slug: string; agregar?: string; siNoContiene?: string; adjuntos?: string[]; orden?: number; siOrden?: number }[];
        /** Cambia la URL de archivos ya registrados (ej. versión nueva de un formato) */
        reemplazarUrls?: Record<string, string>;
        /** Corrige un texto de una entrada existente (ej. un enlace a una página nueva) */
        reemplazarTexto?: { paginaSlug: string; slug: string; buscar: string; reemplazo: string }[];
        /** Reemplaza el contenido de una entrada si nadie lo ha editado (aún contiene siContiene o es igual a una versión anterior) */
        actualizar?: { paginaSlug: string; slug: string; contenido: string; siContiene?: string; siIgualA?: string[] }[];
        /** Cambia la plantilla y la descripción de una página si conserva los valores anteriores */
        paginas?: { slug: string; plantillaAnterior: CmsPagina['plantilla']; plantilla: CmsPagina['plantilla']; descripcion: string; siDescripcion: string }[];
      } = datos;
      const items: Item[] = semilla.entradas ?? (semilla.noticias ?? []).map((n) => ({ ...n, paginaSlug: 'noticias', tipo: 'noticia' }));

      const paginas = this.leer<CmsPagina>('paginas');
      const t = this.ahora();
      const multimedia = this.leer<CmsMultimedia>('multimedia');
      const entradas = this.leer<CmsEntrada>('entradas');
      const porUrl = new Map(multimedia.map((m) => [m.url, m.id]));
      let idM = this.nuevoId(multimedia);
      for (const m of semilla.multimedia) {
        if (porUrl.has(m.url)) continue;
        multimedia.push({ id: idM, nombre: m.nombre, url: m.url, tipo: m.tipo, mime: m.mime ?? undefined, titulo: m.titulo, alt: m.alt ?? undefined, migradoDe: semilla.origen, creadoEn: t });
        porUrl.set(m.url, idM++);
      }
      let idE = this.nuevoId(entradas);
      for (const n of items) {
        const pagina = paginas.find((p) => p.slug === n.paginaSlug);
        if (!pagina) continue;
        if (entradas.some((e) => e.paginaId === pagina.id && e.slug === n.slug)) continue;
        if (n.soloSiVacia && entradas.some((e) => e.paginaId === pagina.id)) continue;
        entradas.push({
          id: idE++,
          paginaId: pagina.id,
          titulo: n.titulo,
          slug: n.slug,
          resumen: n.resumen,
          contenido: n.contenido,
          tipo: n.tipo ?? 'articulo',
          categoria: n.categoria ?? (pagina.plantilla === 'listado' ? categoriaSugerida(n.titulo) : null),
          icono: n.icono ?? null,
          estado: 'publicada',
          destacada: n.portada ?? false,
          imagenDestacadaId: n.destacada ? porUrl.get(n.destacada) ?? null : null,
          multimediaIds: n.adjuntos.map((u) => porUrl.get(u)).filter((x): x is number => x !== undefined),
          autor: 'E.S.E. Hospital San José del Guaviare',
          fechaPublicacion: n.fecha ?? t,
          orden: n.orden ?? 0,
          migradoDe: semilla.origen,
          creadoEn: t,
          actualizadoEn: t,
        });
      }
      if (semilla.intro) {
        const it = semilla.intro;
        const e = entradas.find((x) => x.slug === it.slug && x.contenido?.includes(it.siContiene) && !x.imagenDestacadaId);
        if (e) {
          Object.assign(e, {
            resumen: it.resumen,
            contenido: it.contenido,
            orden: 0,
            imagenDestacadaId: it.destacada ? porUrl.get(it.destacada) ?? null : null,
            multimediaIds: it.adjuntos.map((u) => porUrl.get(u)).filter((x): x is number => x !== undefined),
            actualizadoEn: t,
          });
        }
      }
      for (const a of semilla.ampliar ?? []) {
        const pagina = paginas.find((p) => p.slug === a.paginaSlug);
        const e = pagina && entradas.find((x) => x.paginaId === pagina.id && x.slug === a.slug);
        if (!e) continue;
        if (a.agregar && a.siNoContiene && !(e.contenido ?? '').includes(a.siNoContiene)) {
          const nuevos = (a.adjuntos ?? []).map((u) => porUrl.get(u)).filter((x): x is number => x !== undefined && !e.multimediaIds.includes(x));
          Object.assign(e, { contenido: `${e.contenido ?? ''}\n${a.agregar}`, multimediaIds: [...e.multimediaIds, ...nuevos], orden: a.orden ?? e.orden, actualizadoEn: t });
        } else if (a.siOrden !== undefined && e.orden === a.siOrden && a.orden !== undefined) {
          e.orden = a.orden;
        } else if (!a.agregar && a.adjuntos?.length) {
          // Solo agrega archivos nuevos a la entrada (ej. el informe de un trimestre más)
          const nuevos = a.adjuntos.map((u) => porUrl.get(u)).filter((x): x is number => x !== undefined && !e.multimediaIds.includes(x));
          if (nuevos.length) Object.assign(e, { multimediaIds: [...e.multimediaIds, ...nuevos], actualizadoEn: t });
        }
      }
      for (const m of multimedia) {
        const nueva = semilla.reemplazarUrls?.[m.url];
        if (nueva && !porUrl.has(nueva)) m.url = nueva;
      }
      for (const r of semilla.reemplazarTexto ?? []) {
        const pagina = paginas.find((p) => p.slug === r.paginaSlug);
        const e = pagina && entradas.find((x) => x.paginaId === pagina.id && x.slug === r.slug);
        if (e?.contenido?.includes(r.buscar)) Object.assign(e, { contenido: e.contenido.replace(r.buscar, r.reemplazo), actualizadoEn: t });
      }
      for (const u of semilla.actualizar ?? []) {
        const pagina = paginas.find((p) => p.slug === u.paginaSlug);
        const e = pagina && entradas.find((x) => x.paginaId === pagina.id && x.slug === u.slug);
        if (!e?.contenido) continue;
        if ((u.siContiene && e.contenido.includes(u.siContiene)) || u.siIgualA?.includes(e.contenido)) Object.assign(e, { contenido: u.contenido, actualizadoEn: t });
      }
      for (const cambio of semilla.paginas ?? []) {
        const p = paginas.find((x) => x.slug === cambio.slug);
        if (!p) continue;
        if (p.plantilla === cambio.plantillaAnterior) Object.assign(p, { plantilla: cambio.plantilla, actualizadoEn: t });
        if (p.descripcion === cambio.siDescripcion) p.descripcion = cambio.descripcion;
        for (const e of entradas) if (e.paginaId === p.id && e.resumen === cambio.siDescripcion) e.resumen = cambio.descripcion;
      }
      if (semilla.paginas?.length) this.escribir('paginas', paginas);
      this.escribir('multimedia', multimedia);
      this.escribir('entradas', entradas);
      this.almacen.setItem(clave, '1');
    } catch {
      /* sin conexión o almacenamiento lleno: el portal sigue funcionando sin este contenido */
    }
  }

  /** Contenido inicial fijo (pie de página, misión y visión…). Se siembra una sola vez por lista */
  private sembrarEntradasFijas(nombre: string, lista: (EntradaPieSemilla & { orden?: number })[]): void {
    const clave = this.prefijo + nombre;
    if (this.almacen.getItem(clave) === '1') return;
    const paginas = this.leer<CmsPagina>('paginas');
    const entradas = this.leer<CmsEntrada>('entradas');
    const t = this.ahora();
    let id = this.nuevoId(entradas);
    for (const e of lista) {
      const pagina = paginas.find((p) => p.slug === e.paginaSlug);
      if (!pagina || entradas.some((x) => x.paginaId === pagina.id && x.slug === e.slug)) continue;
      entradas.push({
        id: id++,
        paginaId: pagina.id,
        titulo: e.titulo,
        slug: e.slug,
        resumen: e.resumen,
        contenido: e.contenido,
        tipo: 'articulo',
        estado: 'publicada',
        destacada: false,
        imagenDestacadaId: null,
        multimediaIds: [],
        autor: 'E.S.E. Hospital San José del Guaviare',
        fechaPublicacion: t,
        orden: e.orden ?? 0,
        creadoEn: t,
        actualizadoEn: t,
      });
    }
    this.escribir('entradas', entradas);
    this.almacen.setItem(clave, '1');
  }
}

type PaginaSemilla = Omit<CmsPagina, 'creadoEn' | 'actualizadoEn' | 'visibleEnMenu' | 'estado'> &
  Partial<Pick<CmsPagina, 'visibleEnMenu' | 'estado'>>;

/** Generada a partir de database/cms-schema.sql (misma estructura e ids) */
const ESTRUCTURA_1519: PaginaSemilla[] = [
  { id: 1, menuId: 1, parentId: null, titulo: "Transparencia y acceso a la información pública", slug: 'transparencia', plantilla: 'contenido', descripcion: "Información pública de la E.S.E. Hospital San José del Guaviare, organizada según la Ley 1712 de 2014 y la Resolución 1519 de 2020 de MinTIC.", orden: 1 },
  { id: 2, menuId: 1, parentId: 1, titulo: "1. Información de la entidad", slug: 'informacion-de-la-entidad', plantilla: 'contenido', descripcion: "Conozca quiénes somos, cómo estamos organizados, cómo contactarnos, quién nos vigila y cómo tomamos las decisiones que le afectan.", orden: 0 },
  { id: 3, menuId: 1, parentId: 2, titulo: "1.1 Misión, visión, funciones y deberes", slug: 'mision-vision-funciones-y-deberes', plantilla: 'plataforma', descripcion: "Plataforma estratégica de la E.S.E. Hospital San José del Guaviare: misión, visión y valores corporativos.", orden: 0 },
  { id: 4, menuId: 1, parentId: 2, titulo: "1.2 Estructura orgánica - Organigrama", slug: 'estructura-organica-organigrama', plantilla: 'organigrama', descripcion: "Organigrama y estructura administrativa de la E.S.E. Hospital San José del Guaviare.", orden: 1 },
  { id: 5, menuId: 1, parentId: 2, titulo: "1.3 Mapas y cartas descriptivas de los procesos", slug: 'mapas-y-cartas-descriptivas-de-los-procesos', plantilla: 'procesos', descripcion: "Mapa de procesos y caracterizaciones de los procesos institucionales.", orden: 2 },
  { id: 6, menuId: 1, parentId: 2, titulo: "1.4 Directorio institucional", slug: 'directorio-institucional', plantilla: 'directorio', descripcion: "Dependencias, responsables, teléfonos y correos para comunicarse con el hospital.", orden: 3 },
  { id: 7, menuId: 1, parentId: 2, titulo: "1.5 Directorio de servidores públicos, empleados o contratistas", slug: 'directorio-de-servidores-publicos-empleados-o-contratistas', plantilla: 'documentos', descripcion: "Servidores públicos y contratistas de la entidad, con su cargo e información de contacto.", orden: 4 },
  { id: 8, menuId: 1, parentId: 2, titulo: "1.6 Directorio de entidades", slug: 'directorio-de-entidades', plantilla: 'directorio', descripcion: "Entidades del sector salud y del Estado con las que se relaciona la E.S.E.", orden: 5 },
  { id: 9, menuId: 1, parentId: 2, titulo: "1.7 Directorio de agremiaciones, asociaciones y otros grupos de interés", slug: 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes', plantilla: 'directorio', descripcion: "Asociaciones de usuarios, agremiaciones y grupos de interés relacionados con el hospital.", orden: 6 },
  { id: 10, menuId: 1, parentId: 2, titulo: "1.8 Servicio al público, normas, formularios y protocolos de atención", slug: 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion', plantilla: 'documentos', descripcion: "Normas, formularios y protocolos que orientan la atención a la ciudadanía.", orden: 7 },
  { id: 11, menuId: 1, parentId: 2, titulo: "1.9 Procedimientos que se siguen para tomar decisiones en las diferentes áreas", slug: 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas', plantilla: 'documentos', descripcion: "Procedimientos e instancias que intervienen en la toma de decisiones de cada área.", orden: 8 },
  { id: 12, menuId: 1, parentId: 2, titulo: "1.10 Mecanismo de presentación directa de solicitudes, quejas y reclamos", slug: 'mecanismo-pqrsd', plantilla: 'enlace', urlExterna: '/pqrsf', descripcion: "Radique en línea peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias, y consulte su estado.", orden: 9 },
  { id: 13, menuId: 1, parentId: 2, titulo: "1.11 Calendario de actividades y eventos", slug: 'calendario-de-actividades-y-eventos', plantilla: 'calendario', descripcion: "Agenda de capacitaciones, jornadas, comités y espacios de participación de la E.S.E. Hospital San José del Guaviare.", orden: 10 },
  { id: 14, menuId: 1, parentId: 2, titulo: "1.12 Información sobre decisiones que pueden afectar al público", slug: 'informacion-sobre-decisiones-que-pueden-afectar-al-publico', plantilla: 'documentos', descripcion: "Decisiones institucionales que pueden afectar a la ciudadanía y sus fundamentos.", orden: 11 },
  { id: 15, menuId: 1, parentId: 2, titulo: "1.13 Entes y autoridades que lo vigilan", slug: 'entes-y-autoridades-que-lo-vigilan', plantilla: 'directorio', descripcion: "Organismos de control, vigilancia e inspección que supervisan la gestión de la E.S.E.", orden: 12 },
  { id: 16, menuId: 1, parentId: 2, titulo: "1.14 Publicación de hojas de vida", slug: 'publicacion-de-hojas-de-vida', plantilla: 'documentos', descripcion: "Hojas de vida de aspirantes a cargos de libre nombramiento, publicadas para observaciones ciudadanas.", orden: 13 },
  { id: 17, menuId: 1, parentId: 1, titulo: "2. Normativa", slug: 'normativa', plantilla: 'contenido', orden: 1 },
  { id: 18, menuId: 1, parentId: 17, titulo: "2.1 Normativa de la entidad", slug: 'normativa-de-la-entidad', plantilla: 'contenido', orden: 0 },
  { id: 19, menuId: 1, parentId: 18, titulo: "2.1.1 Leyes", slug: 'leyes', plantilla: 'documentos', orden: 0 },
  { id: 20, menuId: 1, parentId: 18, titulo: "2.1.2 Decreto único reglamentario", slug: 'decreto-unico-reglamentario', plantilla: 'documentos', orden: 1 },
  { id: 21, menuId: 1, parentId: 18, titulo: "2.1.3 Normativa aplicable", slug: 'normativa-aplicable', plantilla: 'documentos', orden: 2 },
  { id: 22, menuId: 1, parentId: 18, titulo: "2.1.4 Vínculo al Diario o Gaceta Oficial", slug: 'vinculo-al-diario-o-gaceta-oficial', plantilla: 'enlace', urlExterna: 'http://www.imprenta.gov.co/diario-oficial', orden: 3 },
  { id: 23, menuId: 1, parentId: 18, titulo: "2.1.5 Políticas, lineamientos y manuales", slug: 'politicas-lineamientos-y-manuales', plantilla: 'documentos', orden: 4 },
  { id: 24, menuId: 1, parentId: 18, titulo: "2.1.6 Agenda regulatoria", slug: 'agenda-regulatoria', plantilla: 'documentos', orden: 5 },
  { id: 25, menuId: 1, parentId: 17, titulo: "2.2 Búsqueda de normas", slug: 'busqueda-de-normas', plantilla: 'contenido', orden: 1 },
  { id: 26, menuId: 1, parentId: 25, titulo: "2.2.1 Sistema Único de Información Normativa - SUIN", slug: 'sistema-unico-de-informacion-normativa-suin', plantilla: 'enlace', urlExterna: 'https://www.suin-juriscol.gov.co', orden: 0 },
  { id: 27, menuId: 1, parentId: 25, titulo: "2.2.2 Sistema de búsqueda de normas propio de la entidad", slug: 'sistema-de-busqueda-de-normas-propio-de-la-entidad', plantilla: 'documentos', orden: 1 },
  { id: 28, menuId: 1, parentId: 17, titulo: "2.3 Proyectos de normas para comentarios", slug: 'proyectos-de-normas-para-comentarios', plantilla: 'documentos', orden: 2 },
  { id: 29, menuId: 1, parentId: 1, titulo: "3. Contratación", slug: 'contratacion', plantilla: 'contenido', orden: 2 },
  { id: 30, menuId: 1, parentId: 29, titulo: "3.1 Plan Anual de Adquisiciones", slug: 'plan-anual-de-adquisiciones', plantilla: 'documentos', orden: 0 },
  { id: 31, menuId: 1, parentId: 29, titulo: "3.2 Publicación de la información contractual", slug: 'publicacion-de-la-informacion-contractual', plantilla: 'documentos', orden: 1 },
  { id: 32, menuId: 1, parentId: 29, titulo: "3.3 Publicación de la ejecución de los contratos", slug: 'publicacion-de-la-ejecucion-de-los-contratos', plantilla: 'documentos', orden: 2 },
  { id: 33, menuId: 1, parentId: 29, titulo: "3.4 Manual de contratación, adquisición y/o compras", slug: 'manual-de-contratacion-adquisicion-yo-compras', plantilla: 'documentos', orden: 3 },
  { id: 34, menuId: 1, parentId: 29, titulo: "3.5 Formatos o modelos de contratos o pliegos tipo", slug: 'formatos-o-modelos-de-contratos-o-pliegos-tipo', plantilla: 'documentos', orden: 4 },
  { id: 35, menuId: 1, parentId: 1, titulo: "4. Planeación, presupuesto e informes", slug: 'planeacion-presupuesto-e-informes', plantilla: 'contenido', orden: 3 },
  { id: 36, menuId: 1, parentId: 35, titulo: "4.1 Presupuesto general de ingresos, gastos e inversión", slug: 'presupuesto-general-de-ingresos-gastos-e-inversion', plantilla: 'documentos', orden: 0 },
  { id: 37, menuId: 1, parentId: 35, titulo: "4.2 Ejecución presupuestal", slug: 'ejecucion-presupuestal', plantilla: 'documentos', orden: 1 },
  { id: 38, menuId: 1, parentId: 35, titulo: "4.3 Plan de acción", slug: 'plan-de-accion', plantilla: 'documentos', orden: 2 },
  { id: 39, menuId: 1, parentId: 35, titulo: "4.4 Proyectos de inversión", slug: 'proyectos-de-inversion', plantilla: 'documentos', orden: 3 },
  { id: 40, menuId: 1, parentId: 35, titulo: "4.5 Informes de empalme", slug: 'informes-de-empalme', plantilla: 'documentos', orden: 4 },
  { id: 41, menuId: 1, parentId: 35, titulo: "4.6 Información pública y/o relevante", slug: 'informacion-publica-yo-relevante', plantilla: 'documentos', orden: 5 },
  { id: 42, menuId: 1, parentId: 35, titulo: "4.7 Informes de gestión, evaluación y auditoría", slug: 'informes-de-gestion-evaluacion-y-auditoria', plantilla: 'documentos', orden: 6 },
  { id: 43, menuId: 1, parentId: 35, titulo: "4.8 Informes de la Oficina de Control Interno", slug: 'informes-de-la-oficina-de-control-interno', plantilla: 'documentos', orden: 7 },
  { id: 44, menuId: 1, parentId: 35, titulo: "4.9 Informe sobre defensa pública y prevención del daño antijurídico", slug: 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico', plantilla: 'documentos', orden: 8 },
  { id: 45, menuId: 1, parentId: 35, titulo: "4.10 Informes trimestrales sobre acceso a información, quejas y reclamos", slug: 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos', plantilla: 'documentos', orden: 9 },
  { id: 46, menuId: 1, parentId: 1, titulo: "5. Trámites", slug: 'tramites-transparencia', plantilla: 'enlace', urlExterna: '/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos', orden: 4 },
  { id: 47, menuId: 1, parentId: 1, titulo: "6. Participa", slug: 'participa-transparencia', plantilla: 'enlace', urlExterna: '/participa', orden: 5 },
  { id: 48, menuId: 1, parentId: 1, titulo: "7. Datos abiertos", slug: 'datos-abiertos', plantilla: 'contenido', orden: 6 },
  { id: 49, menuId: 1, parentId: 48, titulo: "7.1 Instrumentos de gestión de la información", slug: 'instrumentos-de-gestion-de-la-informacion', plantilla: 'contenido', orden: 0 },
  { id: 50, menuId: 1, parentId: 49, titulo: "7.1.1 Registro de activos de información", slug: 'registro-de-activos-de-informacion', plantilla: 'documentos', orden: 0 },
  { id: 51, menuId: 1, parentId: 49, titulo: "7.1.2 Índice de información clasificada y reservada", slug: 'indice-de-informacion-clasificada-y-reservada', plantilla: 'documentos', orden: 1 },
  { id: 52, menuId: 1, parentId: 49, titulo: "7.1.3 Esquema de publicación de la información", slug: 'esquema-de-publicacion-de-la-informacion', plantilla: 'esquema', descripcion: "Instrumento para facilitar el acceso organizado, oportuno y transparente a la información pública de la E.S.E. Hospital San José del Guaviare.", orden: 2 },
  { id: 53, menuId: 1, parentId: 49, titulo: "7.1.4 Programa de Gestión Documental", slug: 'programa-de-gestion-documental', plantilla: 'documentos', descripcion: "Programa de Gestión Documental (PGD), instrumentos archivísticos, inventarios de fondos acumulados y transferencias documentales.", orden: 3 },
  { id: 54, menuId: 1, parentId: 49, titulo: "7.1.5 Tablas de Retención Documental", slug: 'tablas-de-retencion-documental', plantilla: 'documentos', descripcion: "Tablas de Retención Documental (TRD) de la E.S.E. y actos administrativos de aprobación.", orden: 4 },
  { id: 55, menuId: 1, parentId: 49, titulo: "7.1.6 Costos de reproducción de la información pública", slug: 'costos-de-reproduccion-de-la-informacion-publica', plantilla: 'documentos', orden: 5 },
  { id: 56, menuId: 1, parentId: 48, titulo: "7.2 Sección de datos abiertos", slug: 'seccion-de-datos-abiertos', plantilla: 'documentos', descripcion: "Conjuntos de datos abiertos de la E.S.E. en formatos Excel y CSV, y enlace al portal nacional datos.gov.co.", orden: 1 },
  { id: 57, menuId: 1, parentId: 1, titulo: "8. Información específica para grupos de interés", slug: 'informacion-especifica-para-grupos-de-interes', plantilla: 'contenido', descripcion: "Información dirigida a niñas, niños y adolescentes, mujeres, grupos étnicos y poblaciones de atención diferencial.", orden: 7 },
  { id: 58, menuId: 1, parentId: 57, titulo: "8.1 Información para niñas, niños y adolescentes", slug: 'informacion-para-ninas-ninos-y-adolescentes', plantilla: 'contenido', descripcion: "Enlaces seguros con información, juegos y orientación para niñas, niños y adolescentes.", orden: 0 },
  { id: 59, menuId: 1, parentId: 57, titulo: "8.2 Información para mujeres", slug: 'informacion-para-mujeres', plantilla: 'contenido', orden: 1 },
  { id: 60, menuId: 1, parentId: 57, titulo: "8.3 Otros grupos de interés", slug: 'otros-grupos-de-interes', plantilla: 'contenido', descripcion: "Atención con enfoque diferencial para grupos étnicos, personas con discapacidad, personas adultas mayores y víctimas del conflicto armado.", orden: 2 },
  { id: 108, menuId: 1, parentId: 60, titulo: "Grupos étnicos", slug: 'grupos-etnicos', plantilla: 'secciones', icono: 'govco:globe-americas', descripcion: "Atención integral en salud con enfoque diferencial, intercultural y de respeto por la diversidad étnica y cultural del territorio.", orden: 0 },
  { id: 109, menuId: 1, parentId: 60, titulo: "Atención con enfoque diferencial", slug: 'atencion-con-enfoque-diferencial', plantilla: 'secciones', icono: 'govco:universal-access', descripcion: "Información y orientación para personas en situación de discapacidad, personas adultas mayores y víctimas del conflicto armado.", orden: 1 },
  { id: 61, menuId: 1, parentId: 1, titulo: "9. Obligación de reporte de información específica por parte de la entidad", slug: 'reporte-de-informacion-especifica', plantilla: 'documentos', orden: 8 },
  { id: 62, menuId: 1, parentId: null, titulo: "Atención y servicios a la ciudadanía", slug: 'atencion-y-servicios-a-la-ciudadania', plantilla: 'contenido', descripcion: "Trámites, canales de atención y mecanismos para presentar peticiones, quejas, reclamos, sugerencias y denuncias.", orden: 2 },
  { id: 63, menuId: 1, parentId: 62, titulo: "Trámites y otros procedimientos", slug: 'tramites-y-otros-procedimientos', plantilla: 'contenido', orden: 0 },
  { id: 113, menuId: 1, parentId: 62, titulo: "Racionalización de trámites", slug: 'racionalizacion-de-tramites', plantilla: 'contenido', descripcion: "Estrategia de racionalización de trámites de la E.S.E. conforme a la Ley 2052 de 2020 y la política de racionalización del DAFP, con los trámites inscritos en el SUIT.", orden: 1 },
  { id: 64, menuId: 1, parentId: 62, titulo: "Canales de atención y pida una cita", slug: 'canales-de-atencion', plantilla: 'contenido', descripcion: "Solicite su cita, radique PQRSFD, pida copia de su historia clínica y consulte sus resultados de laboratorio.", orden: 2 },
  { id: 65, menuId: 1, parentId: 62, titulo: "PQRSD - Peticiones, quejas, reclamos, sugerencias y denuncias", slug: 'pqrsd', plantilla: 'enlace', urlExterna: '/pqrsf', orden: 3 },
  { id: 66, menuId: 1, parentId: 62, titulo: "Carpeta Ciudadana Digital", slug: 'carpeta-ciudadana-digital', plantilla: 'enlace', urlExterna: 'https://carpetaciudadana.and.gov.co/', descripcion: "Consulte en un solo lugar sus documentos e información en poder del Estado colombiano.", orden: 4 },
  { id: 97, menuId: 1, parentId: 62, titulo: "Información para población vulnerable", slug: 'informacion-para-poblacion-vulnerable', plantilla: 'enlace', urlExterna: '/transparencia/informacion-especifica-para-grupos-de-interes', orden: 5 },
  { id: 98, menuId: 1, parentId: 62, titulo: "Boletines de salud", slug: 'boletines-de-salud', plantilla: 'listado', descripcion: "Boletines epidemiológicos, infografías y piezas informativas sobre fechas conmemorativas en salud.", orden: 6 },
  { id: 99, menuId: 1, parentId: 62, titulo: "Perfil epidemiológico", slug: 'perfil-epidemiologico', plantilla: 'documentos', descripcion: "Perfil epidemiológico institucional y boletines epidemiológicos trimestrales.", orden: 7 },
  { id: 105, menuId: 1, parentId: 62, titulo: "Solicitudes contractuales", slug: 'solicitudes-contractuales', plantilla: 'enlace', urlExterna: '/solicitudes-contractuales', descripcion: "Solicite certificaciones de sus contratos con la E.S.E. y consulte el estado de su solicitud.", orden: 8 },
  { id: 111, menuId: 1, parentId: 62, titulo: "Copia de historia clínica", slug: 'copia-historia-clinica-en-linea', plantilla: 'enlace', urlExterna: '/solicitud-historia-clinica', descripcion: "Solicite en línea la copia de su historia clínica y consulte el estado con su número de radicado.", orden: 8 },
  { id: 106, menuId: 1, parentId: 62, titulo: "Preguntas frecuentes", slug: 'preguntas-frecuentes', plantilla: 'preguntas', descripcion: "Respuestas a las dudas más comunes sobre contacto, citas, trámites, PQRSFD, derechos y deberes de los usuarios.", orden: 9 },
  { id: 107, menuId: 1, parentId: 62, titulo: "Glosario", slug: 'glosario', plantilla: 'glosario', descripcion: "Términos jurídicos, administrativos y de salud que se usan en la gestión del hospital, de la A a la Z.", orden: 10 },
  { id: 67, menuId: 1, parentId: null, titulo: "Participa", slug: 'participa', plantilla: 'contenido', descripcion: "Espacios de participación ciudadana en la gestión de la E.S.E. Hospital San José del Guaviare (lineamientos del DAFP).", orden: 3 },
  { id: 68, menuId: 1, parentId: 67, titulo: "Participación para el diagnóstico de necesidades e identificación de problemas", slug: 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas', plantilla: 'contenido', descripcion: "Espacio para identificar y analizar las necesidades, expectativas y problemáticas de la comunidad en relación con los servicios de salud.", orden: 0 },
  { id: 69, menuId: 1, parentId: 67, titulo: "Planeación y presupuesto participativo", slug: 'planeacion-y-presupuesto-participativo', plantilla: 'contenido', descripcion: "La comunidad participa en la definición de prioridades, la asignación de recursos y la formulación de planes y proyectos institucionales.", orden: 1 },
  { id: 70, menuId: 1, parentId: 67, titulo: "Consulta ciudadana", slug: 'consulta-ciudadana', plantilla: 'contenido', descripcion: "Temas abiertos a consulta para que la comunidad aporte a las decisiones y políticas institucionales.", orden: 2 },
  { id: 71, menuId: 1, parentId: 67, titulo: "Colaboración e innovación abierta", slug: 'colaboracion-e-innovacion-abierta', plantilla: 'contenido', descripcion: "Co-creación de soluciones innovadoras a problemáticas de salud entre la institución, la comunidad y otros actores.", orden: 3 },
  { id: 72, menuId: 1, parentId: 67, titulo: "Rendición de cuentas", slug: 'rendicion-de-cuentas', plantilla: 'documentos', descripcion: "Informes, audiencias públicas y mecanismos con los que la E.S.E. informa sobre su gestión, resultados y uso de recursos.", orden: 4 },
  { id: 73, menuId: 1, parentId: 67, titulo: "Control social", slug: 'control-social', plantilla: 'contenido', descripcion: "Espacios para que la comunidad conozca, vigile y evalúe la gestión institucional y el uso de los recursos públicos (Ley 850 de 2003 y Ley 1757 de 2015).", orden: 5 },
  { id: 100, menuId: 1, parentId: 67, titulo: "Estrategia de participación ciudadana", slug: 'estrategia-de-participacion-ciudadana', plantilla: 'contenido', descripcion: "Cómo la E.S.E. articula a usuarios, familias, líderes y organizaciones en la planeación, el seguimiento y el control social.", orden: 6 },
  { id: 101, menuId: 1, parentId: 67, titulo: "Plan Anticorrupción y de Atención al Ciudadano (PAAC)", slug: 'plan-anticorrupcion-y-de-atencion-al-ciudadano', plantilla: 'contenido', descripcion: "Acciones para prevenir la corrupción y mejorar la atención y el servicio a la ciudadanía.", orden: 7 },
  { id: 102, menuId: 1, parentId: 67, titulo: "Calendario de eventos", slug: 'calendario-de-participacion', plantilla: 'enlace', urlExterna: '/transparencia/informacion-de-la-entidad/calendario-de-actividades-y-eventos', orden: 8 },
  { id: 103, menuId: 1, parentId: 67, titulo: "Normativas institucionales", slug: 'normativas-institucionales', plantilla: 'enlace', urlExterna: '/transparencia/normativa/normativa-de-la-entidad', orden: 9 },
  { id: 104, menuId: 1, parentId: 67, titulo: "Divulgación de resultados", slug: 'divulgacion-de-resultados', plantilla: 'contenido', descripcion: "Avances y resultados de la gestión en el marco de la participación ciudadana.", orden: 10 },
  { id: 112, menuId: 1, parentId: 67, titulo: "Consultas ciudadanas en línea", slug: 'consultas-ciudadanas-en-linea', plantilla: 'enlace', urlExterna: '/participacion', descripcion: "Participe en las consultas abiertas de la E.S.E.: conozca los temas, envíe sus aportes en línea y consulte los resultados.", orden: 11 },
  { id: 74, menuId: 1, parentId: null, titulo: "Nuestro Hospital", slug: 'nuestro-hospital', plantilla: 'contenido', orden: 0 },
  { id: 86, menuId: 1, parentId: 74, titulo: "Misión y visión", slug: 'mision-vision', plantilla: 'enlace', urlExterna: '/transparencia/informacion-de-la-entidad/mision-vision-funciones-y-deberes', orden: 0 },
  { id: 75, menuId: 1, parentId: 74, titulo: "Reseña histórica", slug: 'resena-historica', plantilla: 'historia', orden: 1 },
  { id: 87, menuId: 1, parentId: 74, titulo: "Estructura orgánica", slug: 'estructura-organica', plantilla: 'enlace', urlExterna: '/transparencia/informacion-de-la-entidad/estructura-organica-organigrama', orden: 2 },
  { id: 76, menuId: 1, parentId: 74, titulo: "Portafolio de servicios", slug: 'portafolio-de-servicios', plantilla: 'servicios', descripcion: "Conozca los servicios de salud que presta la E.S.E. Hospital San José del Guaviare, hospital de II nivel de complejidad y centro de referencia del departamento.", orden: 3 },
  { id: 77, menuId: 1, parentId: 74, titulo: "Sedes y horarios de atención", slug: 'sedes-y-horarios', plantilla: 'sedes', descripcion: "Dirección, teléfonos, ubicación en el mapa y horarios de atención de la E.S.E. Hospital San José del Guaviare.", orden: 4 },
  { id: 88, menuId: 1, parentId: 74, titulo: "Calendario de eventos", slug: 'calendario-de-eventos', plantilla: 'enlace', urlExterna: '/transparencia/informacion-de-la-entidad/calendario-de-actividades-y-eventos', orden: 5 },
  { id: 89, menuId: 1, parentId: 74, titulo: "Alianza de usuarios", slug: 'alianza-de-usuarios', plantilla: 'contenido', descripcion: "Asociación de usuarios que representa a la comunidad ante la E.S.E. Hospital San José del Guaviare.", orden: 6 },
  { id: 90, menuId: 1, parentId: 74, titulo: "Comité de convivencia laboral", slug: 'comite-de-convivencia-laboral', plantilla: 'documentos', descripcion: "Instancia que promueve un buen ambiente laboral y previene y atiende las situaciones que pueden constituir acoso laboral (Ley 1010 de 2006). Aquí se publican su conformación, comunicados y los documentos de elección de sus integrantes.", orden: 7 },
  { id: 91, menuId: 1, parentId: 74, titulo: "Talento humano", slug: 'talento-humano', plantilla: 'documentos', descripcion: "Manual de funciones, planes, convocatorias, comités, elecciones de representantes, capacitaciones y reglamento interno de trabajo del área de Talento Humano.", orden: 8 },
  { id: 92, menuId: 1, parentId: 74, titulo: "Planes Decreto 612 de 2018", slug: 'planes-decreto-612-de-2018', plantilla: 'documentos', descripcion: "Planes institucionales y estratégicos que la entidad debe publicar según el Decreto 612 de 2018.", orden: 9 },
  { id: 93, menuId: 1, parentId: 74, titulo: "Canal anticorrupción – SICOF", slug: 'canal-anticorrupcion-sicof', plantilla: 'enlace', urlExterna: '/sicof', descripcion: "Subsistema del Riesgo de Corrupción, Opacidad y Fraude: cómo reportar una conducta posiblemente irregular.", orden: 10 },
  { id: 94, menuId: 1, parentId: 74, titulo: "Sistema SARLAFT", slug: 'sistema-sarlaft', plantilla: 'enlace', urlExterna: 'https://esehospitalguaviare.gov.co/sistema-sarlaft/', orden: 11 },
  { id: 110, menuId: 1, parentId: 74, titulo: "Gobierno Digital", slug: 'gobierno-digital', plantilla: 'secciones', icono: 'govco:laptop-code', descripcion: "Proyectos, aplicativos, plataformas y soluciones tecnológicas de la E.S.E. en el marco de Gobierno Digital e innovación tecnológica.", orden: 11 },
  { id: 95, menuId: 1, parentId: 74, titulo: "Acceso ALMERA", slug: 'acceso-almera', plantilla: 'enlace', urlExterna: 'https://sgi.almeraim.com/sgi/index.php?conid=sgiesehospitalguaviare', orden: 12 },
  { id: 96, menuId: 1, parentId: 74, titulo: "Acceso Outlook", slug: 'acceso-outlook', plantilla: 'enlace', urlExterna: 'https://outlook.office.com/mail/', orden: 13 },
  { id: 83, menuId: 1, parentId: null, titulo: "Información de interés", slug: 'informacion-de-interes', plantilla: 'contenido', descripcion: "Invitaciones a cotizar y convocatorias laborales de la E.S.E. Hospital San José del Guaviare.", orden: 4 },
  { id: 78, menuId: 1, parentId: 83, titulo: "Invitaciones a cotizar", slug: 'cotizaciones-propuestas', plantilla: 'enlace', urlExterna: '/informacion-de-interes/invitaciones-a-cotizar', orden: 0 },
  { id: 79, menuId: 1, parentId: 83, titulo: "Trabaja con nosotros", slug: 'trabaja-nosotros', plantilla: 'enlace', urlExterna: '/informacion-de-interes/trabaja-con-nosotros', orden: 1 },
  { id: 80, menuId: 1, parentId: null, titulo: "Noticias", slug: 'noticias', plantilla: 'listado', orden: 5, visibleEnMenu: false },
  { id: 81, menuId: 2, parentId: null, titulo: "Políticas de privacidad y tratamiento de datos", slug: 'politicas-de-privacidad', plantilla: 'contenido', descripcion: "Cómo recolectamos, usamos y protegemos sus datos personales, y cómo puede ejercer sus derechos como titular.", orden: 0 },
  { id: 82, menuId: 2, parentId: null, titulo: "Términos y condiciones", slug: 'terminos-y-condiciones', plantilla: 'contenido', descripcion: "Condiciones de uso del portal web de la E.S.E. Hospital San José del Guaviare.", orden: 1 },
  { id: 84, menuId: 2, parentId: null, titulo: "Accesibilidad", slug: 'accesibilidad', plantilla: 'contenido', descripcion: "Herramientas y compromisos para que todas las personas puedan usar este portal.", orden: 2 },
  { id: 85, menuId: 2, parentId: null, titulo: "Mapa del sitio", slug: 'mapa-del-sitio', plantilla: 'enlace', urlExterna: '/mapa-del-sitio', orden: 3 },
];
