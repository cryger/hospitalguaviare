-- =====================================================================
-- 019 · Solicitudes contractuales (certificaciones de contratos)
-- Reemplaza la plataforma /seguimiento-solicitudes del portal anterior.
-- Radicado SC-AAAA-NNNNNN, vencimiento a 10 días hábiles (Ley 1755 de 2015,
-- art. 14: solicitudes de documentos), adjuntos privados e historial.
-- Las columnas migrado_de / id_anterior permiten cargar el histórico del
-- portal anterior sin perder su numeración. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS contr_solicitudes (
  id                 INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  radicado           VARCHAR(30) NOT NULL,
  cedula             VARCHAR(20) NOT NULL,
  nombre             VARCHAR(150) NOT NULL,
  correo             VARCHAR(150) NOT NULL,
  telefono           VARCHAR(30) NOT NULL,
  tipo_entrega       ENUM('fisica','correo') NOT NULL DEFAULT 'correo',
  vigencias          VARCHAR(120) NULL COMMENT 'Años separados por coma, ej. 2023,2024',
  descripcion        TEXT NOT NULL,
  estado             ENUM('radicada','en_tramite','respondida','rechazada') NOT NULL DEFAULT 'radicada',
  asignado_a         INT UNSIGNED NULL,
  plazo_dias         TINYINT UNSIGNED NOT NULL DEFAULT 10,
  fecha_radicacion   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_vencimiento  DATETIME NOT NULL,
  respuesta          TEXT NULL,
  fecha_respuesta    DATETIME NULL,
  respondido_por     INT UNSIGNED NULL,
  acepta_datos       TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Autorización Ley 1581 de 2012',
  ip_origen          VARCHAR(45) NULL,
  migrado_de         VARCHAR(100) NULL COMMENT 'Origen si viene del portal anterior',
  id_anterior        INT UNSIGNED NULL,
  actualizado_en     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_contr_radicado (radicado),
  KEY ix_contr_cedula (cedula),
  KEY ix_contr_estado (estado, fecha_vencimiento),
  CONSTRAINT fk_contr_asignado FOREIGN KEY (asignado_a) REFERENCES cms_usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_contr_respondio FOREIGN KEY (respondido_por) REFERENCES cms_usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS contr_adjuntos (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  origen         ENUM('ciudadano','respuesta') NOT NULL DEFAULT 'respuesta',
  nombre         VARCHAR(255) NOT NULL,
  ruta           VARCHAR(300) NOT NULL COMMENT 'Relativa a PRIVADO_DIR',
  mime           VARCHAR(120) NULL,
  tamano         INT UNSIGNED NOT NULL DEFAULT 0,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_contr_adj (solicitud_id),
  CONSTRAINT fk_contr_adj FOREIGN KEY (solicitud_id) REFERENCES contr_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS contr_historial (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  usuario_id     INT UNSIGNED NULL,
  usuario_nombre VARCHAR(150) NULL,
  accion         VARCHAR(60) NOT NULL,
  detalle        TEXT NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_contr_hist (solicitud_id, creado_en),
  CONSTRAINT fk_contr_hist FOREIGN KEY (solicitud_id) REFERENCES contr_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Enlace en el menú: Atención y servicios a la ciudadanía › Solicitudes contractuales
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Solicitudes contractuales', 'solicitudes-contractuales',
       'Solicite certificaciones de sus contratos con la E.S.E. y consulte el estado de su solicitud.',
       'enlace', '/solicitudes-contractuales', 7, 1, 'publicada'
  FROM cms_paginas p
 WHERE p.slug = 'atencion-y-servicios-a-la-ciudadania' AND p.parent_id IS NULL
   AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'solicitudes-contractuales')
 LIMIT 1;
