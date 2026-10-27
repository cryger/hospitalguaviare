/**
 * Utilidades del buscador del portal (estándar BDC GOV.CO v5).
 * Todas las búsquedas del sitio y del panel usan estas reglas:
 * - no distinguen mayúsculas ni tildes ("Vacunación" = "vacunacion"),
 * - ignoran etiquetas HTML,
 * - cada palabra escrita debe aparecer (en cualquier orden).
 */

const DIACRITICOS = /[̀-ͯ]/g;

/** Minúsculas, sin tildes ni etiquetas HTML */
export function normalizar(texto: string | null | undefined): string {
  return (texto ?? '')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/g, ' ')
    .normalize('NFD')
    .replace(DIACRITICOS, '')
    .toLowerCase()
    .replace(/\s+/g, ' ')
    .trim();
}

/** Palabras vacías: no se exigen ni se resaltan ("plan de acción" busca "plan" y "acción") */
const PALABRAS_VACIAS = new Set([
  'de', 'del', 'la', 'las', 'el', 'los', 'en', 'y', 'e', 'o', 'u', 'a', 'al', 'un', 'una', 'unos', 'unas',
  'por', 'para', 'con', 'sin', 'se', 'su', 'sus', 'que', 'lo', 'le', 'es',
]);

/** Palabras de la consulta (se ignoran las de una letra y las palabras vacías) */
export function terminosDe(consulta: string | null | undefined): string[] {
  const todas = normalizar(consulta).split(' ').filter((t) => t.length > 1);
  const utiles = todas.filter((t) => !PALABRAS_VACIAS.has(t));
  return utiles.length ? utiles : todas;
}

/** ¿El texto (ya normalizado o no) contiene todas las palabras? */
export function coincide(texto: string, terminos: string[]): boolean {
  if (!terminos.length) return true;
  const base = normalizar(texto);
  return terminos.every((t) => base.includes(t));
}

export const escaparHtml = (t: string) =>
  t.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');

/**
 * Resalta con <mark> las palabras buscadas conservando el texto original
 * (con tildes). Devuelve HTML seguro para usar con [innerHTML].
 */
export function resaltar(texto: string | null | undefined, terminos: string[]): string {
  const original = texto ?? '';
  if (!terminos.length || !original) return escaparHtml(original);
  // Versión comparable letra por letra (misma longitud que el original)
  const base = [...original]
    .map((c) => {
      const s = c.normalize('NFD').replace(DIACRITICOS, '').toLowerCase();
      return s.length === 1 ? s : c.toLowerCase().charAt(0) || ' ';
    })
    .join('');
  const chars = [...original];
  if (base.length !== chars.length) return escaparHtml(original);
  const marcas = new Array<boolean>(chars.length).fill(false);
  for (const t of terminos) {
    let i = base.indexOf(t);
    while (i !== -1) {
      for (let k = i; k < i + t.length; k++) marcas[k] = true;
      i = base.indexOf(t, i + t.length);
    }
  }
  let salida = '';
  let abierta = false;
  chars.forEach((c, i) => {
    if (marcas[i] && !abierta) { salida += '<mark>'; abierta = true; }
    if (!marcas[i] && abierta) { salida += '</mark>'; abierta = false; }
    salida += escaparHtml(c);
  });
  return abierta ? salida + '</mark>' : salida;
}

/** Fragmento del texto alrededor de la primera coincidencia (para resultados) */
export function extracto(texto: string | null | undefined, terminos: string[], largo = 180): string {
  const plano = (texto ?? '').replace(/<[^>]+>/g, ' ').replace(/&nbsp;/g, ' ').replace(/\s+/g, ' ').trim();
  if (plano.length <= largo) return plano;
  const base = normalizar(plano);
  const pos = terminos.length ? Math.max(0, Math.min(...terminos.map((t) => base.indexOf(t)).filter((i) => i >= 0), base.length)) : 0;
  const inicio = pos >= base.length ? 0 : Math.max(0, pos - 60);
  const corte = plano.slice(inicio, inicio + largo);
  return (inicio > 0 ? '…' : '') + corte.replace(/\s\S*$/, '') + '…';
}
