-- =====================================================================
-- 031 · Sedes y horarios de atención
--  - Nueva plantilla de página "sedes": sedes con mapa y contactos, horarios con estado en vivo
--  - Datos del portal anterior (inicio y portafolio de servicios)
-- No cambia entradas que ya existan (se busca por slug).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'sedes', descripcion = COALESCE(NULLIF(descripcion, ''), 'Dirección, teléfonos, ubicación en el mapa y horarios de atención de la E.S.E. Hospital San José del Guaviare.') WHERE slug = 'sedes-y-horarios' AND plantilla = 'contenido';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sede principal – E.S.E. Hospital San José del Guaviare', 'sede-principal', 'Calle 12 con Carrera 20 esquina, Barrio La Esperanza, San José del Guaviare', '<ul><li>Teléfono fijo: (608) 584 0531</li><li>Celular: 318 568 9597</li><li>Urgencias y ambulancia (24 horas): 316 744 0324</li><li>Correo para PQRSFD: contactenos@esehospitalguaviare.gov.co</li><li>Notificaciones judiciales: representacionjudcial@esehospitalguaviare.gov.co</li></ul><p>Coordenadas: 2.5661592, -72.6450748</p>', 'articulo', 'Sede', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sede-principal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención al público y consulta externa', 'horario-atencion-al-publico', 'Lunes a viernes 7:00-12:00, 14:00-18:00; Sábados 8:00-13:00', '<p>Citas, trámites, ventanilla y consulta externa con especialistas.</p>', 'articulo', 'Horario', 'govco:user-md', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-atencion-al-publico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Urgencias', 'horario-urgencias', 'Todos los días 24 horas', '<p>Atención de urgencias de baja y mediana complejidad.</p>', 'articulo', 'Horario', 'govco:hospital-symbol', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-urgencias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ambulancia', 'horario-ambulancia', 'Todos los días 24 horas', '<p>Línea de emergencias: 316 744 0324.</p>', 'articulo', 'Horario', 'govco:ambulance', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-ambulancia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Laboratorio clínico', 'horario-laboratorio-clinico', 'Todos los días 24 horas', NULL, 'articulo', 'Horario', 'govco:flask', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-laboratorio-clinico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Farmacia', 'horario-farmacia', 'Todos los días 24 horas', NULL, 'articulo', 'Horario', 'govco:pills', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-farmacia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Imágenes diagnósticas de urgencias', 'horario-imagenes-diagnosticas', 'Todos los días 24 horas', NULL, 'articulo', 'Horario', 'govco:x-ray', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (inicio y portafolio de servicios)'
  FROM cms_paginas p WHERE p.slug = 'sedes-y-horarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'horario-imagenes-diagnosticas');
