-- =====================================================================
-- 032 · Plataforma estratégica (misión, visión y valores)
--  - Nueva plantilla de página "plataforma": misión y visión destacadas,
--    valores en tarjetas con ícono, objetivos/funciones/deberes en listas
--  - La página 1.1 pasa a usar la plantilla
--  - Misión y visión reciben su sección, ícono y ejes (viñetas) si no los tienen
-- No borra contenido; solo completa lo que falta.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes','plataforma') NOT NULL DEFAULT 'contenido';

UPDATE cms_paginas
   SET plantilla = 'plataforma',
       descripcion = COALESCE(NULLIF(descripcion, ''), 'Plataforma estratégica de la E.S.E. Hospital San José del Guaviare: misión, visión y valores corporativos.')
 WHERE slug = 'mision-vision-funciones-y-deberes' AND plantilla = 'contenido';

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id
   SET e.categoria = COALESCE(e.categoria, 'Misión'),
       e.icono = COALESCE(e.icono, 'govco:bullseye'),
       e.contenido = CONCAT(e.contenido, '\n<ul><li>Servicios integrales</li><li>Eficiencia</li><li>Calidad</li><li>Enfoque diferencial</li><li>Calidez humana</li><li>Desarrollo profesional</li><li>Bienestar de usuarios, colaboradores y familias</li></ul>')
 WHERE p.slug = 'mision-vision-funciones-y-deberes' AND e.slug = 'mision' AND e.contenido NOT LIKE '%<ul%';

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id
   SET e.categoria = COALESCE(e.categoria, 'Visión'),
       e.icono = COALESCE(e.icono, 'govco:eye'),
       e.contenido = CONCAT(e.contenido, '\n<ul><li>Referente de la región</li><li>Acreditado</li><li>Innovador</li><li>Competitivo</li><li>Sostenibilidad financiera</li><li>Cultura organizacional sólida</li><li>Mediana y alta complejidad</li><li>Amigable con el medio ambiente</li></ul>')
 WHERE p.slug = 'mision-vision-funciones-y-deberes' AND e.slug = 'vision' AND e.contenido NOT LIKE '%<ul%';

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id
   SET e.categoria = COALESCE(e.categoria, 'Valores')
 WHERE p.slug = 'mision-vision-funciones-y-deberes' AND e.slug = 'valores-corporativos';
