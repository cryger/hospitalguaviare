-- =====================================================================
-- 064 · «Información para mujeres» y «Otros grupos de interés» atractivas
--  A pedido: estas dos vuelven al estilo de tarjetas (plantilla «secciones»).
--   · Mujeres: revierte el estilo sobrio del 062 (vuelve a «secciones» y
--     restaura el <h2> inicial que sirve de banner).
--   · Otros grupos de interés: la página padre pasa a una landing «secciones»
--     (presentación + dos tarjetas-enlace a sus subpáginas «Grupos étnicos» y
--     «Atención con enfoque diferencial», que ya están en secciones). Se
--     archivan las dos entradas de contenido redundantes del padre.
--  Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- --- 8.2 Información para mujeres: volver a «secciones» (revierte 062) ---
UPDATE cms_paginas SET plantilla = 'secciones', actualizado_en = NOW()
 WHERE slug = 'informacion-para-mujeres' AND plantilla = 'contenido';

UPDATE cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
   SET x.contenido = CONCAT('<h2>Salud y derechos de las mujeres</h2>', x.contenido), x.actualizado_en = NOW()
 WHERE q.slug = 'informacion-para-mujeres' AND x.estado = 'publicada' AND x.contenido NOT LIKE '<h2>%';

-- --- 8.3 Otros grupos de interés: landing «secciones» con enlaces a subpáginas ---
UPDATE cms_paginas SET plantilla = 'secciones', actualizado_en = NOW()
 WHERE slug = 'otros-grupos-de-interes' AND plantilla = 'contenido';

-- Archiva las dos entradas de contenido redundantes del padre (su contenido ya
-- vive, completo, en las subpáginas «Grupos étnicos» y «Atención con enfoque diferencial»)
UPDATE cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id AND q.slug = 'otros-grupos-de-interes'
   SET x.estado = 'archivada', x.actualizado_en = NOW()
 WHERE x.slug IN ('grupos-etnicos', 'atencion-con-enfoque-diferencial') AND x.estado = 'publicada';

-- Entrada landing (presentación + tarjetas-enlace a las subpáginas)
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Otros grupos de interés', 'otros-grupos-landing',
       'Grupos de interés con atención diferencial: grupos étnicos y atención a personas con discapacidad, adultas mayores y víctimas del conflicto armado.',
       '<h2>Otros grupos de interés</h2>\n<p>La E.S.E. Hospital San José del Guaviare reconoce la diversidad de las personas y comunidades del territorio y promueve una atención humanizada, equitativa y libre de discriminación.</p>\n<h3>Enfoque diferencial en la atención</h3>\n<p>El enfoque diferencial busca eliminar las barreras de acceso y garantizar una atención con calidad, respeto y pertinencia cultural. En esta sección encontrará la información y las rutas de atención dirigidas a los grupos étnicos del territorio y a las personas en situación de discapacidad, personas adultas mayores y personas víctimas del conflicto armado.</p>',
       'articulo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 0, 'Portal E.S.E. (reorganización grupos de interés)'
  FROM cms_paginas p WHERE p.slug = 'otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id
                    WHERE q.slug = 'otros-grupos-de-interes' AND x.slug = 'otros-grupos-landing');
