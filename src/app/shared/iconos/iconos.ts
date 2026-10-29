import { ICONOS_GOVCO, IconoGovco } from './iconos-govco';

/** Prefijo con que se guarda un ícono nativo en el campo "icono" de una página */
export const PREFIJO_GOVCO = 'govco:';

const POR_NOMBRE = new Map<string, IconoGovco>(ICONOS_GOVCO.map((i) => [i.nombre, i]));

export function iconoGovco(nombre: string): IconoGovco | undefined {
  return POR_NOMBRE.get(nombre);
}

/**
 * Interpreta el valor guardado:
 * - "govco:ambulance" → ícono de la fuente GOV.CO (carácter + nombre)
 * - cualquier otro texto (ej. un emoji de páginas anteriores) → se muestra tal cual
 */
export function leerIcono(valor: string | null | undefined): { tipo: 'govco'; caracter: string; nombre: string } | { tipo: 'texto'; texto: string } | null {
  const v = (valor ?? '').trim();
  if (!v) return null;
  if (v.startsWith(PREFIJO_GOVCO)) {
    const i = POR_NOMBRE.get(v.slice(PREFIJO_GOVCO.length));
    return i ? { tipo: 'govco', caracter: String.fromCodePoint(i.codigo), nombre: i.nombre } : null;
  }
  return { tipo: 'texto', texto: v };
}

/** "arrow-alt-circle-left" → "Arrow alt circle left" (para títulos y lectores) */
export function nombreLegible(nombre: string): string {
  const t = nombre.replace(/-1$/, ' (contorno)').replace(/-/g, ' ');
  return t.charAt(0).toUpperCase() + t.slice(1);
}
