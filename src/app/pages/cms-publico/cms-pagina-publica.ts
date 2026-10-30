import { Component, computed, effect, inject, signal, untracked } from '@angular/core';
import { DatePipe, NgTemplateOutlet } from '@angular/common';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { map } from 'rxjs';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia, CmsPagina, TIPOS_ENTRADA } from '../../shared/models/cms/cms.models';
import { CmsMediaPublica } from './cms-media-publica';
import { esVistaPrevia } from './cms-publico.routes';
import { BuscadorGovco } from '../../shared/components/buscador-govco/buscador-govco';
import { CalendarioEventos } from '../../componentes/calendario-eventos/calendario-eventos';
import { ResenaHistorica } from './resena-historica';
import { ServiciosTarjetas } from '../../componentes/servicios-tarjetas/servicios-tarjetas';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { Organigrama } from './organigrama';
import { SedesHorarios } from './sedes-horarios';
import { PlataformaEstrategica } from './plataforma-estrategica';
import { DirectorioInstitucional } from './directorio-institucional';
import { MapaProcesos } from './mapa-procesos';
import { PreguntasFrecuentes } from './preguntas-frecuentes';
import { Glosario } from './glosario';
import { VisorDocumentos, sePuedeVer } from '../../shared/components/visor-documentos/visor-documentos.service';
import { normalizar, resaltar as resaltarTexto, terminosDe } from '../../shared/utils/busqueda';
import { slugCategoria } from '../../shared/utils/categorias';

const POR_PAGINA = 9;

/** Una fila del listado de documentos */
interface FilaDoc {
  id: string;
  entrada: CmsEntrada;
  archivo: CmsMultimedia | null;
  titulo: string;
  grupo: string;
  slug: string;
  texto: string;
}

/** Tipo de un documento según su nombre (para agrupar archivos de una misma entrada) */
const TIPOS_ARCHIVO: [RegExp, string][] = [
  [/\bresoluc/, 'Resoluciones'],
  [/\bcircular/, 'Circulares'],
  [/\bcomunicad/, 'Comunicados'],
  [/\bactas?\b/, 'Actas'],
  [/\boficio/, 'Oficios'],
  [/\b(decreto|ley|acuerdo|ordenanza)\b/, 'Normatividad'],
  [/\binforme/, 'Informes'],
  [/\bbolet|infografi/, 'Boletines'],
  [/\bplan(es)?\b/, 'Planes'],
  [/\bformato/, 'Formatos'],
  [/\b(manual|guia|protocolo|procedimiento)/, 'Manuales y guías'],
  [/\bcontrat/, 'Contratos'],
];
function tipoDeArchivo(nombre: string): string {
  const t = normalizar(nombre);
  return TIPOS_ARCHIVO.find(([r]) => r.test(t))?.[1] ?? 'Otros documentos';
}

/** Orden de resultados: por fecha, alfabético o el definido en el CMS */
type Orden = 'predeterminado' | 'recientes' | 'antiguas' | 'az';

