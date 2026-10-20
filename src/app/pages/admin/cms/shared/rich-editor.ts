import { AfterViewInit, Component, ElementRef, effect, model, signal, viewChild } from '@angular/core';
import { FormsModule } from '@angular/forms';

interface Herramienta {
  cmd: string;
  valor?: string;
  etiqueta: string;
  titulo: string;
}

/**
 * Editor de texto enriquecido liviano (contenteditable), sin dependencias.
 * Uso: <app-rich-editor [(valor)]="entrada.contenido" />
 */
@Component({
  selector: 'app-rich-editor',
  imports: [FormsModule],
  template: `
    <div class="barra" role="toolbar" aria-label="Formato de texto">
      @for (h of herramientas; track h.titulo) {
        <button type="button" class="hb" [title]="h.titulo" [attr.aria-label]="h.titulo"
                [disabled]="modoHtml()" (mousedown)="$event.preventDefault()" (click)="aplicar(h)">
          <span [innerHTML]="h.etiqueta"></span>
        </button>
      }
      <button type="button" class="hb" title="Insertar enlace" aria-label="Insertar enlace"
              [disabled]="modoHtml()" (mousedown)="$event.preventDefault()" (click)="enlace()">🔗</button>
      <span class="sep"></span>
      <button type="button" class="hb html" [class.on]="modoHtml()" (click)="alternarHtml()"
              title="Editar HTML" aria-label="Editar HTML">&lt;/&gt;</button>
    </div>

    @if (modoHtml()) {
      <textarea class="fuente" [ngModel]="valor()" (ngModelChange)="valor.set($event)" spellcheck="false"></textarea>
    }
    <div #area class="area" [hidden]="modoHtml()" contenteditable="true" role="textbox" aria-multiline="true"
         (input)="alEscribir()" (blur)="alEscribir()"></div>
  `,
  styles: `
    :host { display: block; border: 1px solid #d1d5db; border-radius: 6px; background: #fff; overflow: hidden; }
    :host(:focus-within) { border-color: #3366cc; box-shadow: 0 0 0 3px rgba(51,102,204,.18); }
    .barra { display: flex; flex-wrap: wrap; gap: 2px; padding: 4px; border-bottom: 1px solid #e5e7eb; background: #f8fafc; }
    .hb {
      min-width: 32px; height: 30px; border: 1px solid transparent; background: none; border-radius: 4px;
      cursor: pointer; font-size: .82rem; color: #1f2937; font-family: inherit;
    }
    .hb:hover:not(:disabled) { background: #e8f0fb; border-color: #bfd3f2; }
    .hb:disabled { opacity: .35; cursor: default; }
    .hb.on { background: #004884; color: #fff; }
    .html { font-family: ui-monospace, Consolas, monospace; }
    .sep { flex: 1; }
    .area { min-height: 260px; max-height: 60vh; overflow: auto; padding: .85rem 1rem; outline: none; font-size: .92rem; line-height: 1.6; }
    .area:empty::before { content: 'Escriba el contenido aquí…'; color: #9ca3af; }
    .area ::ng-deep h2 { font-size: 1.3rem; color: #004884; margin: .8rem 0 .4rem; }
    .area ::ng-deep h3 { font-size: 1.1rem; margin: .7rem 0 .3rem; }
    .area ::ng-deep a { color: #3366cc; }
    .fuente {
      width: 100%; box-sizing: border-box; min-height: 260px; border: none; padding: .85rem 1rem;
      font-family: ui-monospace, Consolas, monospace; font-size: .8rem; resize: vertical; outline: none;
    }
  `,
})
export class RichEditor implements AfterViewInit {
  readonly valor = model<string>('');
  readonly modoHtml = signal(false);
  private area = viewChild.required<ElementRef<HTMLDivElement>>('area');

  readonly herramientas: Herramienta[] = [
    { cmd: 'formatBlock', valor: 'P', etiqueta: '¶', titulo: 'Párrafo' },
    { cmd: 'formatBlock', valor: 'H2', etiqueta: '<b>H2</b>', titulo: 'Título' },
    { cmd: 'formatBlock', valor: 'H3', etiqueta: '<b>H3</b>', titulo: 'Subtítulo' },
    { cmd: 'bold', etiqueta: '<b>B</b>', titulo: 'Negrita' },
    { cmd: 'italic', etiqueta: '<i>I</i>', titulo: 'Cursiva' },
    { cmd: 'underline', etiqueta: '<u>U</u>', titulo: 'Subrayado' },
    { cmd: 'insertUnorderedList', etiqueta: '• ―', titulo: 'Lista con viñetas' },
    { cmd: 'insertOrderedList', etiqueta: '1. ―', titulo: 'Lista numerada' },
    { cmd: 'formatBlock', valor: 'BLOCKQUOTE', etiqueta: '❝', titulo: 'Cita' },
    { cmd: 'unlink', etiqueta: '<s>🔗</s>', titulo: 'Quitar enlace' },
    { cmd: 'removeFormat', etiqueta: '⌫', titulo: 'Limpiar formato' },
  ];

  constructor() {
    // Sincroniza cambios externos (ej. cargar entrada) sin mover el cursor al escribir
    effect(() => {
      const html = this.valor() || '';
      const el = this.area()?.nativeElement;
      if (el && el.innerHTML !== html && document.activeElement !== el) {
        el.innerHTML = html;
      }
    });
  }

  ngAfterViewInit(): void {
    this.area().nativeElement.innerHTML = this.valor() || '';
    // Los saltos de línea generan <p> en lugar de <div>
    document.execCommand('defaultParagraphSeparator', false, 'p');
  }

  alEscribir(): void {
    const el = this.area().nativeElement;
    // Envuelve el texto suelto inicial en un párrafo
    if (el.firstChild && el.firstChild.nodeType === Node.TEXT_NODE && el.childNodes.length && !this.modoHtml()) {
      const sel = window.getSelection();
      const offset = sel?.anchorNode === el.firstChild ? sel.anchorOffset : null;
      const p = document.createElement('p');
      el.insertBefore(p, el.firstChild);
      while (p.nextSibling && (p.nextSibling.nodeType === Node.TEXT_NODE || ['B', 'I', 'U', 'A', 'STRONG', 'EM', 'SPAN'].includes((p.nextSibling as HTMLElement).tagName))) {
        p.appendChild(p.nextSibling);
      }
      if (offset !== null && p.firstChild && sel) {
        const r = document.createRange();
        r.setStart(p.firstChild, Math.min(offset, p.firstChild.textContent?.length ?? 0));
        r.collapse(true);
        sel.removeAllRanges();
        sel.addRange(r);
      }
    }
    const html = this.area().nativeElement.innerHTML;
    this.valor.set(html === '<br>' ? '' : html);
  }

  aplicar(h: Herramienta): void {
    this.area().nativeElement.focus();
    document.execCommand(h.cmd, false, h.valor);
    this.alEscribir();
  }

  enlace(): void {
    const url = prompt('Dirección del enlace (https://…)');
    if (!url) return;
    this.area().nativeElement.focus();
    document.execCommand('createLink', false, url);
    this.alEscribir();
  }

  alternarHtml(): void {
    if (this.modoHtml()) {
      this.area().nativeElement.innerHTML = this.valor() || '';
    }
    this.modoHtml.update((v) => !v);
  }
}
