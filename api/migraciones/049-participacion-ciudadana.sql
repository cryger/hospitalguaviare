-- =====================================================================
-- 049 · Consultas ciudadanas en línea (participación ciudadana)
-- Gobierno abierto / Ley 1757 de 2015, art. 2 y 3 (participación en la
-- gestión pública) y MIPG (política de participación ciudadana).
-- La E.S.E. publica temas/proyectos abiertos a consulta; la ciudadanía
-- envía aportes en línea con radicado PC-AAAA-NNNNNN y consulta su estado
-- con documento + radicado. El consolidado de resultados es público.
-- No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_usuarios
  MODIFY rol ENUM('admin','editor','pqrsfd','contratacion','historia_clinica','participacion','personalizado') NOT NULL DEFAULT 'editor';

-- Consultas publicadas por la entidad
CREATE TABLE IF NOT EXISTS part_consultas (
  id                 INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo             VARCHAR(200) NOT NULL,
  slug               VARCHAR(200) NOT NULL,
  resumen            VARCHAR(300) NOT NULL,
  descripcion        MEDIUMTEXT NOT NULL COMMENT 'HTML redactado por la entidad (contexto, objeto, qué se consulta)',
  categoria          VARCHAR(80) NULL COMMENT 'Ej. Plan de desarrollo, PAAC, política institucional',
  documento_url      VARCHAR(500) NULL COMMENT 'Documento de soporte (público)',
  documento_nombre   VARCHAR(200) NULL,
  fecha_inicio       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_fin          DATETIME NOT NULL COMMENT 'Cierre para recibir aportes',
  estado             ENUM('borrador','abierta','cerrada','con_resultados','archivada') NOT NULL DEFAULT 'borrador',
  resultado          MEDIUMTEXT NULL COMMENT 'Consolidado de resultados (público) una vez cerrada',
  fecha_resultado    DATETIME NULL,
  creado_por         INT UNSIGNED NULL,
  creado_en          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_part_slug (slug),
  KEY ix_part_estado (estado, fecha_fin),
  CONSTRAINT fk_part_creado FOREIGN KEY (creado_por) REFERENCES cms_usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Aportes de la ciudadanía a una consulta
CREATE TABLE IF NOT EXISTS part_aportes (
  id                 INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  consulta_id        INT UNSIGNED NOT NULL,
  radicado           VARCHAR(30) NOT NULL,
  tipo_persona       ENUM('natural','juridica') NOT NULL DEFAULT 'natural',
  tipo_documento     VARCHAR(10) NOT NULL DEFAULT 'CC',
  numero_documento   VARCHAR(20) NOT NULL,
  nombre             VARCHAR(150) NOT NULL,
  organizacion       VARCHAR(150) NULL COMMENT 'Veeduría, junta, asociación, etc.',
  correo             VARCHAR(150) NULL,
  telefono           VARCHAR(30) NULL,
  postura            ENUM('a_favor','en_contra','neutral','propuesta') NULL,
  aporte             TEXT NOT NULL,
  publicar           TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'El ciudadano autoriza publicar su aporte (sin datos personales)',
  estado             ENUM('recibido','en_analisis','incorporado','no_incorporado') NOT NULL DEFAULT 'recibido',
  respuesta          TEXT NULL COMMENT 'Respuesta / motivación de la entidad',
  fecha_respuesta    DATETIME NULL,
  respondido_por     INT UNSIGNED NULL,
  acepta_datos       TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Autorización Ley 1581 de 2012',
  ip_origen          VARCHAR(45) NULL,
  creado_en          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_part_radicado (radicado),
  KEY ix_part_aporte_consulta (consulta_id, creado_en),
  KEY ix_part_aporte_doc (numero_documento),
  CONSTRAINT fk_part_aporte_consulta FOREIGN KEY (consulta_id) REFERENCES part_consultas(id) ON DELETE CASCADE,
  CONSTRAINT fk_part_aporte_resp FOREIGN KEY (respondido_por) REFERENCES cms_usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS part_historial (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  aporte_id      INT UNSIGNED NOT NULL,
  usuario_id     INT UNSIGNED NULL,
  usuario_nombre VARCHAR(150) NULL,
  accion         VARCHAR(60) NOT NULL,
  detalle        TEXT NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_part_hist (aporte_id, creado_en),
  CONSTRAINT fk_part_hist FOREIGN KEY (aporte_id) REFERENCES part_aportes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Enlace en el menú: Participa › Consultas ciudadanas en línea
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT p.menu_id, p.id, 'Consultas ciudadanas en línea', 'consultas-ciudadanas-en-linea',
       'Participe en las consultas abiertas de la E.S.E.: conozca los temas, envíe sus aportes en línea y consulte los resultados.',
       'enlace', '/participacion', 3, 1, 'publicada'
  FROM cms_paginas p
 WHERE p.slug = 'participa' AND p.parent_id IS NULL
   AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'consultas-ciudadanas-en-linea')
 LIMIT 1;
