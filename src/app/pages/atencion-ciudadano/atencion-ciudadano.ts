<<<<<<< HEAD
import { Component } from '@angular/core';

@Component({
  selector: 'app-atencion-ciudadano',
  imports: [],
  templateUrl: './atencion-ciudadano.html',
  styleUrl: './atencion-ciudadano.css',
})
export class AtencionCiudadano {

=======
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink } from '@angular/router';

import {
  ServiciosAtencionService,
} from '../../shared/services/servicios-atencion/servicios-atencion';

import {
  CategoriaServicio,
  Servicio
} from '../../shared/models/servicios-atencion/servicios-atencion/servicios-atencion-module'

@Component({
  selector: 'app-atencion-ciudadano',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './atencion-ciudadano.html',
  styleUrls: ['./atencion-ciudadano.css']
})
export class AtencionCiudadano implements OnInit {

  categorias: CategoriaServicio[] = [];
  servicios: Servicio[] = [];

  constructor(
    private serviciosAtencionService: ServiciosAtencionService
  ) {}

  ngOnInit(): void {
    this.categorias = this.serviciosAtencionService.getCategoriasActivas();
    this.servicios = this.serviciosAtencionService.getServiciosActivos();
  }

  serviciosPorCategoria(categoriaId: number): Servicio[] {
    return this.servicios.filter(
      s => s.categoriaId === categoriaId
    );
  }
>>>>>>> 6865d3237f4bc5713e442c82baab8c7322857aba
}