@Component({
  selector: 'app-cms-pagina-publica',
  imports: [RouterLink, DatePipe, NgTemplateOutlet, CmsMediaPublica, BuscadorGovco, CalendarioEventos, ResenaHistorica, ServiciosTarjetas, IconoCms, Organigrama, SedesHorarios, PlataformaEstrategica, DirectorioInstitucional, MapaProcesos, PreguntasFrecuentes, Glosario],
  templateUrl: './cms-pagina-publica.html',
  styleUrls: ['./cms-pagina-publica.css', './cms-listados.css'],
})
export class CmsPaginaPublica {
  readonly cms = inject(CmsService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private title = inject(Title);
  private visor = inject(VisorDocumentos);
  readonly sePuedeVer = sePuedeVer;

  readonly vistaPrevia = esVistaPrevia();

  private readonly segmentos = toSignal(this.route.url.pipe(map((u) => u.map((s) => s.path))), {
    initialValue: [] as string[],
  });

  /** Página / entrada que corresponde a la URL actual (reactivo a cambios del admin) */
  readonly resuelto = computed(() => {
    this.cms.paginas();
    this.cms.entradas();
    return this.cms.resolverRuta(this.segmentos(), this.vistaPrevia);
  });

  readonly cargado = signal(false);
  readonly mostrar = signal(POR_PAGINA);
  readonly busqueda = signal(this.route.snapshot.queryParamMap.get('q') ?? '');
  /** Filtros del buscador (plantilla listado/noticias) */
  readonly anio = signal('');
  /** Categoría elegida en el filtro lateral (?categoria=comunicados, se puede compartir) */
  readonly categoria = toSignal(this.route.queryParamMap.pipe(map((q) => q.get('categoria') ?? '')), { initialValue: '' });
  readonly orden = signal<Orden>('recientes');
  readonly lightbox = signal<CmsMultimedia | null>(null);

  readonly pagina = computed(() => this.resuelto()?.pagina ?? null);
  readonly entrada = computed(() => this.resuelto()?.entrada ?? null);

  readonly entradas = computed(() => {
    const p = this.pagina();
    return p ? this.cms.entradasPublicas(p, this.vistaPrevia) : [];
  });

  /** Texto de búsqueda de cada entrada: título, resumen, contenido y nombres de sus archivos */
  private readonly indice = computed(() => {
    const mapa = this.cms.multimediaPorId();
    return new Map(
      this.entradas().map((e) => [
        e.id,
        normalizar(
          [e.titulo, e.resumen ?? '', e.contenido ?? '', ...e.multimediaIds.map((id) => mapa.get(id)?.titulo ?? '')].join(' '),
        ),
      ]),
    );
  });

  /** Palabras buscadas (todas deben aparecer, en cualquier orden) */
  readonly terminos = computed(() => terminosDe(this.busqueda()));

  /** Listados de noticias van por fecha; las páginas de documentos, en el orden del CMS */
  readonly ordenPorDefecto = computed<Orden>(() => (this.pagina()?.plantilla === 'listado' ? 'recientes' : 'predeterminado'));

  /** Años con publicaciones, para el filtro */
  readonly anios = computed(() =>
    [...new Set(this.entradas().map((e) => (e.fechaPublicacion || e.creadoEn).slice(0, 4)))].sort().reverse(),
  );

  /** Coincide con la búsqueda y el año (sin mirar la categoría): base para los conteos del filtro lateral */
  private coincide(e: CmsEntrada): boolean {
    const anio = this.anio();
    if (anio && !(e.fechaPublicacion || e.creadoEn).startsWith(anio)) return false;
    const texto = this.indice().get(e.id) ?? '';
    return this.terminos().every((t) => texto.includes(t));
  }

  /**
   * Categorías del filtro lateral con su número de elementos (según búsqueda y año).
   * - Noticias (listado): la categoría de cada publicación.
   * - Documentos: el grupo de cada archivo (ver filasDocs).
   * Solo se muestra el filtro si hay al menos dos categorías.
   */
  readonly categorias = computed(() => {
    const plantilla = this.pagina()?.plantilla;
    if (plantilla === 'documentos') {
      const todas = new Map<string, { slug: string; nombre: string; total: number }>();
      for (const f of this.filasDocs()) if (!todas.has(f.slug)) todas.set(f.slug, { slug: f.slug, nombre: f.grupo, total: 0 });
      if (todas.size < 2) return [];
      for (const f of this.filasDocs()) if (this.coincideFila(f)) todas.get(f.slug)!.total++;
      return [...todas.values()]; // en el orden de la sección
    }
    if (plantilla !== 'listado') return [];
    const todas = new Map<string, { slug: string; nombre: string; total: number }>();
    for (const e of this.entradas()) {
      const nombre = e.categoria?.trim();
      if (!nombre) continue;
      const slug = slugCategoria(nombre);
      if (!todas.has(slug)) todas.set(slug, { slug, nombre, total: 0 });
    }
    if (todas.size < 2) return [];
    for (const e of this.entradas()) {
      const c = e.categoria?.trim();
      if (c && this.coincide(e)) todas.get(slugCategoria(c))!.total++;
    }
    return [...todas.values()].sort((a, b) => a.nombre.localeCompare(b.nombre, 'es'));
  });
  readonly totalTodas = computed(() =>
    this.pagina()?.plantilla === 'documentos'
      ? this.filasDocs().filter((f) => this.coincideFila(f)).length
      : this.entradas().filter((e) => this.coincide(e)).length,
  );

  /* ===== Páginas de documentos: un archivo por fila ===== */

  /**
   * Filas del listado de documentos (un archivo por fila; si una entrada no tiene
   * archivos, una fila que lleva a la entrada). El grupo del filtro lateral es:
   * 1. el "Tipo de documento" de la entrada (dashboard) o, si no tiene, su título;
   * 2. si con eso queda un solo grupo, el tipo de cada archivo según su nombre
   *    (Resoluciones, Comunicados, Actas…).
   */
  readonly filasDocs = computed<FilaDoc[]>(() => {
    if (this.pagina()?.plantilla !== 'documentos') return [];
    const base = this.entradas().flatMap((e) => {
      const docs = this.documentos(e);
      return docs.length ? docs.map((m) => ({ entrada: e, archivo: m as CmsMultimedia | null })) : [{ entrada: e, archivo: null }];
    });
    const deEntrada = (e: CmsEntrada) => e.categoria?.trim() || e.titulo;
    const porArchivo =
      new Set(base.map((f) => deEntrada(f.entrada))).size < 2 &&
      new Set(base.map((f) => tipoDeArchivo(f.archivo?.titulo || f.archivo?.nombre || f.entrada.titulo))).size >= 2;
    return base.map((f, i) => {
      const grupo = porArchivo ? tipoDeArchivo(f.archivo?.titulo || f.archivo?.nombre || f.entrada.titulo) : deEntrada(f.entrada);
      return {
        ...f,
        id: `${f.entrada.id}-${f.archivo?.id ?? 0}-${i}`,
        titulo: f.archivo ? f.archivo.titulo || f.archivo.nombre : f.entrada.titulo,
        grupo,
        slug: slugCategoria(grupo),
        texto: normalizar([f.entrada.titulo, f.entrada.resumen ?? '', f.archivo?.titulo ?? '', f.archivo?.nombre ?? '', grupo].join(' ')),
      };
    });
  });

  private coincideFila(f: FilaDoc): boolean {
    const anio = this.anio();
    if (anio && !(f.entrada.fechaPublicacion || f.entrada.creadoEn).startsWith(anio)) return false;
    return this.terminos().every((t) => f.texto.includes(t));
  }

  readonly filasFiltradas = computed(() => {
    const cat = this.categoriaActiva()?.slug;
    let filas = this.filasDocs().filter((f) => this.coincideFila(f) && (!cat || f.slug === cat));
    const fecha = (f: FilaDoc) => f.entrada.fechaPublicacion || f.entrada.creadoEn;
    switch (this.orden()) {
      case 'recientes': filas = [...filas].sort((a, b) => fecha(b).localeCompare(fecha(a))); break;
      case 'antiguas': filas = [...filas].sort((a, b) => fecha(a).localeCompare(fecha(b))); break;
      case 'az': filas = [...filas].sort((a, b) => a.titulo.localeCompare(b.titulo, 'es', { numeric: true })); break;
    }
    return filas;
  });

  /** Totales para el texto "N documentos / N resultados" */
  readonly conteoFiltrado = computed(() =>
    this.pagina()?.plantilla === 'documentos' ? this.filasFiltradas().length : this.entradasFiltradas().length,
  );
  readonly conteoTotal = computed(() => (this.pagina()?.plantilla === 'documentos' ? this.filasDocs().length : this.entradas().length));

  /** Categoría activa (solo si existe en esta página) */
  readonly categoriaActiva = computed(() => this.categorias().find((c) => c.slug === this.categoria()) ?? null);

  readonly hayFiltros = computed(
    () => !!this.busqueda().trim() || !!this.anio() || !!this.categoriaActiva() || this.orden() !== this.ordenPorDefecto(),
  );

  readonly nombreOrden: Record<Orden, string> = {
    predeterminado: 'Orden de la sección',
    recientes: 'Más recientes primero',
    antiguas: 'Más antiguas primero',
    az: 'Alfabético (A–Z)',
  };

  readonly entradasFiltradas = computed(() => {
    const cat = this.categoriaActiva()?.slug;
    let lista = this.entradas().filter((e) => this.coincide(e) && (!cat || slugCategoria(e.categoria ?? '') === cat));
    const fecha = (e: CmsEntrada) => e.fechaPublicacion || e.creadoEn;
    switch (this.orden()) {
      case 'recientes': lista = [...lista].sort((a, b) => fecha(b).localeCompare(fecha(a))); break;
      case 'antiguas': lista = [...lista].sort((a, b) => fecha(a).localeCompare(fecha(b))); break;
      case 'az': lista = [...lista].sort((a, b) => a.titulo.localeCompare(b.titulo, 'es')); break;
    }
    return lista;
  });

  /** Portafolio de servicios: tarjetas agrupadas por categoría, en el orden del CMS */
  readonly gruposServicios = computed(() => {
    if (this.pagina()?.plantilla !== 'servicios') return [];
    const grupos = new Map<string, CmsEntrada[]>();
    for (const e of this.entradas()) {
      const g = e.categoria?.trim() || 'Otros servicios';
      grupos.set(g, [...(grupos.get(g) ?? []), e]);
    }
    return [...grupos].map(([nombre, servicios]) => ({ nombre, id: slugCategoria(nombre), servicios }));
  });
  readonly grupoServicio = signal('');
  readonly serviciosVisibles = computed(() => {
    const g = this.gruposServicios().find((x) => x.id === this.grupoServicio());
    return g ? g.servicios : this.entradas();
  });

  /** Entradas de tipo "servicio" (trámites): se muestran como tarjetas desplegables */
  readonly servicios = computed(() => this.entradas().filter((e) => e.tipo === 'servicio'));
  readonly noServicios = computed(() => this.entradas().filter((e) => e.tipo !== 'servicio'));

  /** Página superior, para el antetítulo del encabezado */
  readonly padre = computed(() => {
    const p = this.pagina();
    return p?.parentId ? this.cms.paginaPorId().get(p.parentId) ?? null : null;
  });

  readonly subpaginas = computed(() => {
    const p = this.pagina();
    return p ? this.cms.hijasPublicas(p.id) : [];
  });

  /** Todas las imágenes y videos de la página (plantilla galería) */
  readonly galeria = computed(() => {
    const mapa = this.cms.multimediaPorId();
    const ids = new Set<number>();
    this.entradas().forEach((e) => e.multimediaIds.forEach((id) => ids.add(id)));
    return [...ids].map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m && (m.tipo === 'imagen' || m.tipo === 'video'));
  });

