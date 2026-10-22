-- =====================================================================
-- 007 · Orden del menú principal
--   Transparencia · Nuestro Hospital · Atención y servicios a la
--   ciudadanía · Participa · Información de interés
-- Solo cambia el orden (no borra nada).
-- =====================================================================
UPDATE cms_paginas SET orden = 0 WHERE slug = 'transparencia' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 1 WHERE slug = 'nuestro-hospital' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 2 WHERE slug = 'atencion-y-servicios-a-la-ciudadania' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 3 WHERE slug = 'participa' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 4 WHERE slug = 'informacion-de-interes' AND parent_id IS NULL;
