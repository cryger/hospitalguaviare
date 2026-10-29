-- =====================================================================
-- 027 · Talento humano: documentos clasificados por tipo
-- La "categoría" de las entradas de una página de documentos es el tipo de
-- documento; con dos o más tipos, la página muestra el filtro a la izquierda
-- y los archivos en listado. Solo llena las que no tienen tipo.
-- =====================================================================
SET NAMES utf8mb4;

UPDATE cms_entradas e
JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
SET e.categoria = CASE
  WHEN e.slug = 'manual-de-funciones' THEN 'Manual de funciones'
  WHEN e.slug IN ('comite-de-bienestar-social-e-incentivos', 'grupo-geicig') THEN 'Comités y grupos'
  WHEN e.slug = 'formato-de-confidencialidad' THEN 'Formatos'
  WHEN e.slug = 'plan-de-gestion-gerencial' THEN 'Planes'
  ELSE e.categoria
END
WHERE e.categoria IS NULL OR e.categoria = '';
