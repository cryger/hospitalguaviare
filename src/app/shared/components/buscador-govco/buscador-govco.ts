import { Component, ElementRef, computed, inject, input, model, output, signal, viewChild } from '@angular/core';
import { Router } from '@angular/router';

/** Sugerencia del buscador predictivo */
export interface SugerenciaBusqueda {
  /** Texto principal (puede llevar <mark> si viene de resaltar()) */
  html: string;
  /** Texto secundario: sección, tipo… */
  detalle?: string;
  url: string;
}

let contador = 0;

/**
 * Buscador estándar del portal, alineado a la BDC GOV.CO v5
 * (buscador básico + predictivo, desplegables y etiquetas).
 *
 * Uso:
 *   <app-buscador-govco idCampo="buscar-docs" titulo="Buscar documentos"
 *       [(valor)]="busqueda" (enviar)="irAResultados()">
 *     <div filtros class="desplegable-govco">…</div>   ← filtros opcionales
 *     <div class="bn-activos">…</div>                 ← etiquetas de filtros activos
 *   </app-buscador-govco>
 */
@Component({
  selector: 'app-buscador-govco',
  templateUrl: './buscador-govco.html',
  styleUrl: './buscador-govco.css',
  host: { '[class.compacto]': 'compacto()' },
})
export class BuscadorGovco {
  private router = inject(Router);

  readonly idCampo = input.required<string>();
  readonly etiqueta = input('Palabras clave');
  readonly titulo = input('');
  readonly ayuda = input('');
  readonly placeholder = input('Escriba una o varias palabras…');
  readonly etiquetaBoton = input('Buscar');
  /** Sin panel ni título (cabecera, panel administrativo) */
  readonly compacto = input(false);
  /** Oculta la etiqueta visible (queda solo para lectores de pantalla) */
  readonly etiquetaOculta = input(false);
  /** Sugerencias del buscador predictivo (vacío = buscador básico) */
  readonly sugerencias = input<SugerenciaBusqueda[]>([]);
  /** Vacía el campo al abrir una sugerencia (buscador de la cabecera) */
  readonly limpiarAlIr = input(false);

  readonly valor = model('');
  /** Enter o clic en la lupa */
  readonly enviar = output<string>();

  private readonly campo = viewChild<ElementRef<HTMLInputElement>>('campo');
  private readonly uid = ++contador;
  readonly idLista = `sugerencias-${this.uid}`;
  readonly idAyuda = computed(() => `${this.idCampo()}-ayuda`);

  readonly abierta = signal(false);
  readonly activa = signal(-1);
  readonly mostrarLista = computed(() => this.abierta() && !!this.valor().trim() && this.sugerencias().length > 0);

  escribir(texto: string): void {
    this.valor.set(texto);
    this.activa.set(-1);
    this.abierta.set(true);
  }

  limpiar(): void {
    this.valor.set('');
    this.activa.set(-1);
    this.enfocar();
  }

  enfocar(): void {
    this.campo()?.nativeElement.focus();
  }

  alEnviar(ev: Event): void {
    ev.preventDefault();
    const i = this.activa();
    const s = this.sugerencias();
    if (this.mostrarLista() && i >= 0 && s[i]) {
      this.ir(s[i]);
      return;
    }
    // Opción "Ver todos los resultados" o Enter sin opción elegida
    this.abierta.set(false);
    this.enviar.emit(this.valor().trim());
  }

  teclado(ev: KeyboardEvent): void {
    const total = this.sugerencias().length ? this.sugerencias().length + 1 : 0; // + «Ver todos»
    if (ev.key === 'Escape') {
      if (this.mostrarLista()) { this.abierta.set(false); ev.preventDefault(); }
      return;
    }
    if (!total || !this.valor().trim()) return;
    if (ev.key === 'ArrowDown') {
      ev.preventDefault();
      this.abierta.set(true);
      this.activa.set((this.activa() + 1) % total);
    } else if (ev.key === 'ArrowUp') {
      ev.preventDefault();
      this.abierta.set(true);
      this.activa.set(this.activa() <= 0 ? total - 1 : this.activa() - 1);
    }
  }

  /** Cierra las sugerencias cuando el foco sale del buscador */
  salir(ev: FocusEvent, contenedor: HTMLElement): void {
    const destino = ev.relatedTarget as Node | null;
    if (!destino || !contenedor.contains(destino)) this.abierta.set(false);
  }

  ir(s: SugerenciaBusqueda): void {
    this.abierta.set(false);
    this.activa.set(-1);
    if (this.limpiarAlIr()) this.valor.set('');
    if (/^(https?:)?\/\//i.test(s.url)) window.open(s.url, '_blank', 'noopener');
    else this.router.navigateByUrl(s.url);
  }
}
