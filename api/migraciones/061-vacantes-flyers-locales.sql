-- =====================================================================
-- 061 · Flyers de vacantes servidos desde el portal (assets locales)
--  Los flyers de 4 vacantes apuntaban al servidor anterior
--  (esehospitalguaviare.gov.co/resourses/imgTrabajos). Se actualizan a los
--  archivos locales en public/assets/vacantes/ para que el portal sea
--  autónomo. Idempotente (solo cambia las URLs del servidor viejo).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/enfermeria.jpg'
  WHERE imagen_url = 'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/1.png';
UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/bacteriologo.jpg'
  WHERE imagen_url = 'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/7.png';
UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/tecnico-administrativo.jpg'
  WHERE imagen_url = 'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/1111.png';
UPDATE cms_vacantes SET imagen_url = '/assets/vacantes/promotor-salud.jpg'
  WHERE imagen_url = 'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/2%20(2).png';
