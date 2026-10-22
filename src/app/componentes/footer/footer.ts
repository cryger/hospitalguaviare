import { Component, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';
import { ConfiguracionService } from '../../shared/services/configuracion/configuracion.service';
import { REDES_SOCIALES, telefonoEnlace } from '../../shared/models/configuracion/configuracion';

interface EnlacePie {
  titulo: string;
  url: string;
  externo: boolean;
}

/** Enlaces de respaldo si el CMS aún no tiene el menú "Pie de página" */
const PIE_FIJO: EnlacePie[] = [
  { titulo: 'Políticas de privacidad y tratamiento de datos', url: '/politicas-de-privacidad', externo: false },
  { titulo: 'Términos y condiciones', url: '/terminos-y-condiciones', externo: false },
  { titulo: 'Accesibilidad', url: '/accesibilidad', externo: false },
  { titulo: 'Mapa del sitio', url: '/mapa-del-sitio', externo: false },
];

/**
 * Pie de página (Res. 1519 de 2020, Anexo 2).
 * Los datos de la entidad se editan en Admin › Configuración › Datos de la entidad.
 */
@Component({
  selector: 'app-footer',
  imports: [RouterLink],
  templateUrl: './footer.html',
  styleUrl: './footer.css',
})
export class Footer {
  private readonly cms = inject(CmsService);
  private readonly configuracion = inject(ConfiguracionService);

  readonly anio = new Date().getFullYear();

  readonly entidad = computed(() => {
    const e = this.configuracion.entidad();
    return {
      ...e,
      telefonos: e.telefonos.map((t) => ({ ...t, tel: telefonoEnlace(t.numero) })),
      lineaAnticorrupcion: e.lineaAnticorrupcion
        ? {
            numero: e.lineaAnticorrupcion,
            // Puede ser un teléfono o un correo de denuncias
            href: e.lineaAnticorrupcion.includes('@')
              ? 'mailto:' + e.lineaAnticorrupcion
              : 'tel:' + telefonoEnlace(e.lineaAnticorrupcion),
          }
        : null,
      redes: e.redes.map((r) => ({
        ...r,
        nombre: REDES_SOCIALES.find((x) => x.valor === r.red)?.etiqueta ?? r.red,
      })),
    };
  });

  /** Enlaces del pie administrados en Admin › Menús y estructura › Pie de página */
  readonly enlaces = computed<EnlacePie[]>(() => {
    this.cms.paginas();
    this.cms.menus();
    const nodos = this.cms.menuPublico('pie');
    if (!nodos.length) return PIE_FIJO;
    return nodos.map((n) => {
      const url = this.cms.urlPagina(n.pagina);
      return { titulo: n.pagina.titulo, url, externo: this.cms.esExterna(url) };
    });
  });

  /** Directorio institucional (numeral 1.4 de Transparencia) */
  readonly urlDirectorio = computed(() => {
    const p = this.cms.paginas().find((x) => x.slug === 'directorio-institucional');
    return p ? this.cms.urlPagina(p) : '/transparencia/informacion-de-la-entidad/directorio-institucional';
  });

  constructor() {
    this.cms.cargar();
    this.configuracion.cargar();
  }
}
