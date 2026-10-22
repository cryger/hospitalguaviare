import { inject, Injectable, signal } from '@angular/core';
import { toObservable } from '@angular/core/rxjs-interop';
import { firstValueFrom } from 'rxjs';
import { CmsDataSource } from '../cms/cms-datasource';
import { Cotizacion } from '../../models/cotizacion/cotizacion/cotizacion-module';

/**
 * Invitaciones a cotizar (Información de interés).
 * Usa el mismo origen de datos del CMS: localStorage sin backend y
 * la API (tabla cms_cotizaciones) cuando está conectada.
 */
@Injectable({ providedIn: 'root' })
export class CotizacionesService {
  private ds = inject(CmsDataSource);

  readonly cotizaciones = signal<Cotizacion[]>([]);
  readonly cargando = signal(false);
  readonly error = signal<string | null>(null);
  /** Compatibilidad con componentes que usan observables (dashboard) */
  readonly cotizaciones$ = toObservable(this.cotizaciones);
  private cargado = false;

  constructor() {
    this.cargar();
  }

  async cargar(forzar = false): Promise<void> {
    if (this.cargado && !forzar) return;
    this.cargando.set(true);
    try {
      const lista = await firstValueFrom(this.ds.listar<Cotizacion>('cotizaciones'));
      this.cotizaciones.set(this.ordenar(lista));
      this.cargado = true;
      this.error.set(null);
    } catch {
      this.error.set('No se pudieron cargar las invitaciones a cotizar.');
    } finally {
      this.cargando.set(false);
    }
  }

  /* ================= ADMIN ================= */

  getAll(): Cotizacion[] {
    return this.cotizaciones();
  }

  getTotal(): number {
    return this.cotizaciones().length;
  }

  async crear(data: Partial<Cotizacion>): Promise<void> {
    const nueva = await firstValueFrom(
      this.ds.crear<Cotizacion>('cotizaciones', {
        ...data,
        fechaPublicacion: data.fechaPublicacion || new Date().toISOString(),
      }),
    );
    this.cotizaciones.update((l) => this.ordenar([nueva, ...l]));
  }

  async actualizar(id: number, data: Partial<Cotizacion>): Promise<void> {
    const c = await firstValueFrom(this.ds.actualizar<Cotizacion>('cotizaciones', id, data));
    this.cotizaciones.update((l) => this.ordenar(l.map((x) => (x.id === id ? c : x))));
  }

  async eliminar(id: number): Promise<void> {
    await firstValueFrom(this.ds.eliminar('cotizaciones', id), { defaultValue: undefined });
    this.cotizaciones.update((l) => l.filter((c) => c.id !== id));
  }

  /* ================= PÚBLICO ================= */

  getPublicadas(): Cotizacion[] {
    return this.cotizaciones().filter((c) => c.estado === 'publicada');
  }

  getCerradas(): Cotizacion[] {
    return this.cotizaciones().filter((c) => c.estado === 'cerrada');
  }

  private ordenar(l: Cotizacion[]): Cotizacion[] {
    const t = (x: Cotizacion) => new Date(x.fechaPublicacion).getTime() || 0;
    return [...l].sort((a, b) => t(b) - t(a));
  }
}