  /** Otras entradas de la misma página, para "Ver también" */
  readonly relacionadas = computed(() => {
    const e = this.entrada();
    const p = this.pagina();
    return e && p ? this.cms.entradasPublicas(p).filter((x) => x.id !== e.id).slice(0, 3) : [];
  });

  constructor() {
    this.cms.cargar().then(() => this.cargado.set(true));

    effect(() => {
      const r = this.resuelto();
      this.title.setTitle(
        r ? `${r.entrada?.titulo ?? r.pagina.titulo} | E.S.E. Hospital San José del Guaviare` : 'Página no encontrada',
      );
    });

    // URL vieja de una página que se movió: se lleva a su dirección actual
    effect(() => {
      const canonica = this.resuelto()?.canonica;
      if (!canonica) return;
      const [ruta, query] = this.router.url.split('?');
      if (decodeURIComponent(ruta).toLowerCase() !== canonica.toLowerCase()) {
        this.router.navigateByUrl(canonica + (query ? '?' + query : ''), { replaceUrl: true });
      }
    });

    // Página tipo "enlace": redirige a su destino
    effect(() => {
      const p = this.pagina();
      if (p?.plantilla !== 'enlace' || !p.urlExterna || this.entrada()) return;
      const destino = p.urlExterna;
      if (this.cms.esExterna(destino)) {
        window.location.href = destino;
      } else if (destino !== this.router.url) {
        this.router.navigateByUrl(destino, { replaceUrl: true });
      }
    });

    // Al cambiar de página se reinician los filtros (la primera vez se respeta ?q= de la URL)
    let previa: number | null = null;
    effect(() => {
      const p = this.pagina();
      const id = p?.id ?? null;
      if (id === null || id === previa) return;
      untracked(() => {
        this.mostrar.set(POR_PAGINA);
        this.grupoServicio.set('');
        if (previa !== null) {
          this.busqueda.set('');
          this.anio.set('');
        }
        this.orden.set(this.ordenPorDefecto());
      });
      previa = id;
    });
  }

