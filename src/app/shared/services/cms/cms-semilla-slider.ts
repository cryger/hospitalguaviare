/* Diapositivas del slider del inicio para el modo local.
 * Mismo contenido que api/migraciones/016-slider.sql */
import { Banner } from '../../models/slider/banner';

export const BANNERS_SEMILLA: Omit<Banner, 'id'>[] = [
  {
    "titulo": null,
    "descripcion": null,
    "imagenUrl": "assets/img/slider/BANNER_PLATAFORMA-2025.jpg",
    "imagenMovilUrl": null,
    "alt": "Acércate a nosotros: conoce la plataforma estratégica de la E.S.E. Hospital San José del Guaviare. Ingresa aquí.",
    "enlaceUrl": "/transparencia/informacion-de-la-entidad/mision-vision-funciones-y-deberes",
    "textoBoton": null,
    "nuevaPestana": false,
    "orden": 0,
    "estado": "publicado",
    "fechaInicio": null,
    "fechaFin": null
  },
  {
    "titulo": "Atención en Urgencias 24/7",
    "descripcion": "Atención oportuna y humanizada para toda la comunidad.",
    "imagenUrl": "assets/img/slider/vacunacion.jpg",
    "imagenMovilUrl": null,
    "alt": "Profesional de enfermería aplica una vacuna a una usuaria durante una jornada de salud.",
    "enlaceUrl": "/atencion-y-servicios-a-la-ciudadania",
    "textoBoton": "Conoce más",
    "nuevaPestana": false,
    "orden": 1,
    "estado": "publicado",
    "fechaInicio": null,
    "fechaFin": null
  },
  {
    "titulo": null,
    "descripcion": null,
    "imagenUrl": "assets/img/slider/pqrsf.jpg",
    "imagenMovilUrl": null,
    "alt": "¿Tienes preguntas, quejas o sugerencias? ¡Estamos para ti! Tu opinión es importante y nos ayuda a mejorar. Déjanos aquí tus PQRSF.",
    "enlaceUrl": "/pqrsf",
    "textoBoton": null,
    "nuevaPestana": false,
    "orden": 2,
    "estado": "publicado",
    "fechaInicio": null,
    "fechaFin": null
  }
];
