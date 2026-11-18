-- =====================================================================
-- 065 · Contenido nuevo del portal anterior (noviembre 2026)
--  Migra el contenido nuevo publicado en el portal anterior:
--   · 3 invitaciones a cotizar vigentes (nov 2026).
--   · Ejecución presupuestal 2026: meses de agosto y septiembre (gastos e
--     ingresos), que se agregan a las entradas anuales ya existentes.
--  Reutiliza los PDF del servidor anterior. Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';


-- 3 invitaciones a cotizar vigentes
INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Servicio de validación, mediciones y calibraciones de los equipos biomédicos', 'La E.S.E. Hospital San José del Guaviare requiere contratar el servicio de validación, mediciones y calibraciones de los equipos biomédicos. Consulte en el documento las especificaciones técnicas, los requisitos habilitantes y las condiciones para presentar su cotización.', 'Subgerencia Administrativa y Financiera', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20INVITACION%20A%20COTIZARvalidacion.pdf', 'Invitación a presentar cotización - Validación y calibración de equipos biomédicos.pdf', '2026-11-17 12:00:00', 'publicada', 'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE documento_url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20INVITACION%20A%20COTIZARvalidacion.pdf');
INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización', 'La E.S.E. Hospital San José del Guaviare requiere contratar el mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización. Consulte en el documento las especificaciones técnicas, los requisitos habilitantes y las condiciones para presentar su cotización.', 'Subgerencia Administrativa y Financiera', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COT%20MANTO%20PRE%20Y%20COR%20SERVICIO%20DE%20CIRUGIA.pdf', 'Invitación a presentar cotización - Mantenimiento del instrumental quirúrgico.pdf', '2026-11-10 12:00:00', 'publicada', 'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE documento_url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COT%20MANTO%20PRE%20Y%20COR%20SERVICIO%20DE%20CIRUGIA.pdf');
INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Prestación de servicios especializados en cirugía laparoscópica urológica', 'La E.S.E. Hospital San José del Guaviare requiere contratar la prestación de servicios especializados en cirugía laparoscópica urológica. Consulte en el documento las especificaciones técnicas, los requisitos habilitantes y las condiciones para presentar su cotización.', 'Subgerencia Administrativa y Financiera', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COT%20PRESTACION%20DE%20SERVICIOS%20ESPECIALIZADOS%20EN%20CIRUGIA%20LAPAROSCOPICA.pdf', 'Invitación a presentar cotización - Cirugía laparoscópica urológica.pdf', '2026-11-04 12:00:00', 'publicada', 'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE documento_url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COT%20PRESTACION%20DE%20SERVICIOS%20ESPECIALIZADOS%20EN%20CIRUGIA%20LAPAROSCOPICA.pdf');

-- Ejecución presupuestal 2026: agosto y septiembre (gastos e ingresos)
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA AGOSTO 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20AGOSTO%202026.pdf', 'documento', 'application/pdf', 'EJECUCION PASIVA AGOSTO 2026', NULL, 'esehospitalguaviare.gov.co/presupuesto (ejecución 2026)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20AGOSTO%202026.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
         WHERE q.slug = 'ejecucion-presupuestal' AND x.slug = 'ejecucion-presupuestal-de-gastos-2026'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20AGOSTO%202026.pdf'), 7;
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA SEPTIEMBRE 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20SEPTIEMBRE%202026.pdf', 'documento', 'application/pdf', 'EJECUCION PASIVA SEPTIEMBRE 2026', NULL, 'esehospitalguaviare.gov.co/presupuesto (ejecución 2026)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20SEPTIEMBRE%202026.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
         WHERE q.slug = 'ejecucion-presupuestal' AND x.slug = 'ejecucion-presupuestal-de-gastos-2026'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20SEPTIEMBRE%202026.pdf'), 8;
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA AGOSTO 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20AGOSTO%202026.pdf', 'documento', 'application/pdf', 'EJECUCION ACTIVA AGOSTO 2026', NULL, 'esehospitalguaviare.gov.co/presupuesto (ejecución 2026)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20AGOSTO%202026.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
         WHERE q.slug = 'ejecucion-presupuestal' AND x.slug = 'ejecucion-presupuestal-de-ingresos-2026'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20AGOSTO%202026.pdf'), 7;
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA SEPTIEMBRE 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20SEPTIEMBRE%202026.pdf', 'documento', 'application/pdf', 'EJECUCION ACTIVA SEPTIEMBRE 2026', NULL, 'esehospitalguaviare.gov.co/presupuesto (ejecución 2026)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20SEPTIEMBRE%202026.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
         WHERE q.slug = 'ejecucion-presupuestal' AND x.slug = 'ejecucion-presupuestal-de-ingresos-2026'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20SEPTIEMBRE%202026.pdf'), 8;
