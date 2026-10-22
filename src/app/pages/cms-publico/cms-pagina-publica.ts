import { Component, computed, effect, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { map } from 'rxjs';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia, TIPOS_ENTRADA } from '../../shared/models/cms/cms.models';
import { CmsMediaPublica } from './cms-media-publica';
import { esVistaPrevia } from './cms-publico.routes';

const POR_PAGINA = 9;

@Component({
  selector: 'app-cms-pagina-publica',
  imports: [RouterLink, DatePipe, CmsMediaPublica],
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
  readonly busqueda = signal('');
  readonly lightbox = signal<CmsMultimedia | null>(null);

  readonly pagina = computed(() => this.resuelto()?.pagina ?? null);
  readonly entrada = computed(() => this.resuelto()?.entrada ?? null);

  readonly entradas = computed(() => {
    const p = this.pagina();
    return p ? this.cms.entradasPublicas(p, this.vistaPrevia) : [];
  });

  readonly entradasFiltradas = computed(() => {
    const q = this.busqueda().toLowerCase().trim();
    return q
      ? this.entradas().filter((e) => `${e.titulo} ${e.resumen ?? ''}`.toLowerCase().includes(q))
      : this.entradas();
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

    // Al cambiar de página se reinician filtros
    effect(() => {
      this.segmentos();
      this.mostrar.set(POR_PAGINA);
      this.busqueda.set('');
    });
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
    ];
    return reglas.find(([r]) => r.test(t))?.[1] ?? '🗂️';
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
