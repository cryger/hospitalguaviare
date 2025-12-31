import { Injectable } from '@angular/core';
import { Noticia } from '../../models/noticias/noticias/noticias-module';

@Injectable({ providedIn: 'root' })
export class NoticiasService {

  private storageKey = 'noticias-data';
  private noticias: Noticia[] = [];

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.noticias = saved ? JSON.parse(saved) : [];
  }

  private save(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.noticias));
  }

  /* ===== ADMIN ===== */

  getAll(): Noticia[] {
    return [...this.noticias];
  }

  crear(data: Omit<Noticia, 'id' | 'fechaPublicacion'>): void {
    const nueva: Noticia = {
      ...data,
      id: Date.now(),
      fechaPublicacion: new Date()
    };
    this.noticias.unshift(nueva);
    this.save();
  }

  cambiarEstado(id: number, estado: Noticia['estado']): void {
    const n = this.noticias.find(x => x.id === id);
    if (n) {
      n.estado = estado;
      this.save();
    }
  }

  eliminar(id: number): void {
    this.noticias = this.noticias.filter(n => n.id !== id);
    this.save();
  }

  /* ===== PÚBLICO ===== */

  getPublicadas(): Noticia[] {
    return this.noticias.filter(n => n.estado === 'publicada');
  }
}
