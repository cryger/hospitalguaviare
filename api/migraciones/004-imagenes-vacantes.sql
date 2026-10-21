-- =====================================================================
-- 004 · Imágenes de las vacantes migradas del portal anterior
-- Las imágenes ahora viven en el propio proyecto (public/assets/vacantes)
-- para no depender del servidor viejo. Solo cambia las filas que aún
-- apuntan a esehospitalguaviare.gov.co (no pisa cambios hechos en el admin).
-- =====================================================================

UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/administrativo-financiero.jpg'
 WHERE titulo = 'Profesional administrativo y financiero'
   AND imagen_url LIKE '%esehospitalguaviare.gov.co/resourses/imgTrabajos/%';

UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/coordinacion-general.jpg'
 WHERE titulo = 'Profesional para la coordinación general'
   AND imagen_url LIKE '%esehospitalguaviare.gov.co/resourses/imgTrabajos/%';

UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/profesionales-psicosociales.jpg'
 WHERE titulo = 'Profesionales psicosociales'
   AND imagen_url LIKE '%esehospitalguaviare.gov.co/resourses/imgTrabajos/%';
