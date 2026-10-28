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
import { normalizar, resaltar as resaltarTexto, terminosDe } from '../../shared/utils/busqueda';

const POR_PAGINA = 9;

/** Orden de resultados: por fecha, alfabético o el definido en el CMS */
type Orden = 'predeterminado' | 'recientes' | 'antiguas' | 'az';

@Component({
  selector: 'app-cms-pagina-publica',
  imports: [RouterLink, DatePipe, NgTemplateOutlet, CmsMediaPublica, BuscadorGovco, CalendarioEventos, ResenaHistorica],
  templateUrl: './cms-pagina-publica.html',
  styleUrl: './cms-pagina-publica.css',
})
export class CmsPaginaPublica {
  readonly cms = inject(CmsService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);
  private title = inject(Title);

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

  readonly hayFiltros = computed(() => !!this.busqueda().trim() || !!this.anio() || this.orden() !== this.ordenPorDefecto());

  readonly nombreOrden: Record<Orden, string> = {
    predeterminado: 'Orden de la sección',
    recientes: 'Más recientes primero',
    antiguas: 'Más antiguas primero',
    az: 'Alfabético (A–Z)',
  };

  readonly entradasFiltradas = computed(() => {
    const terminos = this.terminos();
    const anio = this.anio();
    const indice = this.indice();
    let lista = this.entradas().filter((e) => {
      if (anio && !(e.fechaPublicacion || e.creadoEn).startsWith(anio)) return false;
      const texto = indice.get(e.id) ?? '';
      return terminos.every((t) => texto.includes(t));
    });
    const fecha = (e: CmsEntrada) => e.fechaPublicacion || e.creadoEn;
    switch (this.orden()) {
      case 'recientes': lista = [...lista].sort((a, b) => fecha(b).localeCompare(fecha(a))); break;
      case 'antiguas': lista = [...lista].sort((a, b) => fecha(a).localeCompare(fecha(b))); break;
      case 'az': lista = [...lista].sort((a, b) => a.titulo.localeCompare(b.titulo, 'es')); break;
    }
    return lista;
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

  limpiarFiltros(): void {
    this.anio.set('');
    this.orden.set(this.ordenPorDefecto());
    this.buscar('');
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
