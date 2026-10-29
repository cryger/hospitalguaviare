import { Component, computed, inject, input } from '@angular/core';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada, CmsMultimedia } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { VisorDocumentos } from '../../shared/components/visor-documentos/visor-documentos.service';

/** Secciones de la plataforma estratégica (campo «Sección» de la entrada en el dashboard) */
export const SECCIONES_PLATAFORMA = [
  { clave: 'Misión', ayuda: 'Párrafo = declaración. Lista (viñetas) opcional = ejes que se muestran como etiquetas.' },
  { clave: 'Visión', ayuda: 'Párrafo = declaración (el año, ej. 2031, se resalta como meta). Lista opcional = «Así seremos».' },
  { clave: 'Valores', ayuda: 'Lista con «Nombre: descripción» por viñeta, o una entrada por valor (título = nombre).' },
  { clave: 'Principios', ayuda: 'Igual que Valores: lista «Nombre: descripción» o una entrada por principio.' },
  { clave: 'Objetivos', ayuda: 'Lista numerada de objetivos estratégicos o institucionales.' },
  { clave: 'Funciones', ayuda: 'Lista de funciones de la entidad (Res. 1519 · 1.1).' },
  { clave: 'Deberes', ayuda: 'Lista de deberes de la entidad (Res. 1519 · 1.1).' },
] as const;
export type SeccionPlataforma = (typeof SECCIONES_PLATAFORMA)[number]['clave'];

export interface Item {
  nombre: string;
  descripcion: string;
  icono: string;
}

interface Declaracion {
  entrada: CmsEntrada;
  texto: string;
  ejes: string[];
  icono: string;
}

/** Ícono sugerido para cada valor o principio según su nombre */
const ICONOS_VALORES: [RegExp, string][] = [
  [/honest|transparen|integridad|probidad/, 'govco:handshake'],
  [/compromiso|lealtad/, 'govco:hand-holding-heart'],
  [/respeto|dignidad/, 'govco:user-check'],
  [/justicia|equidad|imparcial|igualdad/, 'govco:balance-scale'],
  [/diligencia|eficien|responsab/, 'govco:check-circle'],
  [/confidencial|reserva|seguridad/, 'govco:lock'],
  [/puntual/, 'govco:stopwatch'],
  [/equipo|colabora|solidari/, 'govco:users'],
  [/innova|creativ/, 'govco:lightbulb'],
  [/humaniza|calidez|amor|vocacion/, 'govco:heart'],
  [/calidad|excelencia/, 'govco:award'],
  [/ambient|sostenib/, 'govco:leaf'],
  [/servicio|atencion/, 'govco:hand-holding-medical'],
];

/**
 * Plantilla "plataforma": misión y visión destacadas, valores en tarjetas con ícono,
 * y objetivos, funciones y deberes en listas numeradas. Todo se administra en Entradas;
 * el campo «Sección» (o, si está vacío, el título) indica qué es cada entrada.
 */
@Component({
  selector: 'app-plataforma-estrategica',
  imports: [IconoCms],
  templateUrl: './plataforma-estrategica.html',
  styleUrl: './plataforma-estrategica.css',
})
export class PlataformaEstrategica {
  private cms = inject(CmsService);
  private visor = inject(VisorDocumentos);

  readonly entradas = input.required<CmsEntrada[]>();

  private seccionDe(e: CmsEntrada): SeccionPlataforma | null {
    const t = normalizar(e.categoria?.trim() || e.titulo);
    if (/^mision/.test(t)) return 'Misión';
    if (/^vision/.test(t)) return 'Visión';
    if (/^valor/.test(t)) return 'Valores';
    if (/^principio/.test(t)) return 'Principios';
    if (/^objetivo/.test(t)) return 'Objetivos';
    if (/^funcion/.test(t)) return 'Funciones';
    if (/^deber/.test(t)) return 'Deberes';
    return null;
  }

  private de(s: SeccionPlataforma): CmsEntrada[] {
    return this.entradas().filter((e) => this.seccionDe(e) === s);
  }

  readonly mision = computed(() => this.declaracion(this.de('Misión')[0], 'govco:bullseye'));
  readonly vision = computed(() => this.declaracion(this.de('Visión')[0], 'govco:eye'));

