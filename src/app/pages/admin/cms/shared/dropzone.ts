import { Component, input, output, signal } from '@angular/core';

/** Zona para arrastrar o seleccionar archivos */
@Component({
  selector: 'app-dropzone',
  template: `
    <label class="zona" [class.encima]="encima()"
           (dragover)="$event.preventDefault(); encima.set(true)"
           (dragleave)="encima.set(false)"
           (drop)="soltar($event)">
      <input type="file" [attr.accept]="accept()" multiple (change)="elegir($event)" />
      <span class="icono" aria-hidden="true">⬆️</span>
      <strong>Arrastre archivos aquí o haga clic para seleccionarlos</strong>
      <small>{{ ayuda() }}</small>
    </label>
  `,
  styles: `
    .zona {
      display: flex; flex-direction: column; align-items: center; gap: .3rem; text-align: center;
      padding: 1.6rem 1rem; border: 2px dashed #cbd5e1; border-radius: 10px; cursor: pointer;
      background: #f8fafc; transition: border-color .15s, background .15s;
    }
    .zona:hover, .zona.encima { border-color: #3366cc; background: #e8f0fb; }
    .zona:focus-within { outline: 3px solid #ffab00; outline-offset: 2px; }
    input { position: absolute; width: 1px; height: 1px; opacity: 0; }
    .icono { font-size: 1.6rem; }
    strong { font-size: .9rem; color: #1f2937; }
    small { font-size: .76rem; color: #6b7280; }
  `,
})
export class Dropzone {
  readonly accept = input<string | null>(null);
  readonly ayuda = input('Imágenes, videos, PDF, Word, Excel…');
  readonly archivos = output<File[]>();
  readonly encima = signal(false);

  soltar(e: DragEvent): void {
    e.preventDefault();
    this.encima.set(false);
    const files = Array.from(e.dataTransfer?.files || []);
    if (files.length) this.archivos.emit(files);
  }

  elegir(e: Event): void {
    const el = e.target as HTMLInputElement;
    const files = Array.from(el.files || []);
    if (files.length) this.archivos.emit(files);
    el.value = '';
  }
}
