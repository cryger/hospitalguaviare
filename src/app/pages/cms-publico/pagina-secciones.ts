import { Component, computed, inject, input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsEntrada, CmsMultimedia, CmsPagina } from '../../shared/models/cms/cms.models';
import { CmsService } from '../../shared/services/cms/cms.service';
import { IconoCms } from '../../shared/components/icono-cms/icono-cms';
import { CmsMediaPublica } from './cms-media-publica';
import { leerSecciones } from './secciones-parser';

/**
 * Plantilla «secciones»: página informativa con el mismo lenguaje visual de Misión y visión
 * (encabezado estándar del portal, bloque destacado, secciones numeradas, tarjetas con
 * franja de color, etiquetas y listas). El contenido se escribe en una entrada:
 *  - Un título (H2) y los párrafos iniciales → bloque destacado de presentación.
 *  - Cada subtítulo (H3) → sección numerada; un párrafo en cursiva debajo es su descripción.
 *  - Viñetas «**Nombre:** descripción» → tarjetas con ícono (una sublista se ve como etiquetas).
 *  - Viñetas solo con «**Nombre**» → etiquetas; viñetas de texto → lista con marcas.
 *  - Una sección «Ruta…» o «Pasos…» → pasos numerados.
 *  - Último subtítulo con «¿…?» y un enlace o correo → llamado final.
 */
@Component({
  selector: 'app-pagina-secciones',
  imports: [RouterLink, IconoCms, CmsMediaPublica],
  templateUrl: './pagina-secciones.html',
  styleUrl: './pagina-secciones.css',
})
export class PaginaSecciones {
  private readonly cms = inject(CmsService);
  readonly pagina = input.required<CmsPagina>();
  readonly entradas = input<CmsEntrada[]>([]);

  /** Entrada con el texto por secciones: la que tiene subtítulos (o la más larga) */
  readonly principal = computed(() => {
    const lista = this.entradas().filter((e) => e.contenido);
    return lista.find((e) => /<h3/i.test(e.contenido ?? '')) ?? [...lista].sort((a, b) => (b.contenido?.length ?? 0) - (a.contenido?.length ?? 0))[0] ?? null;
  });
  readonly otras = computed(() => this.entradas().filter((e) => e !== this.principal()));
  readonly estructura = computed(() => leerSecciones(this.principal()?.contenido ?? ''));

  documentos(e: CmsEntrada): CmsMultimedia[] {
    const mapa = this.cms.multimediaPorId();
    return e.multimediaIds.map((id) => mapa.get(id)).filter((m): m is CmsMultimedia => !!m && m.tipo !== 'imagen');
  }
}
