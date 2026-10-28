/**
 * Días hábiles en Colombia (lunes a viernes, sin festivos).
 * Festivos según la Ley 51 de 1983 (Ley Emiliani) y los que dependen de la Pascua.
 * Todas las fechas se calculan en hora de Bogotá (UTC-5, sin horario de verano).
 */
const DESFASE_MS = 5 * 3600 * 1000;

/** Fecha (año, mes 1-12, día) en Bogotá de un instante */
function partesBogota(fecha) {
  const d = new Date(new Date(fecha).getTime() - DESFASE_MS);
  return { a: d.getUTCFullYear(), m: d.getUTCMonth() + 1, d: d.getUTCDate() };
}

const clave = (a, m, d) => `${a}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')}`;

/** Domingo de Pascua (algoritmo anónimo gregoriano) */
function pascua(a) {
  const b = a % 19, c = Math.floor(a / 100), e = a % 100;
  const f = Math.floor(c / 4), g = c % 4, h = Math.floor((c + 8) / 25);
  const i = Math.floor((c - h + 1) / 3);
  const j = (19 * b + c - f - i + 15) % 30;
  const k = Math.floor(e / 4), l = e % 4;
  const m = (32 + 2 * g + 2 * k - j - l) % 7;
  const n = Math.floor((b + 11 * m + 22 * j) / 451);
  const mes = Math.floor((j + m - 7 * n + 114) / 31);
  const dia = ((j + m - 7 * n + 114) % 31) + 1;
  return Date.UTC(a, mes - 1, dia);
}

const DIA = 86400000;
const desdeUtc = (t) => { const d = new Date(t); return clave(d.getUTCFullYear(), d.getUTCMonth() + 1, d.getUTCDate()); };
/** Traslada al lunes siguiente (si no cae en lunes) */
const alLunes = (t) => { const w = new Date(t).getUTCDay(); return w === 1 ? t : t + ((8 - w) % 7) * DIA; };

const cache = new Map();
function festivos(a) {
  if (cache.has(a)) return cache.get(a);
  const s = new Set();
  // Fijos
  [[1, 1], [5, 1], [7, 20], [8, 7], [12, 8], [12, 25]].forEach(([m, d]) => s.add(clave(a, m, d)));
  // Trasladables al lunes
  [[1, 6], [3, 19], [6, 29], [8, 15], [10, 12], [11, 1], [11, 11]].forEach(([m, d]) => s.add(desdeUtc(alLunes(Date.UTC(a, m - 1, d)))));
  // Dependientes de la Pascua
  const p = pascua(a);
  s.add(desdeUtc(p - 3 * DIA)); // Jueves Santo
  s.add(desdeUtc(p - 2 * DIA)); // Viernes Santo
  s.add(desdeUtc(p + 43 * DIA)); // Ascensión (lunes)
  s.add(desdeUtc(p + 64 * DIA)); // Corpus Christi (lunes)
  s.add(desdeUtc(p + 71 * DIA)); // Sagrado Corazón (lunes)
  cache.set(a, s);
  return s;
}

function esHabil(a, m, d) {
  const w = new Date(Date.UTC(a, m - 1, d)).getUTCDay();
  return w !== 0 && w !== 6 && !festivos(a).has(clave(a, m, d));
}

/**
 * Fecha de vencimiento: N días hábiles contados desde el día siguiente a la radicación.
 * Devuelve el final de ese día en Bogotá (23:59:59) como Date UTC.
 */
function sumarDiasHabiles(desde, n) {
  const p = partesBogota(desde);
  let t = Date.UTC(p.a, p.m - 1, p.d);
  let restantes = n;
  while (restantes > 0) {
    t += DIA;
    const d = new Date(t);
    if (esHabil(d.getUTCFullYear(), d.getUTCMonth() + 1, d.getUTCDate())) restantes--;
  }
  return new Date(t + DIA - 1000 + DESFASE_MS);
}

module.exports = { sumarDiasHabiles, esHabil, festivos };
