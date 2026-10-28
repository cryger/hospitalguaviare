-- =====================================================================
-- 020 · Trámites: los enlaces de PQRSFD y solicitudes contractuales
--       apuntan a los formularios del portal nuevo (antes, al portal anterior).
-- Solo cambia las entradas que todavía tienen los enlaces viejos. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
   SET e.titulo = 'Radicar peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias (PQRSFD)',
       e.resumen = 'Presente su PQRSFD en línea y consulte su estado con el número de radicado.',
       e.contenido = '<p>Puede presentar su petición, queja, reclamo, sugerencia, felicitación o denuncia por cualquiera de estos canales:</p>
<ul>
<li><strong>En línea:</strong> <a href="/pqrsf">formulario de PQRSFD</a>. Al radicar recibe un número de radicado y un código de consulta.</li>
<li><strong>Correo electrónico:</strong> <a href="mailto:pqrs@esehospitalguaviare.gov.co">pqrs@esehospitalguaviare.gov.co</a></li>
<li><strong>Teléfono:</strong> +57 318 568 9597</li>
<li><strong>Presencial:</strong> Atención al Usuario y Ventanilla Única.</li>
<li><strong>Buzones de sugerencias:</strong> Consulta Externa, Ecografías, Laboratorio Clínico, Hospitalización, UCIM, Etnopabellón, Sala de Cirugía, Pediatría, Urgencias, Unidad Materno Infantil y Fisioterapia.</li>
</ul>
<p><a href="/pqrsf?consultar">Consultar el estado de su PQRSFD</a></p>'
 WHERE e.slug = 'radicar-pqrsf' AND e.contenido LIKE '%seguimiento-pqrs/51%';

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
   SET e.titulo = 'Solicitudes contractuales',
       e.resumen = 'Solicite certificaciones de sus contratos y consulte el estado de su solicitud.',
       e.contenido = '<p>Si tuvo o tiene un contrato con la E.S.E. Hospital San José del Guaviare, solicite en línea la certificación contractual. La respuesta se entrega en máximo 10 días hábiles.</p>
<p><a href="/solicitudes-contractuales">Hacer una solicitud</a> · <a href="/solicitudes-contractuales?consultar">Consultar y descargar con su cédula y el radicado</a></p>'
 WHERE e.slug = 'seguimiento-solicitudes-contractuales' AND e.contenido LIKE '%seguimiento-solicitudes/54%';

