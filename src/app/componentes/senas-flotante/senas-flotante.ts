import { Component, computed, inject } from '@angular/core';
import { LenguaSenasService } from '../../shared/services/senas/lengua-senas.service';

const ANCHO = 156; // px (video de 144 px + bordes): recuadro pequeño
const ALTO = 182;
const MARGEN = 8;

/**
 * Recuadro flotante con el video en Lengua de Señas del enlace señalado.
 * Uno solo para todo el portal (se ubica junto al enlace activo).
 */
@Component({
  selector: 'app-senas-flotante',
  templateUrl: './senas-flotante.html',
  styleUrl: './senas-flotante.css',
  host: {
    '(document:keydown.escape)': 'svc.ocultar()',
    '(window:scroll)': 'svc.ocultar()',
    '(window:resize)': 'svc.ocultar()',
  },
})
export class SenasFlotante {
  readonly svc = inject(LenguaSenasService);

  readonly reducirMovimiento = (() => {
    try {
      return window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    } catch {
      return false;
    }
  })();

  /** Debajo del enlace (o encima si no cabe), centrado y dentro de la pantalla */
  readonly posicion = computed(() => {
    const a = this.svc.actual();
    if (!a) return null;
    const r = a.rect;
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    let left = r.left + r.width / 2 - ANCHO / 2;
    left = Math.max(MARGEN, Math.min(left, vw - ANCHO - MARGEN));
    let top = r.bottom + MARGEN;
    if (top + ALTO > vh - MARGEN) top = Math.max(MARGEN, r.top - ALTO - MARGEN);
    return { top, left };
  });

  /** Algunos navegadores bloquean el autoplay si el video no está silenciado */
  reproducir(v: HTMLVideoElement): void {
    v.muted = true;
    v.play().catch(() => undefined);
  }

  salir(): void {
    this.svc.ocultar();
  }
}
