import { Routes } from '@angular/router';
import { PublicLayout } from './layout/public-layout/public-layout';
import { DashboardLayout } from './layout/dashboard-layout/dashboard-layout';
import { Home } from './componentes/home/home';
import { Transparencia } from './pages/transparencia/transparencia';
import { Participa } from './pages/participa/participa';
import { NuestroHospital } from './pages/nuestro-hospital/nuestro-hospital';
import { AtencionCiudadano } from './pages/atencion-ciudadano/atencion-ciudadano';
import { CotizacionesPropuestas } from './pages/cotizaciones-propuestas/cotizaciones-propuestas';
import { TrabajaNosotros} from './pages/trabaja-nosotros/trabaja-nosotros';
import { Pqrsf } from './pages/pqrsf/pqrsf';
import { Normatividad } from './pages/normatividad/normatividad';
import { Servicios } from './pages/servicios/servicios';
import { Login } from './pages/login/login';
import { AdminGuard } from './shared/guards/admin/admin-guard';
import { DashboardHome } from './pages/dashboardhome/dashboardhome';
import { Noticias } from './pages/admin/noticias/noticias';
import { Usuarios } from './pages/admin/usuarios/usuarios';
import { Configuacion } from './pages/admin/configuracion/configuracion';
import { Pqrsf as AdminPqrsf } from './pages/admin/pqrsf/pqrsf';
import { Transparencia as AdminTransparencia } from './pages/admin/transparencia/transparencia';
import { AuthGuard } from './shared/guards/auth/auth-guard';

export const routes: Routes = [
  {
    path: '',
    component: PublicLayout,
    children:
    [
      { path: '', component: Home, data: { breadcrumb: 'Inicio' } },
      { path: 'home', component: Home, data: { breadcrumb: 'home' } },
      { path: 'transparencia', component: Transparencia, data: { breadcrumb: 'Transparencia' } },
      { path: 'participa', component: Participa, data: { breadcrumb: 'Participa' } },
      { path: 'nuestro-hospital', component: NuestroHospital, data: { breadcrumb: 'Nuestro Hospital' } },
      { path: 'atencion-ciudadano', component: AtencionCiudadano, data: { breadcrumb: 'Atención al Ciudadano' } },
      { path: 'cotizaciones-propuestas', component: CotizacionesPropuestas, data: { breadcrumb: 'Cotizaciones y Propuestas' } },
      { path: 'trabaja-nosotros', component: TrabajaNosotros, data: { breadcrumb: 'Trabaja con Nosotros' } },
      { path: 'pqrsf', component: Pqrsf, data: { breadcrumb: 'PQRSF' } },
      { path: 'normatividad', component: Normatividad, data: { breadcrumb: 'Normatividad' } },
      { path: 'servicios', component: Servicios, data: { breadcrumb: 'Servicios' } },
      { path: 'login', component: Login, data: { breadcrumb: 'Iniciar Sesión' } },
    ]
  },
{
  path: '',
  component: DashboardLayout,
  canActivate: [AdminGuard],
  children: [
    { path: '', component: Home, data: { breadcrumb: 'Inicio' } },
    { path: 'admin', component: DashboardHome, data: { breadcrumb: 'Dashboard' } },
    { path: 'admin-noticias',component: Noticias, data: { breadcrumb: 'Noticias' }},
    { path: 'admin-transparencia', component: AdminTransparencia, data: { breadcrumb: 'Transparencia' } },
    { path: 'admin-pqrsf', component: AdminPqrsf, data: { breadcrumb: 'PQRSF' } },
    { path: 'admin-usuarios', component: Usuarios, data: { breadcrumb: 'Usuarios' } },
  ]

},
{path: '**', redirectTo: ''},
];
