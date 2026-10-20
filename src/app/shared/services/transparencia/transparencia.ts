import { Injectable } from '@angular/core';
import {
  CategoriaTransparencia,
  TransparenciaPublicaciones
} from '../../models/transparencia-module/transparencia-module';

@Injectable({
  providedIn: 'root',
})
export class TransparenciaService {

  private categoriasKey = 'categorias-transparencia';
  private publicacionesKey = 'publicaciones-transparencia';

  private categoriasTransparencia: CategoriaTransparencia[] = [];
  private publicacionesTransparencia: TransparenciaPublicaciones[] = [];

  constructor() {
    this.cargarDesdeStorage();
  }

  /* =========================
     STORAGE
  ========================== */

  private cargarDesdeStorage(): void {
    const cat = localStorage.getItem(this.categoriasKey);
    const pub = localStorage.getItem(this.publicacionesKey);

    this.categoriasTransparencia = cat ? JSON.parse(cat) : [];
    this.publicacionesTransparencia = pub ? JSON.parse(pub) : [];
  }

  private guardarStorage(): void {
    localStorage.setItem(
      this.categoriasKey,
      JSON.stringify(this.categoriasTransparencia)
    );
    localStorage.setItem(
      this.publicacionesKey,
      JSON.stringify(this.publicacionesTransparencia)
    );
  }

  /* =========================
     CATEGORÍAS
  ========================== */

  getCategorias(): CategoriaTransparencia[] {
    return [...this.categoriasTransparencia];
  }

  getCategoriasActivas(): CategoriaTransparencia[] {
    return this.categoriasTransparencia.filter(c => c.activo);
  }

  guardarCategorias(categorias: CategoriaTransparencia[]): void {
    this.categoriasTransparencia = [...categorias];
    this.guardarStorage();
  }

  /* =========================
     PUBLICACIONES
  ========================== */

  getPublicaciones(): TransparenciaPublicaciones[] {
    return [...this.publicacionesTransparencia];
  }

  getPublicacionesActivos(): TransparenciaPublicaciones[] {
    return this.publicacionesTransparencia.filter(p => p.activo);
  }

  guardarPublicaciones(publicaciones: TransparenciaPublicaciones[]): void {
    this.publicacionesTransparencia = [...publicaciones];
    this.guardarStorage();
  }
}
