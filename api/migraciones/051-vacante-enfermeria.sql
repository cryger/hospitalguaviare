-- =====================================================================
--  051 · Trabaja con Nosotros: convocatoria de Enfermería que faltaba
--  (esehospitalguaviare.gov.co/trabaja-con-nosotros, pág. 3 del listado).
--  Con esta quedan las 7 convocatorias del portal anterior. Sin PDF
--  adjunto en el origen. Cerrada (histórica). Idempotente. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Enfermería (4 vacantes)', 'Prestación de servicios', 4, '$3.500.000', 'Turnos rotativos - 192 horas',
       'ESE Hospital San José del Guaviare.',
       'La ESE Hospital San José del Guaviare se complace en extender la invitación a participar de la convocatoria de las cuatro (04) vacantes disponibles para el área de enfermería. Para su postulación, tenga en cuenta las condiciones del contrato.',
       '["Personal del área de enfermería. Consulte las condiciones de la convocatoria."]',
       'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/1.png',
       NULL,
       '2024-09-18 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Enfermería (4 vacantes)' AND fecha_publicacion = '2024-09-18 12:00:00');
