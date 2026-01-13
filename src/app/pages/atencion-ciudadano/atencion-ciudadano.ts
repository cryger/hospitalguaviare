import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

import {
  ServiciosAtencionService,
  CategoriaServicio,
  ServicioAtencion
} from '../../shared/services/servicios-atencion/servicios-atencion';

@Component({
  selector: 'app-atencion-ciudadano',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './atencion-ciudadano.html',
  styleUrls: ['./atencion-ciudadano.css']
})
export class AtencionCiudadano implements OnInit {

  categorias: CategoriaServicio[] = [];
  servicios: ServicioAtencion[] = [];

  constructor(
    private serviciosAtencionService: ServiciosAtencionService
  ) {}

  ngOnInit(): void {
    this.categorias = this.serviciosAtencionService.getCategoriasActivas();
    this.servicios = this.serviciosAtencionService.getServiciosActivos();
  }

  serviciosPorCategoria(categoriaId: number): ServicioAtencion[] {
    return this.servicios.filter(
      s => s.categoriaId === categoriaId
    );
  }
}
