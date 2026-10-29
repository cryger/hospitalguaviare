-- =====================================================================
-- 026 · Estructura orgánica: organigrama interactivo
--  - Nueva plantilla de página "organigrama"
--  - Cada dependencia es una entrada: su "categoría" es el nivel del organigrama
--    (Dirección, Revisoría fiscal, Gerencia, Asesoría, Control, Subgerencias)
--  - El PDF oficial del organigrama se conserva como documento descargable
-- No cambia dependencias que ya existan (se busca por slug).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'organigrama' WHERE slug = 'estructura-organica-organigrama' AND plantilla IN ('contenido', 'documentos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Junta Directiva', 'junta-directiva', 'Máximo órgano de dirección de la E.S.E. Define las políticas institucionales y aprueba los planes y el presupuesto.', '<p>Es el máximo órgano de dirección de la Empresa Social del Estado. Define las políticas generales de la institución, aprueba los planes de desarrollo y de acción, el presupuesto y los estatutos, y evalúa la gestión de la Gerencia.</p>', 'articulo', 'Dirección', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'junta-directiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Revisor Fiscal', 'revisor-fiscal', 'Fiscaliza la gestión financiera y contable de la entidad y rinde informes a la Junta Directiva.', '<p>Ejerce la fiscalización independiente de las operaciones financieras, contables y patrimoniales de la E.S.E., y presenta sus informes y recomendaciones a la Junta Directiva.</p>', 'articulo', 'Revisoría fiscal', 'govco:search-dollar', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'revisor-fiscal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gerencia', 'gerencia', 'Representa legalmente a la E.S.E. y dirige su gestión administrativa, financiera y asistencial.', '<p>La Gerencia representa legalmente a la E.S.E. Hospital San José del Guaviare y dirige, coordina y controla la gestión institucional, en cumplimiento de las políticas de la Junta Directiva y del plan de desarrollo.</p>', 'articulo', 'Gerencia', 'govco:user-tie', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'gerencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Oficina Jurídica y Contratación', 'oficina-juridica-y-contratacion', 'Asesora jurídicamente a la entidad, atiende su defensa judicial y gestiona los procesos de contratación.', '<p>Brinda asesoría jurídica a la Gerencia y a las dependencias, ejerce la representación judicial y extrajudicial de la entidad y adelanta los procesos de contratación conforme al manual de contratación.</p>', 'articulo', 'Asesoría', 'govco:balance-scale', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'oficina-juridica-y-contratacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Oficina de Planeación', 'oficina-de-planeacion', 'Formula y hace seguimiento al plan de desarrollo, los planes de acción y los proyectos institucionales.', '<p>Orienta la formulación, el seguimiento y la evaluación del plan de desarrollo institucional, los planes de acción, los proyectos de inversión y los indicadores de gestión.</p>', 'articulo', 'Asesoría', 'govco:chart-line', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'oficina-de-planeacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Oficina de Calidad', 'oficina-de-calidad', 'Lidera el Sistema Obligatorio de Garantía de la Calidad en Salud y la mejora continua.', '<p>Coordina el Sistema Obligatorio de Garantía de la Calidad en Salud: habilitación, auditoría para el mejoramiento de la calidad, seguridad del paciente y el camino hacia la acreditación.</p>', 'articulo', 'Asesoría', 'govco:award', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'oficina-de-calidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Oficina de Control Interno de Gestión', 'oficina-control-interno-de-gestion', 'Evalúa el sistema de control interno y hace seguimiento independiente a la gestión de la entidad.', '<p>Evalúa de manera independiente el sistema de control interno, hace seguimiento a los planes y a la gestión de riesgos, y acompaña a las dependencias en el fomento de la cultura del autocontrol.</p>', 'articulo', 'Control', 'govco:clipboard-check', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'oficina-control-interno-de-gestion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Oficina de Control Interno Disciplinario', 'oficina-de-control-interno-disciplinario', 'Adelanta los procesos disciplinarios relacionados con los servidores públicos de la entidad.', '<p>Adelanta, en primera instancia, las actuaciones disciplinarias relacionadas con los servidores y exservidores públicos de la entidad, y promueve acciones preventivas.</p>', 'articulo', 'Control', 'govco:gavel', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 80, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'oficina-de-control-interno-disciplinario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Subgerencia de Servicios de Salud', 'subgerencia-de-servicios-de-salud', 'Dirige la prestación de los servicios de salud: consulta externa, urgencias, internación, cirugía y apoyo diagnóstico.', '<p>Dirige, coordina y evalúa la prestación de los servicios asistenciales del hospital: consulta externa, urgencias, hospitalización, atención materno infantil, cirugía y servicios de apoyo diagnóstico y terapéutico.</p><p><a href="/nuestro-hospital/portafolio-de-servicios">Conozca el portafolio de servicios</a></p>', 'articulo', 'Subgerencias', 'govco:stethoscope', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 90, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'subgerencia-de-servicios-de-salud');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Subgerencia Administrativa y Financiera', 'subgerencia-administrativa-y-financiera', 'Gestiona el talento humano, los recursos financieros, físicos y tecnológicos de la entidad.', '<p>Dirige la gestión del talento humano, el presupuesto, la contabilidad, la tesorería, la facturación y cartera, las compras y los recursos físicos y tecnológicos de la entidad.</p>', 'articulo', 'Subgerencias', 'govco:coins', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 100, 'esehospitalguaviare.gov.co (Estructura orgánica)'
  FROM cms_paginas p
 WHERE p.slug = 'estructura-organica-organigrama'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'subgerencia-administrativa-y-financiera');
