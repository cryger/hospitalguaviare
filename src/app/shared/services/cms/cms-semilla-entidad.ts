/* Misión, visión y valores corporativos para el modo local.
 * Mismo contenido que api/migraciones/012-mision-vision.sql. */
import { EntradaPieSemilla } from './cms-semilla-pie';

export const ENTRADAS_ENTIDAD: (EntradaPieSemilla & { orden: number })[] = [
  {
    "paginaSlug": "mision-vision-funciones-y-deberes",
    "slug": "mision",
    "titulo": "Misión",
    "resumen": "Somos la ESE Hospital San José del Guaviare, comprometidos con la prestación de servicios de salud integrales, eficientes, con calidad, enfoque diferencial y calidez humana.",
    "contenido": "<p>Somos la ESE Hospital San José del Guaviare, comprometidos con la prestación de servicios de salud integrales, eficientes, con calidad, enfoque diferencial y calidez humana; aportando a la excelencia y el desarrollo profesional, promoviendo el bienestar al usuario, colaboradores y sus familias.</p>",
    "orden": 0
  },
  {
    "paginaSlug": "mision-vision-funciones-y-deberes",
    "slug": "vision",
    "titulo": "Visión",
    "resumen": "En el 2031, seremos el hospital referente de la región, acreditado, innovador, competitivo, con sostenibilidad financiera y cultura organizacional sólida.",
    "contenido": "<p>En el 2031, seremos el hospital referente de la región, acreditado, innovador, competitivo, con sostenibilidad financiera y cultura organizacional sólida; enfocado en brindar servicios de salud de mediana y alta complejidad que sean amigables con el medio ambiente.</p>",
    "orden": 1
  },
  {
    "paginaSlug": "mision-vision-funciones-y-deberes",
    "slug": "valores-corporativos",
    "titulo": "Valores corporativos",
    "resumen": "Honestidad, compromiso, respeto, justicia, diligencia, confidencialidad, puntualidad, trabajo en equipo, innovación y humanización.",
    "contenido": "<ul>\n<li><strong>Honestidad:</strong> Actúo siempre con fundamento en la verdad, cumpliendo mis deberes con transparencia y rectitud, siempre favoreciendo el interés general.</li>\n<li><strong>Compromiso:</strong> Soy consciente de la importancia de mi rol como servidor público y contratista, y estoy en disposición permanente para comprender y resolver las necesidades de las personas con las que me relaciono en mis labores cotidianas, buscando siempre mejorar su bienestar.</li>\n<li><strong>Respeto:</strong> Reconozco, valoro y trato de manera digna a todas las personas, con sus virtudes y defectos, sin importar su labor, su procedencia, raza, género, títulos o cualquier otra condición.</li>\n<li><strong>Justicia:</strong> Actúo con imparcialidad garantizando los derechos de las personas, con equidad, igualdad y sin discriminación.</li>\n<li><strong>Diligencia:</strong> Cumplo con los deberes, funciones, actividades y responsabilidades asignadas a mi cargo de la mejor manera posible, con atención, prontitud y eficiencia, para así optimizar el uso de los recursos del Estado.</li>\n<li><strong>Confidencialidad:</strong> Es la propiedad de la información por la que se garantiza que está accesible únicamente a personal autorizado a acceder a dicha información.</li>\n<li><strong>Puntualidad:</strong> Llego a tiempo a cumplir con los compromisos adquiridos deliberadamente: una cita del trabajo, una reunión, un compromiso de la oficina, un trabajo pendiente por entregar, una cita médica.</li>\n<li><strong>Trabajo en equipo:</strong> Fomento un clima organizacional saludable donde la colaboración, el respeto mutuo y la diversidad son valorados, contribuyendo a la articulación institucional y permitiendo dar soluciones efectivas a las situaciones presentadas.</li>\n<li><strong>Innovación:</strong> Impulsamos el uso de nuevas tecnologías, metodologías y procesos creativos que optimicen la prestación de servicios de salud, buscando siempre soluciones eficientes y sostenibles.</li>\n<li><strong>Humanización:</strong> Fomento un clima organizacional saludable donde la colaboración, el respeto mutuo y la diversidad son valorados, contribuyendo a la articulación institucional y permitiendo dar soluciones efectivas a las situaciones presentadas.</li>\n</ul>",
    "orden": 2
  }
];
