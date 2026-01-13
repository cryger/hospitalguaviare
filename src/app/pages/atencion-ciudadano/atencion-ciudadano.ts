import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

interface CategoriaServicio {
  id: number;
  nombre: string;
  parentId?: number | null;
  activo: boolean;
}

interface Servicio {
  id: number;
  categoriaId: number;
  titulo: string;
  descripcion: string;
  ruta?: string;
  activo: boolean;
}

@Component({
  selector: 'app-atencion-ciudadano',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './atencion-ciudadano.html',
  styleUrls: ['./atencion-ciudadano.css']
})
export class AtencionCiudadano implements OnInit {

  categorias: CategoriaServicio[] = [];
  servicios: Servicio[] = [];

  ngOnInit(): void {
    this.cargarCategorias();
    this.cargarServicios();
  }

  /* =========================
     CARGA BASE (TEMPORAL)
     Luego irá a servicio/API
  ========================== */

  private cargarCategorias(): void {
    this.categorias = [
      { id: 1, nombre: 'Canales oficiales', activo: true },
      { id: 2, nombre: 'Solicitud de citas', activo: true },
      { id: 3, nombre: 'Información de interés', activo: true }
    ];
  }

  private cargarServicios(): void {
    this.servicios = [
      {
        id: 1,
        categoriaId: 1,
        titulo: 'Línea telefónica institucional',
        descripcion: 'Canal oficial de atención telefónica.',
        activo: true
      },
      {
        id: 2,
        categoriaId: 2,
        titulo: 'Solicitud de cita médica',
        descripcion: 'Agende su cita a través de nuestros canales oficiales.',
        ruta: '/citas',
        activo: true
      },
      {
        id: 3,
        categoriaId: 3,
        titulo: 'Población vulnerable',
        descripcion: 'Información de interés para población prioritaria.',
        activo: true
      }
    ];
  }

  /* =========================
     HELPERS
  ========================== */

  serviciosPorCategoria(categoriaId: number): Servicio[] {
    return this.servicios.filter(
      s => s.categoriaId === categoriaId && s.activo
    );
  }

}

