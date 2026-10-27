/** Evento del calendario institucional (tabla cms_eventos) */
export type EstadoEvento = 'publicado' | 'borrador' | 'cancelado';
export type ModalidadEvento = 'presencial' | 'virtual' | 'mixta';
export type CategoriaEvento =
  | 'capacitacion'
  | 'induccion'
  | 'comite'
  | 'bienestar'
  | 'salud'
  | 'participacion'
  | 'institucional';

export interface Evento {
  id: number;
  titulo: string;
  descripcion: string | null;
  categoria: CategoriaEvento;
  /** Fecha y hora de inicio (ISO, UTC) */
  fechaInicio: string;
  /** Fecha y hora de fin (ISO, UTC) */
  fechaFin: string | null;
  todoElDia: boolean;
  lugar: string | null;
  modalidad: ModalidadEvento;
  /** Enlace de inscripción o de la reunión virtual */
  enlace: string | null;
  dirigidoA: string | null;
  responsable: string | null;
  estado: EstadoEvento;
  destacado: boolean;
  migradoDe?: string | null;
  creadoEn?: string;
  actualizadoEn?: string;
}

/** Categorías con color (contraste AA con texto blanco) */
export const CATEGORIAS_EVENTO: { valor: CategoriaEvento; etiqueta: string; color: string }[] = [
  { valor: 'capacitacion', etiqueta: 'Capacitación', color: '#2E7D32' },
  { valor: 'induccion', etiqueta: 'Inducción y reinducción', color: '#0943B5' },
  { valor: 'comite', etiqueta: 'Comités y mesas de trabajo', color: '#7B1FA2' },
  { valor: 'bienestar', etiqueta: 'Bienestar', color: '#00695C' },
  { valor: 'salud', etiqueta: 'Jornadas de salud', color: '#C62828' },
  { valor: 'participacion', etiqueta: 'Participación ciudadana', color: '#B45309' },
  { valor: 'institucional', etiqueta: 'Institucional', color: '#4C4C4C' },
];

export const MODALIDADES_EVENTO: { valor: ModalidadEvento; etiqueta: string }[] = [
  { valor: 'presencial', etiqueta: 'Presencial' },
  { valor: 'virtual', etiqueta: 'Virtual' },
  { valor: 'mixta', etiqueta: 'Presencial y virtual' },
];

export const categoriaDe = (c: CategoriaEvento | string) =>
  CATEGORIAS_EVENTO.find((x) => x.valor === c) ?? CATEGORIAS_EVENTO[CATEGORIAS_EVENTO.length - 1];

/* =====================================================================
   Fechas: el hospital está en Colombia (UTC−5, sin horario de verano).
   Se guardan en UTC y se muestran siempre en hora de Bogotá.
===================================================================== */
export const ZONA = '-0500';
const OFFSET_MS = 5 * 60 * 60 * 1000;

/** 'AAAA-MM-DD' + 'HH:MM' (hora de Bogotá) → ISO UTC */
export function aIsoBogota(fecha: string, hora = '12:00'): string {
  return new Date(`${fecha}T${hora || '12:00'}:00-05:00`).toISOString();
}

/** ISO UTC → { fecha: 'AAAA-MM-DD', hora: 'HH:MM' } en hora de Bogotá */
export function partesBogota(iso: string | null | undefined): { fecha: string; hora: string } {
  if (!iso) return { fecha: '', hora: '' };
  const d = new Date(new Date(iso).getTime() - OFFSET_MS);
  const p = (n: number) => String(n).padStart(2, '0');
  return {
    fecha: `${d.getUTCFullYear()}-${p(d.getUTCMonth() + 1)}-${p(d.getUTCDate())}`,
    hora: `${p(d.getUTCHours())}:${p(d.getUTCMinutes())}`,
  };
}

/** Día (AAAA-MM-DD, Bogotá) en que empieza el evento */
export const diaDe = (e: Pick<Evento, 'fechaInicio'>) => partesBogota(e.fechaInicio).fecha;

/** Días (AAAA-MM-DD) que abarca un evento (para eventos de varios días) */
export function diasDe(e: Pick<Evento, 'fechaInicio' | 'fechaFin'>): string[] {
  const inicio = diaDe(e);
  const fin = e.fechaFin ? partesBogota(e.fechaFin).fecha : inicio;
  const dias: string[] = [];
  const d = new Date(inicio + 'T00:00:00Z');
  const limite = new Date((fin < inicio ? inicio : fin) + 'T00:00:00Z');
  let guardia = 0;
  while (d <= limite && guardia++ < 62) {
    dias.push(d.toISOString().slice(0, 10));
    d.setUTCDate(d.getUTCDate() + 1);
  }
  return dias;
}

/** Hoy (AAAA-MM-DD) en Bogotá */
export const hoyBogota = () => partesBogota(new Date().toISOString()).fecha;

