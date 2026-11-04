import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsEntrada, CmsMultimedia, CmsPagina } from '../../shared/models/cms/cms.models';
import { CmsService } from '../../shared/services/cms/cms.service';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { CmsMediaPublica } from './cms-media-publica';
import { leerSecciones } from './secciones-parser';

/**
 * Plantilla «esquema»: página por secciones con la estructura del portal anterior (Esquema de
 * publicación de la información, Grupos étnicos, Enfoque diferencial, Gobierno Digital…).
 *
 * El contenido se escribe como una entrada normal en el editor y esta plantilla lo dibuja
 * con la estructura del portal anterior:
 *  - Párrafos antes del primer subtítulo → tarjeta «Presentación».
 *  - Cada subtítulo (H3) → sección numerada (01, 02…). Un párrafo en cursiva justo debajo
 *    es su descripción corta.
 *  - Viñetas «**Nombre:** descripción» → tarjetas con ícono (objetivos, formatos,
 *    periodicidad o responsables, según el subtítulo).
 *  - Viñetas «[Enlace](url): descripción» → tarjetas de categorías numeradas que enlazan.
 *  - Tabla → tabla del esquema; si la primera columna tiene enlace, se agrega «Consultar».
 *  - Subtítulo que empieza con «¿» y tiene un párrafo que es solo un enlace → llamado a la
 *    acción (botón); un enlace mailto: se muestra como tarjeta de contacto.
 * Las demás entradas de la página (ej. conjuntos de datos) se listan al final con sus archivos.
 */

@Component({
  selector: 'app-esquema-publicacion',
  imports: [RouterLink, IconoCms, CmsMediaPublica],
  templateUrl: './esquema-publicacion.html',
  styleUrl: './esquema-publicacion.css',
})
export class EsquemaPublicacion {
  private readonly cms = inject(CmsService);
  readonly pagina = input.required<CmsPagina>();
  readonly entradas = input<CmsEntrada[]>([]);
  /** Título de la sección padre (rótulo del encabezado) */
  readonly antetitulo = input('');

  /** Entrada con el texto del esquema: la que tiene subtítulos (o la más larga) */
  readonly principal = computed(() => {
    const lista = this.entradas().filter((e) => e.contenido);
    return lista.find((e) => /<h3/i.test(e.contenido ?? '')) ?? [...lista].sort((a, b) => (b.contenido?.length ?? 0) - (a.contenido?.length ?? 0))[0] ?? null;
  });
  /** Las demás entradas (conjuntos de datos, anexos…) */
  readonly otras = computed(() => this.entradas().filter((e) => e !== this.principal()));

  readonly estructura = computed(() => leerSecciones(this.principal()?.contenido ?? ''));

  /** Archivos de una entrada (documentos y conjuntos de datos) */
  documentos(e: CmsEntrada): CmsMultimedia[] {
    const mapa = this.cms.multimediaPorId();
    return e.multimediaIds.map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m && m.tipo !== 'imagen');
  }

  /** El esquema de publicación conserva sus textos; las demás páginas usan textos generales */
  readonly esEsquema = computed(() => this.pagina().slug === 'esquema-de-publicacion-de-la-informacion');

  /** Índice de secciones para páginas largas (no en el esquema, que replica el portal anterior) */
  readonly indice = computed(() => {
    const s = this.estructura().secciones;
    return !this.esEsquema() && s.length >= 5 ? s.map((x, i) => ({ id: 'es-sec-' + i, titulo: x.titulo })) : [];
  });

  irA(evento: Event, id: string): void {
    evento.preventDefault();
    const destino = document.getElementById(id);
    destino?.scrollIntoView({ behavior: 'smooth', block: 'start' });
    destino?.focus({ preventScroll: true });
  }

  numero(i: number): string {
    return String(i + 1).padStart(2, '0');
  }
}
