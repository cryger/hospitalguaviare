import { Component, computed, input, signal } from '@angular/core';
import { CmsEntrada } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';

const LETRAS = 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ'.split('');

/** Letra inicial sin tilde (la Ñ se conserva) */
function inicial(t: string): string {
  const c = t.trim().charAt(0).toUpperCase();
  return c === 'Ñ' ? 'Ñ' : c.normalize('NFD').replace(/[̀-ͯ]/g, '');
}

/**
 * Plantilla "glosario": términos de la A a la Z con buscador.
 * Cada entrada: título = término; resumen (o contenido) = definición.
 */
@Component({
  selector: 'app-glosario',
  imports: [IconoCms],
  templateUrl: './glosario.html',
  styleUrl: './glosario.css',
})
export class Glosario {
  readonly entradas = input.required<CmsEntrada[]>();
  readonly letras = LETRAS;
  readonly busqueda = signal('');

  private texto(e: CmsEntrada): string {
    if (e.resumen?.trim()) return e.resumen.trim();
    const div = document.createElement('div');
    div.innerHTML = e.contenido ?? '';
    return div.textContent?.trim() ?? '';
  }

  private readonly terminos = computed(() =>
    this.entradas()
      .map((e) => ({ id: e.id, termino: e.titulo, definicion: this.texto(e), letra: inicial(e.titulo) }))
      .sort((a, b) => a.termino.localeCompare(b.termino, 'es')),
  );

  readonly total = computed(() => this.terminos().length);

  readonly filtrados = computed(() => {
    const q = normalizar(this.busqueda().trim());
    if (!q) return this.terminos();
    // Orden: el término empieza por la búsqueda › alguna palabra del término empieza por ella ›
    // el término la contiene › solo la definición la menciona
    const puntaje = (t: { termino: string; definicion: string }): number => {
      const n = normalizar(t.termino);
      if (n.startsWith(q)) return 0;
      if (n.split(/\s+/).some((w) => w.startsWith(q))) return 1;
      if (n.includes(q)) return 2;
      return normalizar(t.definicion).includes(q) ? 3 : 9;
    };
    return this.terminos()
      .map((t) => ({ t, p: puntaje(t) }))
      .filter((x) => x.p < 9)
      .sort((a, b) => a.p - b.p)
      .map((x) => x.t);
  });

  readonly grupos = computed(() => {
    const lista = this.filtrados();
    if (this.busqueda().trim()) return [{ letra: '', items: lista }];
    return LETRAS.map((l) => ({ letra: l, items: lista.filter((t) => t.letra === l) })).filter((g) => g.items.length);
  });

  readonly conTerminos = computed(() => new Set(this.terminos().map((t) => t.letra)));

  irA(letra: string): void {
    this.busqueda.set('');
    setTimeout(() => {
      const el = document.getElementById('glosario-' + letra);
      el?.scrollIntoView({ behavior: 'smooth', block: 'start' });
      el?.focus({ preventScroll: true });
    });
  }
}
