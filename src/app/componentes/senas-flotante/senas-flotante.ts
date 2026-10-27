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

  /** Junto al enlace (abajo, arriba o al lado), siempre dentro de la pantalla */
  readonly posicion = computed(() => {
    const a = this.svc.actual();
    if (!a) return null;
    const r = a.rect;
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    const dentroX = (x: number) => Math.max(MARGEN, Math.min(x, vw - ANCHO - MARGEN));
    const dentroY = (y: number) => Math.max(MARGEN, Math.min(y, vh - ALTO - MARGEN));
    const centrado = dentroX(r.left + r.width / 2 - ANCHO / 2);
    const abajo = r.bottom + MARGEN;
    const arriba = r.top - ALTO - MARGEN;

    if (a.posicion === 'lado') {
      const derecha = r.right + MARGEN;
      const izquierda = r.left - ANCHO - MARGEN;
      const top = dentroY(r.top + r.height / 2 - ALTO / 2);
      if (derecha + ANCHO <= vw - MARGEN) return { top, left: derecha };
      if (izquierda >= MARGEN) return { top, left: izquierda };
      return { top: abajo + ALTO <= vh - MARGEN ? abajo : dentroY(arriba), left: centrado };
    }
    if (a.posicion === 'arriba') {
      return { top: arriba >= MARGEN ? arriba : dentroY(abajo), left: centrado };
    }
    return { top: abajo + ALTO <= vh - MARGEN ? abajo : dentroY(arriba), left: centrado };
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
