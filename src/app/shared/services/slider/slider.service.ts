import { computed, inject, Injectable, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { CmsDataSource } from '../cms/cms-datasource';
import { Banner, bannerVigente } from '../../models/slider/banner';

/**
 * Slider del inicio administrable desde el panel.
 * Mismo origen de datos del CMS: localStorage en modo local y la API
 * (tabla cms_banners) en producción.
 */
@Injectable({ providedIn: 'root' })
export class SliderService {
  private ds = inject(CmsDataSource);

  readonly banners = signal<Banner[]>([]);
  readonly cargando = signal(false);
  readonly error = signal<string | null>(null);
  private cargado = false;

  /** Diapositivas visibles ahora en el portal, en orden */
  readonly vigentes = computed(() => this.banners().filter((b) => bannerVigente(b)));

  async cargar(forzar = false): Promise<void> {
    if (this.cargado && !forzar) return;
    this.cargando.set(true);
    try {
      const lista = await firstValueFrom(this.ds.listar<Banner>('banners'));
      this.banners.set(this.ordenar(lista.map((b) => this.normalizar(b))));
      this.cargado = true;
      this.error.set(null);
    } catch {
      this.error.set('No se pudo cargar el slider.');
    } finally {
      this.cargando.set(false);
    }
  }

  async crear(data: Partial<Banner>): Promise<Banner> {
    const orden = Math.max(-1, ...this.banners().map((b) => b.orden)) + 1;
    const nuevo = this.normalizar(await firstValueFrom(this.ds.crear<Banner>('banners', { orden, ...data })));
    this.banners.update((l) => this.ordenar([...l, nuevo]));
    return nuevo;
  }

  async actualizar(id: number, data: Partial<Banner>): Promise<void> {
    const b = this.normalizar(await firstValueFrom(this.ds.actualizar<Banner>('banners', id, data)));
    this.banners.update((l) => this.ordenar(l.map((x) => (x.id === id ? b : x))));
  }

  async eliminar(id: number): Promise<void> {
    await firstValueFrom(this.ds.eliminar('banners', id), { defaultValue: undefined });
    this.banners.update((l) => l.filter((b) => b.id !== id));
  }

  /** Mueve una diapositiva y guarda el nuevo orden de todas */
  async mover(id: number, delta: -1 | 1): Promise<void> {
    const l = [...this.banners()];
    const i = l.findIndex((b) => b.id === id);
    const j = i + delta;
    if (i < 0 || j < 0 || j >= l.length) return;
    [l[i], l[j]] = [l[j], l[i]];
    const cambios = l.map((b, k) => ({ b, orden: k })).filter(({ b, orden }) => b.orden !== orden);
    this.banners.set(l.map((b, k) => ({ ...b, orden: k })));
    for (const { b, orden } of cambios) await firstValueFrom(this.ds.actualizar<Banner>('banners', b.id, { orden }));
  }

  private normalizar(b: Banner): Banner {
    return { ...b, nuevaPestana: !!b.nuevaPestana, orden: Number(b.orden) || 0, estado: b.estado || 'publicado' };
  }

  private ordenar(l: Banner[]): Banner[] {
    return [...l].sort((a, b) => a.orden - b.orden || a.id - b.id);
  }
}
