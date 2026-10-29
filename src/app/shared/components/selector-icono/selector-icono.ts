import { Component, ElementRef, HostListener, computed, inject, input, model, signal, viewChild } from '@angular/core';
import { CATEGORIAS_ICONOS, ICONOS_GOVCO, IconoGovco } from '../../iconos/iconos-govco';
import { PREFIJO_GOVCO, iconoGovco, leerIcono, nombreLegible } from '../../iconos/iconos';
import { normalizar } from '../../utils/busqueda';

const TODOS = 'todos';

/**
 * Selector de íconos (galería desplegable) con los íconos nativos de la plataforma
 * (fuente GOV.CO). Guarda "govco:<nombre>"; vacío = sin ícono.
 * Uso: <app-selector-icono idCampo="pg-icono" [(valor)]="form.icono" />
 */
@Component({
  selector: 'app-selector-icono',
  templateUrl: './selector-icono.html',
  styleUrl: './selector-icono.css',
})
export class SelectorIcono {
  readonly valor = model<string | null | undefined>('');
  readonly idCampo = input('selector-icono');

  readonly abierto = signal(false);
  readonly busqueda = signal('');
  readonly categoria = signal<string>(CATEGORIAS_ICONOS[0].nombre);

  readonly categorias = CATEGORIAS_ICONOS.map((c) => ({ nombre: c.nombre, total: c.iconos.length }));
  readonly totalTodos = ICONOS_GOVCO.length;
  readonly TODOS = TODOS;
  readonly legible = nombreLegible;

  private readonly boton = viewChild<ElementRef<HTMLButtonElement>>('boton');
  private readonly buscador = viewChild<ElementRef<HTMLInputElement>>('buscador');
  private readonly rejilla = viewChild<ElementRef<HTMLElement>>('rejilla');

  private host = inject<ElementRef<HTMLElement>>(ElementRef);

  /** Ícono elegido (para la vista previa del botón) */
  readonly actual = computed(() => leerIcono(this.valor()));
  readonly nombreActual = computed(() => {
    const v = this.valor() ?? '';
    return v.startsWith(PREFIJO_GOVCO) ? v.slice(PREFIJO_GOVCO.length) : '';
  });

  readonly visibles = computed<IconoGovco[]>(() => {
    const q = normalizar(this.busqueda()).trim();
    if (q) {
      const palabras = q.split(/\s+/);
      return ICONOS_GOVCO.filter((i) => {
        const texto = `${i.nombre.replace(/-/g, ' ')} ${normalizar(i.claves)}`;
        return palabras.every((p) => texto.includes(p));
      });
    }
    if (this.categoria() === TODOS) return ICONOS_GOVCO;
    const cat = CATEGORIAS_ICONOS.find((c) => c.nombre === this.categoria());
    return (cat?.iconos ?? []).map((n) => iconoGovco(n)!).filter(Boolean);
  });

  caracter(i: IconoGovco): string {
    return String.fromCodePoint(i.codigo);
  }

  alternar(): void {
    if (this.abierto()) this.cerrar(true);
    else this.abrir();
  }

  abrir(): void {
    this.abierto.set(true);
    // Si el ícono actual no está en la categoría visible, se muestra "Todos" para que se vea marcado
    const n = this.nombreActual();
    if (n && !CATEGORIAS_ICONOS.find((c) => c.nombre === this.categoria())?.iconos.includes(n)) {
      const cat = CATEGORIAS_ICONOS.find((c) => c.iconos.includes(n));
      this.categoria.set(cat ? cat.nombre : TODOS);
    }
    setTimeout(() => this.buscador()?.nativeElement.focus());
  }

  cerrar(devolverFoco = false): void {
    this.abierto.set(false);
    this.busqueda.set('');
    if (devolverFoco) setTimeout(() => this.boton()?.nativeElement.focus());
  }

  elegir(i: IconoGovco): void {
    this.valor.set(PREFIJO_GOVCO + i.nombre);
    this.cerrar(true);
  }

  quitar(): void {
    this.valor.set('');
    this.cerrar(true);
  }

  verCategoria(nombre: string): void {
    this.categoria.set(nombre);
    this.busqueda.set('');
  }

  /** Flechas para moverse por la galería; Inicio/Fin para ir al primero/último */
  navegar(ev: KeyboardEvent): void {
    const grid = this.rejilla()?.nativeElement;
    if (!grid) return;
    const botones = Array.from(grid.querySelectorAll<HTMLButtonElement>('button'));
    const i = botones.indexOf(document.activeElement as HTMLButtonElement);
    if (i < 0 || !botones.length) return;
    const ancho = botones[0].getBoundingClientRect().width || 1;
    const columnas = Math.max(1, Math.round(grid.clientWidth / (ancho + 4)));
    const destino: Record<string, number> = {
      ArrowRight: i + 1,
      ArrowLeft: i - 1,
      ArrowDown: i + columnas,
      ArrowUp: i - columnas,
      Home: 0,
      End: botones.length - 1,
    };
    if (!(ev.key in destino)) return;
    ev.preventDefault();
    botones[Math.min(botones.length - 1, Math.max(0, destino[ev.key]))].focus();
  }

  /** Desde el buscador, ↓ lleva a la galería */
  aGaleria(ev: Event): void {
    const primero = this.rejilla()?.nativeElement.querySelector<HTMLButtonElement>('button');
    if (primero) {
      ev.preventDefault();
      primero.focus();
    }
  }

  @HostListener('document:keydown.escape')
  alEscape(): void {
    if (this.abierto()) this.cerrar(true);
  }

  @HostListener('document:click', ['$event'])
  alClicFuera(ev: MouseEvent): void {
    if (this.abierto() && !this.host.nativeElement.contains(ev.target as Node)) this.cerrar();
  }
}
