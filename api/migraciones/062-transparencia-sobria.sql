-- =====================================================================
-- 062 · Estilo sobrio (texto) para 11 páginas de transparencia
--  A pedido: las páginas informativas vuelven de «secciones» (tarjetas de
--  colores) a «contenido» (texto institucional sobrio). Se quita además el
--  <h2> inicial que servía de banner en «secciones» para no duplicar el
--  título. Las páginas de participación se conservan en «secciones».
--  Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'contenido'
 WHERE plantilla = 'secciones' AND slug IN (
   'leyes',
   'agenda-regulatoria',
   'proyectos-de-normas-para-comentarios',
   'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas',
   'informacion-sobre-decisiones-que-pueden-afectar-al-publico',
   'publicacion-de-hojas-de-vida',
   'publicacion-de-la-ejecucion-de-los-contratos',
   'costos-de-reproduccion-de-la-informacion-publica',
   'reporte-de-informacion-especifica',
   'racionalizacion-de-tramites',
   'informacion-para-mujeres'
 );

-- Quita el <h2> inicial (banner de «secciones») del contenido de esas páginas
UPDATE cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
   SET x.contenido = TRIM(SUBSTRING(x.contenido FROM LOCATE('</h2>', x.contenido) + 5)), x.actualizado_en = NOW()
 WHERE q.slug IN (
   'leyes',
   'agenda-regulatoria',
   'proyectos-de-normas-para-comentarios',
   'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas',
   'informacion-sobre-decisiones-que-pueden-afectar-al-publico',
   'publicacion-de-hojas-de-vida',
   'publicacion-de-la-ejecucion-de-los-contratos',
   'costos-de-reproduccion-de-la-informacion-publica',
   'reporte-de-informacion-especifica',
   'racionalizacion-de-tramites',
   'informacion-para-mujeres'
 ) AND x.contenido LIKE '<h2>%';
