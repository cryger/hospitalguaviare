import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsEntrada, CmsMultimedia, CmsPagina } from '../../shared/models/cms/cms.models';
import { CmsService } from '../../shared/services/cms/cms.service';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { CmsMediaPublica } from './cms-media-publica';

/**
 * Plantilla «esquema»: Esquema de publicación de la información (Res. 1519 de 2020).
 *
 * El contenido se escribe como una entrada normal en el editor y esta plantilla lo dibuja
 * con la estructura del portal anterior:
 *  - Párrafos antes del primer subtítulo → tarjeta «Presentación».
 *  - Cada subtítulo (H3) → sección numerada (01, 02…). Un párrafo en cursiva justo debajo
 *    es su descripción corta.
 *  - Viñetas «**Nombre:** descripción» → tarjetas con ícono (objetivos, formatos,
 *    periodicidad o responsables, según el subtítulo).
 *  - Viñetas «[Enlace](url): descripción» → tarjetas de categorías numeradas que enlazan.
 *  - Tabla → tabla del esquema; si la primera columna tiene enlace, se agrega «Consultar».
 *  - Subtítulo que empieza con «¿» y tiene un párrafo que es solo un enlace → llamado a la
 *    acción (botón); un enlace mailto: se muestra como tarjeta de contacto.
 * Las demás entradas de la página (ej. conjuntos de datos) se listan al final con sus archivos.
 */

interface Segmento { texto: string; url?: string; externo?: boolean }
interface Item { nombre: string; texto: string; icono: string; url?: string; externo?: boolean }
type Variante = 'objetivos' | 'formatos' | 'periodicidad' | 'responsables' | 'tarjetas';
type Bloque =
  | { tipo: 'texto'; parrafos: Segmento[][] }
  | { tipo: 'tarjetas'; variante: Variante; items: Item[] }
  | { tipo: 'enlaces'; items: Item[] }
  | { tipo: 'tabla'; encabezados: string[]; filas: { celdas: string[]; url?: string; externo?: boolean }[] }
  | { tipo: 'lista'; items: Segmento[][] };
interface Seccion { titulo: string; subtitulo: string; bloques: Bloque[] }
interface Llamado { titulo: string; parrafos: string[]; boton?: { texto: string; url: string; externo: boolean }; correo?: string }

const sinTildes = (t: string) => t.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
const esExterna = (u: string) => /^(https?:)?\/\//i.test(u) || u.startsWith('mailto:') || u.startsWith('tel:');

/** Ícono GOV.CO según el nombre de la tarjeta (mismos íconos del portal anterior) */
const REGLAS_ICONO: [RegExp, string][] = [
  [/oficina de planeacion/, 'sitemap'],
  [/transparencia activa/, 'landmark'],
  [/transparencia/, 'eye'],
  [/accesibilidad/, 'search'],
  [/participaci/, 'users'],
  [/rendicion/, 'chart-line'],
  [/institucional/, 'building'],
  [/planeacion|planes/, 'compass'],
  [/financier/, 'file-invoice-dollar'],
  [/presupuesto/, 'coins'],
  [/contrataci|contractual/, 'file-signature'],
  [/talento/, 'user-tie'],
  [/tramite|servicio/, 'hand-holding-medical'],
  [/atencion|pqrs/, 'headset'],
  [/control/, 'shield-alt'],
  [/documental|archiv/, 'archive'],
  [/datos/, 'database'],
  [/gobierno digital|tic\b/, 'laptop-code'],
  [/etnic/, 'globe-americas'],
  [/^html/, 'globe'],
  [/^pdf/, 'file-pdf'],
  [/^xlsx|excel/, 'file-excel'],
  [/^csv/, 'file-csv'],
  [/permanente/, 'sync-alt'],
  [/mensual/, 'calendar-alt'],
  [/trimestral/, 'calendar-check'],
  [/anual/, 'calendar'],
  [/modifique|modificacion/, 'history'],
];
const iconoDe = (nombre: string) => 'govco:' + (REGLAS_ICONO.find(([r]) => r.test(sinTildes(nombre)))?.[1] ?? 'file-alt');

function segmentos(el: Element): Segmento[] {
  const out: Segmento[] = [];
  el.childNodes.forEach((n) => {
    if (n instanceof HTMLAnchorElement) {
      const url = n.getAttribute('href') ?? '';
      out.push({ texto: n.textContent ?? '', url, externo: esExterna(url) });
    } else out.push({ texto: n.textContent ?? '' });
  });
  return out.filter((s) => s.texto.trim());
}

/** «Nombre: descripción» o «[Enlace](url): descripción» de una viñeta */
function leerItem(li: Element): Item | null {
  const fuerte = li.querySelector(':scope > strong, :scope > b');
  const enlace = li.querySelector(':scope > a');
  const cabeza = enlace ?? fuerte;
  if (!cabeza) return null;
  const nombre = (cabeza.textContent ?? '').replace(/:\s*$/, '').trim();
  const texto = (li.textContent ?? '').replace(cabeza.textContent ?? '', '').replace(/^\s*[:–—-]\s*/, '').trim();
  const url = enlace?.getAttribute('href') ?? undefined;
  return { nombre, texto, icono: iconoDe(nombre), url, externo: url ? esExterna(url) : undefined };
}

function variante(titulo: string): Variante {
  const t = sinTildes(titulo);
  if (/objetivo/.test(t)) return 'objetivos';
  if (/formato/.test(t)) return 'formatos';
  if (/periodicidad/.test(t)) return 'periodicidad';
  if (/responsable/.test(t)) return 'responsables';
  return 'tarjetas';
}

