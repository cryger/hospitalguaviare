-- =====================================================================
-- 034 · Información de interés del portal anterior (Res. 1519)
--  - Nuevas plantillas "preguntas" (preguntas frecuentes) y "glosario" (A-Z con buscador)
--  - Atención y servicios a la ciudadanía › Preguntas frecuentes y Glosario (páginas nuevas)
--  - 7.2 Sección de datos abiertos: 7 conjuntos de datos (Excel y CSV) y enlace a datos.gov.co
--  - 7.1.1, 7.1.2 y 7.1.3: conjunto de datos correspondiente
--  - Talento humano: convocatorias, comunicados, comités y reglamento interno de trabajo
--  - 2.1.5 Políticas: protocolo y formato de conflicto de intereses
-- 257 entradas y 66 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes','plataforma','directorio','preguntas','glosario') NOT NULL DEFAULT 'contenido';

-- Páginas nuevas en Atención y servicios a la ciudadanía
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, orden, visible_en_menu, estado, migrado_de)
SELECT a.menu_id, a.id, 'Preguntas frecuentes', 'preguntas-frecuentes', 'Respuestas a las dudas más comunes sobre contacto, citas, trámites, PQRSFD, derechos y deberes de los usuarios.', 'preguntas', 8, 1, 'publicada', 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas a WHERE a.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'preguntas-frecuentes');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, orden, visible_en_menu, estado, migrado_de)
SELECT a.menu_id, a.id, 'Glosario', 'glosario', 'Términos jurídicos, administrativos y de salud que se usan en la gestión del hospital, de la A a la Z.', 'glosario', 9, 1, 'publicada', 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas a WHERE a.slug = 'atencion-y-servicios-a-la-ciudadania' AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'glosario');

-- Talento humano: la descripción incluye las convocatorias y comunicados
UPDATE cms_paginas SET descripcion = 'Manual de funciones, planes, convocatorias, comités, elecciones de representantes, capacitaciones y reglamento interno de trabajo del área de Talento Humano.'
 WHERE slug = 'talento-humano' AND descripcion = 'Manual de funciones, planes de gestión gerencial y documentos del área de Talento Humano.';

