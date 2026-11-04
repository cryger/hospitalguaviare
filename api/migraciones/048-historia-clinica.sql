-- =====================================================================
-- 048 · Solicitud en línea de copia de historia clínica (MIPG RT-05 / RT-06)
-- Radicado HC-AAAA-NNNNNN + código de consulta, vencimiento a 10 días
-- hábiles (Ley 1755 de 2015, art. 14: solicitudes de documentos).
-- La historia clínica es reservada (Ley 23 de 1981, art. 34; Res. 1995 de
-- 1999, art. 14): los soportes y la copia se guardan en la carpeta privada,
-- solo los ve el módulo "historias" del dashboard, y el solicitante la
-- descarga con documento + radicado + código durante 30 días.
-- No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_usuarios
  MODIFY rol ENUM('admin','editor','pqrsfd','contratacion','historia_clinica','personalizado') NOT NULL DEFAULT 'editor';

CREATE TABLE IF NOT EXISTS hc_solicitudes (
  id                   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  radicado             VARCHAR(30) NOT NULL,
  codigo_consulta      VARCHAR(12) NOT NULL,
  calidad              ENUM('paciente','representante','autorizado','familiar') NOT NULL DEFAULT 'paciente'
                       COMMENT 'Quién solicita: el paciente, su representante legal, un tercero autorizado o un familiar (paciente fallecido)',
  tipo_documento       VARCHAR(10) NOT NULL,
  numero_documento     VARCHAR(20) NOT NULL,
  nombre               VARCHAR(150) NOT NULL,
  correo               VARCHAR(150) NOT NULL,
  telefono             VARCHAR(30) NOT NULL,
  direccion            VARCHAR(200) NULL,
  paciente_tipo_doc    VARCHAR(10) NULL,
  paciente_documento   VARCHAR(20) NULL,
  paciente_nombre      VARCHAR(150) NULL,
  parentesco           VARCHAR(80) NULL,
  alcance              ENUM('completa','epicrisis','resultados','otro') NOT NULL DEFAULT 'completa',
  servicios            VARCHAR(200) NULL COMMENT 'Servicios separados por coma',
  fecha_desde          DATE NULL,
  fecha_hasta          DATE NULL,
  observaciones        TEXT NULL,
  tipo_entrega         ENUM('digital','fisica') NOT NULL DEFAULT 'digital',
  canal                ENUM('web','correo','presencial') NOT NULL DEFAULT 'web',
  estado               ENUM('radicada','en_tramite','respondida','rechazada') NOT NULL DEFAULT 'radicada',
  asignado_a           INT UNSIGNED NULL,
  plazo_dias           TINYINT UNSIGNED NOT NULL DEFAULT 10,
  fecha_radicacion     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_vencimiento    DATETIME NOT NULL,
  respuesta            TEXT NULL,
  fecha_respuesta      DATETIME NULL,
  respondido_por       INT UNSIGNED NULL,
  acepta_datos         TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Autorización Ley 1581 de 2012',
  declara_veracidad    TINYINT(1) NOT NULL DEFAULT 0,
  ip_origen            VARCHAR(45) NULL,
  actualizado_en       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_hc_radicado (radicado),
  KEY ix_hc_documento (numero_documento),
  KEY ix_hc_estado (estado, fecha_vencimiento),
  CONSTRAINT fk_hc_asignado FOREIGN KEY (asignado_a) REFERENCES cms_usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_hc_respondio FOREIGN KEY (respondido_por) REFERENCES cms_usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS hc_adjuntos (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  origen         ENUM('ciudadano','respuesta') NOT NULL DEFAULT 'respuesta',
  nombre         VARCHAR(255) NOT NULL,
  ruta           VARCHAR(300) NOT NULL COMMENT 'Relativa a PRIVADO_DIR',
  mime           VARCHAR(120) NULL,
  tamano         INT UNSIGNED NOT NULL DEFAULT 0,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_hc_adj (solicitud_id),
  CONSTRAINT fk_hc_adj FOREIGN KEY (solicitud_id) REFERENCES hc_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS hc_historial (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  usuario_id     INT UNSIGNED NULL,
  usuario_nombre VARCHAR(150) NULL,
  accion         VARCHAR(60) NOT NULL,
  detalle        TEXT NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_hc_hist (solicitud_id, creado_en),
  CONSTRAINT fk_hc_hist FOREIGN KEY (solicitud_id) REFERENCES hc_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Enlace en el menú: Atención y servicios a la ciudadanía › Copia de historia clínica
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Copia de historia clínica', 'copia-historia-clinica-en-linea',
       'Solicite en línea la copia de su historia clínica y consulte el estado con su número de radicado.',
       'enlace', '/solicitud-historia-clinica',
       COALESCE((SELECT x.orden FROM cms_paginas x WHERE x.slug = 'solicitudes-contractuales' LIMIT 1), 8), 1, 'publicada'
  FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND p.parent_id IS NULL
   AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'copia-historia-clinica-en-linea')
 LIMIT 1;

-- Trámites y otros procedimientos › Copia de historia clínica: enlace al formulario en línea
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
   SET e.contenido = REPLACE(e.contenido, '<p>Para solicitar copia de su historia clínica:</p>',
       '<p><strong>Solicítela en línea:</strong> diligencie el <a href="/solicitud-historia-clinica">formulario de solicitud de copia de historia clínica</a>, adjunte su documento de identidad y reciba un número de radicado para consultar el estado y descargar la copia.</p>\n<p>También puede solicitarla por correo electrónico:</p>'),
       e.resumen = IF(e.resumen = 'Diligencie el formato de solicitud y envíelo al correo de historias clínicas.',
                      'Solicítela en línea con número de radicado, o por correo con el formato de solicitud.', e.resumen)
 WHERE e.slug = 'copia-de-historia-clinica'
   AND e.contenido LIKE '%<p>Para solicitar copia de su historia clínica:</p>%'
   AND e.contenido NOT LIKE '%/solicitud-historia-clinica%';

-- Canales de atención › Copia de historia clínica: mismo enlace al formulario en línea
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'canales-de-atencion'
   SET e.contenido = CONCAT('<p><strong>Solicítela en línea:</strong> diligencie el <a href="/solicitud-historia-clinica">formulario de solicitud de copia de historia clínica</a> y reciba un número de radicado para consultar el estado y descargar la copia.</p>\n<p>También puede solicitarla por correo electrónico:</p>\n', e.contenido)
 WHERE e.slug = 'copia-de-historia-clinica'
   AND e.contenido LIKE '%E-ET-FO-01%'
   AND e.contenido NOT LIKE '%/solicitud-historia-clinica%';
