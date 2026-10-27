import { Component, computed, inject, input, signal } from '@angular/core';
import { toSignal } from '@angular/core/rxjs-interop';
import { ActivatedRoute, ActivatedRouteSnapshot, NavigationEnd, Router, RouterLink } from '@angular/router';
import { filter, map, startWith } from 'rxjs';
import { CmsService } from '../../shared/services/cms/cms.service';
import { cmsMatcher, esVistaPrevia } from '../../pages/cms-publico/cms-publico.routes';

interface Miga {
  /** Texto completo (lectores de pantalla y atributo title) */
  label: string;
  /** Texto visible, recortado con "…" si es muy largo */
  corto: string;
  url: string;
}

/** Largo máximo visible de cada miga (BDC: títulos cortos con puntos suspensivos) */
const MAX_CARACTERES = 42;

function recortar(texto: string): string {
  const t = texto.replace(/\s+/g, ' ').trim();
  if (t.length <= MAX_CARACTERES) return t;
  const corte = t.slice(0, MAX_CARACTERES);
  const espacio = corte.lastIndexOf(' ');
  return (espacio > 20 ? corte.slice(0, espacio) : corte).replace(/[\s,.;:–-]+$/, '') + '…';
}

/**
 * Miga de pan — BDC GOV.CO v5 (https://cdn.www.gov.co/v5/general/miga-de-pan)
 * - Portal: siempre empieza en "Inicio"; con más de tres niveles muestra solo
 *   Inicio › sección anterior › sección actual (regla BDC).
 * - Las páginas del CMS muestran su jerarquía real (página superior › página › entrada).
 * - Panel: muestra todos los niveles definidos en las rutas.
 */
@Component({
  selector: 'app-breadcrumb',
  imports: [RouterLink],
  templateUrl: './breadcrumb.html',
  styleUrl: './breadcrumb.css',
})
export class Breadcrumb {
  private router = inject(Router);
  private route = inject(ActivatedRoute);
  private cms = inject(CmsService);

  /** 'portal' (sitio público) o 'panel' (dashboard administrativo) */
  readonly variante = input<'portal' | 'panel'>('portal');

  /** Cambia en cada navegación terminada */
  private readonly navegacion = toSignal(
    this.router.events.pipe(
      filter((e) => e instanceof NavigationEnd),
      map(() => this.router.url),
      startWith(this.router.url),
    ),
    { initialValue: this.router.url },
  );

  /** Niveles completos de la ubicación actual */
  readonly niveles = computed<Miga[]>(() => {
    this.navegacion();
    this.cms.paginas(); // recalcula cuando el CMS termina de cargar
    this.cms.entradas();
    const lista: { label: string; url: string }[] = [];
    let actual: ActivatedRouteSnapshot | null = this.route.snapshot.root;
    let url = '';
    while (actual) {
      const hijo: ActivatedRouteSnapshot | null = actual.firstChild;
      if (!hijo) break;
      const segmentos = hijo.url.map((s) => s.path);
      if (hijo.routeConfig?.matcher === cmsMatcher) {
        lista.push(...this.nivelesCms(segmentos));
        break;
      }
      url = segmentos.length ? `${url}/${segmentos.join('/')}` : url;
      const label = hijo.routeConfig?.data?.['breadcrumb'] ?? '';
      if (label && !lista.some((m) => m.url === (url || '/'))) lista.push({ label, url: url || '/' });
      actual = hijo;
    }

    if (this.variante() === 'portal' && lista[0]?.url !== '/') lista.unshift({ label: 'Inicio', url: '/' });
    return lista.map((m) => ({ ...m, corto: recortar(m.label) }));
  });

  /** Lo que se muestra: en el portal, máximo tres niveles (Inicio, anterior y actual) */
  readonly migas = computed<Miga[]>(() => {
    const n = this.niveles();
    if (this.variante() === 'portal' && n.length > 3) return [n[0], n[n.length - 2], n[n.length - 1]];
    return n;
  });

  /** En el inicio del portal no se muestra la miga de pan */
  readonly visible = computed(() => this.variante() === 'panel' || this.niveles().length > 1);

  readonly omitidos = computed(() => Math.max(0, this.niveles().length - this.migas().length));

  /** Jerarquía de una página del CMS: páginas superiores, la página y la entrada */
  private nivelesCms(segmentos: string[]): { label: string; url: string }[] {
    const r = this.cms.resolverRuta(segmentos, esVistaPrevia());
    if (!r) return segmentos.length ? [{ label: 'Página no encontrada', url: '/' + segmentos.join('/') }] : [];
    const cadena: { label: string; url: string }[] = [];
    const porId = this.cms.paginaPorId();
    let p: typeof r.pagina | undefined = r.pagina;
    let guardia = 0;
    while (p && guardia++ < 20) {
      cadena.unshift({ label: p.titulo, url: this.cms.rutaPagina(p.id) });
      p = p.parentId ? porId.get(p.parentId) : undefined;
    }
    if (r.entrada) cadena.push({ label: r.entrada.titulo, url: this.cms.urlEntrada(r.entrada) });
    return cadena;
  }
}
