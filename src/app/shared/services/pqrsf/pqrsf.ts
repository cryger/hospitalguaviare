import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { PQRSF } from '../../models/pqrsf/pqrsf/pqrsf-module';

@Injectable({ providedIn: 'root' })
export class PqrsfService {

  private storageKey = 'pqrsf-data';
  private pqrsf: PQRSF[] = [];
  private subject = new BehaviorSubject<PQRSF[]>([]);

  pqrsf$ = this.subject.asObservable();

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.pqrsf = saved ? JSON.parse(saved) : [];
    this.subject.next(this.pqrsf);
  }

  private save(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.pqrsf));
    this.subject.next([...this.pqrsf]);
  }

  /* ===== PÚBLICO ===== */

  crear(data: Omit<PQRSF, 'id' | 'fechaCreacion' | 'estado'>): void {
    const nueva: PQRSF = {
      ...data,
      id: Date.now(),
      fechaCreacion: new Date(),
      estado: 'Recibida'
    };

    this.pqrsf.unshift(nueva);
    this.save();
  }

  /* ===== ADMIN ===== */

  getAll(): PQRSF[] {
    return [...this.pqrsf];
  }

  responder(id: number, respuesta: string): void {
    const item = this.pqrsf.find(p => p.id === id);
    if (!item) return;

    item.respuesta = respuesta;
    item.fechaRespuesta = new Date();
    item.estado = 'Respondida';

    this.save();
  }

  cambiarEstado(id: number, estado: PQRSF['estado']): void {
    const item = this.pqrsf.find(p => p.id === id);
    if (!item) return;

    item.estado = estado;
    this.save();
  }
}
