import { Injectable, computed, signal } from '@angular/core';

/** Lo mínimo que necesita el visor de un archivo (sirve para CmsMultimedia y para enlaces sueltos) */
export interface DocumentoVisor {
  url: string;
  titulo?: string | null;
  nombre?: string | null;
  mime?: string | null;
  tamano?: number | null;
}

export type ModoVisor = 'pdf' | 'office' | 'odf' | 'imagen' | 'video' | 'audio' | 'texto' | 'ninguno';

const OFFICE = ['doc', 'docx', 'xls', 'xlsx', 'xlsm', 'ppt', 'pptx', 'pps', 'ppsx'];
const ODF = ['odt', 'ods', 'odp', 'rtf'];
const IMAGEN = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg', 'bmp', 'avif'];
const VIDEO = ['mp4', 'webm', 'ogv', 'mov', 'm4v'];
const AUDIO = ['mp3', 'wav', 'ogg', 'm4a', 'aac'];
const TEXTO = ['txt', 'csv', 'json', 'xml', 'md'];

/** "Informe final.PDF?x=1" → "pdf" */
export function extensionDe(d: DocumentoVisor): string {
  const fuente = d.nombre || d.url || '';
  return (fuente.split('?')[0].split('#')[0].match(/\.([a-z0-9]{2,5})$/i)?.[1] ?? '').toLowerCase();
}

/** Cómo se puede mostrar un archivo dentro del portal */
export function modoVisor(d: DocumentoVisor): ModoVisor {
  const ext = extensionDe(d);
  const mime = (d.mime ?? '').toLowerCase();
  if (ext === 'pdf' || mime === 'application/pdf') return 'pdf';
  if (OFFICE.includes(ext) || /msword|ms-excel|ms-powerpoint|officedocument/.test(mime)) return 'office';
  if (ODF.includes(ext) || mime.includes('opendocument')) return 'odf';
  if (IMAGEN.includes(ext) || mime.startsWith('image/')) return 'imagen';
  if (VIDEO.includes(ext) || mime.startsWith('video/')) return 'video';
  if (AUDIO.includes(ext) || mime.startsWith('audio/')) return 'audio';
  if (TEXTO.includes(ext) || mime.startsWith('text/')) return 'texto';
  return 'ninguno';
}

/** ¿El portal puede mostrarlo? (los comprimidos y ejecutables solo se descargan) */
export function sePuedeVer(d: DocumentoVisor): boolean {
  return modoVisor(d) !== 'ninguno';
}

/**
 * Visor de documentos del portal (PDF, Word, Excel, PowerPoint, imágenes, video, texto).
 * Se abre desde cualquier listado: visor.abrir(archivo, listaDelListado)
 * El componente <app-visor-documentos> está en app.html.
 */
@Injectable({ providedIn: 'root' })
export class VisorDocumentos {
  readonly lista = signal<DocumentoVisor[]>([]);
  readonly indice = signal(0);
  readonly abierto = signal(false);
  readonly actual = computed(() => (this.abierto() ? this.lista()[this.indice()] ?? null : null));

  /** Elemento que abrió el visor, para devolverle el foco al cerrar */
  origen: HTMLElement | null = null;

  abrir(doc: DocumentoVisor, lista: DocumentoVisor[] = [doc]): void {
    const visibles = lista.filter(sePuedeVer);
    const i = visibles.findIndex((d) => d.url === doc.url);
    this.origen = document.activeElement as HTMLElement | null;
    this.lista.set(i >= 0 ? visibles : [doc]);
    this.indice.set(Math.max(0, i));
    this.abierto.set(true);
  }

  cerrar(): void {
    this.abierto.set(false);
    const o = this.origen;
    this.origen = null;
    setTimeout(() => o?.focus());
  }

  mover(delta: number): void {
    const n = this.lista().length;
    if (n > 1) this.indice.set((this.indice() + delta + n) % n);
  }
}
