-- =====================================================================
-- 053 · Racionalización de trámites (MIPG / FURAG · Ley 2052 de 2020)
--  Nueva página «Racionalización de trámites» bajo «Atención y servicios a
--  la ciudadanía», junto a «Trámites y otros procedimientos». Publica el
--  marco normativo (Ley 962/2005, D.L. 019/2012, D.L. 2106/2019, Ley
--  2052/2020), el enlace a los trámites inscritos en el SUIT/GOV.CO y una
--  estructura lista para cargar la estrategia de racionalización de cada
--  vigencia. Prioridad de la política de Gobierno Digital para FURAG.
--  No borra nada; idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- Ubica la página inmediatamente después de «Trámites y otros procedimientos»,
-- cualquiera sea su posición actual bajo «Atención y servicios a la ciudadanía».
SET @padre := (SELECT id FROM cms_paginas WHERE slug = 'atencion-y-servicios-a-la-ciudadania' LIMIT 1);
SET @tram  := (SELECT orden FROM cms_paginas WHERE parent_id = @padre AND slug = 'tramites-y-otros-procedimientos' LIMIT 1);

-- 1) Abre un hueco tras «Trámites y otros procedimientos» (solo antes de crear la nueva)
UPDATE cms_paginas
   SET orden = orden + 1
 WHERE parent_id = @padre AND @tram IS NOT NULL AND orden > @tram
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'racionalizacion-de-tramites');

-- 2) Crea la página «Racionalización de trámites» (plantilla contenido), justo después de Trámites
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Racionalización de trámites', 'racionalizacion-de-tramites', 'Estrategia de racionalización de trámites de la E.S.E. conforme a la Ley 2052 de 2020 y la política de racionalización del DAFP, con los trámites inscritos en el SUIT.', 'contenido', NULL, COALESCE(@tram, -1) + 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'racionalizacion-de-tramites');

-- 3) Contenido de la página (una entrada, si no existe)
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estrategia de racionalización de trámites', 'racionalizacion-de-tramites-marco', 'Marco normativo, trámites inscritos en el SUIT y estrategia de racionalización de la E.S.E.',
  '<p>La racionalización de trámites es el conjunto de acciones que la E.S.E. Hospital San José del Guaviare adelanta para simplificar, estandarizar, optimizar o automatizar sus trámites, con el fin de facilitar el acceso de la ciudadanía a los servicios y reducir costos, tiempos y pasos. Hace parte de la política de <strong>Racionalización de Trámites</strong> del Modelo Integrado de Planeación y Gestión (MIPG).</p><h2>Marco normativo</h2><ul><li><strong>Ley 962 de 2005</strong> y <strong>Decreto Ley 019 de 2012</strong> — racionalización y supresión de trámites (antitrámites).</li><li><strong>Decreto Ley 2106 de 2019</strong> — simplificación y digitalización de trámites.</li><li><strong>Ley 2052 de 2020</strong> — racionalización, interoperabilidad y uso de medios digitales.</li><li><strong>Decreto 1081 de 2015</strong> — componente de racionalización dentro del Plan Anticorrupción y de Atención al Ciudadano (PAAC).</li></ul><h2>Trámites inscritos en el SUIT</h2><p>Los trámites y otros procedimientos administrativos (OPA) de la entidad se registran en el <strong>Sistema Único de Información de Trámites — SUIT</strong>, administrado por el Departamento Administrativo de la Función Pública, y se ofrecen a la ciudadanía a través del portal <strong>GOV.CO</strong>:</p><ul><li><a href="https://www.funcionpublica.gov.co/web/suit" target="_blank" rel="noopener">SUIT — Sistema Único de Información de Trámites</a></li><li><a href="https://www.gov.co/" target="_blank" rel="noopener">GOV.CO — Portal Único del Estado colombiano</a></li><li><a href="/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos">Trámites y otros procedimientos</a> de la E.S.E. publicados en este portal.</li></ul><h2>Estrategia de racionalización de la vigencia</h2><p>Cada vigencia la E.S.E. formula su estrategia de racionalización de trámites, que forma parte del <strong>componente de racionalización de trámites del Plan Anticorrupción y de Atención al Ciudadano</strong>. En esta sección se publicará la estrategia vigente con: los trámites a racionalizar, el tipo de racionalización (normativa, administrativa o tecnológica), las acciones previstas, los responsables, las fechas y el beneficio para la ciudadanía, junto con los informes de seguimiento registrados en el SUIT.</p><h2>Avances del hospital</h2><p>La E.S.E. ha avanzado en la racionalización tecnológica de varios trámites y servicios, que hoy pueden realizarse en línea desde este portal:</p><ul><li><a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">Solicitud de citas y copia de historia clínica en línea</a>.</li><li><a href="/pqrsf">Radicación y seguimiento de PQRSFD en línea</a>.</li><li><a href="/participacion">Participación ciudadana</a> y consulta de aportes por radicado.</li></ul>',
  'articulo', 'Trámites', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento MIPG / FURAG — Racionalización de trámites (Ley 2052 de 2020)'
  FROM cms_paginas p WHERE p.slug = 'racionalizacion-de-tramites'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'racionalizacion-de-tramites' AND x.slug = 'racionalizacion-de-tramites-marco');
