import { Injectable, signal } from '@angular/core';
import { normalizar } from '../../utils/busqueda';

export interface VideoSena {
  titulo: string;
  /** MP4 (H.264): compatible con todos los navegadores */
  video: string;
  /** WebM (VP9) opcional: más liviano y para navegadores sin H.264 */
  webm?: string;
  poster?: string;
}

interface Mostrar {
  sena: VideoSena;
  /** Rectángulo del enlace que lo activó (para ubicar el recuadro) */
  rect: DOMRect;
  /** Elemento que lo activó (para devolverle el control al cerrar) */
  origen: HTMLElement;
}

const CLAVE_PREFERENCIA = 'lsc-activo';
const RUTA_CATALOGO = 'assets/senas/senas.json';

/**
 * Lengua de Señas Colombiana (LSC) en los enlaces del portal.
 * - El catálogo de videos está en public/assets/senas/senas.json (clave = texto del enlace normalizado).
 * - El ciudadano puede activar o desactivar los videos desde la barra de accesibilidad;
 *   la preferencia se recuerda en el navegador.
 */
@Injectable({ providedIn: 'root' })
export class LenguaSenasService {
  readonly activo = signal(this.leerPreferencia());
  readonly actual = signal<Mostrar | null>(null);

  private catalogo = new Map<string, VideoSena>();
  private cargado: Promise<void> | null = null;

  cargar(): Promise<void> {
    this.cargado ??= fetch(RUTA_CATALOGO)
      .then((r) => (r.ok ? r.json() : { videos: {} }))
      .then((d: { videos?: Record<string, VideoSena> }) => {
        for (const [clave, v] of Object.entries(d.videos ?? {})) this.catalogo.set(normalizar(clave), v);
      })
      .catch(() => undefined);
    return this.cargado;
  }

  /** Video para un texto o clave (null si no hay) */
  buscar(texto: string): VideoSena | null {
    return this.catalogo.get(normalizar(texto)) ?? null;
  }

  mostrar(sena: VideoSena, origen: HTMLElement): void {
    if (!this.activo()) return;
    this.actual.set({ sena, rect: origen.getBoundingClientRect(), origen });
  }

  ocultar(): void {
    this.actual.set(null);
  }

  alternar(): void {
    const v = !this.activo();
    this.activo.set(v);
    if (!v) this.ocultar();
    try {
      localStorage.setItem(CLAVE_PREFERENCIA, v ? '1' : '0');
    } catch {
      /* sin almacenamiento: solo dura esta visita */
    }
  }

  private leerPreferencia(): boolean {
    try {
      return localStorage.getItem(CLAVE_PREFERENCIA) !== '0';
    } catch {
      return true;
    }
  }
}