function bloqueDe(el: Element, titulo: string): Bloque | null {
  const tag = el.tagName;
  if (tag === 'P') return { tipo: 'texto', parrafos: [segmentos(el)] };
  if (tag === 'TABLE') {
    const filasHtml = [...el.querySelectorAll('tr')];
    const encabezados = [...(filasHtml[0]?.children ?? [])].map((c) => (c.textContent ?? '').trim());
    const filas = filasHtml.slice(1).map((tr) => {
      const a = tr.querySelector('a');
      const url = a?.getAttribute('href') ?? undefined;
      return { celdas: [...tr.children].map((c) => (c.textContent ?? '').trim()), url, externo: url ? esExterna(url) : undefined };
    });
    return { tipo: 'tabla', encabezados, filas };
  }
  if (tag === 'UL' || tag === 'OL') {
    const lis = [...el.querySelectorAll(':scope > li')];
    const items = lis.map(leerItem);
    if (items.length && items.every((i): i is Item => !!i)) {
      return items.every((i) => i.url) ? { tipo: 'enlaces', items } : { tipo: 'tarjetas', variante: variante(titulo), items };
    }
    return { tipo: 'lista', items: lis.map(segmentos) };
  }
  return null;
}

/** Une párrafos seguidos en un solo bloque de texto */
function agregar(bloques: Bloque[], b: Bloque): void {
  const ultimo = bloques[bloques.length - 1];
  if (b.tipo === 'texto' && ultimo?.tipo === 'texto') ultimo.parrafos.push(...b.parrafos);
  else bloques.push(b);
}

@Component({
  selector: 'app-esquema-publicacion',
  imports: [RouterLink, IconoCms, CmsMediaPublica],
  templateUrl: './esquema-publicacion.html',
  styleUrl: './esquema-publicacion.css',
})
export class EsquemaPublicacion {
  private readonly cms = inject(CmsService);
  readonly pagina = input.required<CmsPagina>();
  readonly entradas = input<CmsEntrada[]>([]);
  /** Título de la sección padre (rótulo del encabezado) */
  readonly antetitulo = input('');

  /** Entrada con el texto del esquema: la que tiene subtítulos (o la más larga) */
  readonly principal = computed(() => {
    const lista = this.entradas().filter((e) => e.contenido);
    return lista.find((e) => /<h3/i.test(e.contenido ?? '')) ?? [...lista].sort((a, b) => (b.contenido?.length ?? 0) - (a.contenido?.length ?? 0))[0] ?? null;
  });
  /** Las demás entradas (conjuntos de datos, anexos…) */
  readonly otras = computed(() => this.entradas().filter((e) => e !== this.principal()));

  readonly estructura = computed(() => {
    const html = this.principal()?.contenido ?? '';
    const intro: string[] = [];
    const secciones: Seccion[] = [];
    let llamado: Llamado | null = null;
    if (typeof DOMParser === 'undefined' || !html) return { intro, secciones, llamado };

    const doc = new DOMParser().parseFromString(`<div>${html}</div>`, 'text/html');
    let actual: Seccion | null = null;
    for (const el of [...doc.body.firstElementChild!.children]) {
      if (/^H[2-4]$/.test(el.tagName)) {
        actual = { titulo: (el.textContent ?? '').trim(), subtitulo: '', bloques: [] };
        secciones.push(actual);
        continue;
      }
      if (!actual) {
        if (el.tagName === 'P' && el.textContent?.trim()) intro.push(el.textContent.trim());
        continue;
      }
      // Descripción corta: párrafo en cursiva justo debajo del subtítulo
      if (!actual.bloques.length && !actual.subtitulo && el.tagName === 'P' && el.children.length === 1 && /^(EM|I)$/.test(el.children[0].tagName) && el.textContent?.trim() === el.children[0].textContent?.trim()) {
        actual.subtitulo = el.textContent.trim();
        continue;
      }
      const b = bloqueDe(el, actual.titulo);
      if (b) agregar(actual.bloques, b);
    }

    // Llamado a la acción: «¿…?» con un párrafo que es solo un enlace
    const ultima = secciones[secciones.length - 1];
    if (ultima && /^¿/.test(ultima.titulo)) {
      const parrafos: string[] = [];
      let boton: Llamado['boton'];
      let correo: string | undefined;
      for (const b of ultima.bloques) {
        if (b.tipo !== 'texto') continue;
        for (const p of b.parrafos) {
          const enlaces = p.filter((s) => s.url);
          const soloEnlace = enlaces.length === 1 && p.every((s) => s.url || !s.texto.trim());
          if (soloEnlace && enlaces[0].url!.startsWith('mailto:')) correo = enlaces[0].url!.slice(7);
          else if (soloEnlace && !boton) boton = { texto: enlaces[0].texto.trim(), url: enlaces[0].url!, externo: !!enlaces[0].externo };
          else parrafos.push(p.map((s) => s.texto).join(''));
        }
      }
      if (boton || correo) {
        llamado = { titulo: ultima.titulo, parrafos, boton, correo };
        secciones.pop();
      }
    }
    return { intro, secciones, llamado };
  });

  /** Archivos de una entrada (documentos y conjuntos de datos) */
  documentos(e: CmsEntrada): CmsMultimedia[] {
    const mapa = this.cms.multimediaPorId();
    return e.multimediaIds.map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m && m.tipo !== 'imagen');
  }

  numero(i: number): string {
    return String(i + 1).padStart(2, '0');
  }
}
