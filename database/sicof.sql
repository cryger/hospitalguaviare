-- =====================================================================
-- 030 · Canal anticorrupción – SICOF
-- Reportes del formulario /sicof. Cada reporte se envía por correo al
-- Oficial de Cumplimiento; si el correo falla queda pendiente y se reintenta.
-- Las evidencias se guardan en PRIVADO_DIR/sicof (nunca públicas).
-- =====================================================================
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS sicof_reportes (
  id                  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  radicado            VARCHAR(30) NOT NULL,
  tipo_evento         VARCHAR(60) NOT NULL,
  descripcion         TEXT NOT NULL,
  como_se_dio_cuenta  TEXT NOT NULL,
  tiempo              VARCHAR(200) NOT NULL,
  fecha_conocimiento  DATE NOT NULL,
  involucrados        TEXT NULL,
  area                VARCHAR(300) NOT NULL,
  correo              VARCHAR(150) NULL COMMENT 'Opcional: el reporte puede ser anónimo',
  ip_origen           VARCHAR(45) NULL,
  correo_enviado_en   DATETIME NULL COMMENT 'Cuándo llegó al Oficial de Cumplimiento',
  constancia_enviada  TINYINT(1) NOT NULL DEFAULT 0,
  intentos            INT NOT NULL DEFAULT 0,
  ultimo_error        VARCHAR(500) NULL,
  creado_en           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_sicof_radicado (radicado),
  KEY ix_sicof_pendientes (correo_enviado_en, intentos)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS sicof_adjuntos (
  id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  reporte_id  INT UNSIGNED NOT NULL,
  nombre      VARCHAR(255) NOT NULL,
  ruta        VARCHAR(500) NOT NULL,
  mime        VARCHAR(120) NULL,
  tamano      INT UNSIGNED NULL,
  creado_en   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_sicof_adj (reporte_id),
  CONSTRAINT fk_sicof_adj FOREIGN KEY (reporte_id) REFERENCES sicof_reportes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La página "Canal anticorrupción – SICOF" del menú lleva al formulario
UPDATE cms_paginas SET plantilla = 'enlace', url_externa = '/sicof'
 WHERE slug = 'canal-anticorrupcion-sicof' AND plantilla = 'contenido';
