import { Component, computed, input, signal } from '@angular/core';
import { CmsEntrada } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';

/**
 * Plantilla "preguntas": preguntas frecuentes en acordeón, con buscador y filtro por tema.
 * Cada entrada: título = pregunta; contenido = respuesta; categoría = tema (opcional).
 */
@Component({
  selector: 'app-preguntas-frecuentes',
  imports: [IconoCms],
  templateUrl: './preguntas-frecuentes.html',
  styleUrl: './preguntas-frecuentes.css',
})
export class PreguntasFrecuentes {
  readonly entradas = input.required<CmsEntrada[]>();

  readonly busqueda = signal('');
  readonly tema = signal('');
  /** Ids de las preguntas abiertas */
  readonly abiertas = signal<Set<number>>(new Set());

  private texto(html: string | null | undefined): string {
    const div = document.createElement('div');
    div.innerHTML = html ?? '';
    return div.textContent ?? '';
  }

  private readonly todas = computed(() =>
    this.entradas().map((e) => ({ entrada: e, tema: e.categoria?.trim() || '', clave: normalizar(`${e.titulo} ${e.categoria ?? ''} ${this.texto(e.contenido)}`) })),
  );

  readonly temas = computed(() => [...new Set(this.todas().map((p) => p.tema).filter(Boolean))]);

  readonly filtradas = computed(() => {
    const palabras = normalizar(this.busqueda()).split(/\s+/).filter(Boolean);
    return this.todas().filter((p) => (!this.tema() || p.tema === this.tema()) && palabras.every((w) => p.clave.includes(w)));
  });

  /** Agrupadas por tema (si no hay búsqueda ni tema elegido) */
  readonly grupos = computed(() => {
    const lista = this.filtradas();
    if (this.tema() || this.busqueda().trim() || this.temas().length < 2) return [{ tema: '', items: lista }];
    return this.temas().map((t) => ({ tema: t, items: lista.filter((p) => p.tema === t) })).filter((g) => g.items.length);
  });

  estaAbierta(id: number): boolean {
    return this.abiertas().has(id) || !!this.busqueda().trim();
  }

  alternar(id: number, ev: Event): void {
    const abierta = (ev.target as HTMLDetailsElement).open;
    const s = new Set(this.abiertas());
    if (abierta) s.add(id); else s.delete(id);
    this.abiertas.set(s);
  }

  readonly todasAbiertas = computed(() => this.filtradas().length > 0 && this.filtradas().every((p) => this.abiertas().has(p.entrada.id)));

  alternarTodas(): void {
    this.abiertas.set(this.todasAbiertas() ? new Set() : new Set(this.filtradas().map((p) => p.entrada.id)));
  }
}
