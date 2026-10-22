import { Component, computed, inject } from '@angular/core';
import { NgTemplateOutlet } from '@angular/common';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsPaginaNodo } from '../../shared/models/cms/cms.models';

interface NodoMapa {
  id: number;
  titulo: string;
  url: string;
  externo: boolean;
  hijos: NodoMapa[];
}

/** Mapa del sitio: se genera solo a partir de los menús publicados en el CMS */
@Component({
  selector: 'app-mapa-del-sitio',
  imports: [RouterLink, NgTemplateOutlet],
  templateUrl: './mapa-del-sitio.html',
  styleUrl: './mapa-del-sitio.css',
})
export class MapaDelSitio {
  private readonly cms = inject(CmsService);

  readonly principal = computed(() => this.convertir(this.cms.menuPublico('principal')));
  readonly pie = computed(() =>
    this.convertir(this.cms.menuPublico('pie')).filter((n) => n.url !== '/mapa-del-sitio'),
  );

  constructor() {
    this.cms.cargar();
  }

  private convertir(nodos: CmsPaginaNodo[]): NodoMapa[] {
    // menuPublico depende de las señales de páginas y menús, así que se recalcula solo
    return nodos.map((n) => {
      const url = this.cms.urlPagina(n.pagina);
      return {
        id: n.pagina.id,
        titulo: n.pagina.titulo,
        url,
        externo: this.cms.esExterna(url),
        hijos: this.convertir(n.hijos),
      };
    });
  }
}
