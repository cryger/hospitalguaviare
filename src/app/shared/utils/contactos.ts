/**
 * Datos de contacto escritos en el dashboard como líneas «Etiqueta: valor», por ejemplo:
 *   Correo: siau@esehospitalguaviare.gov.co
 *   Celular: 318 568 9597
 *   WhatsApp: 310 203 3803
 *   Coordenadas: 2.5661592, -72.6450748
 * Teléfonos, WhatsApp y correos se vuelven enlaces. Las líneas sin «:» son notas.
 */
export type TipoContacto = 'tel' | 'whatsapp' | 'correo' | 'texto';

export interface Contacto {
  etiqueta: string;
  valor: string;
  href: string | null;
  tipo: TipoContacto;
}

export interface DatosContacto {
  contactos: Contacto[];
  notas: string[];
  /** «lat,lng» si hay una línea «Coordenadas» */
  coordenadas: string | null;
}

/** Número en formato internacional para tel: y wa.me (Colombia +57); otros quedan como están */
export function telefonoInternacional(valor: string): string {
  const d = valor.replace(/\D/g, '');
  if (d.length === 10) return '+57' + d;
  if (d.length === 12 && d.startsWith('57')) return '+' + d;
  return d;
}

export function leerContactos(html: string | null | undefined): DatosContacto {
  const div = document.createElement('div');
  div.innerHTML = html ?? '';
  const lineas = Array.from(div.querySelectorAll('li, p'))
    .map((n) => n.textContent?.replace(/\s+/g, ' ').trim() ?? '')
    .filter(Boolean);
  const datos: DatosContacto = { contactos: [], notas: [], coordenadas: null };
  for (const l of lineas) {
    const m = l.match(/^([^:]{2,60}):\s*(.+)$/);
    if (!m) { datos.notas.push(l); continue; }
    const etiqueta = m[1].trim();
    const valor = m[2].trim();
    if (/^coordenadas$/i.test(etiqueta)) {
      const c = valor.match(/(-?\d+(?:\.\d+)?)\s*,\s*(-?\d+(?:\.\d+)?)/);
      if (c) datos.coordenadas = `${c[1]},${c[2]}`;
      continue;
    }
    if (/^[^\s@]+@[^\s@]+\.[a-z]{2,}$/i.test(valor)) {
      datos.contactos.push({ etiqueta, valor, href: 'mailto:' + valor, tipo: 'correo' });
    } else if (/^[+()\d\s-]{7,}$/.test(valor)) {
      const num = telefonoInternacional(valor);
      datos.contactos.push(
        /whats/i.test(etiqueta)
          ? { etiqueta, valor, href: 'https://wa.me/' + num.replace('+', ''), tipo: 'whatsapp' }
          : { etiqueta, valor, href: 'tel:' + num, tipo: 'tel' },
      );
    } else {
      datos.contactos.push({ etiqueta, valor, href: null, tipo: 'texto' });
    }
  }
  return datos;
}
