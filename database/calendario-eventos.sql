-- =====================================================================
-- 015 · Calendario de eventos administrable
-- Tabla cms_eventos, plantilla de página "calendario" y eventos migrados
-- del portal anterior (esehospitalguaviare.gov.co/calendario-de-eventos).
-- La página 1.11 pasa a mostrar el calendario. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS cms_eventos (
  id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo          VARCHAR(250) NOT NULL,
  descripcion     TEXT NULL,
  categoria       ENUM('capacitacion','induccion','comite','bienestar','salud','participacion','institucional') NOT NULL DEFAULT 'institucional',
  fecha_inicio    DATETIME NOT NULL COMMENT 'UTC',
  fecha_fin       DATETIME NULL COMMENT 'UTC',
  todo_el_dia     TINYINT(1) NOT NULL DEFAULT 0,
  lugar           VARCHAR(250) NULL,
  modalidad       ENUM('presencial','virtual','mixta') NOT NULL DEFAULT 'presencial',
  enlace          VARCHAR(500) NULL COMMENT 'Inscripción o reunión virtual',
  dirigido_a      VARCHAR(250) NULL,
  responsable     VARCHAR(250) NULL,
  estado          ENUM('publicado','borrador','cancelado') NOT NULL DEFAULT 'publicado',
  destacado       TINYINT(1) NOT NULL DEFAULT 0,
  migrado_de      VARCHAR(300) NULL,
  creado_en       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY ix_evento_fecha (estado, fecha_inicio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Nueva plantilla de página: calendario
ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario') NOT NULL DEFAULT 'contenido';

-- 1.11 Calendario de actividades y eventos usa la nueva plantilla
UPDATE cms_paginas
   SET plantilla = 'calendario',
       descripcion = COALESCE(NULLIF(descripcion, ''), 'Agenda de capacitaciones, jornadas, comités y espacios de participación de la E.S.E. Hospital San José del Guaviare.')
 WHERE slug = 'calendario-de-actividades-y-eventos';

-- La lista fija de octubre queda archivada (sus eventos pasan al calendario)
UPDATE cms_entradas SET estado = 'archivada' WHERE slug = 'calendario-octubre-2026' AND estado = 'publicada';

-- Eventos migrados

INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Creación de cuenta en SIMO y Excel', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará capacitación sobre creación de cuenta en SIMO y de 5:10 p. m. a 6:00 p. m. sobre herramientas de Office - Excel.', 'capacitacion', '2026-06-16 21:00:00', '2026-06-16 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Dayana y Sandra - Talento Humano; Santiago Marroquin - Sistemas', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Creación de cuenta en SIMO y Excel' AND fecha_inicio = '2026-06-16 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Adaptación al cambio y ciberseguridad', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se abordará el tema Adaptación al cambio y de 5:10 p. m. a 6:00 p. m. Protección de datos y ciberseguridad.', 'capacitacion', '2026-06-30 21:00:00', '2026-06-30 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Daniela - Psicóloga Talento Humano; Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Adaptación al cambio y ciberseguridad' AND fecha_inicio = '2026-06-30 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Indicadores y herramientas colaborativas', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará capacitación sobre lectura y análisis de indicadores y de 5:10 p. m. a 6:00 p. m. sobre uso de Teams y herramientas colaborativas.', 'capacitacion', '2026-07-14 21:00:00', '2026-07-14 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Ferney Marin - Jefe de Oficina de Calidad; Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Indicadores y herramientas colaborativas' AND fecha_inicio = '2026-07-14 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Solución de problemas y phishing', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se abordará la solución rápida de problemas frecuentes en equipos y de 5:10 p. m. a 6:00 p. m. el tema de phishing.', 'capacitacion', '2026-07-28 21:00:00', '2026-07-28 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Johanna - Trabajadora Social Talento Humano; Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Solución de problemas y phishing' AND fecha_inicio = '2026-07-28 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Almacenamiento en la nube y Malware', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará capacitación sobre uso de almacenamiento en la nube (Drive y OneDrive) y de 5:10 p. m. a 6:00 p. m. sobre Malware.', 'capacitacion', '2026-08-18 21:00:00', '2026-08-18 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Almacenamiento en la nube y Malware' AND fecha_inicio = '2026-08-18 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Adaptación al cambio y gestión del conocimiento', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará la segunda jornada de Adaptación al cambio y de 5:10 p. m. a 6:00 p. m. se sensibilizará sobre la importancia de la gestión del conocimiento.', 'capacitacion', '2026-08-25 21:00:00', '2026-08-25 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Johanna - Trabajadora Social Talento Humano; Dayana y Johanna - Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Adaptación al cambio y gestión del conocimiento' AND fecha_inicio = '2026-08-25 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Protección de datos y transparencia', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se abordará Protección de datos y ciberseguridad y de 5:10 p. m. a 6:00 p. m. Transparencia al día: Ley 1712 y Decreto 612 sin complicaciones.', 'capacitacion', '2026-09-08 21:00:00', '2026-09-08 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Protección de datos y transparencia' AND fecha_inicio = '2026-09-08 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Adaptación al cambio y gestión del conocimiento', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará la segunda jornada de Adaptación al cambio y de 5:10 p. m. a 6:00 p. m. se sensibilizará sobre la importancia de la gestión del conocimiento.', 'capacitacion', '2026-09-22 21:00:00', '2026-09-22 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Johanna - Trabajadora Social Talento Humano; Dayana y Johanna - Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Adaptación al cambio y gestión del conocimiento' AND fecha_inicio = '2026-09-22 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - COPILOT y protección de datos', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará capacitación sobre COPILOT El Kiosco y de 5:10 p. m. a 6:00 p. m. sobre Protección de datos y ciberseguridad - Kiosco.', 'capacitacion', '2026-09-29 21:00:00', '2026-09-29 23:00:00', 0, 'Kiosco de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - COPILOT y protección de datos' AND fecha_inicio = '2026-09-29 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Salida ecológica – Trabajo Social', 'Salida ecológica de bienestar organizada por Trabajo Social.', 'bienestar', '2026-10-02 12:30:00', '2026-10-02 21:00:00', 0, NULL, 'presencial', NULL, 'Funcionarios y colaboradores', 'Trabajo Social', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Salida ecológica – Trabajo Social' AND fecha_inicio = '2026-10-02 12:30:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Mesa de trabajo de Calidad – Manual de inducción', 'Mesa de trabajo de calidad para la revisión del Manual de Inducción.', 'comite', '2026-10-06 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Equipo de trabajo', 'Oficina de Calidad', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Mesa de trabajo de Calidad – Manual de inducción' AND fecha_inicio = '2026-10-06 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - SARLAFT', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. se realizará capacitación sobre SARLAFT y de 5:10 p. m. a 6:00 p. m. sobre la página de SARLAFT.', 'capacitacion', '2026-10-06 21:00:00', '2026-10-06 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Jairo - Planeación; Henrry - Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - SARLAFT' AND fecha_inicio = '2026-10-06 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Salida ecológica – Trabajo Social', 'Salida ecológica de bienestar organizada por Trabajo Social.', 'bienestar', '2026-10-09 12:30:00', '2026-10-09 21:00:00', 0, NULL, 'presencial', NULL, 'Funcionarios y colaboradores', 'Trabajo Social', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Salida ecológica – Trabajo Social' AND fecha_inicio = '2026-10-09 12:30:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-10-13 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-10-13 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-10-14 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-10-14 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Mesa Bipartita', 'Sesión de la Mesa Bipartita.', 'comite', '2026-10-14 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Integrantes de la mesa', NULL, 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Mesa Bipartita' AND fecha_inicio = '2026-10-14 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Capacitación a evaluados', 'Capacitación dirigida a los servidores públicos evaluados.', 'capacitacion', '2026-10-20 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Servidores públicos evaluados', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Capacitación a evaluados' AND fecha_inicio = '2026-10-20 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Mesa de trabajo de Calidad – Manual de inducción', 'Mesa de trabajo de calidad para la revisión del Manual de Inducción.', 'comite', '2026-10-20 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Equipo de trabajo', 'Oficina de Calidad', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Mesa de trabajo de Calidad – Manual de inducción' AND fecha_inicio = '2026-10-20 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de reinducción', 'Jornada de reinducción institucional para funcionarios y colaboradores.', 'induccion', '2026-10-27 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Funcionarios y colaboradores', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de reinducción' AND fecha_inicio = '2026-10-27 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Capacitación a evaluados', 'Capacitación dirigida a los servidores públicos evaluados.', 'capacitacion', '2026-11-10 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Servidores públicos evaluados', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Capacitación a evaluados' AND fecha_inicio = '2026-11-10 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Lectura y análisis de indicadores', 'Jornada de capacitación del Martes del Saber. De 4:00 p. m. a 5:00 p. m. el tema de capacitación se encuentra pendiente de definir. De 5:10 p. m. a 6:00 p. m. se realizará capacitación sobre lectura y análisis de indicadores.', 'capacitacion', '2026-11-10 21:00:00', '2026-11-10 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Calidad - Jefe Ferney', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Lectura y análisis de indicadores' AND fecha_inicio = '2026-11-10 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Comité de Docencia Servicio (Andino, SENA y UNAL)', 'Reunión del Comité de Docencia Servicio con participación de Andino, SENA y la Universidad Nacional de Colombia.', 'comite', '2026-11-11 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Integrantes del comité', NULL, 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Comité de Docencia Servicio (Andino, SENA y UNAL)' AND fecha_inicio = '2026-11-11 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Jornada de capacitación', 'Jornada de capacitación del Martes del Saber. Los temas de capacitación de 4:00 p. m. a 5:00 p. m. y de 5:10 p. m. a 6:00 p. m. se encuentran pendientes de definir.', 'capacitacion', '2026-11-24 21:00:00', '2026-11-24 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Jornada de capacitación' AND fecha_inicio = '2026-11-24 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de reinducción', 'Jornada de reinducción institucional para funcionarios y colaboradores.', 'induccion', '2026-11-25 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Funcionarios y colaboradores', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de reinducción' AND fecha_inicio = '2026-11-25 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-12-01 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-12-01 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-12-02 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-12-02 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Martes del Saber - Jornada de capacitación', 'Jornada de capacitación del Martes del Saber. Los temas de capacitación de 4:00 p. m. a 5:00 p. m. y de 5:10 p. m. a 6:00 p. m. se encuentran pendientes de definir.', 'capacitacion', '2026-12-08 21:00:00', '2026-12-08 23:00:00', 0, 'Auditorio de la E.S.E. Hospital San José del Guaviare', 'presencial', NULL, 'Funcionarios y colaboradores', 'Gobierno Digital', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Martes del Saber - Jornada de capacitación' AND fecha_inicio = '2026-12-08 21:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-12-09 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-12-09 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de inducción', 'Jornada de inducción institucional para el personal que ingresa a la E.S.E.', 'induccion', '2026-12-10 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Personal que ingresa a la entidad', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de inducción' AND fecha_inicio = '2026-12-10 17:00:00');
INSERT INTO cms_eventos (titulo, descripcion, categoria, fecha_inicio, fecha_fin, todo_el_dia, lugar, modalidad, enlace, dirigido_a, responsable, estado, migrado_de)
SELECT 'Jornada de reinducción', 'Jornada de reinducción institucional para funcionarios y colaboradores.', 'induccion', '2026-12-16 17:00:00', NULL, 1, NULL, 'presencial', NULL, 'Funcionarios y colaboradores', 'Talento Humano', 'publicado', 'esehospitalguaviare.gov.co/calendario-de-eventos'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_eventos WHERE titulo = 'Jornada de reinducción' AND fecha_inicio = '2026-12-16 17:00:00');