-- 7.2 deja de ser un enlace y publica los conjuntos de datos
UPDATE cms_paginas SET plantilla = 'documentos', url_externa = NULL,
       descripcion = COALESCE(NULLIF(descripcion, ''), 'Conjuntos de datos abiertos de la E.S.E. en formatos Excel y CSV, y enlace al portal nacional datos.gov.co.')
 WHERE slug = 'seccion-de-datos-abiertos' AND plantilla = 'enlace';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-activos_información.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Registro de activos de información (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-activos_información.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.csv', 'documento', 'text/csv', 'Registro de activos de información (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-indice_información_clasificada.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Índice de información clasificada y reservada (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-indice_información_clasificada.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.csv', 'documento', 'text/csv', 'Índice de información clasificada y reservada (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-esquema_publicación.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Esquema de publicación de la información (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-esquema_publicación.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.csv', 'documento', 'text/csv', 'Esquema de publicación de la información (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-directorio_teléfonos_HSJG.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Directorio de teléfonos institucionales (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-directorio_teléfonos_HSJG.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.csv', 'documento', 'text/csv', 'Directorio de teléfonos institucionales (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-PAAC_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anticorrupción y de Atención al Ciudadano (PAAC) 2025 (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-PAAC_2025.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.csv', 'documento', 'text/csv', 'Plan Anticorrupción y de Atención al Ciudadano (PAAC) 2025 (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-plan_acción_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional 2025 (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-plan_acción_2025.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.csv', 'documento', 'text/csv', 'Plan de acción institucional 2025 (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-PQRSF_Consolidado_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'PQRSF consolidado 2025 (Excel)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dataset-PQRSF_Consolidado_2025.csv', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.csv', 'documento', 'text/csv', 'PQRSF consolidado 2025 (CSV)', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.csv');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Portal de Datos Abiertos – datos.gov.co', 'https://www.datos.gov.co', 'otro', NULL, 'Portal de Datos Abiertos – datos.gov.co', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.datos.gov.co');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROTOCOLO PARA LA DECLARACIÓN Y GESTIÓN DE CONFLICTO DE INTERES E IMPEDIMENTOS Y REACUSACIONES V2 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf', 'documento', 'application/pdf', 'Protocolo para la declaración y gestión de conflictos de intereses, impedimentos y recusaciones V2', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '05 FORMATO DE DECLARACIÓN DE SITUACIONES DE CONFLICTO DE INTERESES V1 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf', 'documento', 'application/pdf', 'Formato de declaración de situaciones de conflicto de intereses V1', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MODIFICACION RES. 0533 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MODIFICACION%20RES.%200533%202026.pdf', 'documento', 'application/pdf', 'Resolución 0533 de 2026', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MODIFICACION%20RES.%200533%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución No. 0610 COMITÉ COPASST-MOD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST-MOD.pdf', 'documento', 'application/pdf', 'Resolución 0610 de 2025 – COPASST', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST-MOD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTO ADMINISTRATIVO N° 0482 MESA BIPARTITA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTO%20ADMINISTRATIVO%20N%C2%B0%200482%20MESA%20BIPARTITA.pdf', 'documento', 'application/pdf', 'Acto administrativo 0482 de 2026', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTO%20ADMINISTRATIVO%20N%C2%B0%200482%20MESA%20BIPARTITA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 0436, MODIFICACION FECHA VIGENCIA ACUERDO 2025 A 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200436,%20MODIFICACION%20FECHA%20VIGENCIA%20ACUERDO%202025%20A%202026.pdf', 'documento', 'application/pdf', 'Acto administrativo 0436 de 2026', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200436,%20MODIFICACION%20FECHA%20VIGENCIA%20ACUERDO%202025%20A%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DIVULGACION DE ASPIRANTES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DIVULGACION%20DE%20ASPIRANTES.pdf', 'documento', 'application/pdf', 'Divulgación de aspirantes – Comisión de Personal', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DIVULGACION%20DE%20ASPIRANTES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA PARA LA ELECCIÓN DE LOS REPRESENTANTE_20260224_183703.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20PARA%20LA%20ELECCI%C3%93N%20DE%20LOS%20REPRESENTANTE_20260224_183703.pdf', 'documento', 'application/pdf', 'Resolución 0152 de 2026', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20PARA%20LA%20ELECCI%C3%93N%20DE%20LOS%20REPRESENTANTE_20260224_183703.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'COMUNICADO N° 03 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COMUNICADO%20N%C2%B0%2003%20(1).pdf', 'documento', 'application/pdf', 'Comunicado 03 de 2024', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COMUNICADO%20N%C2%B0%2003%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Gestión basado en resultados.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gesti%C3%B3n%20basado%20en%20resultados.pdf', 'documento', 'application/pdf', 'Comunicado – Curso Gestión basada en resultados', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gesti%C3%B3n%20basado%20en%20resultados.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEMINARIO DERECHOS HUMANOS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEMINARIO%20DERECHOS%20HUMANOS.pdf', 'documento', 'application/pdf', 'Comunicado – Seminario de derechos humanos', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEMINARIO%20DERECHOS%20HUMANOS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONFORMACION COMITE BIENESTAR SOCIAL E INCENTIVOS 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONFORMACION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVOS%202023.pdf', 'documento', 'application/pdf', 'Resolución 1077 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONFORMACION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVOS%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION COMITE BIENESTAR SOCIAL E INCENTIVO 2023-2025....pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVO%202023-2025....pdf', 'documento', 'application/pdf', 'Resolución 1039 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVO%202023-2025....pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION_CONFORMACION_COMITE_CONVIVENCIA_LABORAL_2023_2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_CONFORMACION_COMITE_CONVIVENCIA_LABORAL_2023_2025.pdf', 'documento', 'application/pdf', 'Resolución 0844 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_CONFORMACION_COMITE_CONVIVENCIA_LABORAL_2023_2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION_COMISION_PERSONAL_2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_COMISION_PERSONAL_2023.pdf', 'documento', 'application/pdf', 'Resolución de conformación de la Comisión de Personal 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_COMISION_PERSONAL_2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CamScanner 18-07-2023 22.01.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CamScanner%2018-07-2023%2022.01.pdf', 'documento', 'application/pdf', 'Respuesta a reclamaciones y resultado final – Convocatoria 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CamScanner%2018-07-2023%2022.01.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'convocatoria Bacterióloga.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/convocatoria%20Bacteri%C3%B3loga.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Convocatoria bacterióloga 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/convocatoria%20Bacteri%C3%B3loga.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESPUESTA RECLAMACIONES CONVOCATORIA INTERNA N°4-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B04-2023.pdf', 'documento', 'application/pdf', 'Respuesta a reclamaciones – Convocatoria interna 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B04-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'HOSPITAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/HOSPITAL.pdf', 'documento', 'application/pdf', 'Modificación de la convocatoria interna 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/HOSPITAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Modificacion de la convocartoria interna N°004 del 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Modificacion%20de%20la%20convocartoria%20interna%20N%C2%B0004%20del%202023.pdf', 'documento', 'application/pdf', 'Ampliación del cronograma – Convocatoria interna 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Modificacion%20de%20la%20convocartoria%20interna%20N%C2%B0004%20del%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESPUESTA A RECLAMACIONES CONVOCATORIA INTERNA N°003 DE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B0003%20DE%202023.pdf', 'documento', 'application/pdf', 'Respuesta a reclamaciones – Convocatoria interna 003 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B0003%20DE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESULTADOS CONVOCATORIA INTERNA 003-2023 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20003-2023%20(1).pdf', 'documento', 'application/pdf', 'Resultados – Convocatoria interna 003 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20003-2023%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESULTADOS CONVOCATORIA INTERNA 004-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20004-2023.pdf', 'documento', 'application/pdf', 'Resultados – Convocatoria interna 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20004-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CURSO CONTROL SOCIAL A LA GESTIÓN PÚBLICA CON EN ENFOQUE A LA SALUD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CURSO%20CONTROL%20SOCIAL%20A%20LA%20GESTI%C3%93N%20P%C3%9ABLICA%20CON%20EN%20ENFOQUE%20A%20LA%20SALUD.pdf', 'documento', 'application/pdf', 'Curso de control social a la gestión pública con enfoque en salud', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CURSO%20CONTROL%20SOCIAL%20A%20LA%20GESTI%C3%93N%20P%C3%9ABLICA%20CON%20EN%20ENFOQUE%20A%20LA%20SALUD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION COMITE SST 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20SST%202023.pdf', 'documento', 'application/pdf', 'Resolución 0653 de 2023 – COPASST', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20SST%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION COMITE DE CONVICENCIA LABORAL 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20DE%20CONVICENCIA%20LABORAL%202023.pdf', 'documento', 'application/pdf', 'Resolución 0652 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20DE%20CONVICENCIA%20LABORAL%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CAPACITACION COMUNICACION EFECTIVA Y CONFLICTOS DE INTERES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CAPACITACION%20COMUNICACION%20EFECTIVA%20Y%20CONFLICTOS%20DE%20INTERES.pdf', 'documento', 'application/pdf', 'Comunicado 015 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CAPACITACION%20COMUNICACION%20EFECTIVA%20Y%20CONFLICTOS%20DE%20INTERES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA INTERNA N° 003-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20003-2023.pdf', 'documento', 'application/pdf', 'Convocatoria interna 003 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20003-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA INTERNA N° 004-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20004-2023.pdf', 'documento', 'application/pdf', 'Convocatoria interna 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20004-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Formato anexo 1 – Convocatoria N°003 - 004 -2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Formato%20anexo%201%20%E2%80%93%20Convocatoria%20N%C2%B0003%20-%20004%20-2023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Formato anexo 1 – Convocatorias 003 y 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Formato%20anexo%201%20%E2%80%93%20Convocatoria%20N%C2%B0003%20-%20004%20-2023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Comunicado N° 012.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Comunicado%20N%C2%B0%20012.pdf', 'documento', 'application/pdf', 'Comunicado interno 012 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Comunicado%20N%C2%B0%20012.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA N°3.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B03.pdf', 'documento', 'application/pdf', 'Convocatoria 03 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B03.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA N°4.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B04.pdf', 'documento', 'application/pdf', 'Convocatoria 04 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B04.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FORMATO DE INSCRIPCIÓN.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20DE%20INSCRIPCI%C3%93N.doc', 'documento', 'application/msword', 'Formato de inscripción', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20DE%20INSCRIPCI%C3%93N.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0533 CONVOCATORIA REPRESENTANTE JUNTA DIRECTIVA (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200533%20CONVOCATORIA%20REPRESENTANTE%20JUNTA%20DIRECTIVA%20(2).pdf', 'documento', 'application/pdf', 'Resolución 0533 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200533%20CONVOCATORIA%20REPRESENTANTE%20JUNTA%20DIRECTIVA%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FORMATO DE INSCRIPCION JUNTA DIRECTIVA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20DE%20INSCRIPCION%20JUNTA%20DIRECTIVA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Formato de inscripción – Junta Directiva', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20DE%20INSCRIPCION%20JUNTA%20DIRECTIVA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESPUESTA A LAS DECLARACIONES  CONVOCATORIA INTERNA N° 002-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20LAS%20DECLARACIONES%20%20CONVOCATORIA%20INTERNA%20N%C2%B0%20002-2023.pdf', 'documento', 'application/pdf', 'Respuesta a reclamaciones – Convocatoria interna 002 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20LAS%20DECLARACIONES%20%20CONVOCATORIA%20INTERNA%20N%C2%B0%20002-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0466 DE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200466%20DE%202023.pdf', 'documento', 'application/pdf', 'Resolución 0466 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200466%20DE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESULTADO CONVOCATORIA INTERNA N°002-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADO%20CONVOCATORIA%20INTERNA%20N%C2%B0002-2023.pdf', 'documento', 'application/pdf', 'Resultado – Convocatoria interna 002 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADO%20CONVOCATORIA%20INTERNA%20N%C2%B0002-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ANEXO 1 Formato Verificacion Hojas de Vida.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/ANEXO%201%20Formato%20Verificacion%20Hojas%20de%20Vida.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Anexo 1 – Formato de verificación de hojas de vida', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/ANEXO%201%20Formato%20Verificacion%20Hojas%20de%20Vida.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 453-2023 CONVOCATORIA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20453-2023%20CONVOCATORIA.pdf', 'documento', 'application/pdf', 'Resolución 0453 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20453-2023%20CONVOCATORIA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA CON APLAZAMIENTO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20CON%20APLAZAMIENTO.pdf', 'documento', 'application/pdf', 'Resolución 0370 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20CON%20APLAZAMIENTO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ANEXO 2 RESOLUCION 0370 DE 2023 FORMATO DE INSCRIPCIÓN.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%202%20RESOLUCION%200370%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc', 'documento', 'application/msword', 'Anexo 2 – Formato de inscripción', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%202%20RESOLUCION%200370%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA INTERNARESOLUCION 0361.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNARESOLUCION%200361.pdf', 'documento', 'application/pdf', 'Resolución 0361 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNARESOLUCION%200361.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ANEXO 1 RESOLUCION 0361 DE 2023 FORMATO DE INSCRIPCIÓN.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%201%20RESOLUCION%200361%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc', 'documento', 'application/msword', 'Anexo 1 – Formato de inscripción', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%201%20RESOLUCION%200361%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA MEDICO AUDITOR SALUD CORRECIONES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20MEDICO%20AUDITOR%20SALUD%20CORRECIONES.pdf', 'documento', 'application/pdf', 'Convocatoria médico auditor en salud', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20MEDICO%20AUDITOR%20SALUD%20CORRECIONES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONVOCATORIA PÚBLICA REVISOR FISCAL HOSPITAL 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CONVOCATORIA%20PU%CC%81BLICA%20REVISOR%20FISCAL%20HOSPITAL%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Convocatoria pública revisor fiscal 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CONVOCATORIA%20PU%CC%81BLICA%20REVISOR%20FISCAL%20HOSPITAL%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION DE LA CONVOCATORIA 001-2023 FIRMADA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20DE%20LA%20CONVOCATORIA%20001-2023%20FIRMADA.pdf', 'documento', 'application/pdf', 'Evaluación de la convocatoria 001 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20DE%20LA%20CONVOCATORIA%20001-2023%20FIRMADA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'comunicado interno N.005 comision de personal.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20N.005%20comision%20de%20personal.pdf', 'documento', 'application/pdf', 'Comunicado interno 005 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20N.005%20comision%20de%20personal.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'comunicado interno 004 comite de convivencia laboral.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20004%20comite%20de%20convivencia%20laboral.pdf', 'documento', 'application/pdf', 'Comunicado interno 004 de 2023', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20004%20comite%20de%20convivencia%20laboral.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 08 DEL 27 DE OCTUBRE DE 2020- REGLAMENTO INTERNO DE TRABAJO (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf', 'documento', 'application/pdf', 'Acuerdo 08 de 2020 – Reglamento interno de trabajo', NULL, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Registro de activos de información', 'registro-de-activos-de-informacion', 'Inventario de la información que produce, adquiere o custodia la entidad.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'registro-de-activos-de-informacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'registro-de-activos-de-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'registro-de-activos-de-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Registro de activos de información – datos abiertos', 'registro-de-activos-de-informacion-datos-abiertos', 'Inventario de la información que produce, adquiere o custodia la entidad.', NULL, 'documento', 'Datos abiertos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'registro-de-activos-de-informacion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'registro-de-activos-de-informacion-datos-abiertos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'registro-de-activos-de-informacion'
 WHERE e.slug = 'registro-de-activos-de-informacion-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-activos_informaci%C3%B3n.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'registro-de-activos-de-informacion'
 WHERE e.slug = 'registro-de-activos-de-informacion-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Índice de información clasificada y reservada', 'indice-de-informacion-clasificada-y-reservada', 'Información que por ley no es de acceso público, con su fundamento legal.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 20, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'indice-de-informacion-clasificada-y-reservada');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'indice-de-informacion-clasificada-y-reservada' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'indice-de-informacion-clasificada-y-reservada' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Índice de información clasificada y reservada – datos abiertos', 'indice-de-informacion-clasificada-y-reservada-datos-abiertos', 'Información que por ley no es de acceso público, con su fundamento legal.', NULL, 'documento', 'Datos abiertos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'indice-de-informacion-clasificada-y-reservada'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'indice-de-informacion-clasificada-y-reservada-datos-abiertos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'indice-de-informacion-clasificada-y-reservada'
 WHERE e.slug = 'indice-de-informacion-clasificada-y-reservada-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-indice_informaci%C3%B3n_clasificada.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'indice-de-informacion-clasificada-y-reservada'
 WHERE e.slug = 'indice-de-informacion-clasificada-y-reservada-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Esquema de publicación de la información', 'esquema-de-publicacion-de-la-informacion', 'Qué información publica la entidad, dónde y con qué frecuencia.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 30, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'esquema-de-publicacion-de-la-informacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'esquema-de-publicacion-de-la-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'esquema-de-publicacion-de-la-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Esquema de publicación de la información – datos abiertos', 'esquema-de-publicacion-de-la-informacion-datos-abiertos', 'Qué información publica la entidad, dónde y con qué frecuencia.', NULL, 'documento', 'Datos abiertos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-28 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'esquema-de-publicacion-de-la-informacion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'esquema-de-publicacion-de-la-informacion-datos-abiertos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'esquema-de-publicacion-de-la-informacion'
 WHERE e.slug = 'esquema-de-publicacion-de-la-informacion-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-esquema_publicaci%C3%B3n.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'esquema-de-publicacion-de-la-informacion'
 WHERE e.slug = 'esquema-de-publicacion-de-la-informacion-datos-abiertos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Directorio de teléfonos institucionales', 'directorio-de-telefonos-institucionales', 'Teléfonos fijos y celulares por dependencia.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-27 12:00:00', 40, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'directorio-de-telefonos-institucionales');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'directorio-de-telefonos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-directorio_tel%C3%A9fonos_HSJG.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'directorio-de-telefonos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anticorrupción y de Atención al Ciudadano (PAAC) 2025', 'plan-anticorrupcion-y-de-atencion-al-ciudadano-paac-2025', 'Actividades, responsables y fechas del PAAC 2025.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-27 12:00:00', 50, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-anticorrupcion-y-de-atencion-al-ciudadano-paac-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'plan-anticorrupcion-y-de-atencion-al-ciudadano-paac-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PAAC_2025.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'plan-anticorrupcion-y-de-atencion-al-ciudadano-paac-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2025', 'plan-de-accion-institucional-2025', 'Metas, actividades e indicadores del plan de acción 2025.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-27 12:00:00', 60, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'plan-de-accion-institucional-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-plan_acci%C3%B3n_2025.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'plan-de-accion-institucional-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'PQRSF consolidado 2025', 'pqrsf-consolidado-2025', 'Peticiones, quejas, reclamos, sugerencias y felicitaciones recibidas en 2025.', NULL, 'documento', 'Conjuntos de datos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-27 12:00:00', 70, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pqrsf-consolidado-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'pqrsf-consolidado-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/dataset-PQRSF_Consolidado_2025.csv'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'pqrsf-consolidado-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Portal de Datos Abiertos del Estado colombiano', 'portal-de-datos-abiertos-del-estado-colombiano', 'Consulte los conjuntos de datos abiertos de las entidades públicas en datos.gov.co.', NULL, 'enlace', 'Portal nacional', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-27 12:00:00', 80, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'seccion-de-datos-abiertos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'portal-de-datos-abiertos-del-estado-colombiano');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.datos.gov.co'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'seccion-de-datos-abiertos'
 WHERE e.slug = 'portal-de-datos-abiertos-del-estado-colombiano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo para la declaración y gestión de conflictos de intereses, impedimentos y recusaciones', 'protocolo-para-la-declaracion-y-gestion-de-conflictos-de-intereses-impedimentos-y-recusaciones', 'Protocolo institucional (versión 2) y formato de declaración de situaciones de conflicto de intereses.', NULL, 'documento', 'Control y riesgo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-03-13 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'protocolo-para-la-declaracion-y-gestion-de-conflictos-de-intereses-impedimentos-y-recusaciones');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-para-la-declaracion-y-gestion-de-conflictos-de-intereses-impedimentos-y-recusaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-para-la-declaracion-y-gestion-de-conflictos-de-intereses-impedimentos-y-recusaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0533 de 2026 – Modificación de la conformación del COPASST', 'resolucion-0533-de-2026-modificacion-de-la-conformacion-del-copasst', 'Modifica parcialmente la Resolución 0610 de 2025 sobre la conformación del Comité Paritario de Seguridad y Salud en el Trabajo (COPASST).', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-05 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0533-de-2026-modificacion-de-la-conformacion-del-copasst');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MODIFICACION%20RES.%200533%202026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0533-de-2026-modificacion-de-la-conformacion-del-copasst' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0610 de 2025 – Conformación del COPASST 2025-2027', 'resolucion-0610-de-2025-conformacion-del-copasst-2025-2027', 'Conforma el Comité Paritario de Seguridad y Salud en el Trabajo (COPASST) de la E.S.E. para la vigencia 2025-2027.', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-05 12:00:00', 20, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0610-de-2025-conformacion-del-copasst-2025-2027');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST-MOD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0610-de-2025-conformacion-del-copasst-2025-2027' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acto administrativo 0482 de 2026 – Mesa bipartita de seguimiento del acuerdo colectivo', 'acto-administrativo-0482-de-2026-mesa-bipartita-de-seguimiento-del-acuerdo-colectivo', 'Conforma la mesa bipartita de seguimiento del acuerdo colectivo suscrito en 2024 con las organizaciones sindicales ANTHOC y SINDESS.', NULL, 'documento', 'Acuerdo colectivo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-16 12:00:00', 30, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acto-administrativo-0482-de-2026-mesa-bipartita-de-seguimiento-del-acuerdo-colectivo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTO%20ADMINISTRATIVO%20N%C2%B0%200482%20MESA%20BIPARTITA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'acto-administrativo-0482-de-2026-mesa-bipartita-de-seguimiento-del-acuerdo-colectivo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acto administrativo 0436 de 2026 – Modificación de la vigencia del acuerdo colectivo', 'acto-administrativo-0436-de-2026-modificacion-de-la-vigencia-del-acuerdo-colectivo', 'Modifica parcialmente la Resolución 1587 de 2024, que adoptó el acuerdo colectivo, en lo relativo a su vigencia (2025 a 2026).', NULL, 'documento', 'Acuerdo colectivo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-16 12:00:00', 40, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acto-administrativo-0436-de-2026-modificacion-de-la-vigencia-del-acuerdo-colectivo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200436,%20MODIFICACION%20FECHA%20VIGENCIA%20ACUERDO%202025%20A%202026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'acto-administrativo-0436-de-2026-modificacion-de-la-vigencia-del-acuerdo-colectivo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Elección de representantes ante la Comisión de Personal 2026 – Divulgación de aspirantes', 'eleccion-de-representantes-ante-la-comision-de-personal-2026-divulgacion-de-aspirantes', 'Listado de aspirantes a representantes de los empleados ante la Comisión de Personal (Resolución 0152 de 2026).', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-03-11 12:00:00', 50, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'eleccion-de-representantes-ante-la-comision-de-personal-2026-divulgacion-de-aspirantes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DIVULGACION%20DE%20ASPIRANTES.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'eleccion-de-representantes-ante-la-comision-de-personal-2026-divulgacion-de-aspirantes' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0152 de 2026 – Convocatoria a elección de representantes ante la Comisión de Personal', 'resolucion-0152-de-2026-convocatoria-a-eleccion-de-representantes-ante-la-comision-de-personal', 'Convoca y fija el procedimiento, requisitos y cronograma para elegir a los representantes de los empleados ante la Comisión de Personal.', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-02-25 12:00:00', 60, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0152-de-2026-convocatoria-a-eleccion-de-representantes-ante-la-comision-de-personal');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20PARA%20LA%20ELECCI%C3%93N%20DE%20LOS%20REPRESENTANTE_20260224_183703.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0152-de-2026-convocatoria-a-eleccion-de-representantes-ante-la-comision-de-personal' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicado 03 de 2024 – Vacante definitiva de Auxiliar Área de la Salud', 'comunicado-03-de-2024-vacante-definitiva-de-auxiliar-area-de-la-salud', 'Convocatoria al personal inscrito en carrera administrativa para postularse a una vacante definitiva de Auxiliar Área de la Salud, grado 04, código 412.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-06-11 12:00:00', 70, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicado-03-de-2024-vacante-definitiva-de-auxiliar-area-de-la-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COMUNICADO%20N%C2%B0%2003%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'comunicado-03-de-2024-vacante-definitiva-de-auxiliar-area-de-la-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Curso «Gestión basada en resultados»', 'curso-gestion-basada-en-resultados', 'Invitación a servidores y colaboradores a participar en el curso.', NULL, 'documento', 'Capacitaciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-11-08 12:00:00', 80, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'curso-gestion-basada-en-resultados');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gesti%C3%B3n%20basado%20en%20resultados.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'curso-gestion-basada-en-resultados' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seminario de derechos humanos', 'seminario-de-derechos-humanos', 'Invitación a participar en el seminario de derechos humanos.', NULL, 'documento', 'Capacitaciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-09-26 12:00:00', 90, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'seminario-de-derechos-humanos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEMINARIO%20DERECHOS%20HUMANOS.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'seminario-de-derechos-humanos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 1077 de 2023 – Conformación del Comité de Bienestar Social e Incentivos 2023-2025', 'resolucion-1077-de-2023-conformacion-del-comite-de-bienestar-social-e-incentivos-2023-2025', 'Conformación del Comité de Bienestar Social e Incentivos para la vigencia 2023-2025.', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-09-25 12:00:00', 100, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-1077-de-2023-conformacion-del-comite-de-bienestar-social-e-incentivos-2023-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONFORMACION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVOS%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-1077-de-2023-conformacion-del-comite-de-bienestar-social-e-incentivos-2023-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 1039 de 2023 – Elección de representantes al Comité de Bienestar Social e Incentivos', 'resolucion-1039-de-2023-eleccion-de-representantes-al-comite-de-bienestar-social-e-incentivos', 'Convocatoria para elegir a los representantes de los empleados ante el Comité de Bienestar Social e Incentivos 2023-2025.', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-09-11 12:00:00', 110, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-1039-de-2023-eleccion-de-representantes-al-comite-de-bienestar-social-e-incentivos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20BIENESTAR%20SOCIAL%20E%20INCENTIVO%202023-2025....pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-1039-de-2023-eleccion-de-representantes-al-comite-de-bienestar-social-e-incentivos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0844 de 2023 – Conformación del Comité de Convivencia Laboral 2023-2025', 'resolucion-0844-de-2023-conformacion-del-comite-de-convivencia-laboral-2023-2025', 'Conformación del Comité de Convivencia Laboral para la vigencia 2023-2025.', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-08-01 12:00:00', 120, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0844-de-2023-conformacion-del-comite-de-convivencia-laboral-2023-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_CONFORMACION_COMITE_CONVIVENCIA_LABORAL_2023_2025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0844-de-2023-conformacion-del-comite-de-convivencia-laboral-2023-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conformación de la Comisión de Personal 2023-2025', 'conformacion-de-la-comision-de-personal-2023-2025', 'Resolución de conformación de la Comisión de Personal para la vigencia 2023-2025.', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-07-28 12:00:00', 130, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conformacion-de-la-comision-de-personal-2023-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_COMISION_PERSONAL_2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'conformacion-de-la-comision-de-personal-2023-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria interna 004 de 2023 – Respuesta a reclamaciones y resultado final', 'convocatoria-interna-004-de-2023-respuesta-a-reclamaciones-y-resultado-final', NULL, NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-07-18 12:00:00', 140, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-interna-004-de-2023-respuesta-a-reclamaciones-y-resultado-final');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CamScanner%2018-07-2023%2022.01.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-interna-004-de-2023-respuesta-a-reclamaciones-y-resultado-final' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria para contratar bacterióloga 2023', 'convocatoria-para-contratar-bacteriologa-2023', 'Contrato de prestación de servicios como bacterióloga (sistema de turnos).', NULL, 'documento', 'Convocatorias de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-07-07 12:00:00', 150, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-para-contratar-bacteriologa-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/convocatoria%20Bacteri%C3%B3loga.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-para-contratar-bacteriologa-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resultados de la convocatoria interna 004 de 2023', 'resultados-de-la-convocatoria-interna-004-de-2023', 'Resultados de la convocatoria interna para proveer empleos de nivel asistencial y respuesta a reclamaciones.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-07-07 12:00:00', 160, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resultados-de-la-convocatoria-interna-004-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B04-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resultados-de-la-convocatoria-interna-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Modificación de la convocatoria interna 004 de 2023', 'modificacion-de-la-convocatoria-interna-004-de-2023', NULL, NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-07-06 12:00:00', 170, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'modificacion-de-la-convocatoria-interna-004-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/HOSPITAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'modificacion-de-la-convocatoria-interna-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria interna 003 (respuesta a reclamaciones) y 004 de 2023 (ampliación de cronograma)', 'convocatoria-interna-003-respuesta-a-reclamaciones-y-004-de-2023-ampliacion-de-cronograma', 'Respuesta a reclamaciones y resultado final de la convocatoria interna 003 de 2023; ampliación del cronograma de la convocatoria 004.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-27 12:00:00', 180, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-interna-003-respuesta-a-reclamaciones-y-004-de-2023-ampliacion-de-cronograma');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Modificacion%20de%20la%20convocartoria%20interna%20N%C2%B0004%20del%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-interna-003-respuesta-a-reclamaciones-y-004-de-2023-ampliacion-de-cronograma' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20RECLAMACIONES%20CONVOCATORIA%20INTERNA%20N%C2%B0003%20DE%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-interna-003-respuesta-a-reclamaciones-y-004-de-2023-ampliacion-de-cronograma' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resultados de las convocatorias internas 003 y 004 de 2023', 'resultados-de-las-convocatorias-internas-003-y-004-de-2023', 'Resultados de las convocatorias internas para proveer empleos de nivel profesional (003) y asistencial (004).', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-16 12:00:00', 190, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resultados-de-las-convocatorias-internas-003-y-004-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20003-2023%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resultados-de-las-convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADOS%20CONVOCATORIA%20INTERNA%20004-2023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resultados-de-las-convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Curso «Control social a la gestión pública con enfoque en salud»', 'curso-control-social-a-la-gestion-publica-con-enfoque-en-salud', 'Invitación a participar en el curso.', NULL, 'documento', 'Capacitaciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-16 12:00:00', 200, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'curso-control-social-a-la-gestion-publica-con-enfoque-en-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CURSO%20CONTROL%20SOCIAL%20A%20LA%20GESTI%C3%93N%20P%C3%9ABLICA%20CON%20EN%20ENFOQUE%20A%20LA%20SALUD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'curso-control-social-a-la-gestion-publica-con-enfoque-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0653 de 2023 – Conformación del COPASST 2023-2025', 'resolucion-0653-de-2023-conformacion-del-copasst-2023-2025', 'Conforma el Comité Paritario de Seguridad y Salud en el Trabajo para las vigencias 2023-2025.', NULL, 'documento', 'Comités y grupos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-09 12:00:00', 210, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0653-de-2023-conformacion-del-copasst-2023-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20SST%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0653-de-2023-conformacion-del-copasst-2023-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0652 de 2023 – Elección de representantes ante el Comité de Convivencia Laboral', 'resolucion-0652-de-2023-eleccion-de-representantes-ante-el-comite-de-convivencia-laboral', 'Convoca a elección de los representantes de los servidores públicos ante el Comité de Convivencia Laboral 2023-2025.', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-09 12:00:00', 220, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0652-de-2023-eleccion-de-representantes-ante-el-comite-de-convivencia-laboral');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20COMITE%20DE%20CONVICENCIA%20LABORAL%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0652-de-2023-eleccion-de-representantes-ante-el-comite-de-convivencia-laboral' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicado 015 de 2023 – Capacitaciones PAMEC', 'comunicado-015-de-2023-capacitaciones-pamec', 'Invitación a las capacitaciones en comunicación efectiva y conflictos de interés para todos los funcionarios.', NULL, 'documento', 'Capacitaciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-07 12:00:00', 230, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicado-015-de-2023-capacitaciones-pamec');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CAPACITACION%20COMUNICACION%20EFECTIVA%20Y%20CONFLICTOS%20DE%20INTERES.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'comunicado-015-de-2023-capacitaciones-pamec' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Modificación de las convocatorias internas 003 y 004 de 2023', 'modificacion-de-las-convocatorias-internas-003-y-004-de-2023', 'Modifica los numerales 1, 3 y 7 de las convocatorias internas 003 y 004 de 2023 (nivel profesional y asistencial).', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-05 12:00:00', 240, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'modificacion-de-las-convocatorias-internas-003-y-004-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20003-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'modificacion-de-las-convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNA%20N%C2%B0%20004-2023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'modificacion-de-las-convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Formato%20anexo%201%20%E2%80%93%20Convocatoria%20N%C2%B0003%20-%20004%20-2023.docx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'modificacion-de-las-convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicado interno 012 de 2023 – Candidatos a representante del estamento científico', 'comunicado-interno-012-de-2023-candidatos-a-representante-del-estamento-cientifico', 'Lista de candidatos que cumplen los requisitos para la elección del representante del estamento científico ante la Junta Directiva.', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-29 12:00:00', 250, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicado-interno-012-de-2023-candidatos-a-representante-del-estamento-cientifico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Comunicado%20N%C2%B0%20012.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'comunicado-interno-012-de-2023-candidatos-a-representante-del-estamento-cientifico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatorias internas 003 y 004 de 2023', 'convocatorias-internas-003-y-004-de-2023', 'Convocatoria interna para proveer empleos de nivel profesional (003) y asistencial (004) dirigida a personas con contrato vigente de prestación de servicios.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-26 12:00:00', 260, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatorias-internas-003-y-004-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B03.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20N%C2%B04.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20DE%20INSCRIPCI%C3%93N.doc'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatorias-internas-003-y-004-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0533 de 2023 – Elección del representante del estamento científico ante la Junta Directiva', 'resolucion-0533-de-2023-eleccion-del-representante-del-estamento-cientifico-ante-la-junta-directiva', 'Convoca a la elección del representante del estamento científico técnico ante la Junta Directiva.', NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-25 12:00:00', 270, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0533-de-2023-eleccion-del-representante-del-estamento-cientifico-ante-la-junta-directiva');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200533%20CONVOCATORIA%20REPRESENTANTE%20JUNTA%20DIRECTIVA%20(2).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0533-de-2023-eleccion-del-representante-del-estamento-cientifico-ante-la-junta-directiva' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20DE%20INSCRIPCION%20JUNTA%20DIRECTIVA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0533-de-2023-eleccion-del-representante-del-estamento-cientifico-ante-la-junta-directiva' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria interna 002 de 2023 – Respuesta a reclamaciones', 'convocatoria-interna-002-de-2023-respuesta-a-reclamaciones', NULL, NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-11 12:00:00', 280, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-interna-002-de-2023-respuesta-a-reclamaciones');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESPUESTA%20A%20LAS%20DECLARACIONES%20%20CONVOCATORIA%20INTERNA%20N%C2%B0%20002-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-interna-002-de-2023-respuesta-a-reclamaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0466 de 2023 – Modificación de la convocatoria interna', 'resolucion-0466-de-2023-modificacion-de-la-convocatoria-interna', 'Modifica la Resolución 0453 de 2023 sobre la convocatoria interna para proveer empleos en vacancia definitiva y temporal.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-10 12:00:00', 290, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0466-de-2023-modificacion-de-la-convocatoria-interna');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200466%20DE%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0466-de-2023-modificacion-de-la-convocatoria-interna' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resultado de la convocatoria interna 002 de 2023', 'resultado-de-la-convocatoria-interna-002-de-2023', NULL, NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-04 12:00:00', 300, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resultado-de-la-convocatoria-interna-002-de-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESULTADO%20CONVOCATORIA%20INTERNA%20N%C2%B0002-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resultado-de-la-convocatoria-interna-002-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/ANEXO%201%20Formato%20Verificacion%20Hojas%20de%20Vida.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resultado-de-la-convocatoria-interna-002-de-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0453 de 2023 – Modificación de la convocatoria interna', 'resolucion-0453-de-2023-modificacion-de-la-convocatoria-interna', 'Modifica la Resolución 0370 de 2023 sobre la convocatoria interna para proveer empleos de nivel profesional y asistencial.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-03 12:00:00', 310, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0453-de-2023-modificacion-de-la-convocatoria-interna');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20453-2023%20CONVOCATORIA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0453-de-2023-modificacion-de-la-convocatoria-interna' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0370 de 2023 – Aplazamiento de la convocatoria interna', 'resolucion-0370-de-2023-aplazamiento-de-la-convocatoria-interna', 'Modifica la Resolución 0361 de 2023 de convocatoria interna para proveer empleos en vacancia definitiva y temporal.', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-17 12:00:00', 320, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0370-de-2023-aplazamiento-de-la-convocatoria-interna');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20CON%20APLAZAMIENTO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0370-de-2023-aplazamiento-de-la-convocatoria-interna' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%202%20RESOLUCION%200370%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0370-de-2023-aplazamiento-de-la-convocatoria-interna' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución 0361 de 2023 – Convocatoria interna para proveer empleos', 'resolucion-0361-de-2023-convocatoria-interna-para-proveer-empleos', 'Convocatoria interna para proveer empleos en vacancia definitiva y temporal de nivel profesional y asistencial (Resolución 0236 de 2023).', NULL, 'documento', 'Convocatorias internas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-13 12:00:00', 330, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-0361-de-2023-convocatoria-interna-para-proveer-empleos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20INTERNARESOLUCION%200361.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0361-de-2023-convocatoria-interna-para-proveer-empleos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/ANEXO%201%20RESOLUCION%200361%20DE%202023%20FORMATO%20DE%20INSCRIPCI%C3%93N.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'resolucion-0361-de-2023-convocatoria-interna-para-proveer-empleos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria para contratar médico auditor en salud', 'convocatoria-para-contratar-medico-auditor-en-salud', 'Contratación de un profesional de la salud (medicina o enfermería) con especialización en auditoría en salud.', NULL, 'documento', 'Convocatorias de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-10 12:00:00', 340, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-para-contratar-medico-auditor-en-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CONVOCATORIA%20MEDICO%20AUDITOR%20SALUD%20CORRECIONES.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-para-contratar-medico-auditor-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria pública 01 de 2023 – Revisoría fiscal', 'convocatoria-publica-01-de-2023-revisoria-fiscal', 'La Junta Directiva recibió propuestas para contratar los servicios profesionales de revisoría fiscal.', NULL, 'documento', 'Convocatorias de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-04 12:00:00', 350, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-publica-01-de-2023-revisoria-fiscal');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CONVOCATORIA%20PU%CC%81BLICA%20REVISOR%20FISCAL%20HOSPITAL%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-publica-01-de-2023-revisoria-fiscal' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20DE%20LA%20CONVOCATORIA%20001-2023%20FIRMADA.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'convocatoria-publica-01-de-2023-revisoria-fiscal' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicado interno 005 de 2023 – Postulación de candidatos a la Comisión de Personal', 'comunicado-interno-005-de-2023-postulacion-de-candidatos-a-la-comision-de-personal', NULL, NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-03-02 12:00:00', 360, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicado-interno-005-de-2023-postulacion-de-candidatos-a-la-comision-de-personal');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20N.005%20comision%20de%20personal.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'comunicado-interno-005-de-2023-postulacion-de-candidatos-a-la-comision-de-personal' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicado interno 004 de 2023 – Postulación de candidatos al Comité de Convivencia Laboral', 'comunicado-interno-004-de-2023-postulacion-de-candidatos-al-comite-de-convivencia-laboral', NULL, NULL, 'documento', 'Elecciones y representantes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-03-02 12:00:00', 370, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicado-interno-004-de-2023-postulacion-de-candidatos-al-comite-de-convivencia-laboral');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/comunicado%20interno%20004%20comite%20de%20convivencia%20laboral.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'comunicado-interno-004-de-2023-postulacion-de-candidatos-al-comite-de-convivencia-laboral' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reglamento interno de trabajo – Acuerdo 08 de 2020', 'reglamento-interno-de-trabajo-acuerdo-08-de-2020', 'Acuerdo 08 del 27 de octubre de 2020 de la Junta Directiva, por el cual se adopta el reglamento interno de trabajo.', NULL, 'documento', 'Reglamento interno de trabajo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-03-08 12:00:00', 380, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reglamento-interno-de-trabajo-acuerdo-08-de-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%2008%20DEL%2027%20DE%20OCTUBRE%20DE%202020-%20REGLAMENTO%20INTERNO%20DE%20TRABAJO%20(2).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'reglamento-interno-de-trabajo-acuerdo-08-de-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Información de interés)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cómo puedo contactar al hospital?', 'como-puedo-contactar-al-hospital', NULL, '<ul><li><strong>Teléfono fijo (conmutador):</strong> <a href="tel:+576085840531">(608) 584 0531</a></li><li><strong>Ambulancia 24 horas:</strong> <a href="tel:+573167440324">316 744 0324</a></li><li><strong>Correo electrónico:</strong> <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a></li></ul><p>Encuentre los teléfonos y correos de todas las dependencias en el <a href="/transparencia/informacion-de-la-entidad/directorio-institucional">Directorio institucional</a>.</p>', 'articulo', 'Contacto', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'como-puedo-contactar-al-hospital');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cómo presento una petición, queja, reclamo, sugerencia, felicitación o denuncia (PQRSFD)?', 'como-presento-una-peticion-queja-reclamo-sugerencia-felicitacion-o-denuncia-pqrs', NULL, '<p>Si tiene alguna queja, reclamo, inquietud o sugerencia, diligencie el <a href="/pqrsf">formulario de PQRSFD</a> del portal. Al radicarla recibirá un número de radicado con el que puede consultar el estado de su solicitud.</p><p>También puede usar los demás <a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">canales oficiales para PQRSFD</a>: correo, línea telefónica, oficinas y buzones.</p>', 'articulo', 'PQRSFD', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 20, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'como-presento-una-peticion-queja-reclamo-sugerencia-felicitacion-o-denuncia-pqrs');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cómo solicito una cita de consulta externa?', 'como-solicito-una-cita-de-consulta-externa', NULL, '<p>Escríbanos por WhatsApp al <a href="https://wa.me/573102033803" target="_blank" rel="noopener">310 203 3803</a>. Tenga a mano su documento de identidad, la orden médica o autorización de su EPS y un número de contacto.</p>', 'articulo', 'Citas y trámites', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 30, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'como-solicito-una-cita-de-consulta-externa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cómo pido una copia de mi historia clínica?', 'como-pido-una-copia-de-mi-historia-clinica', NULL, '<p>Descargue el formato de solicitud de copia de historia clínica en <a href="/transparencia/informacion-de-la-entidad/servicio-al-publico-normas-formularios-y-protocolos-de-atencion">Servicio al público</a>, diligéncielo, fírmelo y envíelo a <a href="mailto:historiaclinica@esehospitalguaviare.gov.co">historiaclinica@esehospitalguaviare.gov.co</a> con la copia de su documento de identidad.</p>', 'articulo', 'Citas y trámites', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 40, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'como-pido-una-copia-de-mi-historia-clinica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Dónde consulto mis resultados de laboratorio?', 'donde-consulto-mis-resultados-de-laboratorio', NULL, '<p>En la plataforma de resultados del laboratorio clínico. Encuentre el enlace en <a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">Canales de atención</a>.</p>', 'articulo', 'Citas y trámites', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 50, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'donde-consulto-mis-resultados-de-laboratorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cuáles son mis derechos como usuario?', 'cuales-son-mis-derechos-como-usuario', NULL, '<ol><li>Ser llamado por su nombre y atendido con amabilidad.</li><li>Ser tratado dignamente.</li><li>Participar o no en investigaciones científicas y retirarse de ellas cuando lo requiera.</li><li>Pedir una segunda opinión.</li><li>Recibir información clara y oportuna de quien lo atiende sobre su estado, tratamiento y pronóstico.</li><li>La privacidad y la confidencialidad de la información contenida en su historia clínica.</li><li>Recibir o rechazar asistencia espiritual según su credo.</li><li>Recibir o rechazar visitas durante su estancia hospitalaria.</li><li>Que durante su atención no se presenten interrupciones.</li><li>Ser informado de los costos de su atención en salud, copagos y trámites administrativos.</li><li>No ser grabado ni monitoreado con fines de difusión sin su permiso.</li><li>Tener un médico responsable de su atención.</li></ol><p>Consulte la resolución de derechos y deberes y la carta de trato digno en <a href="/transparencia/informacion-de-la-entidad/servicio-al-publico-normas-formularios-y-protocolos-de-atencion">Servicio al público</a>.</p>', 'articulo', 'Derechos y deberes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 60, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cuales-son-mis-derechos-como-usuario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, '¿Cuáles son mis deberes como usuario?', 'cuales-son-mis-deberes-como-usuario', NULL, '<ol><li>Asistir puntualmente a las citas y procedimientos programados.</li><li>Tratar con respeto a la persona que lo atiende.</li><li>Utilizar correctamente las instalaciones y mantenerlas en buen estado.</li><li>Cuidar de sus pertenencias, siempre que su condición clínica se lo permita.</li><li>Cumplir con las recomendaciones para exámenes y procedimientos.</li><li>Evitar comportamientos agresivos contra la persona que lo atiende.</li><li>Participar en su rehabilitación integral en caso de que sea necesaria.</li><li>Participar en la Asociación de Usuarios, los comités de participación y las veedurías ciudadanas para el control social de la gestión pública.</li><li>Presentar oportunamente sus sugerencias, quejas, reclamos y reconocimientos para el mejoramiento del servicio.</li><li>Aportar la información necesaria para su atención y colaborar en todos los aspectos relacionados con el cuidado y tratamiento de su enfermedad.</li></ol>', 'articulo', 'Derechos y deberes', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-29 12:00:00', 70, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'preguntas-frecuentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cuales-son-mis-deberes-como-usuario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acción de repetición', 'accion-de-repeticion', 'Acción contenciosa administrativa que debe promover el Estado cuando haya sido condenado a reparar daños como consecuencia de la conducta dolosa o gravemente culposa de un agente suyo, para recuperar de su peculio el valor pagado. Esta acción se ha instituido para responsabilizar civilmente a los servidores públicos y a toda persona que actúa en nombre del Estado, por sus actuaciones; a la vez que para proteger el patrimonio público.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 10, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'accion-de-repeticion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acción disciplinaria', 'accion-disciplinaria', 'Facultad que poseen la propia administración y todos los ciudadanos de acudir ante las autoridades competentes para que se adelanten las investigaciones y se impongan las sanciones legales contra servidores públicos que cometan irregularidades en el desempeño de la función.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 20, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'accion-disciplinaria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acto administrativo', 'acto-administrativo', 'Declaración de voluntad realizada por la administración en el ejercicio de una potestad administrativa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 30, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acto-administrativo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Actuación administrativa', 'actuacion-administrativa', 'Conjunto de decisiones y operaciones que emanan de las autoridades administrativas tendientes a cumplir los cometidos estatales, prestar satisfactoriamente los servicios públicos y hacer efectivos los derechos e intereses reconocidos a los administrados.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 40, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'actuacion-administrativa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Actualización del sistema', 'actualizacion-del-sistema', 'Corresponde a los cambios que se realizan en las estructuras de las tablas y se ven reflejados en la ejecución del programa por cada usuario.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 50, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'actualizacion-del-sistema');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Administración pública', 'administracion-publica', 'Actividad que se desarrolla en los organismos oficiales para el cumplimiento de los fines del Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 60, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'administracion-publica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Alegato de conclusión', 'alegato-de-conclusion', 'Oportunidad procesal en la que el disciplinado o su apoderado le manifiestan al operador disciplinario sus apreciaciones acerca de la forma en que debe dictarse el fallo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 70, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'alegato-de-conclusion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Amonestación escrita', 'amonestacion-escrita', 'Sanción aplicable a los servidores públicos que hayan incurrido en faltas leves culposas, consistente en un llamado de atención que se le hace por escrito y el cual deberá incorporarse en su hoja de vida. Constituye antecedente disciplinario.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 80, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'amonestacion-escrita');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Antecedentes disciplinarios', 'antecedentes-disciplinarios', 'Sanciones disciplinarias ejecutoriadas que figuren en la hoja de vida del servidor público y en los organismos de control externo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 90, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'antecedentes-disciplinarios');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Antijuridicidad', 'antijuridicidad', 'Realización de una conducta contraria a derecho, sin justificación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 100, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'antijuridicidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Aplicativo', 'aplicativo', 'Tipo de programa informático diseñado como herramienta para permitir a un usuario realizar uno o diversos tipos de trabajos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 110, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'aplicativo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apropiación', 'apropiacion', 'Partidas que aparecen en el presupuesto de gastos y señalan los topes máximos de gasto para ser ejecutados o comprometidos durante la vigencia anual correspondiente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 120, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apropiacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Archivo definitivo', 'archivo-definitivo', 'Decisión motivada que se adopta en cualquier etapa de la actuación disciplinaria, cuando aparezca plenamente demostrado que el hecho atribuido no existió, que la conducta no está prevista en la ley como falta disciplinaria, que el investigado no la cometió, que existe una causal de exclusión de responsabilidad o que la actuación no podía iniciarse o proseguirse.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 130, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'archivo-definitivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Artículo', 'articulo', 'Cada una de las disposiciones numeradas de un tratado, la Constitución Nacional, una ley, un reglamento o un acto administrativo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 140, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'articulo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Audiencia', 'audiencia', 'Acto que se efectúa para conocer de determinadas personas los argumentos a favor o en contra de decisiones que proyecten las autoridades.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 150, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'audiencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auto de apertura de investigación', 'auto-de-apertura-de-investigacion', 'Providencia mediante la cual el operador disciplinario da inicio a la investigación formal del asunto. Requiere que se encuentre demostrado objetivamente el comportamiento presuntamente constitutivo de falta y su posible autor.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 160, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'auto-de-apertura-de-investigacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auto de sustanciación', 'auto-de-sustanciacion', 'Pronunciamiento que emite el operador disciplinario para impulsar el trámite de la actuación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 170, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'auto-de-sustanciacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auto interlocutorio', 'auto-interlocutorio', 'Pronunciamientos motivados que emite el operador disciplinario para definir cuestiones de fondo en la actuación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 180, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'auto-interlocutorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Autor', 'autor', 'Servidor público o particular en ejercicio de funciones públicas que comete la falta disciplinaria.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 190, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'autor');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Autoridad', 'autoridad', 'Poder legítimo. Facultad para tomar decisiones de obligatorio cumplimiento.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 200, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'autoridad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Buena fe', 'buena-fe', 'Obrar con la convicción de que con sus actos no se lesionan intereses de terceros.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 210, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'buena-fe');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Caducidad de la acción', 'caducidad-de-la-accion', 'Fenómeno que se presenta cuando, transcurrido el tiempo que la ley fija para el ejercicio de un derecho, este se extingue, quedando el interesado impedido jurídicamente para reclamarlo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 220, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'caducidad-de-la-accion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Capacitación', 'capacitacion', 'Desarrollo del proceso intelectivo y de habilidades técnicas y operativas en alguna área del conocimiento.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 230, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'capacitacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Carga de la prueba', 'carga-de-la-prueba', 'Obligación procesal a cargo del Estado, que le impone el deber de demostrar en el proceso la comisión de la falta disciplinaria y la responsabilidad del autor.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 240, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'carga-de-la-prueba');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Caso fortuito', 'caso-fortuito', 'Se reputa fortuito el hecho causado por mero accidente, totalmente imprevisto, sin que medie dolo ni culpa del sujeto. Constituye causal de exclusión de la responsabilidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 250, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'caso-fortuito');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Celeridad', 'celeridad', 'Rapidez y oportunidad con la que se deben realizar las diversas actuaciones administrativas. Implica la supresión de pasos, tiempos, movimientos, soportes, documentos, firmas, copias, etc., no indispensables.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 260, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'celeridad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coacción', 'coaccion', 'Presión realizada por medio de violencia y sin estar legítimamente autorizado, tendiente a que un tercero realice conductas a las que no está obligado u omita conductas a las que está obligado legalmente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 270, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coaccion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cobro coactivo', 'cobro-coactivo', 'Actividad administrativa encaminada a lograr el pago de las sanciones pecuniarias adeudadas al Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 280, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cobro-coactivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comisión', 'comision', 'Orden y facultad que una autoridad da por escrito a otra para que realice alguna diligencia o practique alguna prueba.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 290, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comision');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Competencia', 'competencia', 'Presupuesto del proceso consistente en la cualidad de un órgano jurisdiccional que le permite o le exige conocer válidamente de un tipo de asuntos y tener preferencia legal respecto de otros órganos jurisdiccionales para conocer de un litigio o causa determinados.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 300, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'competencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Competencia a prevención', 'competencia-a-prevencion', 'Factor que contribuye a determinar la competencia sobre un proceso específico, en el caso de que este pueda ser conocido por distintas autoridades judiciales o administrativas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 310, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'competencia-a-prevencion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Competencia preferente', 'competencia-preferente', 'Facultad otorgada a la Procuraduría General de la Nación y a las personerías municipales o distritales para desplazar a las oficinas de control disciplinario interno en el conocimiento de una actuación disciplinaria en cualquiera de las etapas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 320, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'competencia-preferente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comunicaciones', 'comunicaciones', 'Son aquellas que realiza el operador disciplinario a las partes para informar de las decisiones.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 330, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicaciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conducencia', 'conducencia', 'Idoneidad legal que tiene una prueba para demostrar determinado hecho. Supone la comparación entre el medio probatorio y la ley, a fin de saber si el hecho se puede demostrar en el proceso con el empleo de ese medio probatorio.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 340, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conducencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Confesión', 'confesion', 'Reconocimiento libre y voluntario que realiza el implicado de su responsabilidad como autor de la falta que se le imputa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 350, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'confesion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conflicto de competencias', 'conflicto-de-competencias', 'Controversia surgida entre dos autoridades judiciales o administrativas cuando ambas pretenden conocer o no del mismo asunto. Solamente se da entre autoridades de igual jerarquía.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 360, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conflicto-de-competencias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conflicto de intereses', 'conflicto-de-intereses', 'Se presenta cuando el servidor público deba actuar en un asunto en el que tenga interés particular y directo en su regulación, gestión, control o decisión, o lo tuviere su cónyuge, compañero o compañera permanente o sus parientes dentro del cuarto grado de consanguinidad, segundo de afinidad o primero civil, o su socio o socios de hecho o de derecho. En este caso existe la obligación legal para el servidor de declararse impedido.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 370, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conflicto-de-intereses');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conservación de documentos', 'conservacion-de-documentos', 'Conjunto de medidas preventivas o correctivas adoptadas para garantizar la integridad física y funcional de los documentos de archivo, sin alterar su contenido.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 380, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conservacion-de-documentos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Constitución Política', 'constitucion-politica', 'Conjunto de reglas fundamentales que rigen la organización y las relaciones de los poderes públicos, los derechos de los asociados y la manera como se concilian la autoridad y la libertad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 390, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'constitucion-politica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta', 'consulta', 'Obligación del operador disciplinario de remitir la actuación al superior para un nuevo examen cuando dispone la suspensión provisional del disciplinado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 400, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'consulta');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta de documentos', 'consulta-de-documentos', 'Acceso a un documento o grupo de documentos con el fin de conocer la información que contienen.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 410, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'consulta-de-documentos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contratista', 'contratista', 'Persona que por contrato ejecuta una obra, suministra un bien o se encarga de un servicio para la administración o para un particular.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 420, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contratista');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contrato de trabajo', 'contrato-de-trabajo', 'Acuerdo de voluntades en virtud del cual una persona, a cambio de remuneración, presta sus servicios por cuenta de otra, transfiriéndole su resultado. Forma de vinculación del trabajador oficial.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 430, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contrato-de-trabajo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contravención', 'contravencion', 'Conducta punible que, por no afectar bienes jurídicos de mayor entidad, no reviste la categoría de delito y por ende merece tanto un procedimiento como una sanción menos rígidos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 440, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contravencion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control', 'control', 'Dispositivo que regula la acción de un mecanismo. Inspección, fiscalización, dominio.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 450, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control fiscal', 'control-fiscal', 'Función pública que tiene a su cargo la gestión fiscal de la administración y de los particulares o entidades que manejen fondos o bienes del Estado en todos sus órdenes y niveles. Es ejercido en forma posterior por la Contraloría General de la República y las contralorías departamentales y municipales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 460, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-fiscal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno', 'control-interno', 'Aquel que se realiza bajo responsabilidad de la misma entidad. Es un sistema de autocontrol institucional.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 470, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-interno');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno disciplinario', 'control-interno-disciplinario', 'Potestad que ejercen las entidades y organismos del Estado para regular el comportamiento de los servidores públicos y de los particulares que ejercen funciones públicas y garantizar que las cumplan adecuadamente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 480, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-interno-disciplinario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convención colectiva', 'convencion-colectiva', 'Mecanismo por medio del cual uno o más empleadores y una o varias organizaciones sindicales o de trabajadores acuerdan las condiciones que han de gobernar los contratos individuales de trabajo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 490, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convencion-colectiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Copago', 'copago', 'Aporte en dinero definido por ley que corresponde a una parte del valor del servicio y tiene como finalidad ayudar a financiar el sistema de salud.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 500, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'copago');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Copia de seguridad', 'copia-de-seguridad', 'Respaldo de las bases de datos, el software y la documentación generada por las diferentes dependencias de la institución.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 510, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'copia-de-seguridad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cosa juzgada', 'cosa-juzgada', 'Efecto propio de las sentencias en firme. Tiene la finalidad jurídica de que los hechos debatidos y definidos ante las autoridades competentes no puedan ser objeto de investigaciones o sanciones posteriores.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 520, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cosa-juzgada');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código', 'codigo', 'Conjunto armónico y coherente de disposiciones sobre una materia, que se ordena en un solo cuerpo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 530, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'codigo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Culpa', 'culpa', 'Forma de incurrir en falta disciplinaria por no actuar con el deber de cuidado exigido en una situación concreta.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 540, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'culpa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Culpa grave', 'culpa-grave', 'Se incurre en falta disciplinaria por inobservancia del cuidado necesario que cualquier persona del común imprime a sus actuaciones.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 550, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'culpa-grave');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Culpa gravísima', 'culpa-gravisima', 'Se incurre en falta disciplinaria por ignorancia supina, desatención elemental o violación manifiesta de reglas de obligatorio cumplimiento.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 560, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'culpa-gravisima');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Culpabilidad', 'culpabilidad', 'Conforma el aspecto subjetivo de la infracción disciplinaria y se predica cuando en el comportamiento del agente concurren el dolo o la culpa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 570, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'culpabilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'De oficio', 'de-oficio', 'Derecho y deber que le permite al Estado iniciar y adelantar la actuación disciplinaria por su propia iniciativa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 580, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'de-oficio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Deberes', 'deberes', 'Relación de obligaciones establecidas en el Código Disciplinario para los servidores públicos y particulares que ejerzan funciones públicas, encaminadas al efectivo cumplimiento de la función pública.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 590, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'deberes');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Debido proceso', 'debido-proceso', 'Sometimiento de las actuaciones de las autoridades judiciales y administrativas a las formalidades preestablecidas por las normas jurídicas. Tiene como finalidad la protección de las garantías consignadas en la normatividad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 600, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'debido-proceso');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Decreto', 'decreto', 'Forma que deben revestir las decisiones de las autoridades de la rama ejecutiva siempre que aprueben disposiciones de carácter general de rango inferior a la ley.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 610, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'decreto');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Delegación de funciones', 'delegacion-de-funciones', 'Técnica de manejo administrativo en virtud de la cual se produce el traslado de competencias de un órgano que es titular de las respectivas funciones a otro, para que sean ejercidas por este, bajo su responsabilidad, dentro de los términos y condiciones que fije la ley.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 620, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'delegacion-de-funciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Delito', 'delito', 'Conducta humana gravemente lesiva de aquella parte fundamental del bien común requerida por la existencia misma de la sociedad, y para la cual se ha señalado como consecuencia jurídica la imposición de penas o medidas de seguridad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 630, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'delito');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Denuncia', 'denuncia', 'Acto, oral o escrito, por el cual cualquier persona declara el conocimiento que tiene acerca de la comisión de un delito.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 640, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'denuncia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derecho', 'derecho', 'Conjunto de normas o reglas que rigen la actividad humana en la sociedad, cuya inobservancia está sancionada.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 650, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derecho');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derecho de defensa', 'derecho-de-defensa', 'Garantía del disciplinado que le permite, directamente o por intermedio de su abogado, solicitar, aportar y controvertir las pruebas que se aducen en su contra, desvirtuar los cargos que se le imputan e impugnar las decisiones que le sean desfavorables.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 660, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derecho-de-defensa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derecho de petición', 'derecho-de-peticion', 'Derecho constitucionalmente reconocido a todas las personas para formular solicitudes respetuosas ante entidades públicas o privadas y obtener de ellas respuesta en los términos perentoriamente establecidos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 670, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derecho-de-peticion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derecho disciplinario', 'derecho-disciplinario', 'Conjunto de normas sustanciales y procesales en virtud de las cuales el Estado asegura la obediencia, la disciplina, la moralidad y la eficiencia de los servidores públicos, con miras a asegurar el buen funcionamiento de los diferentes servicios a su cargo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 680, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derecho-disciplinario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derecho internacional humanitario', 'derecho-internacional-humanitario', 'Normas relativas a la protección de las víctimas de los conflictos armados nacionales e internacionales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 690, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derecho-internacional-humanitario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derechos humanos', 'derechos-humanos', 'Derechos del individuo, naturales e innatos, que deben ser reconocidos y protegidos por el Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 700, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derechos-humanos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Descargos', 'descargos', 'Oportunidad procesal otorgada al disciplinado para que explique y justifique su conducta frente a las imputaciones que le formule el operador disciplinario.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 710, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'descargos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Descentralización', 'descentralizacion', 'Traslado de asuntos que serían de conocimiento de la autoridad central a las autoridades territoriales, o de la administración central a otras autoridades a quienes se confía el desempeño de labores especializadas, de tal suerte que la decisión administrativa no se adopta por la autoridad central, sino por un ente territorial o por la entidad prestadora del servicio o encargada del ejercicio de funciones administrativas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 720, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'descentralizacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Desconcentración', 'desconcentracion', 'Transferencia de potestades para la toma de decisiones a instancias o agencias que se encuentran subordinadas al ente central, sin que necesariamente gocen de personería jurídica, presupuesto ni reglamento administrativo propio, con el propósito de descongestionar las tareas que corresponden a las autoridades administrativas y contribuir así a su rápido diligenciamiento.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 730, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'desconcentracion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Desistimiento', 'desistimiento', 'Declaración de voluntad del actor en el sentido de no proseguir con el proceso que se inició a su instancia. No opera en materia disciplinaria.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 740, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'desistimiento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Destitución', 'destitucion', 'Desvinculación del empleado de la entidad y del servicio, a título de sanción y como consecuencia de la incursión en una falta gravísima. Es la máxima sanción administrativa aplicable cuando a esa decisión conduzca un proceso disciplinario. Va siempre acompañada de inhabilidad general.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 750, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'destitucion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Determinación o autoría intelectual', 'determinacion-o-autoria-intelectual', 'Referida a la persona que quiere la realización del delito pero lo ejecuta a través de otra, a la que fuerza o induce a ejecutarlo materialmente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 760, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'determinacion-o-autoria-intelectual');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Déficit fiscal', 'deficit-fiscal', 'Se presenta al término del año, cuando el monto de los ingresos recaudados no gastados es insuficiente para atender el valor de los compromisos de pago legalmente adquiridos con cargo al mismo presupuesto. Si el resultado fuere contrario, es decir, que sobraren recursos, se trataría de un superávit fiscal.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 770, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'deficit-fiscal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Dignidad humana', 'dignidad-humana', 'Principio inherente al ser humano que constituye un límite al ejercicio del poder punitivo del Estado, que impide convertir al imputado en objeto de prueba y someterlo a tratos inhumanos, crueles o degradantes.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 780, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dignidad-humana');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Disposición final de los documentos', 'disposicion-final-de-los-documentos', 'Selección de los documentos en cualquier etapa del ciclo vital, con miras a su conservación temporal o permanente, o a su eliminación, conforme a lo dispuesto en las tablas de retención documental.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 790, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'disposicion-final-de-los-documentos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Documento', 'documento', 'Cualquier cosa que, siendo susceptible de ser percibida por la vista o el oído, o por ambos, sirve por sí misma para ilustrar o comprobar, por vía de representación, la existencia de un hecho cualquiera.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 800, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'documento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Dolo', 'dolo', 'Forma de incurrir en falta disciplinaria consistente en el conocimiento del servidor público de los hechos constitutivos de la infracción, a pesar de lo cual quiere su realización.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 810, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dolo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Duda razonable', 'duda-razonable', 'Ausencia objetiva de certeza acerca de la responsabilidad del disciplinado, que surge tras el análisis probatorio y que no es posible obtener.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 820, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'duda-razonable');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Economía', 'economia', 'Óptimo aprovechamiento de los recursos asignados a una función administrativa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 830, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'economia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Efecto devolutivo', 'efecto-devolutivo', 'Característica que ostenta el recurso de apelación interpuesto contra determinadas decisiones, según la cual el inferior no pierde competencia para proseguir el trámite del proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 840, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'efecto-devolutivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Efecto diferido', 'efecto-diferido', 'Característica predicable del recurso de apelación interpuesto contra determinadas decisiones, según la cual el inferior pierde competencia en los aspectos que dependen de la decisión del superior.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 850, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'efecto-diferido');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Efecto suspensivo', 'efecto-suspensivo', 'Característica que ostenta el recurso de apelación interpuesto contra determinadas decisiones, según la cual el inferior pierde competencia para seguir conociendo del proceso y la decisión que haya adoptado no se cumple hasta tanto se pronuncie el superior sobre ella.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 860, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'efecto-suspensivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Eficacia', 'eficacia', 'Logro de resultados. Cumplimiento de metas y objetivos en la actividad administrativa, en términos de cantidad y calidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 870, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'eficacia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Eficiencia', 'eficiencia', 'Maximización en el empleo de los diferentes recursos a disposición de la entidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 880, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'eficiencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecutoriedad', 'ejecutoriedad', 'Principio según el cual el destinatario de la ley disciplinaria cuya situación se haya decidido mediante fallo ejecutoriado o decisión que tenga la misma fuerza vinculante, proferidos por autoridad competente, no será sometido a nueva investigación y juzgamiento disciplinarios por el mismo hecho, aun cuando a este se le dé una denominación distinta.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 890, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecutoriedad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Elección', 'eleccion', 'Método de designación del titular o titulares de un órgano, caracterizado por la pluralidad de los llamados a tomar parte en aquella.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 900, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'eleccion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'EPS', 'eps', 'Entidad Promotora de Salud que brinda a los usuarios afiliados los servicios contemplados en el sistema de seguridad social.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 910, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'eps');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estado', 'estado', 'Comunidad organizada en un territorio definido, mediante un orden jurídico servido por un cuerpo de funcionarios determinado y garantizado por un poder jurídico, autónomo y centralizado, que tiende a realizar el bien común en el ámbito de esa comunidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 920, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estado');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estatuto', 'estatuto', 'Régimen jurídico que gobierna determinada actividad o ramo especializado, el cual puede estar integrado por normas de distintas leyes, decretos u otros textos jurídicos que guarden entre sí homogeneidad en relación con el área de que se trata.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 930, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estatuto');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estatuto Orgánico de Presupuesto', 'estatuto-organico-de-presupuesto', 'Ley de jerarquía orgánica que regula la programación, preparación, aprobación, modificación y ejecución del presupuesto de rentas y la ley de apropiaciones de la nación, de las entidades territoriales y de los entes administrativos de cualquier nivel, y su coordinación con el Plan Nacional de Desarrollo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 940, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estatuto-organico-de-presupuesto');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Expediente', 'expediente', 'Conjunto de todos los documentos correspondientes a un asunto o negocio. Serie ordenada de actuaciones procesales administrativas o judiciales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 950, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'expediente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Extinción de la acción', 'extincion-de-la-accion', 'Forma de terminación del proceso que ocurre por la muerte del investigado o la prescripción de la acción disciplinaria.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 960, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'extincion-de-la-accion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Factor de conexidad', 'factor-de-conexidad', 'Permite conocer en una sola actuación varias faltas cometidas por un mismo servidor público. Igualmente determina la competencia del funcionario que debe conocer la investigación cuando en la comisión de la falta han intervenido varios servidores públicos de una misma entidad, evento en el cual es competente el que por disposición legal tenga la atribución de juzgar al de mayor jerarquía.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 970, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'factor-de-conexidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fallo', 'fallo', 'Decisión de fondo del asunto, que pone fin al proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 980, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fallo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Falta disciplinaria', 'falta-disciplinaria', 'La incursión en cualquiera de las conductas o comportamientos previstos en la ley disciplinaria que conlleve incumplimiento de deberes, extralimitación en el ejercicio de derechos y funciones, prohibiciones y violación del régimen de inhabilidades, incompatibilidades, impedimentos y conflicto de intereses, sin estar amparado por cualquiera de las causales de exclusión de responsabilidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 990, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'falta-disciplinaria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Favorabilidad', 'favorabilidad', 'Principio según el cual la disposición más benigna se aplica de preferencia a la restrictiva o desfavorable.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1000, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'favorabilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fiscalía', 'fiscalia', 'Institución de la rama judicial que ejerce las funciones de investigación y acusación de los presuntos infractores ante los tribunales y juzgados competentes.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1010, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fiscalia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fuero constitucional', 'fuero-constitucional', 'Garantía de que gozan determinados servidores públicos en virtud del cargo que ostentan, que les da la posibilidad de ser juzgados por funcionarios y a través de procedimientos especiales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1020, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fuero-constitucional');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fuerza mayor', 'fuerza-mayor', 'Suceso inevitable que escapa a la ordinaria capacidad humana de control de lo externo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1030, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fuerza-mayor');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fuerza pública', 'fuerza-publica', 'Entidad conformada por las Fuerzas Militares y la Policía Nacional.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1040, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fuerza-publica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Función', 'funcion', 'Cada una de las responsabilidades inherentes al cargo que debe cumplir el servidor público para el cabal cumplimiento de su misión.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1050, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'funcion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Función correctiva', 'funcion-correctiva', 'Finalidad propia de la sanción disciplinaria encaminada a castigar los comportamientos de los servidores públicos que ofenden o colocan en peligro la función pública.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1060, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'funcion-correctiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Función preventiva', 'funcion-preventiva', 'Finalidad de la sanción disciplinaria consistente en disuadir al servidor público de incurrir en violación al régimen disciplinario mediante la amenaza de imponer sus consecuencias jurídicas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1070, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'funcion-preventiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Función pública', 'funcion-publica', 'Conjunto de tareas y actividades que deben cumplir los diferentes órganos del Estado con el fin de desarrollar sus funciones y cumplir sus cometidos, garantizando así la realización de sus fines.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1080, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'funcion-publica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Graduación de la sanción', 'graduacion-de-la-sancion', 'Valoración que el operador disciplinario efectúa para determinar la clase de sanción a imponer, así como su extensión.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1090, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'graduacion-de-la-sancion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ignorancia supina', 'ignorancia-supina', 'La que procede de negligencia en aprender o averiguar lo que puede y debe saberse.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1100, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ignorancia-supina');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Impertinencia', 'impertinencia', 'El proceso está constituido por los hechos que es necesario probar. La impertinencia se predica de las pruebas que se refieren a hechos que no son materia del proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1110, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'impertinencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Incompatibilidad', 'incompatibilidad', 'Imposibilidad para el ejercicio simultáneo de dos actividades o cargos que puedan poner en entredicho la transparencia debida para el normal desarrollo de la actividad pública.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1120, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'incompatibilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Indagación preliminar', 'indagacion-preliminar', 'Etapa o fase de la actuación disciplinaria que tiene como finalidad verificar la ocurrencia de la conducta, determinar si es constitutiva de falta disciplinaria o si se ha actuado al amparo de una causal de exclusión de la responsabilidad, e identificar o individualizar a su autor.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1130, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'indagacion-preliminar');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Indicios', 'indicios', 'Hechos de los cuales se infieren otros, que son los jurídicamente relevantes para la investigación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1140, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'indicios');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informante', 'informante', 'Servidor público que, al tener conocimiento de una conducta contraria al régimen disciplinario, cumple con el deber de ponerla en conocimiento del competente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1150, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informante');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inhabilidad', 'inhabilidad', 'Circunstancias expresadas en la Constitución o la ley que impiden o imposibilitan que una persona sea elegida o designada para un cargo público.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1160, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inhabilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inhabilidad especial', 'inhabilidad-especial', 'Sanción disciplinaria que se impone junto con la suspensión e implica la imposibilidad de ejercer la función pública.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1170, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inhabilidad-especial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inhabilidad sobreviniente', 'inhabilidad-sobreviniente', 'Circunstancias determinadas en la Constitución y la ley que surgen con posterioridad al ejercicio de un cargo o función pública y que imposibilitan que se continúe desarrollando.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1180, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inhabilidad-sobreviniente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inhibitorio', 'inhibitorio', 'Providencia que emite el operador disciplinario cuando la información o queja sea manifiestamente temeraria, se refiera a hechos disciplinariamente irrelevantes o de imposible ocurrencia, o sea presentada de manera absolutamente inconcreta o difusa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1190, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inhibitorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inimputabilidad', 'inimputabilidad', 'Incapacidad o falta de madurez mental de una persona para entender la norma y actuar según ese entendimiento.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1200, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inimputabilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Injuria', 'injuria', 'Toda expresión o acción ejecutada en deshonra, descrédito o menosprecio de otra persona.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1210, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'injuria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inspección o visita especial', 'inspeccion-o-visita-especial', 'Medio de prueba por medio del cual el operador disciplinario puede comprobar el estado de lugares, los rastros y otros efectos materiales de utilidad para la investigación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1220, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'inspeccion-o-visita-especial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Integración normativa', 'integracion-normativa', 'Principio según el cual es viable aplicar instituciones procesales propias de estatutos diferentes al Código Disciplinario Único en aquellos eventos en que el fenómeno no esté regulado en este, siempre y cuando no se opongan a su naturaleza y finalidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1230, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'integracion-normativa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Integridad referencial', 'integridad-referencial', 'Proceso que se utiliza para establecer que las tablas de las bases de datos no se pierdan en el proceso de actualización.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1240, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'integridad-referencial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Interventoría', 'interventoria', 'Servicio de supervisión y control al cumplimiento del objeto y a la correcta destinación de los recursos públicos en el desarrollo de un contrato estatal. Esta labor puede ser asignada a un servidor público o a un particular.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1250, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'interventoria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Investigado', 'investigado', 'Persona a la que se le endilga la comisión de una falta disciplinaria y cuya responsabilidad es debatida en el proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1260, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'investigado');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Jueces', 'jueces', 'Funcionarios de la rama judicial encargados de estudiar y decidir si procede o no, en derecho, dispensar las tutelas jurídicas debatidas en el proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1270, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'jueces');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Jurisdicción', 'jurisdiccion', 'Potestad que tiene el Estado para administrar justicia en ejercicio de la soberanía de que es titular, mediante el conocimiento y decisión de las diferentes causas (civiles, penales, laborales, administrativas, etc.).', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1280, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'jurisdiccion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley', 'ley', 'Norma expedida por el Congreso de la República en el ejercicio de su función legislativa, que tiene carácter general y obligatorio y cuya finalidad es desarrollar la Constitución Nacional.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1290, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ley');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley disciplinaria', 'ley-disciplinaria', 'Conjunto de normas que regulan el comportamiento oficial de los servidores públicos y particulares en ejercicio de funciones públicas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1300, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ley-disciplinaria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Libre nombramiento y remoción', 'libre-nombramiento-y-remocion', 'Capacidad discrecional del nominador para decidir sobre quién ha de desempeñar un cargo, teniendo siempre en cuenta el efectivo ejercicio de la función pública.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1310, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'libre-nombramiento-y-remocion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Licencia', 'licencia', 'Facultad legal que autoriza a un funcionario para separarse temporalmente del ejercicio de sus funciones por motivos taxativamente establecidos en la normatividad vigente y sin que se rompa el vínculo laboral con la entidad a la que pertenece.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1320, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'licencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Licitación pública', 'licitacion-publica', 'Procedimiento público de selección objetiva del oferente, aplicable en los contratos estatales de mayor entidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1330, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'licitacion-publica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Llamamiento en garantía', 'llamamiento-en-garantia', 'Trámite mediante el cual, en un proceso de responsabilidad patrimonial adelantado contra el Estado, se vincula al servidor público que pueda estar comprometido como responsable del daño o perjuicio por haber actuado de manera dolosa o gravemente culposa.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1340, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'llamamiento-en-garantia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de funciones', 'manual-de-funciones', 'Descripción de las funciones generales que corresponden a cada empleo y la determinación de los requisitos para su ejercicio.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1350, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-funciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de procedimientos', 'manual-de-procedimientos', 'Documento básico que describe la manera como se hace o se desarrolla una tarea, un proceso o una actividad de acuerdo con el grado de dificultad, tiempos, movimientos, flujos de operación, controles y normatividad aplicable a cada caso en particular.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1360, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-procedimientos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Miedo insuperable', 'miedo-insuperable', 'Causal de exclusión de la responsabilidad disciplinaria originada en violencia psicológica insuperable ejercida sobre un servidor público, tendiente a que realice una conducta u omisión constitutiva de falta.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1370, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'miedo-insuperable');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ministerio Público', 'ministerio-publico', 'Función y autoridad que tiene como misión hacer cumplir la ley y velar por la defensa de los intereses generales de la sociedad. Radica en cabeza de la Procuraduría General de la Nación, las personerías distritales y municipales y la Defensoría del Pueblo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1380, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ministerio-publico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Moralidad pública', 'moralidad-publica', 'Conjunto de valores éticos vigentes en la sociedad. En la administración pública, la moralidad está determinada por normas que fijan las funciones, obligaciones y prohibiciones de los servidores públicos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1390, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'moralidad-publica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Motivación', 'motivacion', 'Principio que impone al operador disciplinario la necesidad de fundamentar sus decisiones.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1400, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'motivacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Multa', 'multa', 'Sanción pecuniaria derivada de la comisión de una falta leve dolosa. Se tasa en salarios diarios percibidos al momento de la comisión de la falta.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1410, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'multa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Notificación en estrados', 'notificacion-en-estrados', 'Comunicación de las decisiones proferidas en audiencia pública o en cualquier diligencia de carácter verbal a todos los sujetos procesales, estén o no presentes.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1420, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'notificacion-en-estrados');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Notificación personal', 'notificacion-personal', 'Forma de dar a conocer las decisiones tomadas, directa y efectivamente, a los sujetos procesales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1430, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'notificacion-personal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Orden médica', 'orden-medica', 'Documento donde se refleja el tratamiento farmacológico prescrito por el médico.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1440, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'orden-medica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ordenanza', 'ordenanza', 'Norma emanada de las asambleas departamentales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1450, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ordenanza');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Organización de los documentos', 'organizacion-de-los-documentos', 'Conjunto de acciones orientadas a la clasificación, ordenación y descripción de los documentos de una institución, como parte integral de los procesos archivísticos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1460, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'organizacion-de-los-documentos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Paraclínico', 'paraclinico', 'Exámenes que se realizan a los pacientes porque son útiles para ayudar a establecer la severidad del problema y confirmar el diagnóstico basado en la sospecha clínica. La mayoría son muestras de sangre que se examinan en el laboratorio según la solicitud.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1470, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'paraclinico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Patrimonio público', 'patrimonio-publico', 'Conjunto de bienes y derechos económicos que pertenecen a las entidades públicas.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1480, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'patrimonio-publico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Persona ausente', 'persona-ausente', 'Se denomina así al disciplinado cuando, agotadas las gestiones necesarias, no se logró notificarlo en forma personal del pliego de cargos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1490, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'persona-ausente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Persona jurídica', 'persona-juridica', 'Persona ficticia capaz de ejercer derechos y contraer obligaciones, y de ser representada judicial o extrajudicialmente por personas naturales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1500, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'persona-juridica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de desarrollo', 'plan-de-desarrollo', 'Descripción de las metas, objetivos, estrategias y actividades sobresalientes que comprometen al Estado y en particular a cada una de las entidades territoriales que lo integran, con efectos para cada período de gobierno y los recursos que se destinarán para su cumplimiento. Es la principal expresión formal de la planeación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1510, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-desarrollo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de mantenimiento', 'plan-de-mantenimiento', 'Conjunto de actividades que se requiere realizar periódicamente para mantener los equipos de cómputo en óptimo estado de funcionamiento y detectar a tiempo cualquier indicio de fallas o daños en sus componentes.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1520, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-mantenimiento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Pliego de cargos', 'pliego-de-cargos', 'Pronunciamiento emitido por el Estado a través del operador disciplinario, donde consigna las faltas al régimen disciplinario que se le atribuyen al servidor público investigado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1530, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pliego-de-cargos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Policía judicial', 'policia-judicial', 'Funciones que la Constitución y la ley atribuyen a determinados organismos para apoyar a los fiscales y jueces en el proceso penal. Esta función también es atribuida de manera especial a la Procuraduría, para allegar documentación, realizar análisis de información y escuchar en entrevista a quienes se consideren partícipes de faltas disciplinarias, entre otras.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1540, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'policia-judicial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Potestad disciplinaria', 'potestad-disciplinaria', 'Facultad del Estado para investigar y sancionar a los servidores públicos y particulares que ejerzan funciones públicas que incurran en faltas disciplinarias.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1550, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'potestad-disciplinaria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prelación legal', 'prelacion-legal', 'Preferencia con que un asunto debe ser atendido respecto de otro con el cual se le compara, por disposición de la ley.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1560, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prelacion-legal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prescripción', 'prescripcion', 'Pérdida de la potestad disciplinaria del Estado para investigar y sancionar a los servidores públicos y particulares que ejerzan funciones públicas, en virtud del paso del tiempo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1570, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prescripcion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presunción de inocencia', 'presuncion-de-inocencia', 'Garantía del servidor público sometido a investigación disciplinaria según la cual, hasta tanto no se produzca la decisión que lo declare responsable de la falta, se considera inocente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1580, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presuncion-de-inocencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto', 'presupuesto', 'Expresión cifrada, conjunta y sistemática de las obligaciones que, como máximo, puede reconocer un ente público, y de los derechos que prevea liquidar durante el correspondiente ejercicio.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1590, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Primera instancia', 'primera-instancia', 'Instancia originaria, donde comienza el trámite del proceso.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1600, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'primera-instancia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Principios', 'principios', 'Normas fundamentales que rigen la interpretación de la misma normatividad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1610, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'principios');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procedimiento ordinario', 'procedimiento-ordinario', 'El que se imprime a la actuación disciplinaria cuando no concurren circunstancias que ameriten su desarrollo mediante trámites especiales.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1620, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procedimiento-ordinario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procedimiento verbal', 'procedimiento-verbal', 'Trámite especial de la actuación disciplinaria previsto para los eventos en que el autor es sorprendido al momento de cometer la falta, o con elementos, efectos o instrumentos que provengan de su ejecución. También se aplica cuando la falta ha sido calificada como leve, cuando el implicado confiesa su responsabilidad y en las demás faltas que determine la ley disciplinaria.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1630, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procedimiento-verbal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Proceso', 'proceso', 'Serie o sucesión de actos y etapas tendientes a la aplicación o realización del derecho en un caso concreto.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1640, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Producción documental', 'produccion-documental', 'Generación de documentos en las instituciones, en cumplimiento de sus funciones.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1650, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'produccion-documental');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Programa Anual Mensualizado de Caja (PAC)', 'programa-anual-mensualizado-de-caja-pac', 'Instrumento para la ejecución presupuestal que fija los montos máximos de fondos a disposición para pagos mes a mes en cada ejercicio anual. Permite proyectar el comportamiento de la liquidez y de esa manera programar el flujo de pagos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1660, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'programa-anual-mensualizado-de-caja-pac');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prohibiciones', 'prohibiciones', 'Descripción que de manera negativa realiza el legislador de los comportamientos exigibles a los servidores públicos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1670, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prohibiciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Proporcionalidad', 'proporcionalidad', 'Principio según el cual la sanción disciplinaria debe corresponder a la gravedad de la falta cometida.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1680, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proporcionalidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Providencia', 'providencia', 'Pronunciamiento mediante el cual el operador disciplinario impulsa el trámite del proceso o adopta decisiones.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1690, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'providencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prueba', 'prueba', 'Argumento, instrumento u otro medio con que se pretende mostrar y hacer patente la verdad o falsedad de algo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1700, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prueba');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prueba trasladada', 'prueba-trasladada', 'Elemento de convicción que, practicado válidamente en un proceso, se aporta a otro para que sea tenido en cuenta.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1710, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prueba-trasladada');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Queja', 'queja', 'Supuesto de reclamación, denuncia o crítica de la actuación administrativa en relación con las anomalías observadas en el funcionamiento de los servicios administrativos. Por regla general constituye el fundamento de la acción disciplinaria.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1720, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'queja');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recurso de apelación', 'recurso-de-apelacion', 'Facultad atribuida a los sujetos procesales, y excepcionalmente al quejoso, para controvertir las decisiones del funcionario de primera instancia y que la misma sea resuelta por el superior del funcionario que la dictó.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1730, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recurso-de-apelacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recurso de queja', 'recurso-de-queja', 'Facultad atribuida a los sujetos procesales de solicitar al superior que conozca del recurso de apelación cuyo otorgamiento fue negado por el inferior.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1740, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recurso-de-queja');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recurso de reposición', 'recurso-de-reposicion', 'Facultad que tienen los sujetos procesales, y excepcionalmente el quejoso, para acudir ante la autoridad que profiere un acto para que lo revoque, modifique o aclare.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1750, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recurso-de-reposicion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recursos', 'recursos', 'Peticiones del disciplinado, defensor, quejoso o representante del Ministerio Público en el proceso para que se examine de nuevo la materia fáctica o jurídica de una decisión.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1760, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recursos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recusación', 'recusacion', 'Petición que pueden formular el disciplinado o su defensor y el representante del Ministerio Público para que el operador disciplinario sea sustituido cuando en él concurra una causa de impedimento y no se haya apartado libremente del conocimiento del asunto.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1770, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recusacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reglamento', 'reglamento', 'Conjunto de disposiciones de carácter administrativo obligatorias que regulan el desempeño de las funciones de los servidores públicos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1780, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reglamento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reintegro', 'reintegro', 'Reincorporación al empleo. También, devolución de bienes o efectos que se realiza para atenuar el monto de la sanción.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1790, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reintegro');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Remoción', 'remocion', 'Forma de la sanción de destitución que implica la privación para continuar desempeñando las funciones de un cargo o empleo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1800, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'remocion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Renta de destinación específica', 'renta-de-destinacion-especifica', 'Aquella que desde su creación se dirige exclusivamente a la atención de una determinada actividad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1810, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'renta-de-destinacion-especifica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Representante legal', 'representante-legal', 'Persona que, en ejercicio de funciones públicas, ostenta la dirección de la entidad y en la cual radica la capacidad jurídica para comprometerla y representarla.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1820, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'representante-legal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reserva de sangre', 'reserva-de-sangre', 'Tipo de solicitud en la que el médico requiere al banco de sangre un número determinado de hemocomponentes previos a una cirugía, para administrarlos en caso de una pérdida masiva de sangre o alguna complicación.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1830, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reserva-de-sangre');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución', 'resolucion', 'Decreto, providencia, auto o fallo de autoridad administrativa o judicial.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1840, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resolución de acusación', 'resolucion-de-acusacion', 'Providencia mediante la cual el fiscal que conoce la investigación en un proceso penal formula cargos al sindicado y lo acusa ante el juez competente.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1850, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resolucion-de-acusacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Responsabilidad objetiva', 'responsabilidad-objetiva', 'Forma, proscrita constitucional y legalmente, de imputar la comisión de una conducta penal o disciplinaria con fundamento exclusivo en el resultado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1860, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'responsabilidad-objetiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Revocatoria directa', 'revocatoria-directa', 'Mecanismo extraordinario que le permite a la administración, de oficio o a solicitud de parte, dejar sin efecto un acto o fallo que infrinja manifiestamente las normas constitucionales, legales o reglamentarias en que debería fundarse.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1870, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'revocatoria-directa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sana crítica', 'sana-critica', 'Sistema de valoración probatoria que impone al operador disciplinario la obligación de analizar en conjunto los elementos de convicción, aplicando las reglas de la lógica, la psicología y la experiencia.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1880, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sana-critica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sanción', 'sancion', 'Castigo derivado de la infracción al ordenamiento jurídico del Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1890, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sancion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Segunda instancia', 'segunda-instancia', 'Instancia superior que realiza un nuevo examen del asunto al resolver los recursos de apelación o de queja.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1900, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'segunda-instancia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguridad social', 'seguridad-social', 'Conjunto integrado de medidas de ordenación estatal para la prevención y remedio de riesgos personales mediante prestaciones individualizadas y económicamente evaluables; tales medidas se encaminan hacia la protección general de todos los residentes contra las situaciones de necesidad.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1910, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'seguridad-social');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicio público esencial', 'servicio-publico-esencial', 'Actividad que se presta para la atención de las necesidades primarias de carácter general en forma regular e ininterrumpida por el Estado y en la que, por su importancia para los asociados, se encuentra prohibido el derecho de huelga.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1920, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servicio-publico-esencial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicios públicos', 'servicios-publicos', 'Aquellos destinados a satisfacer necesidades colectivas en forma general, permanente y continua, bajo la dirección, regulación y control del Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1930, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servicios-publicos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servidor público', 'servidor-publico', 'Persona natural vinculada a un organismo público por un procedimiento electoral, reglamentario o contractual, en cargos previamente creados, para el ejercicio de funciones y deberes señalados por autoridad competente, relacionados con los fines y las actividades del Estado.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1940, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servidor-publico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Silencio administrativo positivo', 'silencio-administrativo-positivo', 'Implica que, frente a la omisión de la administración, la petición o el recurso interpuesto se considera atendido favorablemente. Se aplica en los casos expresamente determinados por la ley.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1950, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'silencio-administrativo-positivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Soportes de facturación', 'soportes-de-facturacion', 'Documento por el cual se refleja la realización de algún procedimiento o atención al usuario que sirva de evidencia para legalizar la factura.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1960, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'soportes-de-facturacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Suspensión', 'suspension', 'Sanción disciplinaria consistente en la separación del ejercicio del cargo en cuyo desempeño se originó la falta, por el término fijado en el fallo.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1970, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'suspension');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Tesoro público', 'tesoro-publico', 'Conjunto de los recursos financieros, sean dinero, valores o créditos, de la administración del Estado y de los organismos autónomos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1980, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'tesoro-publico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Testimonio', 'testimonio', 'Relato formal que hace una persona, diferente del investigado, sobre el conocimiento que tiene de los hechos que se investigan.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 1990, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'testimonio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Términos procesales', 'terminos-procesales', 'Plazo otorgado legalmente al operador disciplinario para adelantar cada una de las etapas de la investigación y emitir determinadas decisiones, y a los sujetos procesales para ejercer sus derechos.', NULL, 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-29 12:00:00', 2000, 'esehospitalguaviare.gov.co (Información de interés)'
  FROM cms_paginas p WHERE p.slug = 'glosario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'terminos-procesales');
