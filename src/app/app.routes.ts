import { Routes } from '@angular/router';
import { rutaCmsComodin } from './pages/cms-publico/cms-publico.routes';
import { PublicLayout } from './layout/public-layout/public-layout';
import { DashboardLayout } from './layout/dashboard-layout/dashboard-layout';
import { Home } from './componentes/home/home';
import { CotizacionesPropuestas } from './pages/cotizaciones-propuestas/cotizaciones-propuestas';
import { TrabajaNosotros } from './pages/trabaja-nosotros/trabaja-nosotros';
import { InformacionInteres } from './pages/informacion-interes/informacion-interes';
import { MapaDelSitio } from './pages/mapa-del-sitio/mapa-del-sitio';
import { Buscar } from './pages/buscar/buscar';
import { EventosAdmin } from './pages/admin/eventos-admin/eventos-admin';
import { SliderAdmin } from './pages/admin/slider-admin/slider-admin';
import { PqrsfComponent } from './pages/pqrsf/pqrsf';
import { Login } from './pages/login/login';
import { DashboardHomeComponent } from './pages/dashboardhome/dashboardhome';
import { Usuarios } from './pages/admin/usuarios/usuarios';
import { Configuracion } from './pages/admin/configuracion/configuracion';
import { PqrsfAdminComponent as AdminPqrsf } from './pages/admin/pqrsf-admin/pqrsf-admin';
import { AuthGuard } from './shared/guards/auth/auth-guard';
import { CotizacionesPropuestasAdminComponent } from './pages/admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin';
import { AccesibilidadAdmin } from './pages/admin/accesibilidad-admin/accesibilidad-admin';
import { TrabajaNosotrosAdminComponent } from './pages/admin/trabaja-nosotros-admin/trabaja-nosotros-admin/trabaja-nosotros-admin';

export const routes: Routes = [

  // 🌍 SITIO PÚBLICO
  {
    path: '',
    component: PublicLayout,
    children: [
      { path: '', component: Home, data: { breadcrumb: 'Inicio' } },
      { path: 'home', redirectTo: '', pathMatch: 'full' },

      // Módulos con flujo propio (formularios / listados especiales)
      // Información de interés: invitaciones a cotizar y convocatorias laborales
      {
        path: 'informacion-de-interes',
        data: { breadcrumb: 'Información de interés' },
        children: [
          { path: '', component: InformacionInteres, data: { breadcrumb: '' } },
          { path: 'invitaciones-a-cotizar', component: CotizacionesPropuestas, data: { breadcrumb: 'Invitaciones a cotizar' } },
          { path: 'trabaja-con-nosotros', component: TrabajaNosotros, data: { breadcrumb: 'Trabaja con nosotros' } },
        ],
      },
      { path: 'pqrsf', component: PqrsfComponent, data: { breadcrumb: 'PQRSF' } },
      { path: 'mapa-del-sitio', component: MapaDelSitio, data: { breadcrumb: 'Mapa del sitio' } },
      { path: 'buscar', component: Buscar, data: { breadcrumb: 'Buscar en el portal' } },
      { path: 'login', component: Login, data: { breadcrumb: 'Iniciar sesión' } },

      // Direcciones anteriores → nueva estructura (Res. 1519 de 2020)
      { path: 'normatividad', redirectTo: 'transparencia/normativa', pathMatch: 'full' },
      { path: 'atencion-ciudadano', redirectTo: 'atencion-y-servicios-a-la-ciudadania', pathMatch: 'full' },
      { path: 'servicios', redirectTo: 'nuestro-hospital/portafolio-de-servicios', pathMatch: 'full' },
      { path: 'cotizaciones-propuestas', redirectTo: 'informacion-de-interes/invitaciones-a-cotizar', pathMatch: 'full' },
      { path: 'invitaciones-a-presentar-propuestas-cotizacion', redirectTo: 'informacion-de-interes/invitaciones-a-cotizar', pathMatch: 'full' },
      { path: 'trabaja-nosotros', redirectTo: 'informacion-de-interes/trabaja-con-nosotros', pathMatch: 'full' },
      { path: 'trabaja-con-nosotros', redirectTo: 'informacion-de-interes/trabaja-con-nosotros', pathMatch: 'full' },

      // Todo lo demás lo resuelve el CMS (páginas, subpáginas, entradas y 404)
      rutaCmsComodin,
    ]
  },

  // 🔐 DASHBOARD ADMIN
  {
    path: 'admin',
    component: DashboardLayout,
    canActivate: [AuthGuard],
    children: [
      { path: '', component: DashboardHomeComponent, data: { breadcrumb: 'Dashboard' } },
      { path: 'pqrsf', component: AdminPqrsf, data: { breadcrumb: 'Administrar PQRSF' } },
      { path: 'cotizaciones', component: CotizacionesPropuestasAdminComponent, data: { breadcrumb: 'Invitaciones a cotizar' } },
      { path: 'vacantes', component: TrabajaNosotrosAdminComponent, data: { breadcrumb: 'Trabaja con nosotros' } },
      { path: 'eventos', component: EventosAdmin, data: { breadcrumb: 'Calendario de eventos' } },
      { path: 'slider', component: SliderAdmin, data: { breadcrumb: 'Slider del inicio' } },
      { path: 'usuarios', component: Usuarios, data: { breadcrumb: 'Administrar Usuarios' } },
      { path: 'accesibilidad-admin', component: AccesibilidadAdmin, data: { breadcrumb: 'Administrar Accesibilidad' } },
      { path: 'configuracion', component: Configuracion, data: { breadcrumb: 'Configuración' } },

      // 🧩 CMS: Menú → Páginas → Entradas → Multimedia
      {
        path: 'contenido',
        data: { breadcrumb: 'Contenido' },
        children: [
          { path: '', pathMatch: 'full', redirectTo: 'menus' },
          { path: 'menus', data: { breadcrumb: 'Menús y estructura' },
            loadComponent: () => import('./pages/admin/cms/menus/cms-menus').then(m => m.CmsMenus) },
          { path: 'paginas', data: { breadcrumb: 'Páginas' },
            loadComponent: () => import('./pages/admin/cms/paginas/cms-paginas').then(m => m.CmsPaginas) },
          { path: 'paginas/nueva', data: { breadcrumb: 'Nueva página' },
            loadComponent: () => import('./pages/admin/cms/paginas/cms-pagina-editor').then(m => m.CmsPaginaEditor) },
          { path: 'paginas/:id', data: { breadcrumb: 'Editar página' },
            loadComponent: () => import('./pages/admin/cms/paginas/cms-pagina-editor').then(m => m.CmsPaginaEditor) },
          { path: 'entradas', data: { breadcrumb: 'Entradas' },
            loadComponent: () => import('./pages/admin/cms/entradas/cms-entradas').then(m => m.CmsEntradas) },
          { path: 'entradas/nueva', data: { breadcrumb: 'Nueva entrada' },
            loadComponent: () => import('./pages/admin/cms/entradas/cms-entrada-editor').then(m => m.CmsEntradaEditor) },
          { path: 'entradas/:id', data: { breadcrumb: 'Editar entrada' },
            loadComponent: () => import('./pages/admin/cms/entradas/cms-entrada-editor').then(m => m.CmsEntradaEditor) },
          { path: 'multimedia', data: { breadcrumb: 'Multimedia' },
            loadComponent: () => import('./pages/admin/cms/multimedia/cms-multimedia').then(m => m.CmsMultimediaComponent) },
        ]
      }
    ]
  },


  // 🚫 FALLBACK
  { path: '**', redirectTo: '' }
];
