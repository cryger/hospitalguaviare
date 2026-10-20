import { Component, computed, input } from '@angular/core';
import { CmsMultimedia, ICONOS_MULTIMEDIA } from '../../../../shared/models/cms/cms.models';

/** Miniatura de un archivo multimedia (imagen real o icono según tipo) */
@Component({
  selector: 'app-media-thumb',
  template: `
    @if (media(); as m) {
      @if (m.tipo === 'imagen') {
        <img [src]="m.url" [alt]="m.alt || ''" loading="lazy" />
      } @else if (youtubeId()) {
        <img [src]="'https://img.youtube.com/vi/' + youtubeId() + '/mqdefault.jpg'" alt="" loading="lazy" />
        <span class="play" aria-hidden="true">▶</span>
      } @else {
        <span class="icono" aria-hidden="true">{{ iconos[m.tipo] }}</span>
        <span class="ext">{{ extension() }}</span>
      }
    } @else {
      <span class="icono" aria-hidden="true">🖼️</span>
    }
  `,
  styles: `
    :host {
      position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center;
      width: 100%; aspect-ratio: 4 / 3; background: #f1f5f9; border-radius: 6px; overflow: hidden;
    }
    img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .icono { font-size: 2rem; line-height: 1; }
    .ext { font-size: 0.7rem; font-weight: 700; color: #475569; text-transform: uppercase; margin-top: 0.3rem; }
    .play {
      position: absolute; inset: 0; margin: auto; width: 34px; height: 34px; border-radius: 50%;
      background: rgba(0,0,0,.6); color: #fff; display: grid; place-items: center; font-size: .8rem;
    }
  `,
})
export class MediaThumb {
  readonly media = input<CmsMultimedia | null | undefined>(null);
  readonly iconos = ICONOS_MULTIMEDIA;

  readonly extension = computed(() => {
    const n = this.media()?.nombre || this.media()?.url || '';
    const m = n.match(/\.([a-z0-9]{2,5})(?:\?|$)/i);
    return m ? m[1] : this.media()?.tipo ?? '';
  });

  readonly youtubeId = computed(() => {
    const url = this.media()?.url || '';
    const m = url.match(/(?:youtube\.com\/(?:watch\?v=|embed\/|shorts\/)|youtu\.be\/)([\w-]{11})/);
    return m ? m[1] : null;
  });
}
