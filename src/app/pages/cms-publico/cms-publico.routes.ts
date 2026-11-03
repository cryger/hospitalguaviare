import { inject } from '@angular/core';
import { ResolveFn, Route, UrlMatcher, UrlSegment } from '@angular/router';
import { CmsService, RUTAS_RESERVADAS } from '../../shared/services/cms/cms.service';

/** Captura cualquier URL pública que no empiece por una ruta reservada */
export const cmsMatcher: UrlMatcher = (segments: UrlSegment[]) => {
  if (!segments.length || RUTAS_RESERVADAS.includes(segments[0].path.toLowerCase())) return null;
  return { consumed: segments, posParams: { ruta: new UrlSegment(segments.map((s) => s.path).join('/'), {}) } };
};

function segmentosDe(segments: UrlSegment[]): string[] {
  return segments.map((s) => s.path);
}

/** Vista previa de borradores solo para usuarios con sesión de administrador */
export function esVistaPrevia(): boolean {
  try {
    return localStorage.getItem('auth') === 'true' && new URLSearchParams(location.search).has('vista-previa');
  } catch {
    return false;
  }
}

/**
 * Empieza a cargar el CMS al entrar a la ruta, SIN esperar: así el marco del portal (barra,
 * menú, pie) se pinta de inmediato. Las migas de pan y la página se actualizan solas con las
 * señales del CmsService cuando llega el contenido.
 */
export const cmsTitulo: ResolveFn<string> = (route) => {
  const cms = inject(CmsService);
  void cms.cargar();
  const r = cms.resolverRuta(segmentosDe(route.url), esVistaPrevia());
  return r ? (r.entrada?.titulo ?? r.pagina.titulo) : '';
};

const cargarVista = () => import('./cms-pagina-publica').then((m) => m.CmsPaginaPublica);

/** Ruta comodín del sitio público: páginas, subpáginas y entradas del CMS (y 404) */
export const rutaCmsComodin: Route = {
  matcher: cmsMatcher,
  resolve: { breadcrumb: cmsTitulo },
  runGuardsAndResolvers: 'always',
  loadComponent: cargarVista,
};
