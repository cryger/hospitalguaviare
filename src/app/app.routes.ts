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

  // 🌍 SITIO PÚBLICO
  {
    path: '',
    component: PublicLayout,
    children: [
      { path: '', component: Home, data: { breadcrumb: 'Inicio' } },
      { path: 'home', component: Home },
      { path: 'transparencia', component: Transparencia },
      { path: 'participa', component: Participa },
      { path: 'nuestro-hospital', component: NuestroHospital },
      { path: 'atencion-ciudadano', component: AtencionCiudadano },
      { path: 'cotizaciones-propuestas', component: CotizacionesPropuestas },
      { path: 'trabaja-nosotros', component: TrabajaNosotros },
      { path: 'pqrsf', component: Pqrsf },
      { path: 'normatividad', component: Normatividad },
      { path: 'servicios', component: Servicios },
      { path: 'login', component: Login },
    ]
  },

  // 🔐 DASHBOARD ADMIN
  {
    path: 'admin',
    component: DashboardLayout,
    canActivate: [AuthGuard],
    children: [
      { path: '', component: DashboardHome, data: { breadcrumb: 'Dashboard' } },
      { path: 'noticias', component: Noticias },
      { path: 'transparencia', component: AdminTransparencia },
      { path: 'pqrsf', component: AdminPqrsf },
      { path: 'usuarios', component: Usuarios },
    ]
  },

  // 🚫 FALLBACK
  { path: '**', redirectTo: '' }
];

