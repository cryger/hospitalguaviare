import { Routes } from '@angular/router';
import { PublicLayout } from './layout/public-layout/public-layout';
import { DashboardLayout } from './layout/dashboard-layout/dashboard-layout';
import { Home } from './componentes/home/home';
import { Transparencia } from './pages/transparencia/transparencia';
import { Participa } from './pages/participa/participa';
import { NuestroHospital } from './pages/nuestro-hospital/nuestro-hospital';
import { AtencionCiudadano} from './pages/atencion-ciudadano/atencion-ciudadano'
import { CotizacionesPropuestas } from './pages/cotizaciones-propuestas/cotizaciones-propuestas';
import { TrabajaNosotros} from './pages/trabaja-nosotros/trabaja-nosotros';
import { PqrsfComponent } from './pages/pqrsf/pqrsf';
import { Normatividad } from './pages/normatividad/normatividad';
import { Servicios } from './pages/servicios/servicios';
import { Login } from './pages/login/login';
import { AdminGuard } from './shared/guards/admin/admin-guard';
import { DashboardHomeComponent } from './pages/dashboardhome/dashboardhome';
import { NoticiasAdminComponent } from './pages/admin/noticias/noticias';
import { Usuarios } from './pages/admin/usuarios/usuarios';
import { Configuacion } from './pages/admin/configuracion/configuracion';
import { PqrsfAdminComponent as AdminPqrsf } from './pages/admin/pqrsf-admin/pqrsf-admin';
import { transparenciaAdminComponent as AdminTransparencia } from './pages/admin/transparencia-admin/transparencia-admin';
import { AuthGuard } from './shared/guards/auth/auth-guard';
import { Breadcrumb } from './componentes/breadcrumb/breadcrumb';
import { CotizacionesPropuestasAdminComponent } from './pages/admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin/cotizaciones-propuestas-admin';
import { ServiciosAtencionAdmin } from './pages/admin/servicios-atencion-admin/servicios-atencion-admin/servicios-atencion-admin';
import { AccesibilidadAdmin } from './pages/admin/accesibilidad-admin/accesibilidad-admin';
import { TrabajaNosotrosAdminComponent } from './pages/admin/trabaja-nosotros-admin/trabaja-nosotros-admin/trabaja-nosotros-admin';


export const routes: Routes = [];
