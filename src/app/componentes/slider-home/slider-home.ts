import { Component, DestroyRef, computed, effect, inject, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { NgTemplateOutlet } from '@angular/common';
import { SliderService } from '../../shared/services/slider/slider.service';
import { Banner, esEnlaceExterno } from '../../shared/models/slider/banner';

const INTERVALO_MS = 6000;

/**
 * Slider del inicio — carrusel BDC GOV.CO v5 (https://cdn.www.gov.co/v5/general/carrusel).
 * Las diapositivas se administran en Panel › Slider del inicio.
 * Controles obligatorios: indicadores de posición, reproducir/pausar con texto visible
 * y flechas con texto para lectores de pantalla. Se detiene al pasar el mouse o al
 * enfocar con el teclado, y no avanza solo si el usuario prefiere menos movimiento.
 */
@Component({
  selector: 'app-slider-home',
  imports: [RouterLink, NgTemplateOutlet],
  templateUrl: './slider-home.html',
  styleUrls: ['./slider-home.css'],
})
export class SliderHomeComponent {
  readonly svc = inject(SliderService);

  readonly slides = this.svc.vigentes;
  readonly actual = signal(0);
  /** Reproducción automática (el usuario la puede pausar) */
  readonly reproduciendo = signal(!this.prefiereMenosMovimiento());
  /** Pausa mientras el mouse o el foco están sobre el carrusel */
  readonly enPausaTemporal = signal(false);

  readonly total = computed(() => this.slides().length);
  readonly indice = computed(() => (this.total() ? this.actual() % this.total() : 0));

  private temporizador: ReturnType<typeof setInterval> | null = null;
  private inicioToque: number | null = null;

  constructor() {
    this.svc.cargar();

    // Avance automático
    effect(() => {
      const activo = this.reproduciendo() && !this.enPausaTemporal() && this.total() > 1;
      this.detener();
      if (activo) this.temporizador = setInterval(() => this.siguiente(), INTERVALO_MS);
    });
    inject(DestroyRef).onDestroy(() => this.detener());
  }

  private detener(): void {
    if (this.temporizador) clearInterval(this.temporizador);
    this.temporizador = null;
  }

  private prefiereMenosMovimiento(): boolean {
    try {
      return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    } catch {
      return false;
    }
  }

  siguiente(): void {
    if (this.total()) this.actual.set((this.indice() + 1) % this.total());
  }

  anterior(): void {
    if (this.total()) this.actual.set((this.indice() - 1 + this.total()) % this.total());
  }

  ir(i: number): void {
    this.actual.set(i);
  }

  alternar(): void {
    this.reproduciendo.update((v) => !v);
  }

  /** Teclado dentro del carrusel: flechas izquierda/derecha */
  teclado(ev: KeyboardEvent): void {
    if (ev.key === 'ArrowRight') { ev.preventDefault(); this.siguiente(); }
    if (ev.key === 'ArrowLeft') { ev.preventDefault(); this.anterior(); }
  }

  /** Deslizar con el dedo en celulares */
  tocar(ev: PointerEvent): void {
    if (ev.pointerType !== 'mouse') this.inicioToque = ev.clientX;
  }

  soltar(ev: PointerEvent): void {
    if (this.inicioToque === null) return;
    const dx = ev.clientX - this.inicioToque;
    this.inicioToque = null;
    if (Math.abs(dx) > 40) (dx < 0 ? this.siguiente() : this.anterior());
  }

  /** El foco sale del carrusel: se reanuda */
  salirFoco(ev: FocusEvent, contenedor: HTMLElement): void {
    if (!contenedor.contains(ev.relatedTarget as Node | null)) this.enPausaTemporal.set(false);
  }

  externo = (b: Banner) => esEnlaceExterno(b.enlaceUrl);
  conTexto = (b: Banner) => !!(b.titulo || b.descripcion || (b.textoBoton && b.enlaceUrl));
}
