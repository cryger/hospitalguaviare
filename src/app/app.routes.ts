import { Routes } from '@angular/router';
import { rutaCmsComodin } from './pages/cms-publico/cms-publico.routes';
import { PublicLayout } from './layout/public-layout/public-layout';
import { Home } from './componentes/home/home';
import { AuthGuard } from './shared/guards/auth/auth-guard';
import { moduloGuard } from './shared/guards/modulo/modulo-guard';

// Solo el inicio y el marco público van en el paquete inicial; el resto de páginas y todo
// el panel de administración se descargan al entrar a ellos (carga diferida)
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
          { path: '', loadComponent: () => import('./pages/informacion-interes/informacion-interes').then(m => m.InformacionInteres), data: { breadcrumb: '' } },
          { path: 'invitaciones-a-cotizar', loadComponent: () => import('./pages/cotizaciones-propuestas/cotizaciones-propuestas').then(m => m.CotizacionesPropuestas), data: { breadcrumb: 'Invitaciones a cotizar' } },
          { path: 'trabaja-con-nosotros', loadComponent: () => import('./pages/trabaja-nosotros/trabaja-nosotros').then(m => m.TrabajaNosotros), data: { breadcrumb: 'Trabaja con nosotros' } },
        ],
      },
      { path: 'pqrsf', loadComponent: () => import('./pages/pqrsf/pqrsf').then(m => m.PqrsfComponent), data: { breadcrumb: 'PQRSFD' } },
      { path: 'consulta-radicado', data: { breadcrumb: 'Consulta tu radicado' },
        loadComponent: () => import('./pages/consulta-radicado/consulta-radicado').then(m => m.ConsultaRadicado) },
      { path: 'sicof', data: { breadcrumb: 'Canal anticorrupción – SICOF' },
        loadComponent: () => import('./pages/sicof/sicof').then(m => m.Sicof) },
      { path: 'solicitudes-contractuales', data: { breadcrumb: 'Solicitudes contractuales' },
        loadComponent: () => import('./pages/solicitudes-contractuales/solicitudes-contractuales').then(m => m.SolicitudesContractuales) },
      { path: 'solicitud-historia-clinica', data: { breadcrumb: 'Copia de historia clínica' },
        loadComponent: () => import('./pages/historia-clinica/historia-clinica').then(m => m.HistoriaClinica) },
      { path: 'participacion', data: { breadcrumb: 'Consultas ciudadanas' },
        loadComponent: () => import('./pages/participacion/participacion').then(m => m.Participacion) },
      { path: 'participacion/:slug', data: { breadcrumb: 'Consulta ciudadana' },
        loadComponent: () => import('./pages/participacion/participacion').then(m => m.Participacion) },
      { path: 'mapa-del-sitio', loadComponent: () => import('./pages/mapa-del-sitio/mapa-del-sitio').then(m => m.MapaDelSitio), data: { breadcrumb: 'Mapa del sitio' } },
      { path: 'buscar', loadComponent: () => import('./pages/buscar/buscar').then(m => m.Buscar), data: { breadcrumb: 'Buscar en el portal' } },
      { path: 'login', loadComponent: () => import('./pages/login/login').then(m => m.Login), data: { breadcrumb: 'Iniciar sesión' } },

      // Direcciones anteriores → nueva estructura (Res. 1519 de 2020)
      // URL del portal anterior
      { path: 'seguimiento-solicitudes', redirectTo: 'solicitudes-contractuales', pathMatch: 'full' },
      { path: 'seguimiento-solicitudes/:id', redirectTo: 'solicitudes-contractuales', pathMatch: 'full' },
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
    loadComponent: () => import('./layout/dashboard-layout/dashboard-layout').then(m => m.DashboardLayout),
    canActivate: [AuthGuard],
    children: [
      // Cada ruta exige su módulo (permisos por rol); si no lo tiene, va a su primera página permitida
      { path: '', loadComponent: () => import('./pages/dashboardhome/dashboardhome').then(m => m.DashboardHomeComponent), canActivate: [moduloGuard], data: { breadcrumb: 'Dashboard', modulo: 'resumen' } },
      { path: 'pqrsf', loadComponent: () => import('./pages/admin/pqrsf-admin/pqrsf-admin').then(m => m.PqrsfAdminComponent), canActivate: [moduloGuard], data: { breadcrumb: 'PQRSFD', modulo: 'pqrsfd' } },
      { path: 'solicitudes-contractuales', canActivate: [moduloGuard], data: { breadcrumb: 'Solicitudes contractuales', modulo: 'contratacion' },
        loadComponent: () => import('./pages/admin/contratacion-admin/contratacion-admin').then(m => m.ContratacionAdmin) },
      { path: 'historias-clinicas', canActivate: [moduloGuard], data: { breadcrumb: 'Copias de historia clínica', modulo: 'historias' },
        loadComponent: () => import('./pages/admin/historia-clinica-admin/historia-clinica-admin').then(m => m.HistoriaClinicaAdmin) },
      { path: 'participacion', canActivate: [moduloGuard], data: { breadcrumb: 'Consultas ciudadanas', modulo: 'participacion' },
        loadComponent: () => import('./pages/admin/participacion-admin/participacion-admin').then(m => m.ParticipacionAdmin) },
      { path: 'cotizaciones', loadComponent: () => import('./pages/admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin').then(m => m.CotizacionesPropuestasAdminComponent), canActivate: [moduloGuard], data: { breadcrumb: 'Invitaciones a cotizar', modulo: 'cotizaciones' } },
      { path: 'vacantes', loadComponent: () => import('./pages/admin/trabaja-nosotros-admin/trabaja-nosotros-admin/trabaja-nosotros-admin').then(m => m.TrabajaNosotrosAdminComponent), canActivate: [moduloGuard], data: { breadcrumb: 'Trabaja con nosotros', modulo: 'vacantes' } },
      { path: 'eventos', loadComponent: () => import('./pages/admin/eventos-admin/eventos-admin').then(m => m.EventosAdmin), canActivate: [moduloGuard], data: { breadcrumb: 'Calendario de eventos', modulo: 'eventos' } },
      { path: 'slider', loadComponent: () => import('./pages/admin/slider-admin/slider-admin').then(m => m.SliderAdmin), canActivate: [moduloGuard], data: { breadcrumb: 'Slider del inicio', modulo: 'slider' } },
      { path: 'usuarios', loadComponent: () => import('./pages/admin/usuarios/usuarios').then(m => m.Usuarios), canActivate: [moduloGuard], data: { breadcrumb: 'Usuarios y permisos', modulo: 'usuarios' } },
      { path: 'accesibilidad-admin', loadComponent: () => import('./pages/admin/accesibilidad-admin/accesibilidad-admin').then(m => m.AccesibilidadAdmin), canActivate: [moduloGuard], data: { breadcrumb: 'Administrar Accesibilidad', modulo: 'accesibilidad' } },
      { path: 'configuracion', loadComponent: () => import('./pages/admin/configuracion/configuracion').then(m => m.Configuracion), canActivate: [moduloGuard], data: { breadcrumb: 'Configuración', modulo: 'configuracion' } },
      // Cualquier usuario: sus datos y cambio de contraseña
      { path: 'mi-cuenta', loadComponent: () => import('./pages/admin/configuracion/configuracion').then(m => m.Configuracion), data: { breadcrumb: 'Mi cuenta', soloCuenta: true } },

      // 🧩 CMS: Menú → Páginas → Entradas → Multimedia
      {
        path: 'contenido',
        canActivate: [moduloGuard],
        data: { breadcrumb: 'Contenido', modulo: 'contenido' },
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
          { path: 'servicios', data: { breadcrumb: 'Portafolio de servicios' },
            loadComponent: () => import('./pages/admin/cms/servicios/cms-servicios').then(m => m.CmsServicios) },
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
