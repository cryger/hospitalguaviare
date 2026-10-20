<<<<<<< HEAD
import { Component } from '@angular/core';

@Component({
  selector: 'app-cotizaciones-propuestas',
  imports: [],
  templateUrl: './cotizaciones-propuestas.html',
  styleUrl: './cotizaciones-propuestas.css',
})
export class CotizacionesPropuestas {

=======
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { Cotizacion } from '../../shared/models/cotizacion/cotizacion/cotizacion-module';

@Component({
  selector: 'app-cotizaciones-propuestas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './cotizaciones-propuestas.html',
  styleUrls: ['./cotizaciones-propuestas.css']
})
export class CotizacionesPropuestas implements OnInit {

  cotizaciones: Cotizacion[] = [];

  constructor(private cotizacionesService: CotizacionesService) {}

  ngOnInit(): void {
    this.cotizacionesService.cotizaciones$.subscribe(() => {
      this.cotizaciones = this.cotizacionesService.getPublicadas();
    });
  }
>>>>>>> 6865d3237f4bc5713e442c82baab8c7322857aba
}
