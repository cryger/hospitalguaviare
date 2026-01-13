import { Injectable } from '@angular/core';

export interface CategoriaServicio {
  id: number;
  nombre: string;
  parentId?: number | null;
  activo: boolean;
}

export interface ServicioAtencion {
  id: number;
  categoriaId: number;
  titulo: string;
  descripcion: string;
  ruta?: string;
  activo: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class ServiciosAtencionService {

  private storageKeyCategorias = 'servicios-atencion-categorias';
  private storageKeyServicios = 'servicios-atencion-servicios';

  private categorias: CategoriaServicio[] = [];
  private servicios: ServicioAtencion[] = [];

  constructor() {
    this.categorias = JSON.parse(
      localStorage.getItem(this.storageKeyCategorias) || '[]'
    );

    this.servicios = JSON.parse(
      localStorage.getItem(this.storageKeyServicios) || '[]'
    );
  }

  /* =========================
     CATEGORÍAS
  ========================== */

  getCategoriasActivas(): CategoriaServicio[] {
    return this.categorias.filter(c => c.activo);
  }

  guardarCategorias(categorias: CategoriaServicio[]): void {
    this.categorias = categorias;
    localStorage.setItem(
      this.storageKeyCategorias,
      JSON.stringify(this.categorias)
    );
  }

  /* =========================
     SERVICIOS
  ========================== */

  getServiciosActivos(): ServicioAtencion[] {
    return this.servicios.filter(s => s.activo);
  }

  guardarServicios(servicios: ServicioAtencion[]): void {
    this.servicios = servicios;
    localStorage.setItem(
      this.storageKeyServicios,
      JSON.stringify(this.servicios)
    );
  }

  /* =========================
     HELPERS
  ========================== */

  serviciosPorCategoria(categoriaId: number): ServicioAtencion[] {
    return this.servicios.filter(
      s => s.categoriaId === categoriaId && s.activo
    );
  }
}
