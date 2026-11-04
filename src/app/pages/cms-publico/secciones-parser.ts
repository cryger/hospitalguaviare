/**
 * Lectura del contenido de una entrada con la convención de «páginas por secciones»
 * (la usan las plantillas «esquema» y «secciones»): párrafos iniciales = presentación,
 * subtítulos = secciones, viñetas «Nombre: texto» = tarjetas, etc.
 */
export interface Segmento { texto: string; url?: string; externo?: boolean }
export interface Item { nombre: string; texto: string; icono: string; url?: string; externo?: boolean; subitems: string[] }
export type Variante = 'objetivos' | 'formatos' | 'periodicidad' | 'responsables' | 'tarjetas' | 'chips' | 'pasos' | 'compacta' | 'amplia';
export type Bloque =
  | { tipo: 'texto'; parrafos: Segmento[][] }
  | { tipo: 'tarjetas'; variante: Variante; items: Item[] }
  | { tipo: 'enlaces'; items: Item[] }
  | { tipo: 'tabla'; encabezados: string[]; filas: { celdas: string[]; url?: string; externo?: boolean }[] }
  | { tipo: 'lista'; items: Segmento[][] }
  | { tipo: 'contacto'; correo: string };
export interface Seccion { titulo: string; subtitulo: string; bloques: Bloque[] }
export interface Llamado { titulo: string; parrafos: string[]; boton?: { texto: string; url: string; externo: boolean }; correo?: string }

const sinTildes = (t: string) => t.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
const esExterna = (u: string) => /^(https?:)?\/\//i.test(u) || u.startsWith('mailto:') || u.startsWith('tel:');

/** Ícono GOV.CO según el nombre de la tarjeta (mismos íconos del portal anterior) */
const REGLAS_ICONO: [RegExp, string][] = [
  // Grupos étnicos, enfoque diferencial y Gobierno Digital
  [/automatizacion/, 'cogs'],
  [/^digitalizacion/, 'file-alt'],
  [/gestion de informacion|gestion y consulta de informacion|uso estrategico/, 'database'],
  [/servicios digitales|aplicaciones/, 'mobile-alt'],
  [/inventario web/, 'clipboard-list'],
  [/laboratorio/, 'microscope'],
  [/transformacion/, 'rocket'],
  [/seguridad de la informacion/, 'lock'],
  [/innovacion/, 'lightbulb'],
  [/portal web/, 'desktop'],
  [/sistemas de informacion/, 'server'],
  [/diversidad/, 'globe-americas'],
  [/humaniz/, 'hand-holding-heart'],
  [/^equidad/, 'balance-scale'],
  [/intercultural|dialogo/, 'comments'],
  [/^territorio|entidades territoriales/, 'map-marker-alt'],
  [/^comunidad/, 'users'],
  [/saberes/, 'book-open'],
  [/institucion de salud/, 'hospital'],
  [/autoridades tradicionales/, 'landmark'],
  [/acceso/, 'universal-access'],
  [/^reconocimiento/, 'award'],
  [/caracterizacion|diagnostico/, 'chart-bar'],
  [/promocion/, 'heartbeat'],
  [/formacion|capacitaciones/, 'user-graduate'],
  [/valoraciones/, 'stethoscope'],
  [/educacion/, 'book-open'],
  [/vacunacion/, 'syringe'],
  [/salud oral/, 'tooth'],
  [/enfermeria/, 'user-nurse'],
  [/orientacion de rutas|protocolos/, 'route'],
  [/^identificacion/, 'user-check'],
  [/^orientacion/, 'map-signs'],
  [/^atencion$/, 'user-md'],
  [/^articulacion/, 'people-arrows'],
  [/^seguimiento/, 'tasks'],
  [/^respeto/, 'hands'],
  [/^dignidad|trato digno/, 'user-shield'],
  [/^inclusion/, 'universal-access'],
  [/no discriminacion/, 'hands'],
  [/^normatividad/, 'balance-scale'],
  [/^lineamientos/, 'compass'],
  [/planes y programas/, 'tasks'],
  [/asistencias tecnicas/, 'hands-helping'],
  [/jornadas/, 'calendar-check'],
  [/tu participacion/, 'comment-dots'],
  [/discapacidad/, 'wheelchair'],
  [/adultas mayores/, 'walking'],
  [/victimas/, 'dove'],
  [/^oficina de planeacion/, 'sitemap'],
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
export const iconoDe = (nombre: string) => 'govco:' + (REGLAS_ICONO.find(([r]) => r.test(sinTildes(nombre)))?.[1] ?? 'file-alt');

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
  // Una sublista dentro de la viñeta se muestra como etiquetas debajo del texto
  const subitems = [...li.querySelectorAll(':scope > ul > li, :scope > ol > li')].map((x) => (x.textContent ?? '').trim().replace(/\.$/, ''));
  const copia = li.cloneNode(true) as Element;
  copia.querySelectorAll(':scope > ul, :scope > ol').forEach((x) => x.remove());
  const nombre = (cabeza.textContent ?? '').replace(/:\s*$/, '').trim();
  const texto = (copia.textContent ?? '').replace(cabeza.textContent ?? '', '').replace(/^\s*[:–—-]\s*/, '').trim();
  const url = enlace?.getAttribute('href') ?? undefined;
  return { nombre, texto, icono: iconoDe(nombre), url, externo: url ? esExterna(url) : undefined, subitems };
}

