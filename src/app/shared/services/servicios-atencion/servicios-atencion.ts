import { Injectable } from '@angular/core';
import { Servicio,CategoriaServicio } from '../../models/servicios-atencion/servicios-atencion/servicios-atencion-module';

@Injectable({ providedIn: 'root' })
export class ServiciosAtencionService {

  private categoriasKey = 'servicios-categorias';
  private serviciosKey = 'servicios-items';

  private categorias: CategoriaServicio[] = [];
  private servicios: Servicio[] = [];
  categoriaId: number | null = null;

  constructor() {
    this.cargarDesdeStorage();
  }

  /* =========================
     STORAGE
  ========================== */

  private cargarDesdeStorage(): void {
    const cat = localStorage.getItem(this.categoriasKey);
    const serv = localStorage.getItem(this.serviciosKey);

    this.categorias = cat ? JSON.parse(cat) : [];
    this.servicios = serv ? JSON.parse(serv) : [];
  }

  private guardarStorage(): void {
    localStorage.setItem(this.categoriasKey, JSON.stringify(this.categorias));
    localStorage.setItem(this.serviciosKey, JSON.stringify(this.servicios));
  }

  /* =========================
     CATEGORÍAS
  ========================== */

  getCategorias(): CategoriaServicio[] {
    return [...this.categorias];
  }

  getCategoriasActivas(): CategoriaServicio[] {
    return this.categorias.filter(c => c.activo);
  }

  guardarCategorias(categorias: CategoriaServicio[]): void {
    this.categorias = [...categorias];
    this.guardarStorage();
  }

  /* =========================
     SERVICIOS
  ========================== */

  getServicios(): Servicio[] {
    return [...this.servicios];
  }

  getServiciosActivos(): Servicio[] {
    return this.servicios.filter(s => s.activo);
  }

  guardarServicios(servicios: Servicio[]): void {
    this.servicios = [...servicios];
    this.guardarStorage();
  }
}