  /* ===== Buscador ===== */
  buscar(texto: string): void {
    this.busqueda.set(texto);
    this.mostrar.set(POR_PAGINA);
    // La búsqueda queda en la URL (?q=…) para poder compartirla
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: { q: texto.trim() || null },
      queryParamsHandling: 'merge',
      replaceUrl: true,
    });
  }

  filtrarAnio(anio: string): void {
    this.anio.set(anio);
    this.mostrar.set(POR_PAGINA);
  }

  cambiarOrden(orden: string): void {
    this.orden.set((['predeterminado', 'recientes', 'antiguas', 'az'] as const).find((o) => o === orden) ?? this.ordenPorDefecto());
    this.mostrar.set(POR_PAGINA);
  }

  /** Cambia la categoría en la URL (?categoria=…); vacío = todas */
  filtrarCategoria(slug: string): void {
    this.mostrar.set(POR_PAGINA);
    this.router.navigate([], {
      relativeTo: this.route,
      queryParams: { categoria: slug || null },
      queryParamsHandling: 'merge',
      replaceUrl: true,
    });
  }

  limpiarFiltros(): void {
    this.anio.set('');
    this.orden.set(this.ordenPorDefecto());
    this.busqueda.set('');
    this.mostrar.set(POR_PAGINA);
    this.router.navigate([], { relativeTo: this.route, queryParams: { q: null, categoria: null }, queryParamsHandling: 'merge', replaceUrl: true });
  }

  /** Resalta las palabras buscadas en un texto (se usa con [innerHTML]) */
  resaltar(texto: string | null | undefined): string {
    return resaltarTexto(texto, this.terminos());
  }

  /* ===== Helpers de plantilla ===== */
  media(id: number | null): CmsMultimedia | null {
    return id ? this.cms.multimediaPorId().get(id) ?? null : null;
  }

  adjuntos(e: CmsEntrada): CmsMultimedia[] {
    const mapa = this.cms.multimediaPorId();
    return e.multimediaIds
      .filter((id) => id !== e.imagenDestacadaId)
      .map((id) => mapa.get(id))
      .filter((m): m is CmsMultimedia => !!m);
  }

  documentos(e: CmsEntrada): CmsMultimedia[] {
    return this.adjuntos(e).filter((m) => m.tipo === 'documento' || m.tipo === 'otro' || m.tipo === 'audio');
  }

  /** Abre el visor con el archivo; las flechas recorren los demás archivos del listado filtrado */
  verDocumento(m: CmsMultimedia): void {
    if (!sePuedeVer(m)) {
      window.open(m.url, '_blank', 'noopener');
      return;
    }
    const lista = this.filasFiltradas().map((f) => f.archivo).filter((x): x is CmsMultimedia => !!x);
    this.visor.abrir(m, lista.length ? lista : [m]);
  }

  /** "informe.final.pdf" → "PDF" (para la insignia del listado de documentos) */
  extension(m: CmsMultimedia): string {
    const ext = (m.nombre || m.url).split('?')[0].split('.').pop() ?? '';
    return ext.length > 0 && ext.length <= 4 ? ext.toUpperCase() : 'DOC';
  }

  tamanoLegible(bytes: number): string {
    return bytes >= 1048576 ? (bytes / 1048576).toFixed(1).replace('.', ',') + ' MB' : Math.max(1, Math.round(bytes / 1024)) + ' KB';
  }

  visuales(e: CmsEntrada): CmsMultimedia[] {
    return this.adjuntos(e).filter((m) => m.tipo === 'imagen' || m.tipo === 'video');
  }

  /** Galería del detalle: sin repetir la imagen destacada que ya se muestra arriba */
  galeriaDe(e: CmsEntrada): CmsMultimedia[] {
    return this.visuales(e).filter((m) => m.id !== e.imagenDestacadaId);
  }

  /** El resumen no se repite si el contenido ya empieza con ese mismo texto (noticias migradas) */
  mostrarResumen(e: CmsEntrada): boolean {
    if (!e.resumen) return false;
    if (!e.contenido) return true;
    const plano = (t: string) => t.replace(/<[^>]+>/g, ' ').replace(/&nbsp;/g, ' ').replace(/\s+/g, ' ').trim();
    const inicio = plano(e.resumen).replace(/…$/, '').slice(0, 120);
    return !plano(e.contenido).startsWith(inicio);
  }

  imagenDe(e: CmsEntrada): CmsMultimedia | null {
    const m = this.media(e.imagenDestacadaId);
    return m?.tipo === 'imagen' ? m : null;
  }

  /** Icono según el tema del trámite o servicio */
  iconoServicio(e: CmsEntrada): string {
    const t = `${e.slug} ${e.titulo}`.toLowerCase();
    const reglas: [RegExp, string][] = [
      [/pqrs|queja|reclamo|petici/, '💬'],
      [/\bcitas?\b|agenda|consulta externa/, '📅'],
      [/historia/, '📋'],
      [/laboratorio|resultado|examen/, '🧪'],
      [/contrat|cotizaci|propuesta/, '📑'],
      [/certificad|defunci|nacido/, '📜'],
      [/medicamento|farmacia|f[oó]rmula/, '💊'],
      [/vacuna/, '💉'],
      [/urgencia/, '🚑'],
      [/radiolog|im[aá]genes diagn/, '🩻'],
      [/terapia|rehabilit/, '🤸'],
      [/encuesta|satisfacci/, '📝'],
      [/trato digno|derechos/, '🤝'],
      [/vigilancia|veedur|observaci|procesos vigilados/, '🔎'],
      [/modalidades|control social/, '🧭'],
    ];
    return reglas.find(([r]) => r.test(t))?.[1] ?? '🗂️';
  }

  /* ===== Tarjetas de subpáginas ("En esta sección") ===== */

  /** "1.4 Directorio institucional" → "1.4" */
  numeroDe(titulo: string): string {
    return titulo.match(/^\s*(\d+(?:\.\d+)*)\.?\s+/)?.[1] ?? '';
  }

  sinNumero(titulo: string): string {
    return titulo.replace(/^\s*\d+(?:\.\d+)*\.?\s+/, '');
  }

  /** Icono: el definido en la página (campo icono) o uno según el tema */
  iconoPagina(s: CmsPagina): string {
    if (s.icono) return s.icono;
    const t = normalizar(`${s.slug} ${s.titulo}`);
    const reglas: [RegExp, string][] = [
      [/mision|vision|plataforma|valores/, '🎯'],
      [/organigrama|estructura organica/, '🏛️'],
      [/mapa|procesos|caracteriz/, '🗺️'],
      [/directorio de servidores|hojas de vida|talento|empleo|trabaja/, '👥'],
      [/directorio de entidades|entes|autoridades|vigilan|control/, '🛡️'],
      [/agremiacion|asociacion|grupos de interes|participa/, '🤝'],
      [/directorio|contacto|sedes|horario/, '📇'],
      [/servicio al publico|protocolo|formulario|atencion/, '🧾'],
      [/decision|procedimiento/, '⚖️'],
      [/pqrs|solicitud|queja|reclamo/, '💬'],
      [/calendario|evento|agenda/, '📅'],
      [/normativ|norma|ley|decreto|resoluc/, '📜'],
      [/contrat|cotiza|compra/, '📑'],
      [/presupuest|financ|estados|planea|plan/, '📊'],
      [/informe|rendicion|auditor/, '📈'],
      [/datos abiertos|datos/, '🗃️'],
      [/noticia|boletin|comunicad/, '📰'],
      [/historia|resena/, '🕰️'],
      [/portafolio|servicios/, '🩺'],
      [/transparencia|informacion/, '📂'],
    ];
    return reglas.find(([r]) => r.test(t))?.[1] ?? '📄';
  }

  /** Qué encontrará la persona al entrar */
  tipoPagina(s: CmsPagina, externa: boolean): string {
    if (externa) return 'Sitio externo';
    switch (s.plantilla) {
      case 'documentos': return 'Documentos';
      case 'listado': return 'Publicaciones';
      case 'galeria': return 'Galería';
      case 'calendario': return 'Calendario';
      case 'historia': return 'Historia';
      case 'servicios': return 'Servicios';
      case 'organigrama': return 'Organigrama';
      case 'sedes': return 'Sedes y horarios';
      case 'plataforma': return 'Plataforma estratégica';
      case 'directorio': return 'Directorio';
      case 'preguntas': return 'Preguntas frecuentes';
      case 'glosario': return 'Glosario';
      case 'procesos': return 'Mapa de procesos';
      case 'enlace': return 'Ir al servicio';
      default: return 'Información';
    }
  }

  /** Texto por defecto si la página no tiene descripción */
  ayudaPagina(s: CmsPagina): string {
    switch (s.plantilla) {
      case 'documentos': return 'Consulte y descargue los documentos publicados.';
      case 'listado': return 'Consulte las publicaciones más recientes.';
      case 'calendario': return 'Consulte las actividades y eventos programados.';
      case 'servicios': return 'Conozca los servicios de salud que prestamos.';
      case 'enlace': return 'Acceda directamente al servicio.';
      default: return 'Consulte la información de esta sección.';
    }
  }

  irA(slug: string, ev: Event): void {
    ev.preventDefault();
    const el = document.getElementById('srv-' + slug) as HTMLDetailsElement | null;
    if (!el) return;
    el.open = true;
    el.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  url(e: CmsEntrada): string {
    return this.cms.urlEntrada(e);
  }

  etiquetaTipo(t: string): string {
    return TIPOS_ENTRADA.find((x) => x.valor === t)?.etiqueta ?? '';
  }

  esExterna(url: string): boolean {
    return this.cms.esExterna(url);
  }
}
