import { Component, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';

interface EnlacePie {
  titulo: string;
  url: string;
  externo: boolean;
}

/** Datos de contacto de la entidad (Res. 1519 de 2020, Anexo 2 – pie de página) */
const ENTIDAD = {
  nombre: 'E.S.E. HOSPITAL SAN JOSÉ DEL GUAVIARE',
  direccion: 'Calle 12 con Carrera 20, Barrio La Esperanza',
  ciudad: 'San José del Guaviare – Guaviare, Colombia',
  codigoPostal: '950001',
  horario: [
    'Lunes a viernes: 7:00 a.m. – 12:00 m. y 2:00 p.m. – 6:00 p.m.',
    'Sábados: 8:00 a.m. – 1:00 p.m.',
    'Urgencias: 24 horas, todos los días',
  ],
  telefonos: [
    { etiqueta: 'Conmutador', numero: '(608) 584 0531', tel: '+576085840531' },
    { etiqueta: 'Celular', numero: '318 568 9597', tel: '+573185689597' },
    { etiqueta: 'Urgencias y ambulancia (24 h)', numero: '316 744 0324', tel: '+573167440324' },
  ],
  correoInstitucional: 'contactenos@esehospitalguaviare.gov.co',
  correoJudicial: 'representacionjudcial@esehospitalguaviare.gov.co',
  /** Res. 1519: línea anticorrupción / denuncias. Deje null mientras no exista; aparece sola al llenarla */
  lineaAnticorrupcion: null as { numero: string; tel: string } | null,
  redes: [
    { red: 'Facebook', usuario: 'hospitalsanjosedelguaviare', icono: 'facebook', url: 'https://www.facebook.com/hospitalsanjosedelguaviare' },
    { red: 'Instagram', usuario: '@ese_hsjg', icono: 'instagram', url: 'https://www.instagram.com/ese_hsjg/' },
    { red: 'X (Twitter)', usuario: '@ESE_HSJG', icono: 'x', url: 'https://x.com/ESE_HSJG' },
    { red: 'YouTube', usuario: 'E.S.E. Hospital San José del Guaviare', icono: 'youtube', url: 'https://www.youtube.com/@esehospitalsanjosedelguavi7955' },
  ],
};

/** Enlaces de respaldo si el CMS aún no tiene el menú "Pie de página" */
const PIE_FIJO: EnlacePie[] = [
  { titulo: 'Políticas de privacidad y tratamiento de datos', url: '/politicas-de-privacidad', externo: false },
  { titulo: 'Términos y condiciones', url: '/terminos-y-condiciones', externo: false },
  { titulo: 'Accesibilidad', url: '/accesibilidad', externo: false },
  { titulo: 'Mapa del sitio', url: '/mapa-del-sitio', externo: false },
];

@Component({
  selector: 'app-footer',
  imports: [RouterLink],
  templateUrl: './footer.html',
  styleUrl: './footer.css',
})
export class Footer {
  private readonly cms = inject(CmsService);

  readonly entidad = ENTIDAD;
  readonly anio = new Date().getFullYear();

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
  }
}
