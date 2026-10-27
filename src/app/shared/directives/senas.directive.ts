import { Directive, ElementRef, OnDestroy, inject, input } from '@angular/core';
import { LenguaSenasService } from '../services/senas/lengua-senas.service';

const RETARDO_MOSTRAR_MS = 250;
const RETARDO_OCULTAR_MS = 200;

/**
 * Muestra el video en Lengua de Señas del enlace al pasar el mouse o al enfocarlo con el teclado.
 * Uso: <a appSenas="Inicio" …> o <a [appSenas]="item.titulo" …>
 * Si no hay video para ese texto, no hace nada.
 * Cumple WCAG 1.4.13: aparece con hover y con foco, se puede pasar el mouse sobre el recuadro
 * sin que desaparezca y se cierra con Esc.
 */
@Directive({
  selector: '[appSenas]',
  host: {
    '(mouseenter)': 'entrar($event)',
    '(mouseleave)': 'salir()',
    '(focusin)': 'entrar($event)',
    '(focusout)': 'salir()',
    '(keydown.escape)': 'svc.ocultar()',
  },
})
export class SenasDirective implements OnDestroy {
  readonly svc = inject(LenguaSenasService);
  private el = inject<ElementRef<HTMLElement>>(ElementRef);

  /** Texto o clave del video (por defecto, el texto del enlace) */
  readonly appSenas = input<string>('');

  private temporizador: ReturnType<typeof setTimeout> | null = null;

  constructor() {
    this.svc.cargar();
  }

  entrar(ev: Event): void {
    if (!this.svc.activo()) return;
    // En pantallas táctiles no hay "hover": no se muestra al tocar
    if (ev.type === 'mouseenter' && !window.matchMedia('(hover: hover)').matches) return;
    this.limpiar();
    this.temporizador = setTimeout(async () => {
      await this.svc.cargar();
      const texto = this.appSenas() || this.el.nativeElement.textContent || '';
      const sena = this.svc.buscar(texto);
      if (sena) this.svc.mostrar(sena, this.el.nativeElement);
    }, RETARDO_MOSTRAR_MS);
  }

  salir(): void {
    this.limpiar();
    // Pequeña espera para permitir mover el mouse hasta el recuadro (WCAG 1.4.13)
    this.temporizador = setTimeout(() => {
      const actual = this.svc.actual();
      if (actual?.origen === this.el.nativeElement && !document.querySelector('app-senas-flotante .senas-caja:hover')) {
        this.svc.ocultar();
      }
    }, RETARDO_OCULTAR_MS);
  }

  private limpiar(): void {
    if (this.temporizador) clearTimeout(this.temporizador);
    this.temporizador = null;
  }

  ngOnDestroy(): void {
    this.limpiar();
    if (this.svc.actual()?.origen === this.el.nativeElement) this.svc.ocultar();
  }
}