function variante(titulo: string, items: Item[]): Variante {
  const t = sinTildes(titulo);
  if (/objetivo/.test(t)) return 'objetivos';
  if (/formato/.test(t)) return 'formatos';
  if (/periodicidad/.test(t)) return 'periodicidad';
  if (/responsable/.test(t)) return 'responsables';
  // Solo nombres (sin descripción) → etiquetas compactas
  if (items.every((i) => !i.texto && !i.subitems.length)) return 'chips';
  // Ruta o pasos → línea de pasos numerados
  if (/\bruta\b|pasos/.test(t)) return 'pasos';
  const largo = Math.max(...items.map((i) => i.texto.length));
  if (largo > 180) return 'amplia';
  if (items.length >= 4 && largo <= 170 && items.every((i) => !i.subitems.length)) return 'compacta';
  return 'tarjetas';
}

function bloqueDe(el: Element, titulo: string): Bloque | null {
  const tag = el.tagName;
  if (tag === 'P') {
    // Párrafo que es solo un correo → tarjeta de contacto
    const a = el.querySelector(':scope > a[href^="mailto:"]');
    if (a && el.textContent?.trim() === a.textContent?.trim()) return { tipo: 'contacto', correo: a.getAttribute('href')!.slice(7) };
    return { tipo: 'texto', parrafos: [segmentos(el)] };
  }
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
      return items.every((i) => i.url) ? { tipo: 'enlaces', items } : { tipo: 'tarjetas', variante: variante(titulo, items), items };
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

export interface Estructura { intro: string[]; introTitulo: string; secciones: Seccion[]; llamado: Llamado | null }

export function leerSecciones(html: string): Estructura {

    const intro: string[] = [];
    const secciones: Seccion[] = [];
    let llamado: Llamado | null = null;
    let introTitulo = '';
    if (typeof DOMParser === 'undefined' || !html) return { intro, introTitulo, secciones, llamado };

    const doc = new DOMParser().parseFromString(`<div>${html}</div>`, 'text/html');
    let actual: Seccion | null = null;
    const hijos = [...doc.body.firstElementChild!.children];
    // Un H2 inicial seguido de secciones H3 es el título de la presentación
    if (hijos[0]?.tagName === 'H2' && hijos.some((h) => h.tagName === 'H3')) introTitulo = (hijos.shift()!.textContent ?? '').trim();
    for (const el of hijos) {
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
      const parrafos: string[] = ultima.subtitulo ? [ultima.subtitulo] : [];
      let boton: Llamado['boton'];
      let correo: string | undefined;
      for (const b of ultima.bloques) {
        if (b.tipo === 'contacto') { correo = b.correo; continue; }
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
    return { intro, introTitulo, secciones, llamado };
}
