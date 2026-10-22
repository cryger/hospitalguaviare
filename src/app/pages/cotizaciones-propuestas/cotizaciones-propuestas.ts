import { Component, computed, inject } from '@angular/core';
import { DatePipe, NgTemplateOutlet } from '@angular/common';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { InformacionInteresNav } from '../informacion-interes/informacion-interes-nav';

@Component({
  selector: 'app-cotizaciones-propuestas',
  standalone: true,
  imports: [DatePipe, NgTemplateOutlet, InformacionInteresNav],
  templateUrl: './cotizaciones-propuestas.html',
  styleUrls: ['./cotizaciones-propuestas.css'],
})
export class CotizacionesPropuestas {
  readonly service = inject(CotizacionesService);

  readonly vigentes = computed(() => this.service.cotizaciones().filter((c) => c.estado === 'publicada'));
  readonly anteriores = computed(() => this.service.cotizaciones().filter((c) => c.estado === 'cerrada'));

  constructor() {
    this.service.cargar();
  }

  /** Días que faltan para la fecha límite (null si no tiene) */
  diasRestantes(fecha?: string | null): number | null {
    if (!fecha) return null;
    const ms = new Date(fecha).getTime() - Date.now();
    return isNaN(ms) ? null : Math.ceil(ms / 86_400_000);
  }
}
