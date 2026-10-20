import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Vacante } from '../../models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';

@Injectable({ providedIn: 'root' })
export class TrabajaNosotrosService {

  private storageKey = 'vacantes-trabaja-nosotros';
  private vacantes: Vacante[] = [];
  private vacantes$ = new BehaviorSubject<Vacante[]>([]);

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.vacantes = saved ? JSON.parse(saved) : [];
    this.vacantes$.next(this.vacantes);
  }

  private persist(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.vacantes));
    this.vacantes$.next([...this.vacantes]);
  }

  /* ================= ADMIN ================= */

  getAll(): Vacante[] {
    return [...this.vacantes];
  }

  crear(data: Omit<Vacante, 'id' | 'fechaPublicacion'>): void {
    this.vacantes.unshift({
      ...data,
      id: Date.now(),
      fechaPublicacion: new Date()
    });
    this.persist();
  }

  actualizar(id: number, data: Partial<Vacante>): void {
    const index = this.vacantes.findIndex(v => v.id === id);
    if (index === -1) return;

    this.vacantes[index] = { ...this.vacantes[index], ...data };
    this.persist();
  }

  eliminar(id: number): void {
    this.vacantes = this.vacantes.filter(v => v.id !== id);
    this.persist();
  }

  /* ================= PÚBLICO ================= */

  getPublicadas(): Vacante[] {
    return this.vacantes.filter(v => v.estado === 'publicada');
  }

  vacantesObservable() {
    return this.vacantes$.asObservable();
  }
}
