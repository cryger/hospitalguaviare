-- =====================================================================
--  CMS Portal Web - E.S.E. Hospital San José del Guaviare
--  Estructura:  Menú  →  Páginas  →  Entradas  →  Multimedia
--  Motor: MySQL 8 / MariaDB 10.5+   |   Charset: utf8mb4
-- =====================================================================

SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- En cPanel la base de datos se crea desde "Bases de datos MySQL"
-- (queda con prefijo, ej. usuario_hsjgportal). Selecciónela en phpMyAdmin
-- y ejecute este archivo. En un servidor propio puede usar:
--   CREATE DATABASE hsjg_portal CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
--   USE hsjg_portal;

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
-- USUARIOS DEL ADMIN (la contraseña se guarda con bcrypt)
-- Crear el primero con:  npm run crear-admin -- usuario "Nombre" clave
-- ---------------------------------------------------------------------
CREATE TABLE cms_usuarios (
  id             INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(150) NOT NULL,
  usuario        VARCHAR(80)  NOT NULL,
  password_hash  VARCHAR(100) NOT NULL,
  rol            ENUM('admin','editor') NOT NULL DEFAULT 'editor',
  activo         TINYINT(1) NOT NULL DEFAULT 1,
  ultimo_acceso  DATETIME NULL,
  creado_en      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_usuario (usuario)
) ENGINE=InnoDB;

-- ---------------------------------------------------------------------
-- Datos iniciales: estructura del portal según la Resolución 1519 de 2020
-- (Anexo 2, MinTIC) y los lineamientos del menú Participa (DAFP).
-- Las páginas quedan vacías, listas para cargar el contenido desde el admin.
-- ---------------------------------------------------------------------
INSERT INTO cms_menus (id, nombre, ubicacion) VALUES
  (1, 'Menú principal', 'principal'),
  (2, 'Pie de página',  'pie');

