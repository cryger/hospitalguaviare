-- =====================================================================
-- 058 · «Consulta tu radicado» (RT-06) · ventanilla única de consulta
--  Nuevo acceso bajo «Atención y servicios a la ciudadanía» (plantilla
--  enlace a /consulta-radicado). Permite consultar por radicado el estado
--  de PQRSFD, copia de historia clínica, aportes de participación y
--  solicitudes contractuales. Se ubica junto a PQRSFD. Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

SET @padre := (SELECT id FROM cms_paginas WHERE slug = 'atencion-y-servicios-a-la-ciudadania' LIMIT 1);
SET @ord   := (SELECT orden FROM cms_paginas WHERE parent_id = @padre AND slug = 'pqrsd' LIMIT 1);

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Consulta tu radicado', 'consulta-radicado',
  'Consulta el estado de tu PQRSFD, copia de historia clínica, aporte ciudadano o solicitud contractual con el número de radicado.',
  'enlace', '/consulta-radicado', COALESCE(@ord, 1), 1, 'publicada'
  FROM cms_paginas p WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'consulta-radicado');
