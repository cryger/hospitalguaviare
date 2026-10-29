import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsEntrada } from '../../shared/models/cms/cms.models';
import { normalizar } from '../../shared/utils/busqueda';
import { leerIcono } from '../../shared/iconos/iconos';

/** Íconos de línea (24×24) por servicio; si no hay uno propio se usa el de su categoría */
const ICONOS: Record<string, string> = {
  estetoscopio: 'M6 3v5a4 4 0 0 0 8 0V3M10 12v3a5 5 0 0 0 10 0v-3M18 10a2 2 0 1 0 4 0 2 2 0 0 0-4 0',
  urgencias: 'M10 3h4v7h7v4h-7v7h-4v-7H3v-4h7z',
  cama: 'M3 18V6M3 14h18v4M21 14v-2a3 3 0 0 0-3-3h-7v5M6.5 11.5a1.5 1.5 0 1 0 0-.01',
  bisturi: 'M3.5 20.5 10 14M10 14l9-9a1.8 1.8 0 0 1 1.5 3L13.5 16.5zM12.5 11.5l2 2',
  corazon: 'M12 20s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 10c0 5.6-7 10-7 10z',
  pulso: 'M3 12h4l2-5 4 10 2-5h6',
  hoja: 'M5 19C5 11 11 5 19 5c0 8-6 14-14 14zM5 19l7-7',
  matraz: 'M9 3h6M10 3v6l-5 9a2 2 0 0 0 1.7 3h10.6a2 2 0 0 0 1.7-3l-5-9V3M7.5 15h9',
  rayosx: 'M3 4h18v13H3zM8 21h8M12 17v4M9 8.5h6M9 11h6M9 13.5h6M12 7v8',
  movimiento: 'M14 4.5a1.5 1.5 0 1 0 0-.01M8 21l3-6 3 2v4M11 15l1.2-5 3.3 2.5H19M12.2 10 9 11l-1.5 3',
  personas: 'M9 11a3 3 0 1 0 0-6 3 3 0 0 0 0 6zM3 20a6 6 0 0 1 12 0M16 5a3 3 0 0 1 0 6M21 20a6 6 0 0 0-4-5.6',
  informacion: 'M4 5h16v11H9l-5 4zM12 8v.01M12 10.5V13',
  hospital: 'M4 21V7l8-4 8 4v14M10 21v-4h4v4M12 8v5M9.5 10.5h5',
};

const POR_SLUG: [RegExp, string][] = [
  [/consulta/, 'estetoscopio'],
  [/urgencia|emergencia/, 'urgencias'],
  [/cuidados|ucim|uci\b/, 'pulso'],
  [/hospitaliz|internac/, 'cama'],
  [/cirug|quirofano/, 'bisturi'],
  [/parto|materno|matern|obstet/, 'corazon'],
  [/etno|indigena/, 'hoja'],
  [/laborator/, 'matraz'],
  [/imagen|radiolog|rayos/, 'rayosx'],
  [/terapia|fisio|rehabilit/, 'movimiento'],
  [/trabajo-social|psicolog/, 'personas'],
  [/siau|atencion-al-usuario|informacion/, 'informacion'],
];

/** Color de la tarjeta según la categoría (paleta GOV.CO) */
const TONOS: [RegExp, string][] = [
  [/urgencia/, 'rojo'],
  [/internac|hospitaliz/, 'marino'],
  [/cirug/, 'verde'],
  [/apoyo|diagnost|terapeut/, 'cielo'],
  [/usuario|atencion/, 'naranja'],
];

export interface TarjetaServicio {
  id: number;
  titulo: string;
  resumen: string;
  categoria: string;
  url: string;
  imagen: string | null;
  alt: string;
  icono: string;
  /** Carácter del ícono GOV.CO elegido en el dashboard (si lo hay) */
  govco: string | null;
  tono: string;
}

/** Ícono (trazo SVG), ícono GOV.CO elegido y color de un servicio: se usa en las tarjetas y en el dashboard */
export function aspectoServicio(e: Pick<CmsEntrada, 'slug' | 'titulo' | 'categoria' | 'icono'>): { icono: string; govco: string | null; tono: string } {
  const clave = normalizar(`${e.slug} ${e.titulo}`);
  const cat = normalizar(e.categoria ?? '');
  const nombre = POR_SLUG.find(([r]) => r.test(clave))?.[1] ?? POR_SLUG.find(([r]) => r.test(cat))?.[1] ?? 'hospital';
  const elegido = leerIcono(e.icono);
  return {
    icono: ICONOS[nombre],
    govco: elegido?.tipo === 'govco' ? elegido.caracter : null,
    tono: TONOS.find(([r]) => r.test(cat || clave))?.[1] ?? 'azul',
  };
}

/**
 * Tarjetas del portafolio de servicios (inicio y página "Portafolio de servicios").
 * Cada tarjeta lleva a la página del servicio; si no tiene imagen destacada
 * se muestra un fondo con el ícono del servicio.
 */
@Component({
  selector: 'app-servicios-tarjetas',
  imports: [RouterLink],
  templateUrl: './servicios-tarjetas.html',
  styleUrl: './servicios-tarjetas.css',
})
export class ServiciosTarjetas {
  private cms = inject(CmsService);

  readonly servicios = input.required<CmsEntrada[]>();
  /** Nivel del título de cada tarjeta (h2 en la página del portafolio sin grupos, h3 en el inicio) */
  readonly nivel = input<2 | 3>(3);
  readonly mostrarCategoria = input(true);

  readonly tarjetas = computed<TarjetaServicio[]>(() => {
    const multimedia = this.cms.multimediaPorId();
    return this.servicios().map((e) => {
      const m = e.imagenDestacadaId ? multimedia.get(e.imagenDestacadaId) : undefined;
      return {
        id: e.id,
        titulo: e.titulo,
        resumen: e.resumen ?? '',
        categoria: e.categoria?.trim() ?? '',
        url: this.cms.urlEntrada(e),
        imagen: m?.tipo === 'imagen' ? m.url : null,
        alt: m?.alt ?? '',
        ...aspectoServicio(e),
      };
    });
  });
}
