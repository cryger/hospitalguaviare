import { inject, Injectable, signal } from '@angular/core';
import { toObservable } from '@angular/core/rxjs-interop';
import { firstValueFrom } from 'rxjs';
import { CmsDataSource } from '../cms/cms-datasource';
import { Vacante } from '../../models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';

/**
 * Vacantes / convocatorias de "Trabaja con Nosotros".
 * Usa el mismo origen de datos del CMS: localStorage en desarrollo y
 * la API (tabla cms_vacantes) en producción.
 */
@Injectable({ providedIn: 'root' })
export class TrabajaNosotrosService {
  private ds = inject(CmsDataSource);

  readonly vacantes = signal<Vacante[]>([]);
  readonly cargando = signal(false);
  readonly error = signal<string | null>(null);
  private readonly vacantes$ = toObservable(this.vacantes);
  private cargado = false;

  constructor() {
    this.cargar();
  }

  async cargar(forzar = false): Promise<void> {
    if (this.cargado && !forzar) return;
    this.cargando.set(true);
    try {
      const lista = await firstValueFrom(this.ds.listar<Vacante>('vacantes'));
      this.vacantes.set(this.ordenar(lista.map((v) => this.normalizar(v))));
      this.cargado = true;
      this.error.set(null);
    } catch {
      this.error.set('No se pudieron cargar las vacantes.');
    } finally {
      this.cargando.set(false);
    }
  }

  /* ================= ADMIN ================= */

  getAll(): Vacante[] {
    return this.vacantes();
  }

  async crear(data: Partial<Vacante>): Promise<void> {
    const nueva = await firstValueFrom(
      this.ds.crear<Vacante>('vacantes', { ...data, fechaPublicacion: data.fechaPublicacion || new Date().toISOString() }),
    );
    this.vacantes.update((l) => this.ordenar([this.normalizar(nueva), ...l]));
  }

  async actualizar(id: number, data: Partial<Vacante>): Promise<void> {
    const v = await firstValueFrom(this.ds.actualizar<Vacante>('vacantes', id, data));
    this.vacantes.update((l) => this.ordenar(l.map((x) => (x.id === id ? this.normalizar(v) : x))));
  }

  async eliminar(id: number): Promise<void> {
    await firstValueFrom(this.ds.eliminar('vacantes', id), { defaultValue: undefined });
    this.vacantes.update((l) => l.filter((v) => v.id !== id));
  }

  /* ================= PÚBLICO ================= */

  getPublicadas(): Vacante[] {
    return this.vacantes().filter((v) => v.estado === 'publicada');
  }

  getCerradas(): Vacante[] {
    return this.vacantes().filter((v) => v.estado === 'cerrada');
  }

  vacantesObservable() {
    return this.vacantes$;
  }

  /* ================= helpers ================= */

  private normalizar(v: Vacante): Vacante {
    let requisitos: unknown = v.requisitos;
    if (typeof requisitos === 'string') {
      try {
        requisitos = JSON.parse(requisitos);
      } catch {
        requisitos = (requisitos as string).split('\n');
      }
    }
    return {
      ...v,
      vacantes: Number(v.vacantes) || 0,
      requisitos: Array.isArray(requisitos) ? requisitos.filter((r) => String(r).trim()) : [],
    };
  }

  private ordenar(l: Vacante[]): Vacante[] {
    const t = (x: Vacante) => new Date(x.fechaPublicacion).getTime() || 0;
    return [...l].sort((a, b) => t(b) - t(a));
  }
}
