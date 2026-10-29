-- =====================================================================
-- 029 · Comité de Convivencia Laboral: misma organización del portal anterior
-- (/convivencia/59): "Comité de convivencia 2026" y "Anuncios 2026".
-- Los 10 documentos ya se migraron en 013; aquí se separan en dos grupos,
-- se ajustan las fechas y se describe la página. Solo actúa si nadie la ha cambiado.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas
   SET descripcion = 'Instancia que promueve un buen ambiente laboral y previene y atiende las situaciones que pueden constituir acoso laboral (Ley 1010 de 2006). Aquí se publican su conformación, comunicados y los documentos de elección de sus integrantes.'
 WHERE slug = 'comite-de-convivencia-laboral'
   AND (descripcion IS NULL OR descripcion = '' OR descripcion LIKE 'Resoluciones, comunicados y actas del proceso de conformación%');

-- Grupo 1: Comité de convivencia 2026 (resolución y comunicados)
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'comite-de-convivencia-laboral'
   SET e.titulo = 'Comité de Convivencia Laboral 2026',
       e.resumen = 'Resolución de conformación y comunicados del proceso.',
       e.categoria = 'Comité de convivencia 2026',
       e.fecha_publicacion = '2026-08-03 12:00:00',
       e.orden = 0
 WHERE e.slug = 'conformacion-comite-convivencia-2026' AND e.categoria IS NULL;

-- Grupo 2: Anuncios 2026 (oficio, actas y aspirantes)
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Anuncios de la elección 2026', 'anuncios-eleccion-comite-convivencia-2026',
       'Oficio de Gerencia, actas de apertura y cierre de la elección y aspirantes inscritos.', NULL, 'documento', 'Anuncios 2026',
       'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-03 12:00:00', 1, 'esehospitalguaviare.gov.co/convivencia/59'
  FROM cms_paginas p
 WHERE p.slug = 'comite-de-convivencia-laboral'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'anuncios-eleccion-comite-convivencia-2026');

-- Mueve los 4 documentos de anuncios al nuevo grupo (en el orden del portal anterior)
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT a.id, m.id,
       CASE m.url
         WHEN 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/OFICIO%20DE%20GERENCIA.pdf' THEN 0
         WHEN 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20CIERRE%20ELECCI%C3%93N%20COMITE%20DE%20CONVIVENCIA%20LABORAL.pdf' THEN 1
         WHEN 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20APERTURA%20ELECCI%C3%93N%20COMITE%20CONVIVENCIA%20LABORAL.pdf' THEN 2
         ELSE 3 END
  FROM cms_entradas a
  JOIN cms_paginas p ON p.id = a.pagina_id AND p.slug = 'comite-de-convivencia-laboral'
  JOIN cms_multimedia m ON m.url IN (
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/OFICIO%20DE%20GERENCIA.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20CIERRE%20ELECCI%C3%93N%20COMITE%20DE%20CONVIVENCIA%20LABORAL.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20APERTURA%20ELECCI%C3%93N%20COMITE%20CONVIVENCIA%20LABORAL.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Aspirantes%20Inscritos%20comite%20de%20convivencia%20laboral.pdf')
 WHERE a.slug = 'anuncios-eleccion-comite-convivencia-2026';

DELETE em FROM cms_entrada_multimedia em
  JOIN cms_entradas e ON e.id = em.entrada_id AND e.slug = 'conformacion-comite-convivencia-2026'
  JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'comite-de-convivencia-laboral'
  JOIN cms_multimedia m ON m.id = em.multimedia_id
 WHERE m.url IN (
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/OFICIO%20DE%20GERENCIA.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20CIERRE%20ELECCI%C3%93N%20COMITE%20DE%20CONVIVENCIA%20LABORAL.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20APERTURA%20ELECCI%C3%93N%20COMITE%20CONVIVENCIA%20LABORAL.pdf',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Aspirantes%20Inscritos%20comite%20de%20convivencia%20laboral.pdf')
   AND EXISTS (SELECT 1 FROM (SELECT x.entrada_id FROM cms_entrada_multimedia x JOIN cms_entradas y ON y.id = x.entrada_id
                               WHERE y.slug = 'anuncios-eleccion-comite-convivencia-2026') t);
