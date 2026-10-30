-- =====================================================================
-- 035 · Orden de Talento humano y reglamento interno de trabajo
--  - Talento humano: los tipos de documento se muestran en un orden lógico
--    (manual de funciones, reglamento interno, planes, comités, elecciones,
--    convocatorias, acuerdo colectivo, capacitaciones, formatos)
--  - 2.1.5 Políticas, lineamientos y manuales: también publica el reglamento
--    interno de trabajo (Acuerdo 08 de 2020), en el tema «Talento humano»
-- Solo reordena entradas que aún no se han reordenado (orden < 1000).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
   SET e.orden = e.orden + 1000 * CASE e.categoria
         WHEN 'Manual de funciones' THEN 1
         WHEN 'Reglamento interno de trabajo' THEN 2
         WHEN 'Planes' THEN 3
         WHEN 'Comités y grupos' THEN 4
         WHEN 'Elecciones y representantes' THEN 5
         WHEN 'Convocatorias internas' THEN 6
         WHEN 'Convocatorias de contratación' THEN 7
         WHEN 'Acuerdo colectivo' THEN 8
         WHEN 'Capacitaciones' THEN 9
         WHEN 'Formatos' THEN 10
         ELSE 11 END
 WHERE e.orden < 1000;

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reglamento interno de trabajo – Acuerdo 08 de 2020', 'reglamento-interno-de-trabajo-acuerdo-08-de-2020',
       'Acuerdo 08 del 27 de octubre de 2020 de la Junta Directiva, por el cual se adopta el reglamento interno de trabajo.',
       NULL, 'documento', 'Talento humano', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-10-27 12:00:00', 5,
       'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reglamento-interno-de-trabajo-acuerdo-08-de-2020');

INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'reglamento-interno-de-trabajo-acuerdo-08-de-2020'
   AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf');
