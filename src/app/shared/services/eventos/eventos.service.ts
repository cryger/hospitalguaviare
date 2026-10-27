import { computed, inject, Injectable, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { CmsDataSource } from '../cms/cms-datasource';
import { Evento, diaDe, diasDe, hoyBogota } from '../../models/eventos/evento';

/**
 * Calendario de eventos institucional.
 * Mismo origen de datos del CMS: localStorage en modo local y la API
 * (tabla cms_eventos) en producción. Los visitantes solo reciben los
 * eventos publicados o cancelados; el panel recibe todos.
 */
@Injectable({ providedIn: 'root' })
export class EventosService {
  private ds = inject(CmsDataSource);

  readonly eventos = signal<Evento[]>([]);
  readonly cargando = signal(false);
  readonly error = signal<string | null>(null);
  private cargado = false;

  /** Eventos visibles en el portal (publicados y cancelados, para avisar) */
  readonly publicos = computed(() => this.eventos().filter((e) => e.estado !== 'borrador'));

  /** Mapa día (AAAA-MM-DD) → eventos públicos de ese día */
  readonly porDia = computed(() => {
    const mapa = new Map<string, Evento[]>();
    for (const e of this.publicos()) {
      for (const d of diasDe(e)) {
        if (!mapa.has(d)) mapa.set(d, []);
        mapa.get(d)!.push(e);
      }
    }
    return mapa;
  });

  /** Próximos eventos públicos (desde hoy) */
  readonly proximos = computed(() => {
    const hoy = hoyBogota();
    return this.publicos().filter((e) => diasDe(e).some((d) => d >= hoy));
  });

  async cargar(forzar = false): Promise<void> {
    if (this.cargado && !forzar) return;
    this.cargando.set(true);
    try {
      const lista = await firstValueFrom(this.ds.listar<Evento>('eventos'));
      this.eventos.set(this.ordenar(lista.map((e) => this.normalizar(e))));
      this.cargado = true;
      this.error.set(null);
    } catch {
      this.error.set('No se pudieron cargar los eventos.');
    } finally {
      this.cargando.set(false);
    }
  }

  async crear(data: Partial<Evento>): Promise<Evento> {
    const nuevo = this.normalizar(await firstValueFrom(this.ds.crear<Evento>('eventos', data)));
    this.eventos.update((l) => this.ordenar([...l, nuevo]));
    return nuevo;
  }

  async actualizar(id: number, data: Partial<Evento>): Promise<void> {
    const e = this.normalizar(await firstValueFrom(this.ds.actualizar<Evento>('eventos', id, data)));
    this.eventos.update((l) => this.ordenar(l.map((x) => (x.id === id ? e : x))));
  }

  async eliminar(id: number): Promise<void> {
    await firstValueFrom(this.ds.eliminar('eventos', id), { defaultValue: undefined });
    this.eventos.update((l) => l.filter((e) => e.id !== id));
  }

  private normalizar(e: Evento): Evento {
    return {
      ...e,
      todoElDia: !!e.todoElDia,
      destacado: !!e.destacado,
      modalidad: e.modalidad || 'presencial',
      categoria: e.categoria || 'institucional',
      estado: e.estado || 'publicado',
    };
  }

  private ordenar(l: Evento[]): Evento[] {
    return [...l].sort((a, b) => a.fechaInicio.localeCompare(b.fechaInicio) || a.id - b.id);
  }
}

export { diaDe };
