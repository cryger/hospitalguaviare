-- =====================================================================
--  CMS Portal Web - E.S.E. Hospital San José del Guaviare
--  Estructura:  Menú  →  Páginas  →  Entradas  →  Multimedia
--  Motor: MySQL 8 / MariaDB 10.5+   |   Charset: utf8mb4
-- =====================================================================

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS hsjg_portal
  CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE hsjg_portal;

-- ---------------------------------------------------------------------
-- MENÚS: contenedores de navegación (principal, superior, pie...)
-- ---------------------------------------------------------------------
CREATE TABLE cms_menus (
  id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre        VARCHAR(120) NOT NULL,
  ubicacion     ENUM('principal','superior','pie','lateral') NOT NULL DEFAULT 'principal',
  activo        TINYINT(1) NOT NULL DEFAULT 1,
  creado_en     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- PÁGINAS: pertenecen a un menú; parent_id permite submenús (árbol)
-- ---------------------------------------------------------------------
CREATE TABLE cms_paginas (
  id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  menu_id         INT UNSIGNED NULL,
  parent_id       INT UNSIGNED NULL,
  titulo          VARCHAR(200) NOT NULL,
  slug            VARCHAR(200) NOT NULL,
  descripcion     TEXT NULL,
  plantilla       ENUM('contenido','listado','documentos','galeria','enlace') NOT NULL DEFAULT 'contenido',
  url_externa     VARCHAR(500) NULL,
  icono           VARCHAR(40) NULL,
  orden           INT NOT NULL DEFAULT 0,
  visible_en_menu TINYINT(1) NOT NULL DEFAULT 1,
  estado          ENUM('publicada','borrador','oculta') NOT NULL DEFAULT 'borrador',
  migrado_de      VARCHAR(300) NULL COMMENT 'Ruta .phtml / tabla de origen en el portal PHP',
  creado_en       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_pagina_slug (slug),
  KEY ix_pagina_menu (menu_id, parent_id, orden),
  CONSTRAINT fk_pagina_menu   FOREIGN KEY (menu_id)   REFERENCES cms_menus(id)   ON DELETE SET NULL,
  CONSTRAINT fk_pagina_parent FOREIGN KEY (parent_id) REFERENCES cms_paginas(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- MULTIMEDIA: biblioteca central (imágenes, videos, documentos, audio)
-- ---------------------------------------------------------------------
CREATE TABLE cms_multimedia (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(255) NOT NULL COMMENT 'Nombre original del archivo',
  url            VARCHAR(500) NOT NULL COMMENT 'Ruta pública (/uploads/2026/10/archivo.pdf) o URL externa (YouTube)',
  tipo           ENUM('imagen','video','documento','audio','otro') NOT NULL,
  mime           VARCHAR(120) NULL,
  tamano         INT UNSIGNED NULL COMMENT 'Bytes',
  titulo         VARCHAR(255) NULL,
  alt            VARCHAR(255) NULL COMMENT 'Texto alternativo (accesibilidad)',
  descripcion    TEXT NULL,
  migrado_de     VARCHAR(300) NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_multimedia_tipo (tipo)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- ENTRADAS: contenido de una página (noticias, documentos, artículos...)
-- ---------------------------------------------------------------------
CREATE TABLE cms_entradas (
  id                   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  pagina_id            INT UNSIGNED NOT NULL,
  titulo               VARCHAR(250) NOT NULL,
  slug                 VARCHAR(250) NOT NULL,
  resumen              TEXT NULL,
  contenido            MEDIUMTEXT NULL COMMENT 'HTML',
  tipo                 ENUM('articulo','noticia','documento','evento','servicio','enlace') NOT NULL DEFAULT 'articulo',
  estado               ENUM('publicada','borrador','archivada') NOT NULL DEFAULT 'borrador',
  destacada            TINYINT(1) NOT NULL DEFAULT 0,
  imagen_destacada_id  INT UNSIGNED NULL,
  autor                VARCHAR(150) NULL,
  fecha_publicacion    DATETIME NULL,
  orden                INT NOT NULL DEFAULT 0,
  migrado_de           VARCHAR(300) NULL,
  creado_en            DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_entrada_slug (pagina_id, slug),
  KEY ix_entrada_listado (pagina_id, estado, fecha_publicacion),
  FULLTEXT KEY ft_entrada (titulo, resumen, contenido),
  CONSTRAINT fk_entrada_pagina FOREIGN KEY (pagina_id) REFERENCES cms_paginas(id) ON DELETE CASCADE,
  CONSTRAINT fk_entrada_imagen FOREIGN KEY (imagen_destacada_id) REFERENCES cms_multimedia(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- ENTRADA ↔ MULTIMEDIA (N:M): un archivo puede reutilizarse en varias entradas
-- ---------------------------------------------------------------------
CREATE TABLE cms_entrada_multimedia (
  entrada_id     INT UNSIGNED NOT NULL,
  multimedia_id  INT UNSIGNED NOT NULL,
  orden          INT NOT NULL DEFAULT 0,
  PRIMARY KEY (entrada_id, multimedia_id),
  CONSTRAINT fk_em_entrada    FOREIGN KEY (entrada_id)    REFERENCES cms_entradas(id)   ON DELETE CASCADE,
  CONSTRAINT fk_em_multimedia FOREIGN KEY (multimedia_id) REFERENCES cms_multimedia(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Datos iniciales
-- ---------------------------------------------------------------------
INSERT INTO cms_menus (nombre, ubicacion) VALUES
  ('Menú principal', 'principal'),
  ('Pie de página',  'pie');
