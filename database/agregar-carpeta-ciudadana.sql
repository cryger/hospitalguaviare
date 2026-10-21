-- =====================================================================
--  Agrega el acceso a la Carpeta Ciudadana Digital (MinTIC) dentro de
--  "Atención y servicios a la ciudadanía" en una base de datos existente.
--  No borra nada. Si el enlace ya existe, no hace cambios.
-- =====================================================================
SET NAMES utf8mb4;

INSERT INTO cms_paginas
  (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT a.menu_id, a.id,
       'Carpeta Ciudadana Digital',
       'carpeta-ciudadana-digital',
       'Consulte en un solo lugar sus documentos e información en poder del Estado colombiano.',
       'enlace',
       'https://carpetaciudadana.and.gov.co/',
       (SELECT COUNT(*) FROM cms_paginas h WHERE h.parent_id = a.id),
       1,
       'publicada'
  FROM cms_paginas a
 WHERE a.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'carpeta-ciudadana-digital');

SELECT id, titulo, url_externa FROM cms_paginas WHERE slug = 'carpeta-ciudadana-digital';
