import { normalizar } from './busqueda';

/**
 * Categorías de publicaciones (Noticias y demás páginas tipo "Listado").
 * Son sugerencias: en el editor de entradas se puede escribir una categoría nueva
 * y aparecerá sola en el filtro lateral de la página.
 */
export const CATEGORIAS_SUGERIDAS = [
  'Comunicados',
  'Resoluciones',
  'Circulares',
  'Procesos y convocatorias',
  'Boletines',
  'Jornadas de salud',
  'Capacitaciones',
  'Fechas conmemorativas',
  'Institucional',
] as const;

/**
 * Reglas para clasificar por el título (el orden importa: gana la primera que coincida).
 * Las mismas reglas están en api/migraciones/023-categorias-publicaciones.sql.
 */
const REGLAS: [RegExp, string][] = [
  // "Seminario de resolución de conflictos" es capacitación, no resolución
  [/^\W*(capacitacion|seminario|diplomado|taller|curso)\b/, 'Capacitaciones'],
  [/\bresolucion/, 'Resoluciones'],
  [/\bcircular/, 'Circulares'],
  [/\bcomunicado/, 'Comunicados'],
  [/\bboletin/, 'Boletines'],
  [/\b(convocatoria|proceso|terna|eleccion|votacion|votantes|jurados|cronograma electoral|inscritos|postulacion|invitacion|aviso)/, 'Procesos y convocatorias'],
  [/\b(capacitacion|seminario|diplomado|taller|curso)/, 'Capacitaciones'],
  [/\b(jornada|brigada|vacunacion)/, 'Jornadas de salud'],
  [/\b(feliz dia|dia mundial|dia internacional|dia del|dia de la|homenaje)/, 'Fechas conmemorativas'],
];

/** Categoría sugerida a partir del título ("Institucional" si no coincide ninguna regla) */
export function categoriaSugerida(titulo: string): string {
  const t = normalizar(titulo);
  return REGLAS.find(([r]) => r.test(t))?.[1] ?? 'Institucional';
}

/** Identificador para la URL: "Procesos y convocatorias" → "procesos-y-convocatorias" */
export function slugCategoria(nombre: string): string {
  return normalizar(nombre).trim().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
}
