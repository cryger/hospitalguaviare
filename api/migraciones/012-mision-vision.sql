-- =====================================================================
-- 012 · Misión, visión y valores corporativos (Plataforma estratégica)
-- Contenido del portal anterior (esehospitalguaviare.gov.co/plataforma-estrategica/2).
-- Se publica en Transparencia › 1.1 Misión, visión, funciones y deberes, y
-- Nuestro Hospital › Misión y visión enlaza a esa misma sección (una sola
-- fuente de información). No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Misión', 'mision', 'Somos la ESE Hospital San José del Guaviare, comprometidos con la prestación de servicios de salud integrales, eficientes, con calidad, enfoque diferencial y calidez humana.', '<p>Somos la ESE Hospital San José del Guaviare, comprometidos con la prestación de servicios de salud integrales, eficientes, con calidad, enfoque diferencial y calidez humana; aportando a la excelencia y el desarrollo profesional, promoviendo el bienestar al usuario, colaboradores y sus familias.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co/plataforma-estrategica/2'
  FROM cms_paginas p WHERE p.slug = 'mision-vision-funciones-y-deberes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'mision');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Visión', 'vision', 'En el 2031, seremos el hospital referente de la región, acreditado, innovador, competitivo, con sostenibilidad financiera y cultura organizacional sólida.', '<p>En el 2031, seremos el hospital referente de la región, acreditado, innovador, competitivo, con sostenibilidad financiera y cultura organizacional sólida; enfocado en brindar servicios de salud de mediana y alta complejidad que sean amigables con el medio ambiente.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co/plataforma-estrategica/2'
  FROM cms_paginas p WHERE p.slug = 'mision-vision-funciones-y-deberes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'vision');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Valores corporativos', 'valores-corporativos', 'Honestidad, compromiso, respeto, justicia, diligencia, confidencialidad, puntualidad, trabajo en equipo, innovación y humanización.', '<ul>
<li><strong>Honestidad:</strong> Actúo siempre con fundamento en la verdad, cumpliendo mis deberes con transparencia y rectitud, siempre favoreciendo el interés general.</li>
<li><strong>Compromiso:</strong> Soy consciente de la importancia de mi rol como servidor público y contratista, y estoy en disposición permanente para comprender y resolver las necesidades de las personas con las que me relaciono en mis labores cotidianas, buscando siempre mejorar su bienestar.</li>
<li><strong>Respeto:</strong> Reconozco, valoro y trato de manera digna a todas las personas, con sus virtudes y defectos, sin importar su labor, su procedencia, raza, género, títulos o cualquier otra condición.</li>
<li><strong>Justicia:</strong> Actúo con imparcialidad garantizando los derechos de las personas, con equidad, igualdad y sin discriminación.</li>
<li><strong>Diligencia:</strong> Cumplo con los deberes, funciones, actividades y responsabilidades asignadas a mi cargo de la mejor manera posible, con atención, prontitud y eficiencia, para así optimizar el uso de los recursos del Estado.</li>
<li><strong>Confidencialidad:</strong> Es la propiedad de la información por la que se garantiza que está accesible únicamente a personal autorizado a acceder a dicha información.</li>
<li><strong>Puntualidad:</strong> Llego a tiempo a cumplir con los compromisos adquiridos deliberadamente: una cita del trabajo, una reunión, un compromiso de la oficina, un trabajo pendiente por entregar, una cita médica.</li>
<li><strong>Trabajo en equipo:</strong> Fomento un clima organizacional saludable donde la colaboración, el respeto mutuo y la diversidad son valorados, contribuyendo a la articulación institucional y permitiendo dar soluciones efectivas a las situaciones presentadas.</li>
<li><strong>Innovación:</strong> Impulsamos el uso de nuevas tecnologías, metodologías y procesos creativos que optimicen la prestación de servicios de salud, buscando siempre soluciones eficientes y sostenibles.</li>
<li><strong>Humanización:</strong> Fomento un clima organizacional saludable donde la colaboración, el respeto mutuo y la diversidad son valorados, contribuyendo a la articulación institucional y permitiendo dar soluciones efectivas a las situaciones presentadas.</li>
</ul>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 2, 'esehospitalguaviare.gov.co/plataforma-estrategica/2'
  FROM cms_paginas p WHERE p.slug = 'mision-vision-funciones-y-deberes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'valores-corporativos');

-- Nuestro Hospital › Misión y visión → enlace a la sección 1.1
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Misión y visión', 'mision-vision', NULL, 'enlace', '/transparencia/informacion-de-la-entidad/mision-vision-funciones-y-deberes', 0, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'nuestro-hospital' AND n.parent_id IS NULL
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'mision-vision');

-- Si la página ya existía vacía, pasa a ser enlace (si tiene contenido propio, se respeta)
UPDATE cms_paginas p
   SET p.plantilla = 'enlace', p.url_externa = '/transparencia/informacion-de-la-entidad/mision-vision-funciones-y-deberes', p.estado = 'publicada', p.orden = 0
 WHERE p.slug = 'mision-vision'
   AND NOT EXISTS (SELECT 1 FROM (SELECT pagina_id FROM cms_entradas) e WHERE e.pagina_id = p.id);

-- Orden del submenú Nuestro Hospital
UPDATE cms_paginas SET orden = 1 WHERE slug = 'resena-historica';
UPDATE cms_paginas SET orden = 2 WHERE slug = 'portafolio-de-servicios';
UPDATE cms_paginas SET orden = 3 WHERE slug = 'sedes-y-horarios';

-- Descripción de la sección 1.1
UPDATE cms_paginas SET descripcion = 'Plataforma estratégica de la E.S.E. Hospital San José del Guaviare: misión, visión y valores corporativos.'
 WHERE slug = 'mision-vision-funciones-y-deberes' AND (descripcion IS NULL OR descripcion = '');
