-- =====================================================================
--  SINCRONIZA LA ESTRUCTURA DEL CMS CON LA RESOLUCIÓN 1519 DE 2020
--
--  ✅ NO BORRA NADA. Se puede ejecutar varias veces sin duplicar.
--  - Renombra/ubica las páginas de la estructura anterior que tienen
--    equivalente en la nueva (conservando sus entradas).
--  - Agrega las páginas que falten (busca por slug).
--  - Oculta del menú (no borra) las páginas anteriores que ya no van en él.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- Menús base
INSERT INTO cms_menus (nombre, ubicacion)
SELECT 'Menú principal', 'principal' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM cms_menus WHERE ubicacion = 'principal');
INSERT INTO cms_menus (nombre, ubicacion)
SELECT 'Pie de página', 'pie' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM cms_menus WHERE ubicacion = 'pie');

-- 1) Páginas de la estructura anterior con equivalente en la nueva
UPDATE cms_paginas SET slug = 'atencion-y-servicios-a-la-ciudadania', titulo = 'Atención y servicios a la ciudadanía'
 WHERE slug = 'atencion-ciudadano'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'atencion-y-servicios-a-la-ciudadania');
UPDATE cms_paginas SET slug = 'politicas-de-privacidad', titulo = 'Políticas de privacidad y tratamiento de datos'
 WHERE slug = 'politicas-privacidad'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'politicas-de-privacidad');
UPDATE cms_paginas SET slug = 'normativa', titulo = '2. Normativa', plantilla = 'contenido'
 WHERE slug = 'normatividad'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'normativa');
-- Transparencia y Participa ya no usan la plantilla de documentos: muestran sus secciones
UPDATE cms_paginas SET titulo = 'Transparencia y acceso a la información pública', plantilla = 'contenido' WHERE slug = 'transparencia';

