import { Routes } from '@angular/router';
import { PublicLayout } from './layout/public-layout/public-layout';
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
      { path: 'servicios', component: Servicios, data: { breadcrumb: 'Servicios' } }
    ]
  },
{path: '**', redirectTo: ''}
];
