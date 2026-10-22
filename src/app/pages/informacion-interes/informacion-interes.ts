import { Component, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { TrabajaNosotrosService } from '../../shared/services/trabaja-nosotros/trabaja-nosotros-service';

@Component({
  selector: 'app-informacion-interes',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './informacion-interes.html',
  styleUrls: ['./informacion-interes.css'],
})
export class InformacionInteres {
  private cotizaciones = inject(CotizacionesService);
  private vacantes = inject(TrabajaNosotrosService);

  readonly secciones = computed(() => {
    const cot = this.cotizaciones.cotizaciones();
    const vac = this.vacantes.vacantes();
    return [
      {
        icono: '💼',
        titulo: 'Invitaciones a cotizar',
        texto: 'Procesos en los que el hospital invita a personas naturales y jurídicas a presentar cotizaciones para bienes y servicios.',
        ruta: '/informacion-de-interes/invitaciones-a-cotizar',
        vigentes: cot.filter((c) => c.estado === 'publicada').length,
        anteriores: cot.filter((c) => c.estado === 'cerrada').length,
        etiqueta: 'vigente',
      },
      {
        icono: '🧑‍⚕️',
        titulo: 'Trabaja con nosotros',
        texto: 'Convocatorias laborales y de prestación de servicios para hacer parte del equipo de la E.S.E. Hospital San José del Guaviare.',
        ruta: '/informacion-de-interes/trabaja-con-nosotros',
        vigentes: vac.filter((v) => v.estado === 'publicada').length,
        anteriores: vac.filter((v) => v.estado === 'cerrada').length,
        etiqueta: 'abierta',
      },
    ];
  });

  constructor() {
    this.cotizaciones.cargar();
    this.vacantes.cargar();
  }
}