-- 2) Agrega las páginas que falten (en orden: primero las superiores)

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Transparencia y acceso a la información pública', 'transparencia', 'Información pública de la E.S.E. Hospital San José del Guaviare, organizada según la Ley 1712 de 2014 y la Resolución 1519 de 2020 de MinTIC.', 'contenido', NULL, 0, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'transparencia');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1. Información de la entidad', 'informacion-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-de-la-entidad');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.1 Misión, visión, funciones y deberes', 'mision-vision-funciones-y-deberes', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'mision-vision-funciones-y-deberes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.2 Estructura orgánica - Organigrama', 'estructura-organica-organigrama', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'estructura-organica-organigrama');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.3 Mapas y cartas descriptivas de los procesos', 'mapas-y-cartas-descriptivas-de-los-procesos', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'mapas-y-cartas-descriptivas-de-los-procesos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.4 Directorio institucional', 'directorio-institucional', NULL, 'contenido', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'directorio-institucional');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.5 Directorio de servidores públicos, empleados o contratistas', 'directorio-de-servidores-publicos-empleados-o-contratistas', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'directorio-de-servidores-publicos-empleados-o-contratistas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.6 Directorio de entidades', 'directorio-de-entidades', NULL, 'contenido', NULL, 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'directorio-de-entidades');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.7 Directorio de agremiaciones, asociaciones y otros grupos de interés', 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes', NULL, 'contenido', NULL, 6, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.8 Servicio al público, normas, formularios y protocolos de atención', 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion', NULL, 'documentos', NULL, 7, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.9 Procedimientos que se siguen para tomar decisiones en las diferentes áreas', 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas', NULL, 'documentos', NULL, 8, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.10 Mecanismo de presentación directa de solicitudes, quejas y reclamos', 'mecanismo-pqrsd', NULL, 'enlace', '/pqrsf', 9, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'mecanismo-pqrsd');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.11 Calendario de actividades y eventos', 'calendario-de-actividades-y-eventos', NULL, 'contenido', NULL, 10, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'calendario-de-actividades-y-eventos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.12 Información sobre decisiones que pueden afectar al público', 'informacion-sobre-decisiones-que-pueden-afectar-al-publico', NULL, 'documentos', NULL, 11, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-sobre-decisiones-que-pueden-afectar-al-publico');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.13 Entes y autoridades que lo vigilan', 'entes-y-autoridades-que-lo-vigilan', NULL, 'contenido', NULL, 12, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'entes-y-autoridades-que-lo-vigilan');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '1.14 Publicación de hojas de vida', 'publicacion-de-hojas-de-vida', NULL, 'documentos', NULL, 13, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'publicacion-de-hojas-de-vida');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2. Normativa', 'normativa', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'normativa');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1 Normativa de la entidad', 'normativa-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'normativa-de-la-entidad');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.1 Leyes', 'leyes', NULL, 'documentos', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'leyes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.2 Decreto único reglamentario', 'decreto-unico-reglamentario', NULL, 'documentos', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'decreto-unico-reglamentario');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.3 Normativa aplicable', 'normativa-aplicable', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'normativa-aplicable');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.4 Vínculo al Diario o Gaceta Oficial', 'vinculo-al-diario-o-gaceta-oficial', NULL, 'enlace', 'http://www.imprenta.gov.co/diario-oficial', 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'vinculo-al-diario-o-gaceta-oficial');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.5 Políticas, lineamientos y manuales', 'politicas-lineamientos-y-manuales', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'politicas-lineamientos-y-manuales');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.1.6 Agenda regulatoria', 'agenda-regulatoria', NULL, 'documentos', NULL, 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa-de-la-entidad' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'agenda-regulatoria');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.2 Búsqueda de normas', 'busqueda-de-normas', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'busqueda-de-normas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.2.1 Sistema Único de Información Normativa - SUIN', 'sistema-unico-de-informacion-normativa-suin', NULL, 'enlace', 'https://www.suin-juriscol.gov.co', 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'busqueda-de-normas' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'sistema-unico-de-informacion-normativa-suin');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.2.2 Sistema de búsqueda de normas propio de la entidad', 'sistema-de-busqueda-de-normas-propio-de-la-entidad', NULL, 'documentos', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'busqueda-de-normas' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'sistema-de-busqueda-de-normas-propio-de-la-entidad');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '2.3 Proyectos de normas para comentarios', 'proyectos-de-normas-para-comentarios', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'normativa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'proyectos-de-normas-para-comentarios');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3. Contratación', 'contratacion', NULL, 'contenido', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'contratacion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3.1 Plan Anual de Adquisiciones', 'plan-anual-de-adquisiciones', NULL, 'documentos', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'contratacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'plan-anual-de-adquisiciones');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3.2 Publicación de la información contractual', 'publicacion-de-la-informacion-contractual', NULL, 'documentos', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'contratacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'publicacion-de-la-informacion-contractual');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3.3 Publicación de la ejecución de los contratos', 'publicacion-de-la-ejecucion-de-los-contratos', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'contratacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'publicacion-de-la-ejecucion-de-los-contratos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3.4 Manual de contratación, adquisición y/o compras', 'manual-de-contratacion-adquisicion-yo-compras', NULL, 'documentos', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'contratacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'manual-de-contratacion-adquisicion-yo-compras');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '3.5 Formatos o modelos de contratos o pliegos tipo', 'formatos-o-modelos-de-contratos-o-pliegos-tipo', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'contratacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4. Planeación, presupuesto e informes', 'planeacion-presupuesto-e-informes', NULL, 'contenido', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'planeacion-presupuesto-e-informes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.1 Presupuesto general de ingresos, gastos e inversión', 'presupuesto-general-de-ingresos-gastos-e-inversion', NULL, 'documentos', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.2 Ejecución presupuestal', 'ejecucion-presupuestal', NULL, 'documentos', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'ejecucion-presupuestal');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.3 Plan de acción', 'plan-de-accion', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'plan-de-accion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.4 Proyectos de inversión', 'proyectos-de-inversion', NULL, 'documentos', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'proyectos-de-inversion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.5 Informes de empalme', 'informes-de-empalme', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informes-de-empalme');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.6 Información pública y/o relevante', 'informacion-publica-yo-relevante', NULL, 'documentos', NULL, 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-publica-yo-relevante');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.7 Informes de gestión, evaluación y auditoría', 'informes-de-gestion-evaluacion-y-auditoria', NULL, 'documentos', NULL, 6, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informes-de-gestion-evaluacion-y-auditoria');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.8 Informes de la Oficina de Control Interno', 'informes-de-la-oficina-de-control-interno', NULL, 'documentos', NULL, 7, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informes-de-la-oficina-de-control-interno');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.9 Informe sobre defensa pública y prevención del daño antijurídico', 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico', NULL, 'documentos', NULL, 8, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '4.10 Informes trimestrales sobre acceso a información, quejas y reclamos', 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos', NULL, 'documentos', NULL, 9, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'planeacion-presupuesto-e-informes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '5. Trámites', 'tramites-transparencia', NULL, 'enlace', '/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos', 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'tramites-transparencia');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '6. Participa', 'participa-transparencia', NULL, 'enlace', '/participa', 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'participa-transparencia');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7. Datos abiertos', 'datos-abiertos', NULL, 'contenido', NULL, 6, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'datos-abiertos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1 Instrumentos de gestión de la información', 'instrumentos-de-gestion-de-la-informacion', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'datos-abiertos' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'instrumentos-de-gestion-de-la-informacion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.1 Registro de activos de información', 'registro-de-activos-de-informacion', NULL, 'documentos', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'registro-de-activos-de-informacion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.2 Índice de información clasificada y reservada', 'indice-de-informacion-clasificada-y-reservada', NULL, 'documentos', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'indice-de-informacion-clasificada-y-reservada');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.3 Esquema de publicación de la información', 'esquema-de-publicacion-de-la-informacion', NULL, 'documentos', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'esquema-de-publicacion-de-la-informacion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.4 Programa de Gestión Documental', 'programa-de-gestion-documental', NULL, 'documentos', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'programa-de-gestion-documental');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.5 Tablas de Retención Documental', 'tablas-de-retencion-documental', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'tablas-de-retencion-documental');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.1.6 Costos de reproducción de la información pública', 'costos-de-reproduccion-de-la-informacion-publica', NULL, 'documentos', NULL, 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'instrumentos-de-gestion-de-la-informacion' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'costos-de-reproduccion-de-la-informacion-publica');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '7.2 Sección de datos abiertos', 'seccion-de-datos-abiertos', NULL, 'enlace', 'https://www.datos.gov.co', 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'datos-abiertos' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'seccion-de-datos-abiertos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '8. Información específica para grupos de interés', 'informacion-especifica-para-grupos-de-interes', NULL, 'contenido', NULL, 7, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-especifica-para-grupos-de-interes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '8.1 Información para niñas, niños y adolescentes', 'informacion-para-ninas-ninos-y-adolescentes', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-especifica-para-grupos-de-interes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-para-ninas-ninos-y-adolescentes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '8.2 Información para mujeres', 'informacion-para-mujeres', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-especifica-para-grupos-de-interes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-para-mujeres');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '8.3 Otros grupos de interés', 'otros-grupos-de-interes', NULL, 'contenido', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'informacion-especifica-para-grupos-de-interes' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'otros-grupos-de-interes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, '9. Obligación de reporte de información específica por parte de la entidad', 'reporte-de-informacion-especifica', NULL, 'documentos', NULL, 8, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'transparencia' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'reporte-de-informacion-especifica');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Atención y servicios a la ciudadanía', 'atencion-y-servicios-a-la-ciudadania', 'Trámites, canales de atención y mecanismos para presentar peticiones, quejas, reclamos, sugerencias y denuncias.', 'contenido', NULL, 1, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'atencion-y-servicios-a-la-ciudadania');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Trámites y otros procedimientos', 'tramites-y-otros-procedimientos', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'tramites-y-otros-procedimientos');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Canales de atención y pida una cita', 'canales-de-atencion', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'canales-de-atencion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'PQRSD - Peticiones, quejas, reclamos, sugerencias y denuncias', 'pqrsd', NULL, 'enlace', '/pqrsf', 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'pqrsd');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Carpeta Ciudadana Digital', 'carpeta-ciudadana-digital', 'Consulte en un solo lugar sus documentos e información en poder del Estado colombiano.', 'enlace', 'https://carpetaciudadana.and.gov.co/', 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'carpeta-ciudadana-digital');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Participa', 'participa', 'Espacios de participación ciudadana en la gestión de la E.S.E. Hospital San José del Guaviare (lineamientos del DAFP).', 'contenido', NULL, 2, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'participa');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Participación para el diagnóstico de necesidades e identificación de problemas', 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Planeación y presupuesto participativo', 'planeacion-y-presupuesto-participativo', NULL, 'contenido', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'planeacion-y-presupuesto-participativo');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Consulta ciudadana', 'consulta-ciudadana', NULL, 'contenido', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'consulta-ciudadana');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Colaboración e innovación abierta', 'colaboracion-e-innovacion-abierta', NULL, 'contenido', NULL, 3, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'colaboracion-e-innovacion-abierta');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Rendición de cuentas', 'rendicion-de-cuentas', NULL, 'documentos', NULL, 4, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'rendicion-de-cuentas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Control social', 'control-social', NULL, 'contenido', NULL, 5, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'participa' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'control-social');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Nuestro Hospital', 'nuestro-hospital', NULL, 'contenido', NULL, 3, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'nuestro-hospital');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Reseña histórica', 'resena-historica', NULL, 'contenido', NULL, 0, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'nuestro-hospital' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'resena-historica');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Portafolio de servicios', 'portafolio-de-servicios', NULL, 'listado', NULL, 1, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'nuestro-hospital' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'portafolio-de-servicios');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Sedes y horarios de atención', 'sedes-y-horarios', NULL, 'contenido', NULL, 2, 1, 'publicada' FROM cms_paginas p
 WHERE p.slug = 'nuestro-hospital' AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'sedes-y-horarios');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Cotizaciones y Propuestas', 'cotizaciones-propuestas', NULL, 'enlace', '/cotizaciones-propuestas', 4, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'cotizaciones-propuestas');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Trabaja con Nosotros', 'trabaja-nosotros', NULL, 'enlace', '/trabaja-nosotros', 5, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'trabaja-nosotros');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Noticias', 'noticias', NULL, 'listado', NULL, 6, 0, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'noticias');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Políticas de privacidad y tratamiento de datos', 'politicas-de-privacidad', NULL, 'contenido', NULL, 0, 1, 'borrador' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'politicas-de-privacidad');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Términos y condiciones', 'terminos-y-condiciones', NULL, 'contenido', NULL, 1, 1, 'borrador' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'terminos-y-condiciones');

