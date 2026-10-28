-- =====================================================================
-- 018 · PQRSFD: peticiones, quejas, reclamos, sugerencias, felicitaciones
--       y denuncias (Ley 1755 de 2015, Ley 1712 de 2014, Res. 1519 de 2020)
-- Radicado consecutivo por año, vencimiento en días hábiles, adjuntos
-- privados e historial de cada actuación. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- Consecutivos de radicación por año (PQRSFD, solicitudes contractuales…)
CREATE TABLE IF NOT EXISTS cms_consecutivos (
  serie   VARCHAR(30) NOT NULL,
  anio    SMALLINT UNSIGNED NOT NULL,
  valor   INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (serie, anio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS pqrsfd_solicitudes (
  id                 INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  radicado           VARCHAR(30) NOT NULL,
  codigo_consulta    VARCHAR(12) NOT NULL COMMENT 'Se entrega al ciudadano para consultar el estado',
  tipo               ENUM('peticion','queja','reclamo','sugerencia','felicitacion','denuncia','informacion','consulta') NOT NULL,
  anonimo            TINYINT(1) NOT NULL DEFAULT 0,
  tipo_persona       ENUM('natural','juridica') NOT NULL DEFAULT 'natural',
  tipo_documento     VARCHAR(10) NULL,
  numero_documento   VARCHAR(20) NULL,
  nombre             VARCHAR(150) NULL,
  correo             VARCHAR(150) NULL,
  telefono           VARCHAR(30) NULL,
  direccion          VARCHAR(200) NULL,
  municipio          VARCHAR(100) NULL,
  grupo_poblacional  VARCHAR(80) NULL COMMENT 'Enfoque diferencial (opcional)',
  medio_respuesta    ENUM('correo','fisica') NOT NULL DEFAULT 'correo',
  canal              ENUM('web','correo','telefono','presencial','buzon') NOT NULL DEFAULT 'web',
  asunto             VARCHAR(200) NOT NULL,
  mensaje            TEXT NOT NULL,
  estado             ENUM('radicada','en_tramite','respondida','cerrada','trasladada') NOT NULL DEFAULT 'radicada',
  area               VARCHAR(120) NULL COMMENT 'Dependencia que la atiende',
  asignado_a         INT UNSIGNED NULL,
  plazo_dias         TINYINT UNSIGNED NOT NULL DEFAULT 15,
  fecha_radicacion   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_vencimiento  DATETIME NOT NULL,
  respuesta          TEXT NULL,
  fecha_respuesta    DATETIME NULL,
  respondido_por     INT UNSIGNED NULL,
  acepta_datos       TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Autorización Ley 1581 de 2012',
  ip_origen          VARCHAR(45) NULL,
  actualizado_en     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY uq_pqrsfd_radicado (radicado),
  KEY ix_pqrsfd_estado (estado, fecha_vencimiento),
  KEY ix_pqrsfd_documento (numero_documento),
  CONSTRAINT fk_pqrsfd_asignado FOREIGN KEY (asignado_a) REFERENCES cms_usuarios(id) ON DELETE SET NULL,
  CONSTRAINT fk_pqrsfd_respondio FOREIGN KEY (respondido_por) REFERENCES cms_usuarios(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS pqrsfd_adjuntos (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  origen         ENUM('ciudadano','respuesta') NOT NULL,
  nombre         VARCHAR(255) NOT NULL,
  ruta           VARCHAR(300) NOT NULL COMMENT 'Relativa a PRIVADO_DIR',
  mime           VARCHAR(120) NULL,
  tamano         INT UNSIGNED NOT NULL DEFAULT 0,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_pqrsfd_adj (solicitud_id),
  CONSTRAINT fk_pqrsfd_adj FOREIGN KEY (solicitud_id) REFERENCES pqrsfd_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS pqrsfd_historial (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  solicitud_id   INT UNSIGNED NOT NULL,
  usuario_id     INT UNSIGNED NULL,
  usuario_nombre VARCHAR(150) NULL,
  accion         VARCHAR(60) NOT NULL,
  detalle        TEXT NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY ix_pqrsfd_hist (solicitud_id, creado_en),
  CONSTRAINT fk_pqrsfd_hist FOREIGN KEY (solicitud_id) REFERENCES pqrsfd_solicitudes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
