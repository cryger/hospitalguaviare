import { Component, computed, inject } from '@angular/core';
import { DatePipe } from '@angular/common';
import { TrabajaNosotrosService } from '../../shared/services/trabaja-nosotros/trabaja-nosotros-service';

@Component({
  selector: 'app-trabaja-nosotros',
  standalone: true,
  imports: [DatePipe],
  templateUrl: './trabaja-nosotros.html',
  styleUrls: ['./trabaja-nosotros.css'],
})
export class TrabajaNosotros {
  readonly service = inject(TrabajaNosotrosService);

  readonly abiertas = computed(() => this.service.vacantes().filter((v) => v.estado === 'publicada'));
  readonly cerradas = computed(() => this.service.vacantes().filter((v) => v.estado === 'cerrada'));

  constructor() {
    this.service.cargar();
  }
}
