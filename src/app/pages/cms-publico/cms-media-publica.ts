import { Component, computed, inject, input } from '@angular/core';
import { DomSanitizer, SafeResourceUrl } from '@angular/platform-browser';
import { CmsMultimedia, ICONOS_MULTIMEDIA } from '../../shared/models/cms/cms.models';

/** Muestra un archivo multimedia en el sitio público según su tipo */
@Component({
  selector: 'app-cms-media-publica',
  template: `
    @if (media(); as m) {
      @switch (m.tipo) {
        @case ('imagen') {
          <figure class="figura">
            <img [src]="m.url" [alt]="m.alt || m.titulo || ''" loading="lazy" />
            @if (m.descripcion) { <figcaption>{{ m.descripcion }}</figcaption> }
          </figure>
        }
        @case ('video') {
          <figure class="figura">
            @if (youtube(); as yt) {
              <div class="video">
                <iframe [src]="yt" [title]="m.titulo || 'Video'" loading="lazy"
                        allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </div>
            } @else {
              <video [src]="m.url" controls preload="metadata"></video>
            }
            @if (m.titulo || m.descripcion) { <figcaption>{{ m.descripcion || m.titulo }}</figcaption> }
          </figure>
        }
        @case ('audio') {
          <figure class="figura">
            <audio [src]="m.url" controls preload="metadata"></audio>
            @if (m.titulo) { <figcaption>{{ m.titulo }}</figcaption> }
          </figure>
        }
        @default {
          <a class="archivo" [href]="m.url" target="_blank" rel="noopener" [attr.download]="esLocal() ? m.nombre : null">
            <span class="archivo-icono" aria-hidden="true">{{ iconos[m.tipo] }}</span>
            <span class="archivo-info">
              <strong>{{ m.titulo || m.nombre }}</strong>
              <small>{{ extension() }}{{ peso() ? ' · ' + peso() : '' }}</small>
            </span>
            <span class="archivo-accion">Descargar</span>
          </a>
        }
      }
    }
  `,
  styles: `
    :host { display: block; }
    .figura { margin: 0; }
    .figura img, .figura video { width: 100%; height: auto; border-radius: 8px; display: block; }
    .figura audio { width: 100%; }
    figcaption { font-size: .85rem; color: #4b5563; margin-top: .4rem; }
    .video { position: relative; padding-top: 56.25%; border-radius: 8px; overflow: hidden; background: #000; }
    .video iframe { position: absolute; inset: 0; width: 100%; height: 100%; border: 0; }
    .archivo {
      display: flex; align-items: center; gap: .85rem; padding: .8rem 1rem; border: 1px solid #d0d7de;
      border-radius: 8px; text-decoration: none; color: #004884; background: #fff; transition: background .15s, border-color .15s;
    }
    .archivo:hover { background: #e8f0fb; border-color: #3366cc; }
    .archivo:focus-visible { outline: 3px solid #ffab00; outline-offset: 2px; }
    .archivo-icono { font-size: 1.6rem; }
    .archivo-info { flex: 1; min-width: 0; display: flex; flex-direction: column; }
    .archivo-info strong { font-size: .95rem; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
    .archivo-info small { font-size: .78rem; color: #4b5563; text-transform: uppercase; }
    .archivo-accion { font-size: .85rem; font-weight: 600; text-decoration: underline; white-space: nowrap; }
  `,
})
export class CmsMediaPublica {
  private sanitizer = inject(DomSanitizer);
  readonly media = input<CmsMultimedia | null | undefined>(null);
  readonly iconos = ICONOS_MULTIMEDIA;

  readonly esLocal = computed(() => !!this.media()?.url.startsWith('data:'));

  /** Solo se confía en URLs de YouTube con un id válido */
  readonly youtube = computed<SafeResourceUrl | null>(() => {
    const url = this.media()?.url || '';
    const m = url.match(/(?:youtube\.com\/(?:watch\?v=|embed\/|shorts\/)|youtu\.be\/)([\w-]{11})/);
    return m ? this.sanitizer.bypassSecurityTrustResourceUrl(`https://www.youtube-nocookie.com/embed/${m[1]}`) : null;
  });

  readonly extension = computed(() => {
    const n = this.media()?.nombre || this.media()?.url || '';
    const m = n.match(/\.([a-z0-9]{2,5})(?:\?|$)/i);
    return m ? m[1] : 'archivo';
  });

  readonly peso = computed(() => {
    const b = this.media()?.tamano;
    if (!b) return '';
    if (b < 1024 ** 2) return `${Math.max(1, Math.round(b / 1024))} KB`;
    return `${(b / 1024 ** 2).toFixed(1)} MB`;
  });
}
