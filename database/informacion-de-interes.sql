-- =====================================================================
--  Información de interés
--  1) Tabla de invitaciones a cotizar (antes solo en el navegador)
--  2) Invitaciones migradas del portal actual (esehospitalguaviare.gov.co)
--  3) Menú: "Información de interés" agrupa Invitaciones a cotizar y
--     Trabaja con nosotros (se reubican las páginas existentes, no se borra nada)
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS cms_cotizaciones (
  id                INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo            VARCHAR(300) NOT NULL,
  descripcion       TEXT NULL,
  dependencia       VARCHAR(200) NULL COMMENT 'Área que solicita la cotización',
  documento_url     VARCHAR(600) NULL COMMENT 'PDF de la invitación',
  documento_nombre  VARCHAR(250) NULL,
  fecha_publicacion DATETIME NULL,
  fecha_cierre      DATETIME NULL COMMENT 'Fecha límite para recibir cotizaciones',
  estado            ENUM('publicada','borrador','cerrada') NOT NULL DEFAULT 'borrador',
  migrado_de        VARCHAR(300) NULL,
  creado_en         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY ix_cotizacion_estado (estado, fecha_publicacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ---------------------------------------------------------------------
-- Invitaciones a cotizar migradas (vigentes en el portal actual)
-- ---------------------------------------------------------------------
INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización',
       'La E.S.E. Hospital San José del Guaviare requiere contratar el servicio de mantenimiento preventivo y correctivo al instrumental quirúrgico del servicio de cirugía y la central de esterilización. Consulte en el documento las especificaciones técnicas, los requisitos habilitantes y las condiciones para presentar su cotización.',
       'Subgerencia Administrativa y Financiera',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/inv%20mto%20quirurgico.pdf',
       'Invitación a presentar cotización - Mantenimiento instrumental quirúrgico.pdf',
       '2026-10-08 12:00:00', 'publicada',
       'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE fecha_publicacion = '2026-10-08 12:00:00' AND titulo LIKE 'Mantenimiento preventivo y correctivo al instrumental%');

INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Servicio de transporte asistencial básico y medicalizado terrestre para el proceso de referencia y contrarreferencia',
       'La E.S.E. Hospital San José del Guaviare requiere contratar el servicio de transporte asistencial básico y transporte asistencial medicalizado terrestre para apoyar y fortalecer el proceso de referencia y contrarreferencia. Consulte en el documento las condiciones para presentar su cotización.',
       'Subgerencia Administrativa y Financiera',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20PRESTACION%20DE%20SERVICIOS%20DE%20TRANSPORTE%20ASISTENCIAL%20BASICO,%20ASISTENCIAL%20MEDICALIZADO%20TERRESTRE,%20PARA%20APOYAR%20Y%20FORTALECER%20EL%20PROCESO%20DE%20REFERENCIA%20Y%20CONTRARE.pdf',
       'Invitación a presentar cotización - Transporte asistencial.pdf',
       '2026-10-05 12:00:00', 'publicada',
       'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE fecha_publicacion = '2026-10-05 12:00:00' AND titulo LIKE 'Servicio de transporte asistencial%');

INSERT INTO cms_cotizaciones (titulo, descripcion, dependencia, documento_url, documento_nombre, fecha_publicacion, estado, migrado_de)
SELECT 'Suministro de materiales y reactivos para laboratorio clínico y servicio de gestión pretransfusional',
       'La E.S.E. Hospital San José del Guaviare requiere contratar el suministro de materiales y reactivos para el laboratorio clínico y el servicio de gestión pretransfusional, con apoyo tecnológico y software de gestión. Consulte en el documento las condiciones para presentar su cotización.',
       'Subgerencia Administrativa y Financiera',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20COTIZAR%20DE%20MATERIAL%20DE%20LABORATORIO.pdf',
       'Invitación a cotizar - Material de laboratorio.pdf',
       '2026-09-25 12:00:00', 'publicada',
       'esehospitalguaviare.gov.co/invitaciones-a-presentar-propuestas-cotizacion'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_cotizaciones WHERE fecha_publicacion = '2026-09-25 12:00:00' AND titulo LIKE 'Suministro de materiales y reactivos%');

-- ---------------------------------------------------------------------
-- Menú principal: "Información de interés"
-- ---------------------------------------------------------------------
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'principal' ORDER BY id LIMIT 1), NULL, 'Información de interés', 'informacion-de-interes',
       'Invitaciones a cotizar y convocatorias laborales de la E.S.E. Hospital San José del Guaviare.',
       'contenido', NULL, 4, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-de-interes');

-- Las páginas existentes pasan a ser hijas (se conservan ids, entradas y ajustes)
UPDATE cms_paginas c JOIN (SELECT id, menu_id FROM cms_paginas WHERE slug = 'informacion-de-interes') p
   SET c.parent_id = p.id, c.menu_id = p.menu_id, c.orden = 0, c.visible_en_menu = 1,
       c.titulo = 'Invitaciones a cotizar', c.plantilla = 'enlace',
       c.url_externa = '/informacion-de-interes/invitaciones-a-cotizar'
 WHERE c.slug = 'cotizaciones-propuestas';

UPDATE cms_paginas c JOIN (SELECT id, menu_id FROM cms_paginas WHERE slug = 'informacion-de-interes') p
   SET c.parent_id = p.id, c.menu_id = p.menu_id, c.orden = 1, c.visible_en_menu = 1,
       c.titulo = 'Trabaja con nosotros', c.plantilla = 'enlace',
       c.url_externa = '/informacion-de-interes/trabaja-con-nosotros'
 WHERE c.slug = 'trabaja-nosotros';

UPDATE cms_paginas SET orden = 5 WHERE slug = 'noticias' AND parent_id IS NULL;