  /** Año meta de la visión (ej. «En el 2031, seremos…») y cuánto falta */
  readonly meta = computed(() => {
    const v = this.vision();
    const anio = Number(v?.texto.match(/\b(20\d{2})\b/)?.[1] ?? 0);
    if (!anio) return null;
    const faltan = anio - new Date().getFullYear();
    return { anio, texto: faltan > 1 ? `Faltan ${faltan} años` : faltan === 1 ? 'Falta 1 año' : faltan === 0 ? 'Este año' : 'Meta cumplida' };
  });

  readonly valores = computed(() => this.items(this.de('Valores')));
  readonly principios = computed(() => this.items(this.de('Principios')));

  /** Objetivos, funciones y deberes: listas numeradas */
  readonly listas = computed(() =>
    (['Objetivos', 'Funciones', 'Deberes'] as const)
      .map((s) => {
        const es = this.de(s);
        return { seccion: s, titulo: es[0]?.titulo ?? s, icono: es[0]?.icono || this.iconoLista(s), items: es.flatMap((e) => this.lineas(e)) };
      })
      .filter((l) => l.items.length),
  );

  /** Entradas que no son de ninguna sección: texto adicional al final */
  readonly otras = computed(() => this.entradas().filter((e) => !this.seccionDe(e) && e.contenido));

  /** Archivos adjuntos en cualquier entrada (ej. acto administrativo que adopta la plataforma) */
  readonly documentos = computed(() => {
    const mapa = this.cms.multimediaPorId();
    return this.entradas().flatMap((e) =>
      e.multimediaIds
        .map((id) => mapa.get(id))
        .filter((m): m is CmsMultimedia => !!m && m.tipo === 'documento')
        .map((m) => ({ entrada: e, archivo: m })),
    );
  });

  /* ===== Lectura del contenido ===== */

  private html(e: CmsEntrada): HTMLDivElement {
    const div = document.createElement('div');
    div.innerHTML = e.contenido ?? '';
    return div;
  }

  private texto(n: Element | null | undefined): string {
    return n?.textContent?.replace(/\s+/g, ' ').trim() ?? '';
  }

  private declaracion(e: CmsEntrada | undefined, icono: string): Declaracion | null {
    if (!e) return null;
    const div = this.html(e);
    const parrafos = Array.from(div.querySelectorAll('p')).map((p) => this.texto(p)).filter(Boolean);
    const ejes = Array.from(div.querySelectorAll('li')).map((li) => this.texto(li)).filter(Boolean);
    return { entrada: e, texto: parrafos.join(' ') || e.resumen || this.texto(div), ejes, icono: e.icono || icono };
  }

  /** «Nombre: descripción» por viñeta, o una entrada por ítem (título = nombre) */
  private items(es: CmsEntrada[]): Item[] {
    return es.flatMap((e) => {
      const lis = Array.from(this.html(e).querySelectorAll('li'));
      if (!lis.length) {
        return [{ nombre: e.titulo, descripcion: e.resumen || this.texto(this.html(e)), icono: e.icono || this.iconoValor(e.titulo) }];
      }
      return lis.map((li) => {
        const fuerte = this.texto(li.querySelector('strong, b')).replace(/[:.]\s*$/, '');
        const todo = this.texto(li);
        const m = fuerte ? null : todo.match(/^([^:]{2,40}):\s*(.+)$/);
        const nombre = fuerte || m?.[1] || todo;
        const descripcion = fuerte ? todo.slice(todo.indexOf(fuerte) + fuerte.length).replace(/^\s*[:.\-–]\s*/, '') : m?.[2] ?? '';
        return { nombre, descripcion, icono: this.iconoValor(nombre) };
      });
    });
  }

  private lineas(e: CmsEntrada): string[] {
    const div = this.html(e);
    const lis = Array.from(div.querySelectorAll('li')).map((li) => this.texto(li)).filter(Boolean);
    return lis.length ? lis : Array.from(div.querySelectorAll('p')).map((p) => this.texto(p)).filter(Boolean);
  }

  private iconoValor(nombre: string): string {
    const t = normalizar(nombre);
    return ICONOS_VALORES.find(([r]) => r.test(t))?.[1] ?? 'govco:star';
  }

  private iconoLista(s: string): string {
    return s === 'Objetivos' ? 'govco:flag-checkered' : s === 'Funciones' ? 'govco:clipboard-list' : 'govco:gavel';
  }

  ver(m: CmsMultimedia): void {
    this.visor.abrir(m, this.documentos().map((d) => d.archivo));
  }

  extension(m: CmsMultimedia): string {
    return (m.url.split('?')[0].split('.').pop() ?? '').toUpperCase().slice(0, 4);
  }
}
