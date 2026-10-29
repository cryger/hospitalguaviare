import { Component, ElementRef, HostListener, computed, effect, inject, signal, viewChild } from '@angular/core';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { VisorDocumentos, extensionDe, modoVisor } from './visor-documentos.service';

/** Servidores que no se pueden publicar a los visores en línea (Office/Google) */
function esUrlPublica(url: URL): boolean {
  if (!/^https?:$/.test(url.protocol)) return false;
  const h = url.hostname;
  return !(h === 'localhost' || h === '::1' || h.endsWith('.local') || h.endsWith('.localhost') || /^(127|10|192\.168)\./.test(h) || /^172\.(1[6-9]|2\d|3[01])\./.test(h));
}

/**
 * Visor de documentos (ventana sobre la página):
 * - PDF: visor del navegador (en celulares, visor de Google, porque muchos no muestran PDF incrustado)
 * - Word, Excel, PowerPoint: visor de Microsoft Office en línea
 * - OpenDocument (odt, ods, odp) y RTF: visor de Google
 * - Imágenes, video, audio y texto: directamente en el navegador
 * Los visores en línea necesitan que el archivo esté publicado en internet.
 */
@Component({
  selector: 'app-visor-documentos',
  templateUrl: './visor-documentos.html',
  styleUrl: './visor-documentos.css',
})
export class VisorDocumentosComponent {
  readonly visor = inject(VisorDocumentos);
  private sanitizer = inject(DomSanitizer);

  private readonly cerrarBtn = viewChild<ElementRef<HTMLButtonElement>>('cerrarBtn');

  readonly cargando = signal(true);
  readonly tarda = signal(false);
  readonly texto = signal<string | null>(null);
  readonly errorTexto = signal(false);
  private temporizador: ReturnType<typeof setTimeout> | null = null;

  readonly doc = this.visor.actual;
  readonly titulo = computed(() => {
    const d = this.doc();
    return d ? d.titulo || d.nombre || 'Documento' : '';
  });
  readonly ext = computed(() => (this.doc() ? extensionDe(this.doc()!).toUpperCase() || 'DOC' : ''));
  readonly modo = computed(() => (this.doc() ? modoVisor(this.doc()!) : 'ninguno'));

  /** URL absoluta del archivo (las subidas al portal pueden venir como /uploads/…) */
  readonly absoluta = computed(() => {
    const d = this.doc();
    if (!d) return null;
    try {
      return new URL(d.url, location.origin);
    } catch {
      return null;
    }
  });
  readonly publica = computed(() => !!this.absoluta() && esUrlPublica(this.absoluta()!));
  private readonly movil = typeof matchMedia !== 'undefined' && matchMedia('(max-width: 768px), (pointer: coarse)').matches;

  /** Dirección que se carga en el iframe (null = no se puede mostrar incrustado) */
  readonly fuente = computed<SafeResourceUrl | null>(() => {
    const u = this.absoluta();
    if (!u) return null;
    const enc = encodeURIComponent(u.href);
    let src: string | null = null;
    switch (this.modo()) {
      case 'pdf':
        src = this.movil && this.publica() ? `https://docs.google.com/gview?embedded=true&url=${enc}` : `${u.href}#view=FitH`;
        break;
      case 'office':
        src = this.publica() ? `https://view.officeapps.live.com/op/embed.aspx?src=${enc}` : null;
        break;
      case 'odf':
        src = this.publica() ? `https://docs.google.com/gview?embedded=true&url=${enc}` : null;
        break;
    }
    return src ? this.sanitizer.bypassSecurityTrustResourceUrl(src) : null;
  });

  readonly sinVistaPrevia = computed(() => {
    const m = this.modo();
    return m === 'ninguno' || ((m === 'office' || m === 'odf') && !this.publica());
  });

  readonly nombreVisor = computed(() => {
    switch (this.modo()) {
      case 'office': return 'Vista previa con Microsoft Office en línea';
      case 'odf': return 'Vista previa con el visor de Google';
      case 'pdf': return this.movil && this.publica() ? 'Vista previa con el visor de Google' : '';
      default: return '';
    }
  });

  constructor() {
    // Cada vez que cambia el documento: reinicia la carga, bloquea el scroll y enfoca "Cerrar"
    effect(() => {
      const d = this.doc();
      this.limpiarTemporizador();
      this.cargando.set(true);
      this.tarda.set(false);
      this.texto.set(null);
      this.errorTexto.set(false);
      document.body.style.overflow = d ? 'hidden' : '';
      if (!d) return;
      setTimeout(() => this.cerrarBtn()?.nativeElement.focus());
      if (this.modo() === 'texto') this.leerTexto(this.absoluta()!.href);
      this.temporizador = setTimeout(() => this.tarda.set(true), 12000);
    });
  }

  private limpiarTemporizador(): void {
    if (this.temporizador) clearTimeout(this.temporizador);
    this.temporizador = null;
  }

  alCargar(): void {
    this.cargando.set(false);
    this.limpiarTemporizador();
  }

  private async leerTexto(url: string): Promise<void> {
    try {
      const r = await fetch(url);
      if (!r.ok) throw new Error();
      const t = await r.text();
      this.texto.set(t.length > 300_000 ? t.slice(0, 300_000) + '\n…' : t);
    } catch {
      this.errorTexto.set(true);
    }
    this.alCargar();
  }

  @HostListener('document:keydown', ['$event'])
  teclas(ev: KeyboardEvent): void {
    if (!this.visor.abierto()) return;
    if (ev.key === 'Escape') {
      ev.preventDefault();
      this.visor.cerrar();
    } else if (ev.key === 'ArrowRight' && this.visor.lista().length > 1 && !(ev.target as HTMLElement)?.closest?.('input, textarea')) {
      this.visor.mover(1);
    } else if (ev.key === 'ArrowLeft' && this.visor.lista().length > 1 && !(ev.target as HTMLElement)?.closest?.('input, textarea')) {
      this.visor.mover(-1);
    } else if (ev.key === 'Tab') {
      this.atraparFoco(ev);
    }
  }

  /** Mantiene el foco del teclado dentro de la ventana */
  private atraparFoco(ev: KeyboardEvent): void {
    const caja = document.querySelector<HTMLElement>('.visor-caja');
    if (!caja) return;
    const enfocables = Array.from(caja.querySelectorAll<HTMLElement>('a[href], button:not([disabled]), iframe, video, audio, [tabindex]:not([tabindex="-1"])'));
    if (!enfocables.length) return;
    const primero = enfocables[0], ultimo = enfocables[enfocables.length - 1];
    if (ev.shiftKey && document.activeElement === primero) {
      ev.preventDefault();
      ultimo.focus();
    } else if (!ev.shiftKey && document.activeElement === ultimo) {
      ev.preventDefault();
      primero.focus();
    }
  }

  tamano(b?: number | null): string {
    if (!b) return '';
    return b >= 1048576 ? (b / 1048576).toFixed(1).replace('.', ',') + ' MB' : Math.max(1, Math.round(b / 1024)) + ' KB';
  }
}
