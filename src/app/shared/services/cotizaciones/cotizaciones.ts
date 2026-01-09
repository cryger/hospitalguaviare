import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Cotizacion } from '../../models/cotizacion/cotizacion/cotizacion-module';

@Injectable({ providedIn: 'root' })
export class CotizacionesService {

  private storageKey = 'cotizaciones-data';
  private cotizaciones: Cotizacion[] = [];
  private cotizacionesSubject = new BehaviorSubject<Cotizacion[]>([]);

  cotizaciones$ = this.cotizacionesSubject.asObservable();

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.cotizaciones = saved ? JSON.parse(saved) : [];
    this.cotizacionesSubject.next(this.cotizaciones);
  }

  private save(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.cotizaciones));
    this.cotizacionesSubject.next([...this.cotizaciones]);
  }

  /* ===== ADMIN ===== */

  getAll(): Cotizacion[] {
    return [...this.cotizaciones];
  }

  crear(data: Omit<Cotizacion, 'id' | 'fechaPublicacion'>): void {
    const nueva: Cotizacion = {
      ...data,
      id: Date.now(),
      fechaPublicacion: new Date()
    };
    this.cotizaciones.unshift(nueva);
    this.save();
  }

  eliminar(id: number): void {
    this.cotizaciones = this.cotizaciones.filter(c => c.id !== id);
    this.save();
  }

  actualizar(id: number, data: Partial<Cotizacion>): void {
  const index = this.cotizaciones.findIndex(c => c.id === id);

  if (index === -1) {
    return;
  }

  this.cotizaciones[index] = {
    ...this.cotizaciones[index],
    ...data
  };

  this.save();
}


  /* ===== PÚBLICO ===== */

  getPublicadas(): Cotizacion[] {
    return this.cotizaciones.filter(c => c.estado === 'publicada');
  }
}
