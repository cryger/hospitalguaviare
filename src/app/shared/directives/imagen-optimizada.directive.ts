import { Directive, ElementRef, effect, inject, input } from '@angular/core';
import { environment } from '../../../environments/environment';

/**
 * Imágenes optimizadas y en caché.
 *
 * Uso:  <img [appImagen]="url" sizes="(max-width: 576px) 100vw, 400px" alt="…" loading="lazy" />
 *
 * En producción (Vercel) pide la imagen al optimizador `/_vercel/image`, que la redimensiona
 * al ancho que necesita la pantalla, la convierte a WebP y la guarda en la caché del CDN
 * (vercel.json › images). Así las fotos del dominio anterior, que pesan varios MB y tardan
 * varios segundos, llegan en pocos KB desde el servidor más cercano.
 *
 * Si el optimizador no está disponible (desarrollo, otro hosting) la imagen cae sola a su
 * dirección original; nunca queda rota.
 */
const ANCHOS = [256, 384, 640, 828, 1080, 1200, 1920] as const;
const CALIDAD = 75;
/** Orígenes permitidos en vercel.json › images.domains */
const ORIGENES = /^https:\/\/(www\.)?esehospitalguaviare\.gov\.co\//i;

export function urlOptimizada(url: string, ancho: number): string {
  return `${environment.imagenes.optimizador}?url=${encodeURIComponent(url)}&w=${ancho}&q=${CALIDAD}`;
}

/** ¿Se puede optimizar? (fotos JPG/PNG/WebP del portal anterior o de /assets) */
export function esOptimizable(url: string | null | undefined): url is string {
  if (!url || !environment.imagenes.optimizador) return false;
  if (!/\.(jpe?g|png|webp)(\?.*)?$/i.test(url)) return false; // SVG, GIF y data: tal cual
  return ORIGENES.test(url) || /^\/?assets\//.test(url);
}

@Directive({
  selector: 'img[appImagen]',
  host: { '(error)': 'alFallar()', decoding: 'async' },
})
export class ImagenOptimizada {
  private readonly img = inject<ElementRef<HTMLImageElement>>(ElementRef).nativeElement;

  /** Dirección original de la imagen */
  readonly appImagen = input<string | null | undefined>('');
  /** Ancho máximo que tiene sentido pedir (px reales en pantalla × densidad) */
  readonly anchoMaximo = input(1200);

  private original = '';
  private fallo = false;

  constructor() {
    effect(() => {
      const url = this.appImagen() ?? '';
      this.original = url;
      this.fallo = false;
      if (!esOptimizable(url)) {
        this.img.removeAttribute('srcset');
        this.img.src = url;
        return;
      }
      const local = /^\/?assets\//.test(url);
      const fuente = local ? '/' + url.replace(/^\//, '') : url;
      const anchos = ANCHOS.filter((a) => a <= this.anchoMaximo());
      this.img.srcset = anchos.map((a) => `${urlOptimizada(fuente, a)} ${a}w`).join(', ');
      if (!this.img.sizes) this.img.sizes = `(max-width: 576px) 100vw, ${this.anchoMaximo()}px`;
      this.img.src = urlOptimizada(fuente, anchos[anchos.length - 1] ?? 640);
    });
  }

  /** Si el optimizador no responde, se usa la imagen original */
  alFallar(): void {
    if (this.fallo || !this.img.srcset) return;
    this.fallo = true;
    this.img.removeAttribute('srcset');
    this.img.src = this.original;
  }
}
