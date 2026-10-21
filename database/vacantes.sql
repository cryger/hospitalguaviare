-- =====================================================================
--  Trabaja con Nosotros: tabla de vacantes/convocatorias en la base de datos
--  y convocatorias migradas del portal actual (esehospitalguaviare.gov.co).
--  Las de 2024 se cargan como CERRADAS (históricas). No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS cms_vacantes (
  id                INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo            VARCHAR(250) NOT NULL,
  tipo_contrato     VARCHAR(120) NULL,
  vacantes          INT UNSIGNED NOT NULL DEFAULT 1,
  salario           VARCHAR(120) NULL,
  horario           VARCHAR(150) NULL,
  ubicacion         VARCHAR(250) NULL,
  descripcion       TEXT NULL,
  requisitos        TEXT NULL COMMENT 'JSON: arreglo de textos',
  imagen_url        VARCHAR(500) NULL,
  documento_url     VARCHAR(500) NULL COMMENT 'PDF de requisitos / términos',
  fecha_publicacion DATETIME NULL,
  fecha_cierre      DATETIME NULL,
  estado            ENUM('publicada','borrador','cerrada') NOT NULL DEFAULT 'borrador',
  migrado_de        VARCHAR(300) NULL,
  creado_en         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY ix_vacante_estado (estado, fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- 1) Profesional administrativo y financiero
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Profesional administrativo y financiero', 'Prestación de servicios', 1, '$5.139.972 mensual', 'Prestación de servicios',
       'ESE Hospital San José del Guaviare. Departamento del Guaviare.',
       'La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un profesional administrativo y financiero (profesionales en el área de conocimiento economía, administración, contaduría y afines).',
       '["Profesional en el área de conocimiento economía, administración, contaduría y afines.","Consulte los requisitos completos en el documento de la convocatoria."]',
       '/assets/vacantes/administrativo-financiero.jpg',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesional%20Administrativo%20y%20Financiero_342342342.pdf',
       '2024-10-02 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Profesional administrativo y financiero' AND fecha_publicacion = '2024-10-02 12:00:00');

-- 2) Profesional para la coordinación general
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Profesional para la coordinación general', 'Prestación de servicios', 1, '$5.139.972 mensual', 'Prestación de servicios',
       'ESE Hospital San José del Guaviare. Departamento del Guaviare.',
       'La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un profesional para la coordinación general.',
       '["Profesional en Ciencias Sociales y Humanas, u otras áreas indicadas en el documento de la convocatoria.","Consulte los requisitos completos en el documento de la convocatoria."]',
       '/assets/vacantes/coordinacion-general.jpg',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesional%20Coordinaci%C3%B3n%20General_2431312%20.pdf',
       '2024-10-02 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Profesional para la coordinación general' AND fecha_publicacion = '2024-10-02 12:00:00');

-- 3) Profesionales psicosociales (3)
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Profesionales psicosociales', 'Prestación de servicios', 3, '$4.807.985 mensual', 'Prestación de servicios',
       'ESE Hospital San José del Guaviare. Departamento del Guaviare.',
       'La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de tres profesionales psicosociales (profesionales en el área de las ciencias sociales y humanas: trabajo social, sociología, antropología, entre otras indicadas en el documento de la convocatoria).',
       '["Profesional en el área de las ciencias sociales y humanas: trabajo social, sociología, antropología, entre otras indicadas en el documento de la convocatoria.","Consulte los requisitos completos en el documento de la convocatoria."]',
       '/assets/vacantes/profesionales-psicosociales.jpg',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Profesionales%20Psicosociales_34242342.pdf',
       '2024-10-02 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Profesionales psicosociales' AND fecha_publicacion = '2024-10-02 12:00:00');

SELECT COUNT(*) AS vacantes FROM cms_vacantes;
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
