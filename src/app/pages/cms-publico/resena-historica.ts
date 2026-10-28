import { Component, computed, inject, input, output } from '@angular/core';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia } from '../../shared/models/cms/cms.models';

/** "1990 · Abre sus puertas…", "2004-2005: …", "Hoy — …" */
const PATRON_HITO = /^\s*((?:\d{4})(?:\s*[-–]\s*\d{4})?|hoy)\s*[·:\-–—|]?\s*/i;

export interface Hito {
  entrada: CmsEntrada;
  anio: string;
  titulo: string;
  imagen: CmsMultimedia | null;
}

/**
 * Plantilla "Reseña histórica" (administrable desde el dashboard):
 * - La primera entrada que NO empieza por un año es la introducción:
 *   su imagen destacada es la portada y sus imágenes adjuntas forman la galería.
 * - Las entradas cuyo título empieza por un año ("1990 · …") o por "Hoy"
 *   forman la línea de tiempo; su imagen destacada es la foto del hito.
 *   Si un hito no tiene foto, se muestra un espacio con el año.
 * - Las demás entradas se muestran como texto al final.
 */
@Component({
  selector: 'app-resena-historica',
  templateUrl: './resena-historica.html',
  styleUrl: './resena-historica.css',
})
export class ResenaHistorica {
  private cms = inject(CmsService);

  readonly entradas = input.required<CmsEntrada[]>();
  readonly tituloPagina = input('');
  /** Abre la imagen ampliada (lightbox de la página) */
  readonly ampliar = output<CmsMultimedia>();

  private imagen(id: number | null | undefined): CmsMultimedia | null {
    const m = id ? this.cms.multimediaPorId().get(id) : undefined;
    return m?.tipo === 'imagen' ? m : null;
  }

  private esHito(e: CmsEntrada): boolean {
    return PATRON_HITO.test(e.titulo);
  }

  readonly intro = computed(() => this.entradas().find((e) => !this.esHito(e)) ?? null);
  readonly portada = computed(() => this.imagen(this.intro()?.imagenDestacadaId));

  readonly hitos = computed<Hito[]>(() =>
    this.entradas()
      .filter((e) => this.esHito(e))
      .map((e) => {
        const m = e.titulo.match(PATRON_HITO)!;
        const anio = /hoy/i.test(m[1]) ? 'Hoy' : m[1].replace(/\s+/g, '');
        return { entrada: e, anio, titulo: e.titulo.slice(m[0].length).trim() || e.titulo, imagen: this.imagen(e.imagenDestacadaId) };
      })
      .sort((a, b) => clave(a.anio) - clave(b.anio) || a.entrada.orden - b.entrada.orden),
  );

  /** Imágenes adjuntas a la introducción (sin repetir la portada) */
  readonly galeria = computed(() => {
    const i = this.intro();
    if (!i) return [];
    return i.multimediaIds
      .map((id) => this.imagen(id))
      .filter((m): m is CmsMultimedia => !!m && m.id !== i.imagenDestacadaId);
  });

  readonly otras = computed(() => {
    const i = this.intro();
    return this.entradas().filter((e) => e !== i && !this.esHito(e));
  });

  /** Año de inicio para la cifra "más de N años" */
  readonly desde = computed(() => {
    const anios = this.hitos().map((h) => Number(h.anio.slice(0, 4))).filter((n) => n > 1800);
    return anios.length ? Math.min(...anios) : null;
  });
  readonly anios = computed(() => (this.desde() ? new Date().getFullYear() - this.desde()! : null));
}

function clave(anio: string): number {
  return anio === 'Hoy' ? 99999 : Number(anio.slice(0, 4)) || 0;
}
