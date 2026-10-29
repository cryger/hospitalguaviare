import { normalizar } from './busqueda';
import { festivos } from './dias-habiles';

/**
 * Horarios escritos en lenguaje natural desde el dashboard, por ejemplo:
 *   "Lunes a viernes 7:00-12:00, 14:00-18:00; Sábados 8:00-13:00"
 *   "Todos los días 24 horas"
 * Cada tramo separado por ";" tiene días y uno o varios rangos de hora (24 h).
 */
export interface TramoHorario {
  /** Días de la semana (0 = domingo … 6 = sábado) */
  dias: number[];
  /** Texto de los días tal como se escribió ("Lunes a viernes") */
  etiquetaDias: string;
  /** Rangos en minutos desde la medianoche; [0, 1440] = 24 horas */
  rangos: [number, number][];
  veinticuatro: boolean;
}

const DIAS: [RegExp, number][] = [
  [/^dom/, 0], [/^lun/, 1], [/^mar/, 2], [/^mie/, 3], [/^jue/, 4], [/^vie/, 5], [/^sab/, 6],
];

function dia(t: string): number | null {
  return DIAS.find(([r]) => r.test(t))?.[1] ?? null;
}

function diasDe(texto: string): number[] {
  const t = normalizar(texto);
  if (/todos los dias|diario|24\/7|lunes a domingo/.test(t)) return [0, 1, 2, 3, 4, 5, 6];
  const rango = t.match(/(\w+)\s+a\s+(\w+)/);
  if (rango) {
    const a = dia(rango[1]), b = dia(rango[2]);
    if (a !== null && b !== null) {
      const r: number[] = [];
      for (let d = a; ; d = (d + 1) % 7) { r.push(d); if (d === b) break; }
      return r;
    }
  }
  return [...new Set(t.split(/[\s,]+/).filter((w) => w !== 'y').map(dia).filter((d): d is number => d !== null))];
}

const minutos = (h: string, m = '0') => Number(h) * 60 + Number(m);

export function leerHorario(texto: string | null | undefined): TramoHorario[] {
  return (texto ?? '')
    .split(';')
    .map((s) => s.trim())
    .filter(Boolean)
    .map((tramo) => {
      const t = normalizar(tramo);
      const primerNumero = tramo.search(/\d/);
      const etiquetaDias = (primerNumero > 0 ? tramo.slice(0, primerNumero) : tramo).replace(/[:\-–,]\s*$/, '').trim();
      const veinticuatro = /24\s*(h|horas)/.test(t);
      const rangos: [number, number][] = veinticuatro
        ? [[0, 1440]]
        : [...tramo.matchAll(/(\d{1,2})(?::(\d{2}))?\s*(?:-|–|a)\s*(\d{1,2})(?::(\d{2}))?/g)].map((m) => [minutos(m[1], m[2]), minutos(m[3], m[4])]);
      return { dias: diasDe(veinticuatro && !/lun|mar|mie|jue|vie|sab|dom/.test(t) ? 'todos los dias' : etiquetaDias || tramo), etiquetaDias: etiquetaDias.replace(/\s*24\s*horas?/i, '') || 'Todos los días', rangos, veinticuatro };
    })
    .filter((t) => t.dias.length && t.rangos.length);
}

/** "14:00" → "2:00 p. m." */
export function horaLegible(min: number): string {
  if (min >= 1440) return '12:00 a. m.';
  const h = Math.floor(min / 60), m = min % 60;
  const h12 = h % 12 || 12;
  return `${h12}:${String(m).padStart(2, '0')} ${h < 12 ? 'a. m.' : 'p. m.'}`;
}

/** Fecha y hora actuales en Colombia (UTC-5, sin horario de verano) */
export function ahoraColombia(ahora = new Date()): { dia: number; minuto: number; fecha: string } {
  const c = new Date(ahora.getTime() - 5 * 3600 * 1000);
  return { dia: c.getUTCDay(), minuto: c.getUTCHours() * 60 + c.getUTCMinutes(), fecha: c.toISOString().slice(0, 10) };
}

export type EstadoHorario = { abierto: boolean; festivo: boolean; texto: string };

/** ¿Está abierto ahora? Con el texto para mostrar ("Abierto · cierra a las 6:00 p. m.") */
export function estadoHorario(tramos: TramoHorario[], ahora = new Date()): EstadoHorario | null {
  if (!tramos.length) return null;
  const { dia, minuto, fecha } = ahoraColombia(ahora);
  if (tramos.some((t) => t.veinticuatro && t.dias.length === 7)) return { abierto: true, festivo: false, texto: 'Abierto las 24 horas' };
  const festivo = festivos(Number(fecha.slice(0, 4))).has(fecha);
  if (festivo) return { abierto: false, festivo: true, texto: 'Hoy es festivo: confirme la atención por teléfono' };
  const hoy = tramos.filter((t) => t.dias.includes(dia)).flatMap((t) => t.rangos).sort((a, b) => a[0] - b[0]);
  const actual = hoy.find(([a, b]) => minuto >= a && minuto < b);
  if (actual) return { abierto: true, festivo: false, texto: `Abierto · cierra a las ${horaLegible(actual[1])}` };
  const luego = hoy.find(([a]) => a > minuto);
  if (luego) return { abierto: false, festivo: false, texto: `Cerrado · abre a las ${horaLegible(luego[0])}` };
  return { abierto: false, festivo: false, texto: 'Cerrado por hoy' };
}
