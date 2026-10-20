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

/** Título dinámico para las migas de pan */
export const cmsTitulo: ResolveFn<string> = async (route) => {
  const cms = inject(CmsService);
  await cms.cargar();
  const r = cms.resolverRuta(segmentosDe(route.url), esVistaPrevia());
  return r ? (r.entrada?.titulo ?? r.pagina.titulo) : 'Página no encontrada';
};

const cargarVista = () => import('./cms-pagina-publica').then((m) => m.CmsPaginaPublica);

/** Ruta comodín del sitio público: páginas, subpáginas y entradas del CMS (y 404) */
export const rutaCmsComodin: Route = {
  matcher: cmsMatcher,
  resolve: { breadcrumb: cmsTitulo },
  runGuardsAndResolvers: 'always',
  loadComponent: cargarVista,
};
