import { Component, computed, inject, input, signal } from '@angular/core';
import { NgTemplateOutlet } from '@angular/common';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';

/**
 * Niveles del organigrama. Cada dependencia es una entrada de la página y su
 * campo "categoría" indica el nivel (se elige en el dashboard al editar la entrada).
 */
export const NIVELES_ORGANIGRAMA = [
  { clave: 'Dirección', ayuda: 'Órgano máximo (ej. Junta Directiva)' },
  { clave: 'Revisoría fiscal', ayuda: 'Al lado de la dirección, con línea punteada' },
  { clave: 'Gerencia', ayuda: 'Debajo de la dirección' },
  { clave: 'Asesoría', ayuda: 'Oficinas asesoras, a la izquierda de la Gerencia' },
  { clave: 'Control', ayuda: 'Oficinas de control, a la derecha de la Gerencia' },
  { clave: 'Subgerencias', ayuda: 'Dependencias que dependen de la Gerencia' },
] as const;

export interface Dependencia {
  entrada: CmsEntrada;
  icono: string;
}

/**
 * Plantilla "organigrama": árbol visual de la estructura orgánica.
 * Al elegir una dependencia se muestra su información debajo.
 * Las entradas con archivos (ej. el PDF oficial) se ofrecen para descargar.
 */
@Component({
  selector: 'app-organigrama',
  imports: [IconoCms, NgTemplateOutlet],
  templateUrl: './organigrama.html',
  styleUrl: './organigrama.css',
})
export class Organigrama {
  private cms = inject(CmsService);

  readonly entradas = input.required<CmsEntrada[]>();

  /** Entradas que son dependencias (tienen nivel) */
  private readonly dependencias = computed(() => this.entradas().filter((e) => this.nivelDe(e)));

  private nivelDe(e: CmsEntrada): string | null {
    const c = normalizar(e.categoria ?? '').trim();
    if (!c) return null;
    return NIVELES_ORGANIGRAMA.find((n) => normalizar(n.clave) === c)?.clave ?? 'Otras dependencias';
  }

  private de(nivel: string): Dependencia[] {
    return this.dependencias()
      .filter((e) => this.nivelDe(e) === nivel)
      .map((e) => ({ entrada: e, icono: e.icono || 'govco:building' }));
  }

  readonly direccion = computed(() => this.de('Dirección'));
  readonly revisoria = computed(() => this.de('Revisoría fiscal'));
  readonly gerencia = computed(() => this.de('Gerencia'));
  readonly asesoria = computed(() => this.de('Asesoría'));
  readonly control = computed(() => this.de('Control'));
  readonly subgerencias = computed(() => this.de('Subgerencias'));
  readonly otras = computed(() => this.de('Otras dependencias'));

  /** Documentos descargables (entradas sin nivel con archivos adjuntos) */
  readonly documentos = computed(() => {
    const mapa = this.cms.multimediaPorId();
    return this.entradas()
      .filter((e) => !this.nivelDe(e))
      .flatMap((e) => e.multimediaIds.map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m).map((m) => ({ entrada: e, archivo: m })));
  });

  /** Textos de entradas sin nivel ni archivos (introducción opcional) */
  readonly textos = computed(() => this.entradas().filter((e) => !this.nivelDe(e) && !e.multimediaIds.length && e.contenido));

  readonly total = computed(() => this.dependencias().length);

  /* ===== Dependencia elegida ===== */
  private readonly elegidaId = signal<number | null>(null);
  readonly elegida = computed(() => {
    const id = this.elegidaId();
    const lista = this.dependencias();
    return lista.find((e) => e.id === id) ?? this.gerencia()[0]?.entrada ?? lista[0] ?? null;
  });

  elegir(e: CmsEntrada): void {
    this.elegidaId.set(e.id);
    // En pantallas pequeñas, se lleva la vista al detalle
    if (window.matchMedia('(max-width: 900px)').matches) {
      setTimeout(() => document.getElementById('org-detalle')?.scrollIntoView({ behavior: 'smooth', block: 'start' }));
    }
  }

  esElegida(e: CmsEntrada): boolean {
    return this.elegida()?.id === e.id;
  }

  nivel(e: CmsEntrada): string {
    return this.nivelDe(e) ?? '';
  }

  extension(m: CmsMultimedia): string {
    return (m.url.split('?')[0].split('.').pop() ?? '').toUpperCase().slice(0, 4);
  }
}
