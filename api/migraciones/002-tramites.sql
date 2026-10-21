-- =====================================================================
--  Trámites y otros procedimientos (información del portal actual
--  esehospitalguaviare.gov.co, octubre de 2026).
--  No borra nada; si una entrada o documento ya existe, no se duplica.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Solicitar una cita de consulta externa', 'solicitar-cita-consulta-externa', 'Solicite su cita de consulta externa a través de WhatsApp.', '<p>Solicite su cita de consulta externa escribiendo a nuestra línea de WhatsApp.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>Escriba al WhatsApp <strong>+57 310 203 3803</strong>.</li>
<li>Indique el servicio o especialidad que necesita y sus datos de identificación.</li>
<li>Espere la confirmación de la fecha y hora de su cita.</li>
</ol>
<p><a href="https://wa.me/573102033803?text=Buenas%20tardes%2C%20deseo%20solicitar%20una%20cita" target="_blank" rel="noopener">Solicitar cita por WhatsApp</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0
  FROM cms_paginas p
 WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'solicitar-cita-consulta-externa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Solicitud de copia de historia clínica', 'copia-de-historia-clinica', 'Diligencie el formato de solicitud y envíelo al correo de historias clínicas.', '<p>Para solicitar copia de su historia clínica:</p>
<ol>
<li>Descargue y diligencie el <strong>formato de solicitud de copia de historia clínica</strong> (E-ET-FO-01).</li>
<li>Envíelo al correo <a href="mailto:historiaclinica@esehospitalguaviare.gov.co">historiaclinica@esehospitalguaviare.gov.co</a>.</li>
</ol>
<p>Consulte también el manual de manejo de historia clínica de la institución.</p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1
  FROM cms_paginas p
 WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'copia-de-historia-clinica');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, migrado_de)
SELECT 'E-ET-FO-01 FORMATO DE SOLICITUD DE COPIA DE HISTORIA CLINICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf', 'documento', 'application/pdf', 'Formato de solicitud de copia de historia clínica (E-ET-FO-01)', 'esehospitalguaviare.gov.co'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf');
INSERT INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, m.id, 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
  JOIN cms_multimedia m ON m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf'
 WHERE e.slug = 'copia-de-historia-clinica'
   AND NOT EXISTS (SELECT 1 FROM cms_entrada_multimedia x WHERE x.entrada_id = e.id AND x.multimedia_id = m.id);

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, migrado_de)
SELECT 'MANUAL DE MANEJO DE HISTORIA CLINICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20%282%29.pdf', 'documento', 'application/pdf', 'Manual de manejo de historia clínica', 'esehospitalguaviare.gov.co'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20%282%29.pdf');
INSERT INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, m.id, 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
  JOIN cms_multimedia m ON m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20%282%29.pdf'
 WHERE e.slug = 'copia-de-historia-clinica'
   AND NOT EXISTS (SELECT 1 FROM cms_entrada_multimedia x WHERE x.entrada_id = e.id AND x.multimedia_id = m.id);

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Consulta y descarga de resultados de laboratorio', 'resultados-de-laboratorio', 'Consulte y descargue en línea los resultados de sus exámenes de laboratorio.', '<p>Consulte y descargue en línea los resultados de sus exámenes de laboratorio clínico.</p>
<p><a href="http://177.93.49.210:9000/resultados/" target="_blank" rel="noopener">Ir a la consulta de resultados</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 2
  FROM cms_paginas p
 WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'resultados-de-laboratorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Radicar peticiones, quejas, reclamos, sugerencias y felicitaciones (PQRSF)', 'radicar-pqrsf', 'Presente su PQRSF por el formulario en línea, correo, teléfono, ventanilla o buzones.', '<p>Puede presentar su petición, queja, reclamo, sugerencia o felicitación por cualquiera de estos canales:</p>
<ul>
<li><strong>En línea:</strong> <a href="/pqrsf">formulario de PQRSF</a>.</li>
<li><strong>Correo electrónico:</strong> <a href="mailto:pqrs@esehospitalguaviare.gov.co">pqrs@esehospitalguaviare.gov.co</a></li>
<li><strong>Teléfono:</strong> +57 318 568 9597</li>
<li><strong>Presencial:</strong> Atención al Usuario y Ventanilla Única.</li>
<li><strong>Buzones de sugerencias:</strong> Consulta Externa, Ecografías, Laboratorio Clínico, Hospitalización, UCIM, Etnopabellón, Sala de Cirugía, Pediatría, Urgencias, Unidad Materno Infantil y Fisioterapia.</li>
</ul>
<p><a href="https://esehospitalguaviare.gov.co/seguimiento-pqrs/51" target="_blank" rel="noopener">Consultar el estado de su PQRSF</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 3
  FROM cms_paginas p
 WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'radicar-pqrsf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Seguimiento de solicitudes contractuales', 'seguimiento-solicitudes-contractuales', 'Consulte el estado de sus solicitudes contractuales ante el hospital.', '<p>Consulte el estado de las solicitudes contractuales radicadas ante la E.S.E. Hospital San José del Guaviare.</p>
<p><a href="https://esehospitalguaviare.gov.co/seguimiento-solicitudes/54" target="_blank" rel="noopener">Ir al seguimiento de solicitudes</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 4
  FROM cms_paginas p
 WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'seguimiento-solicitudes-contractuales');

UPDATE cms_paginas
   SET descripcion = 'Trámites y servicios que puede realizar ante la E.S.E. Hospital San José del Guaviare.'
 WHERE slug = 'tramites-y-otros-procedimientos' AND (descripcion IS NULL OR descripcion = '');
