-- =====================================================================
-- 016 · Slider del inicio administrable (carrusel BDC GOV.CO v5)
-- Tabla cms_banners y las 3 diapositivas que tenía el inicio. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS cms_banners (
  id                INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo            VARCHAR(120) NULL COMMENT 'BDC: máx. 38 caracteres recomendados',
  descripcion       VARCHAR(250) NULL COMMENT 'BDC: máx. 90 caracteres recomendados',
  imagen_url        VARCHAR(500) NOT NULL,
  imagen_movil_url  VARCHAR(500) NULL,
  alt               VARCHAR(300) NOT NULL,
  enlace_url        VARCHAR(500) NULL,
  texto_boton       VARCHAR(60) NULL,
  nueva_pestana     TINYINT(1) NOT NULL DEFAULT 0,
  orden             INT NOT NULL DEFAULT 0,
  estado            ENUM('publicado','borrador') NOT NULL DEFAULT 'publicado',
  fecha_inicio      DATETIME NULL,
  fecha_fin         DATETIME NULL,
  migrado_de        VARCHAR(300) NULL,
  creado_en         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY ix_banner_orden (estado, orden)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO cms_banners (titulo, descripcion, imagen_url, imagen_movil_url, alt, enlace_url, texto_boton, nueva_pestana, orden, estado, migrado_de)
SELECT NULL, NULL, 'assets/img/slider/BANNER_PLATAFORMA-2025.jpg', NULL, 'Acércate a nosotros: conoce la plataforma estratégica de la E.S.E. Hospital San José del Guaviare. Ingresa aquí.', '/transparencia/informacion-de-la-entidad/mision-vision-funciones-y-deberes', NULL, 0, 0, 'publicado', 'slider del inicio (versión anterior del portal)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_banners WHERE imagen_url = 'assets/img/slider/BANNER_PLATAFORMA-2025.jpg');
INSERT INTO cms_banners (titulo, descripcion, imagen_url, imagen_movil_url, alt, enlace_url, texto_boton, nueva_pestana, orden, estado, migrado_de)
SELECT 'Atención en Urgencias 24/7', 'Atención oportuna y humanizada para toda la comunidad.', 'assets/img/slider/vacunacion.jpg', NULL, 'Profesional de enfermería aplica una vacuna a una usuaria durante una jornada de salud.', '/atencion-y-servicios-a-la-ciudadania', 'Conoce más', 0, 1, 'publicado', 'slider del inicio (versión anterior del portal)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_banners WHERE imagen_url = 'assets/img/slider/vacunacion.jpg');
INSERT INTO cms_banners (titulo, descripcion, imagen_url, imagen_movil_url, alt, enlace_url, texto_boton, nueva_pestana, orden, estado, migrado_de)
SELECT NULL, NULL, 'assets/img/slider/pqrsf.jpg', NULL, '¿Tienes preguntas, quejas o sugerencias? ¡Estamos para ti! Tu opinión es importante y nos ayuda a mejorar. Déjanos aquí tus PQRSF.', '/pqrsf', NULL, 0, 2, 'publicado', 'slider del inicio (versión anterior del portal)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_banners WHERE imagen_url = 'assets/img/slider/pqrsf.jpg');
