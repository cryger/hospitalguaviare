-- =====================================================================
-- 006 · Orden del menú principal
-- "Información de interés" pasa a la posición de "Atención y servicios
-- a la ciudadanía" y viceversa. Solo cambia el orden (no borra nada).
--   Transparencia · Información de interés · Participa ·
--   Nuestro Hospital · Atención y servicios a la ciudadanía
-- =====================================================================
UPDATE cms_paginas SET orden = 1 WHERE slug = 'informacion-de-interes' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 4 WHERE slug = 'atencion-y-servicios-a-la-ciudadania' AND parent_id IS NULL;
