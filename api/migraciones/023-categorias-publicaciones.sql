-- =====================================================================
-- 023 · Categorías de publicaciones (filtro lateral de Noticias)
-- - Agrega cms_entradas.categoria (texto libre; el dashboard sugiere un catálogo)
-- - Clasifica las publicaciones existentes de páginas "Listado" por su título.
--   Mismas reglas que src/app/shared/utils/categorias.ts (gana la primera).
-- No borra información; solo llena las que no tienen categoría.
-- =====================================================================
SET NAMES utf8mb4;

SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_entradas' AND COLUMN_NAME = 'categoria');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_entradas ADD COLUMN categoria VARCHAR(80) NULL COMMENT ''Ej. Comunicados, Resoluciones'' AFTER tipo, ADD KEY ix_entrada_categoria (pagina_id, categoria)',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;

UPDATE cms_entradas e
JOIN cms_paginas p ON p.id = e.pagina_id AND p.plantilla = 'listado'
SET e.categoria = CASE
  WHEN LOWER(e.titulo) REGEXP '^[^a-z0-9]*(capacitaci[oó]n|seminario|diplomado|taller|curso)\\b' THEN 'Capacitaciones'
  WHEN LOWER(e.titulo) REGEXP '\\bresoluci[oó]n' THEN 'Resoluciones'
  WHEN LOWER(e.titulo) REGEXP '\\bcircular' THEN 'Circulares'
  WHEN LOWER(e.titulo) REGEXP '\\bcomunicado' THEN 'Comunicados'
  WHEN LOWER(e.titulo) REGEXP '\\bbolet[ií]n' THEN 'Boletines'
  WHEN LOWER(e.titulo) REGEXP '\\b(convocatoria|proceso|terna|elecci[oó]n|votaci[oó]n|votantes|jurados|cronograma electoral|inscritos|postulaci[oó]n|invitaci[oó]n|aviso)' THEN 'Procesos y convocatorias'
  WHEN LOWER(e.titulo) REGEXP '\\b(capacitaci[oó]n|seminario|diplomado|taller|curso)' THEN 'Capacitaciones'
  WHEN LOWER(e.titulo) REGEXP '\\b(jornada|brigada|vacunaci[oó]n)' THEN 'Jornadas de salud'
  WHEN LOWER(e.titulo) REGEXP '\\b(feliz d[ií]a|d[ií]a mundial|d[ií]a internacional|d[ií]a del|d[ií]a de la|homenaje)' THEN 'Fechas conmemorativas'
  ELSE 'Institucional'
END
WHERE e.categoria IS NULL OR e.categoria = '';