/** Texto de horario: "4:00 p. m. – 6:00 p. m." o "Todo el día" */
export function horarioDe(e: Pick<Evento, 'fechaInicio' | 'fechaFin' | 'todoElDia'>): string {
  if (e.todoElDia) return 'Todo el día';
  const f = (iso: string) => {
    const [h, m] = partesBogota(iso).hora.split(':').map(Number);
    const sufijo = h < 12 ? 'a. m.' : 'p. m.';
    return `${((h + 11) % 12) + 1}:${String(m).padStart(2, '0')} ${sufijo}`;
  };
  const ini = f(e.fechaInicio);
  if (!e.fechaFin) return ini;
  const mismoDia = partesBogota(e.fechaFin).fecha === partesBogota(e.fechaInicio).fecha;
  return mismoDia ? `${ini} – ${f(e.fechaFin)}` : ini;
}

/* =====================================================================
   Exportar a calendarios (iCalendar .ics y Google Calendar)
===================================================================== */
const icsFecha = (iso: string) => new Date(iso).toISOString().replace(/[-:]/g, '').replace(/\.\d{3}/, '');
const icsTexto = (t: string | null | undefined) =>
  (t ?? '').replace(/\\/g, '\\\\').replace(/\n/g, '\\n').replace(/,/g, '\\,').replace(/;/g, '\;');

function finDe(e: Evento): string {
  if (e.fechaFin) return e.fechaFin;
  return new Date(new Date(e.fechaInicio).getTime() + 60 * 60 * 1000).toISOString();
}

export function aIcs(eventos: Evento[], origen = 'esehospitalguaviare.gov.co'): string {
  const lineas = [
    'BEGIN:VCALENDAR',
    'VERSION:2.0',
    'PRODID:-//E.S.E. Hospital San Jose del Guaviare//Calendario de eventos//ES',
    'CALSCALE:GREGORIAN',
    'METHOD:PUBLISH',
    'X-WR-CALNAME:Calendario E.S.E. Hospital San José del Guaviare',
    'X-WR-TIMEZONE:America/Bogota',
  ];
  for (const e of eventos) {
    lineas.push('BEGIN:VEVENT', `UID:evento-${e.id}@${origen}`, `DTSTAMP:${icsFecha(new Date().toISOString())}`);
    if (e.todoElDia) {
      const dias = diasDe(e);
      const ultimo = new Date(dias[dias.length - 1] + 'T00:00:00Z');
      ultimo.setUTCDate(ultimo.getUTCDate() + 1);
      lineas.push(`DTSTART;VALUE=DATE:${dias[0].replace(/-/g, '')}`, `DTEND;VALUE=DATE:${ultimo.toISOString().slice(0, 10).replace(/-/g, '')}`);
    } else {
      lineas.push(`DTSTART:${icsFecha(e.fechaInicio)}`, `DTEND:${icsFecha(finDe(e))}`);
    }
    lineas.push(`SUMMARY:${icsTexto((e.estado === 'cancelado' ? 'CANCELADO: ' : '') + e.titulo)}`);
    if (e.descripcion) lineas.push(`DESCRIPTION:${icsTexto(e.descripcion)}`);
    if (e.lugar) lineas.push(`LOCATION:${icsTexto(e.lugar)}`);
    if (e.enlace) lineas.push(`URL:${e.enlace}`);
    if (e.estado === 'cancelado') lineas.push('STATUS:CANCELLED');
    lineas.push('END:VEVENT');
  }
  lineas.push('END:VCALENDAR');
  return lineas.join('\r\n');
}

export function enlaceGoogle(e: Evento): string {
  const fechas = e.todoElDia
    ? (() => {
        const dias = diasDe(e);
        const fin = new Date(dias[dias.length - 1] + 'T00:00:00Z');
        fin.setUTCDate(fin.getUTCDate() + 1);
        return `${dias[0].replace(/-/g, '')}/${fin.toISOString().slice(0, 10).replace(/-/g, '')}`;
      })()
    : `${icsFecha(e.fechaInicio)}/${icsFecha(finDe(e))}`;
  const p = new URLSearchParams({
    action: 'TEMPLATE',
    text: e.titulo,
    dates: fechas,
    details: e.descripcion ?? '',
    location: e.lugar ?? '',
    ctz: 'America/Bogota',
  });
  return `https://calendar.google.com/calendar/render?${p.toString()}`;
}

/** Descarga un archivo .ics en el navegador */
export function descargarIcs(eventos: Evento[], nombre: string): void {
  const blob = new Blob([aIcs(eventos)], { type: 'text/calendar;charset=utf-8' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = nombre.endsWith('.ics') ? nombre : `${nombre}.ics`;
  document.body.appendChild(a);
  a.click();
  a.remove();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}