INSERT INTO cms_paginas (id, menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado) VALUES
  (1, 1, NULL, 'Transparencia y acceso a la información pública', 'transparencia', 'Información pública de la E.S.E. Hospital San José del Guaviare, organizada según la Ley 1712 de 2014 y la Resolución 1519 de 2020 de MinTIC.', 'contenido', NULL, 0, 1, 'publicada'),
  (2, 1, 1, '1. Información de la entidad', 'informacion-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (3, 1, 2, '1.1 Misión, visión, funciones y deberes', 'mision-vision-funciones-y-deberes', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (4, 1, 2, '1.2 Estructura orgánica - Organigrama', 'estructura-organica-organigrama', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (5, 1, 2, '1.3 Mapas y cartas descriptivas de los procesos', 'mapas-y-cartas-descriptivas-de-los-procesos', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (6, 1, 2, '1.4 Directorio institucional', 'directorio-institucional', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (7, 1, 2, '1.5 Directorio de servidores públicos, empleados o contratistas', 'directorio-de-servidores-publicos-empleados-o-contratistas', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (8, 1, 2, '1.6 Directorio de entidades', 'directorio-de-entidades', NULL, 'contenido', NULL, 5, 1, 'publicada'),
  (9, 1, 2, '1.7 Directorio de agremiaciones, asociaciones y otros grupos de interés', 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes', NULL, 'contenido', NULL, 6, 1, 'publicada'),
  (10, 1, 2, '1.8 Servicio al público, normas, formularios y protocolos de atención', 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion', NULL, 'documentos', NULL, 7, 1, 'publicada'),
  (11, 1, 2, '1.9 Procedimientos que se siguen para tomar decisiones en las diferentes áreas', 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (12, 1, 2, '1.10 Mecanismo de presentación directa de solicitudes, quejas y reclamos', 'mecanismo-pqrsd', NULL, 'enlace', '/pqrsf', 9, 1, 'publicada'),
  (13, 1, 2, '1.11 Calendario de actividades y eventos', 'calendario-de-actividades-y-eventos', NULL, 'contenido', NULL, 10, 1, 'publicada'),
  (14, 1, 2, '1.12 Información sobre decisiones que pueden afectar al público', 'informacion-sobre-decisiones-que-pueden-afectar-al-publico', NULL, 'documentos', NULL, 11, 1, 'publicada'),
  (15, 1, 2, '1.13 Entes y autoridades que lo vigilan', 'entes-y-autoridades-que-lo-vigilan', NULL, 'contenido', NULL, 12, 1, 'publicada'),
  (16, 1, 2, '1.14 Publicación de hojas de vida', 'publicacion-de-hojas-de-vida', NULL, 'documentos', NULL, 13, 1, 'publicada'),
  (17, 1, 1, '2. Normativa', 'normativa', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (18, 1, 17, '2.1 Normativa de la entidad', 'normativa-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (19, 1, 18, '2.1.1 Leyes', 'leyes', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (20, 1, 18, '2.1.2 Decreto único reglamentario', 'decreto-unico-reglamentario', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (21, 1, 18, '2.1.3 Normativa aplicable', 'normativa-aplicable', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (22, 1, 18, '2.1.4 Vínculo al Diario o Gaceta Oficial', 'vinculo-al-diario-o-gaceta-oficial', NULL, 'enlace', 'http://www.imprenta.gov.co/diario-oficial', 3, 1, 'publicada'),
  (23, 1, 18, '2.1.5 Políticas, lineamientos y manuales', 'politicas-lineamientos-y-manuales', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (24, 1, 18, '2.1.6 Agenda regulatoria', 'agenda-regulatoria', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (25, 1, 17, '2.2 Búsqueda de normas', 'busqueda-de-normas', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (26, 1, 25, '2.2.1 Sistema Único de Información Normativa - SUIN', 'sistema-unico-de-informacion-normativa-suin', NULL, 'enlace', 'https://www.suin-juriscol.gov.co', 0, 1, 'publicada'),
  (27, 1, 25, '2.2.2 Sistema de búsqueda de normas propio de la entidad', 'sistema-de-busqueda-de-normas-propio-de-la-entidad', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (28, 1, 17, '2.3 Proyectos de normas para comentarios', 'proyectos-de-normas-para-comentarios', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (29, 1, 1, '3. Contratación', 'contratacion', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (30, 1, 29, '3.1 Plan Anual de Adquisiciones', 'plan-anual-de-adquisiciones', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (31, 1, 29, '3.2 Publicación de la información contractual', 'publicacion-de-la-informacion-contractual', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (32, 1, 29, '3.3 Publicación de la ejecución de los contratos', 'publicacion-de-la-ejecucion-de-los-contratos', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (33, 1, 29, '3.4 Manual de contratación, adquisición y/o compras', 'manual-de-contratacion-adquisicion-yo-compras', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (34, 1, 29, '3.5 Formatos o modelos de contratos o pliegos tipo', 'formatos-o-modelos-de-contratos-o-pliegos-tipo', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (35, 1, 1, '4. Planeación, presupuesto e informes', 'planeacion-presupuesto-e-informes', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (36, 1, 35, '4.1 Presupuesto general de ingresos, gastos e inversión', 'presupuesto-general-de-ingresos-gastos-e-inversion', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (37, 1, 35, '4.2 Ejecución presupuestal', 'ejecucion-presupuestal', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (38, 1, 35, '4.3 Plan de acción', 'plan-de-accion', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (39, 1, 35, '4.4 Proyectos de inversión', 'proyectos-de-inversion', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (40, 1, 35, '4.5 Informes de empalme', 'informes-de-empalme', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (41, 1, 35, '4.6 Información pública y/o relevante', 'informacion-publica-yo-relevante', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (42, 1, 35, '4.7 Informes de gestión, evaluación y auditoría', 'informes-de-gestion-evaluacion-y-auditoria', NULL, 'documentos', NULL, 6, 1, 'publicada'),
  (43, 1, 35, '4.8 Informes de la Oficina de Control Interno', 'informes-de-la-oficina-de-control-interno', NULL, 'documentos', NULL, 7, 1, 'publicada'),
  (44, 1, 35, '4.9 Informe sobre defensa pública y prevención del daño antijurídico', 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (45, 1, 35, '4.10 Informes trimestrales sobre acceso a información, quejas y reclamos', 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos', NULL, 'documentos', NULL, 9, 1, 'publicada'),
  (46, 1, 1, '5. Trámites', 'tramites-transparencia', NULL, 'enlace', '/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos', 4, 1, 'publicada'),
  (47, 1, 1, '6. Participa', 'participa-transparencia', NULL, 'enlace', '/participa', 5, 1, 'publicada'),
  (48, 1, 1, '7. Datos abiertos', 'datos-abiertos', NULL, 'contenido', NULL, 6, 1, 'publicada'),
  (49, 1, 48, '7.1 Instrumentos de gestión de la información', 'instrumentos-de-gestion-de-la-informacion', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (50, 1, 49, '7.1.1 Registro de activos de información', 'registro-de-activos-de-informacion', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (51, 1, 49, '7.1.2 Índice de información clasificada y reservada', 'indice-de-informacion-clasificada-y-reservada', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (52, 1, 49, '7.1.3 Esquema de publicación de la información', 'esquema-de-publicacion-de-la-informacion', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (53, 1, 49, '7.1.4 Programa de Gestión Documental', 'programa-de-gestion-documental', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (54, 1, 49, '7.1.5 Tablas de Retención Documental', 'tablas-de-retencion-documental', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (55, 1, 49, '7.1.6 Costos de reproducción de la información pública', 'costos-de-reproduccion-de-la-informacion-publica', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (56, 1, 48, '7.2 Sección de datos abiertos', 'seccion-de-datos-abiertos', NULL, 'enlace', 'https://www.datos.gov.co', 1, 1, 'publicada'),
  (57, 1, 1, '8. Información específica para grupos de interés', 'informacion-especifica-para-grupos-de-interes', NULL, 'contenido', NULL, 7, 1, 'publicada'),
  (58, 1, 57, '8.1 Información para niñas, niños y adolescentes', 'informacion-para-ninas-ninos-y-adolescentes', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (59, 1, 57, '8.2 Información para mujeres', 'informacion-para-mujeres', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (60, 1, 57, '8.3 Otros grupos de interés', 'otros-grupos-de-interes', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (61, 1, 1, '9. Obligación de reporte de información específica por parte de la entidad', 'reporte-de-informacion-especifica', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (62, 1, NULL, 'Atención y servicios a la ciudadanía', 'atencion-y-servicios-a-la-ciudadania', 'Trámites, canales de atención y mecanismos para presentar peticiones, quejas, reclamos, sugerencias y denuncias.', 'contenido', NULL, 1, 1, 'publicada'),
  (63, 1, 62, 'Trámites y otros procedimientos', 'tramites-y-otros-procedimientos', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (64, 1, 62, 'Canales de atención y pida una cita', 'canales-de-atencion', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (65, 1, 62, 'PQRSD - Peticiones, quejas, reclamos, sugerencias y denuncias', 'pqrsd', NULL, 'enlace', '/pqrsf', 2, 1, 'publicada'),
  (66, 1, 62, 'Carpeta Ciudadana Digital', 'carpeta-ciudadana-digital', 'Consulte en un solo lugar sus documentos e información en poder del Estado colombiano.', 'enlace', 'https://carpetaciudadana.and.gov.co/', 3, 1, 'publicada'),
  (67, 1, NULL, 'Participa', 'participa', 'Espacios de participación ciudadana en la gestión de la E.S.E. Hospital San José del Guaviare (lineamientos del DAFP).', 'contenido', NULL, 2, 1, 'publicada'),
  (68, 1, 67, 'Participación para el diagnóstico de necesidades e identificación de problemas', 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (69, 1, 67, 'Planeación y presupuesto participativo', 'planeacion-y-presupuesto-participativo', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (70, 1, 67, 'Consulta ciudadana', 'consulta-ciudadana', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (71, 1, 67, 'Colaboración e innovación abierta', 'colaboracion-e-innovacion-abierta', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (72, 1, 67, 'Rendición de cuentas', 'rendicion-de-cuentas', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (73, 1, 67, 'Control social', 'control-social', NULL, 'contenido', NULL, 5, 1, 'publicada'),
  (74, 1, NULL, 'Nuestro Hospital', 'nuestro-hospital', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (75, 1, 74, 'Reseña histórica', 'resena-historica', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (76, 1, 74, 'Portafolio de servicios', 'portafolio-de-servicios', NULL, 'listado', NULL, 1, 1, 'publicada'),
  (77, 1, 74, 'Sedes y horarios de atención', 'sedes-y-horarios', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (78, 1, NULL, 'Cotizaciones y Propuestas', 'cotizaciones-propuestas', NULL, 'enlace', '/cotizaciones-propuestas', 4, 1, 'publicada'),
  (79, 1, NULL, 'Trabaja con Nosotros', 'trabaja-nosotros', NULL, 'enlace', '/trabaja-nosotros', 5, 1, 'publicada'),
  (80, 1, NULL, 'Noticias', 'noticias', NULL, 'listado', NULL, 6, 0, 'publicada'),
  (81, 2, NULL, 'Políticas de privacidad y tratamiento de datos', 'politicas-de-privacidad', NULL, 'contenido', NULL, 0, 1, 'borrador'),
  (82, 2, NULL, 'Términos y condiciones', 'terminos-y-condiciones', NULL, 'contenido', NULL, 1, 1, 'borrador');
