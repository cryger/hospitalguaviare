/**
 * Días hábiles en Colombia (lunes a viernes, sin festivos — Ley 51 de 1983).
 * Misma lógica que api/src/dias-habiles.js. Fechas en hora de Bogotá (UTC-5).
 */
const DIA = 86_400_000;
const DESFASE = 5 * 3_600_000;

const clave = (a: number, m: number, d: number) => `${a}-${String(m).padStart(2, '0')}-${String(d).padStart(2, '0')}`;
const desdeUtc = (t: number) => {
  const d = new Date(t);
  return clave(d.getUTCFullYear(), d.getUTCMonth() + 1, d.getUTCDate());
};
const alLunes = (t: number) => {
  const w = new Date(t).getUTCDay();
  return w === 1 ? t : t + ((8 - w) % 7) * DIA;
};

function pascua(a: number): number {
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

const cache = new Map<number, Set<string>>();
export function festivos(a: number): Set<string> {
  const guardado = cache.get(a);
  if (guardado) return guardado;
  const s = new Set<string>();
  [[1, 1], [5, 1], [7, 20], [8, 7], [12, 8], [12, 25]].forEach(([m, d]) => s.add(clave(a, m, d)));
  [[1, 6], [3, 19], [6, 29], [8, 15], [10, 12], [11, 1], [11, 11]].forEach(([m, d]) =>
    s.add(desdeUtc(alLunes(Date.UTC(a, m - 1, d)))),
  );
  const p = pascua(a);
  [-3, -2, 43, 64, 71].forEach((n) => s.add(desdeUtc(p + n * DIA)));
  cache.set(a, s);
  return s;
}

/** Día (medianoche UTC que representa la fecha de Bogotá) */
function diaBogota(fecha: Date | string): number {
  const d = new Date(new Date(fecha).getTime() - DESFASE);
  return Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate());
}

function esHabil(t: number): boolean {
  const d = new Date(t);
  const w = d.getUTCDay();
  return w !== 0 && w !== 6 && !festivos(d.getUTCFullYear()).has(desdeUtc(t));
}

/** Días hábiles desde `desde` (sin contarlo) hasta `hasta` (incluido). Negativo si `hasta` es anterior. */
export function diasHabilesEntre(desde: Date | string, hasta: Date | string): number {
  let a = diaBogota(desde);
  let b = diaBogota(hasta);
  if (isNaN(a) || isNaN(b)) return 0;
  const signo = b >= a ? 1 : -1;
  if (signo < 0) [a, b] = [b, a];
  let n = 0;
  for (let t = a + DIA; t <= b; t += DIA) if (esHabil(t)) n++;
  return n * signo;
}

export type Semaforo = 'ok' | 'alerta' | 'vencida' | 'cerrada';

/**
 * Semáforo de oportunidad según la fecha de vencimiento:
 * vencida (pasó el plazo), alerta (quedan 3 días hábiles o menos), ok.
 */
export function semaforoDe(vencimiento: Date | string, abierta: boolean, ahora = new Date()): { estado: Semaforo; diasRestantes: number } {
  const diasRestantes = diasHabilesEntre(ahora, vencimiento);
  if (!abierta) return { estado: 'cerrada', diasRestantes };
  if (new Date(vencimiento).getTime() < ahora.getTime()) return { estado: 'vencida', diasRestantes: Math.min(diasRestantes, -1) };
  return { estado: diasRestantes <= 3 ? 'alerta' : 'ok', diasRestantes };
}