-- 3) Ubica "2. Normativa" dentro de Transparencia y ordena el menú principal
UPDATE cms_paginas n JOIN (SELECT id, menu_id FROM cms_paginas WHERE slug = 'transparencia') t
   SET n.parent_id = t.id, n.menu_id = t.menu_id, n.orden = 1
 WHERE n.slug = 'normativa';

UPDATE cms_paginas SET orden = 0, visible_en_menu = 1 WHERE slug = 'transparencia' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 1, visible_en_menu = 1 WHERE slug = 'atencion-y-servicios-a-la-ciudadania' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 2, visible_en_menu = 1 WHERE slug = 'participa' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 3, visible_en_menu = 1 WHERE slug = 'nuestro-hospital' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 4, visible_en_menu = 1 WHERE slug = 'cotizaciones-propuestas' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 5, visible_en_menu = 1 WHERE slug = 'trabaja-nosotros' AND parent_id IS NULL;
UPDATE cms_paginas SET orden = 6, visible_en_menu = 0 WHERE slug = 'noticias' AND parent_id IS NULL;

-- 4) Oculta del menú principal (sin borrar) las páginas anteriores que no están en la estructura nueva
UPDATE cms_paginas SET visible_en_menu = 0
 WHERE parent_id IS NULL
   AND menu_id = (SELECT id FROM (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1) m)
   AND slug NOT IN ('transparencia','atencion-y-servicios-a-la-ciudadania','participa','nuestro-hospital','cotizaciones-propuestas','trabaja-nosotros','noticias');

SELECT COUNT(*) AS paginas_totales FROM cms_paginas;
