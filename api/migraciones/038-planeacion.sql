-- =====================================================================
-- 038 · Planeación del portal anterior (Res. 1519)
--  - 4.3 Plan de acción, plan de gestión, comunicaciones, mantenimiento y contingencia
--  - 4.4 Proyectos en ejecución · 4.5 Informes de empalme
--  - 4.7 Informes de gestión, indicadores y acuerdos de gestión
--  - 2.1.5 Manuales, códigos de integridad y buen gobierno, protocolos internos y modelo de atención
--  - 3.4 Manual de contratación · Talento humano: formatos institucionales
--  - Planes Decreto 612: plan de seguridad 2021 · Participa: rendición de cuentas y formulación de políticas
-- 70 entradas y 90 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET descripcion = 'Plan de acción institucional por vigencia, plan de gestión gerencial y planes de comunicaciones, mantenimiento hospitalario y contingencia.' WHERE slug = 'plan-de-accion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Programas y proyectos de inversión en ejecución de la E.S.E.' WHERE slug = 'proyectos-de-inversion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes de empalme entre las administraciones de la gerencia.' WHERE slug = 'informes-de-empalme' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes de gestión, metas e indicadores, y acuerdos de gestión de los gerentes públicos.' WHERE slug = 'informes-de-gestion-evaluacion-y-auditoria' AND (descripcion IS NULL OR descripcion = '');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Accion Institucional 2026.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%20Institucional%202026.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%20Institucional%202026.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Accion 2025_V2.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%202025_V2.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%202025_V2.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Copia de Plan Accion Vg 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Copia%20de%20Plan%20Accion%20Vg%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Copia%20de%20Plan%20Accion%20Vg%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Acción Institucional-2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Acci%C3%B3n%20Institucional-2023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Acci%C3%B3n%20Institucional-2023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Accion-Vg-2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan-de-Accion-Vg-2022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan-de-Accion-Vg-2022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-ACCION-VIGENCIA-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-ACCION-VIGENCIA-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-ACCION-VIGENCIA-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POA-2020-5.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA-2020-5.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan operativo anual (POA) – Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA-2020-5.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POA - PLAN DE GESTIÓN 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20-%20PLAN%20DE%20GESTI%C3%93N%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan operativo anual (POA) y plan de gestión – Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20-%20PLAN%20DE%20GESTI%C3%93N%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE ACCION VIGENCIA 2018.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCION%20VIGENCIA%202018.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de acción institucional – Vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCION%20VIGENCIA%202018.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POA INSTITUCIONAL 2017.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20INSTITUCIONAL%202017.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan operativo anual (POA) institucional – Vigencia 2017', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20INSTITUCIONAL%202017.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-ACCION-INSTITUCIONAL-2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-ACCION-INSTITUCIONAL-2016.pdf', 'documento', 'application/pdf', 'Plan de acción institucional – Vigencia 2016', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-ACCION-INSTITUCIONAL-2016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE GESTIÓN 2025-2027.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20GESTI%C3%93N%202025-2027.pdf', 'documento', 'application/pdf', 'Plan de gestión 2025-2027', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20GESTI%C3%93N%202025-2027.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Gestión 2024-2027.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Gesti%C3%B3n%202024-2027.pdf', 'documento', 'application/pdf', 'Plan de gestión 2024-2027', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Gesti%C3%B3n%202024-2027.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Gestion-2021-2023..pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Gestion-2021-2023..pdf', 'documento', 'application/pdf', 'Plan de gestión gerencial 2021-2023', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Gestion-2021-2023..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-GESTION-2020-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-GESTION-2020-2023.pdf', 'documento', 'application/pdf', 'Plan de gestión gerencial 2020-2023', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-GESTION-2020-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN GESTION 2018 -2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20GESTION%202018%20-2019.pdf', 'documento', 'application/pdf', 'Plan de gestión gerencial 2018-2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20GESTION%202018%20-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE GESTION 2018 - VF.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20-%20VF.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de gestión 2018', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20-%20VF.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-COMUNICACIONES-2022-2.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-COMUNICACIONES-2022-2.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan de comunicaciones 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-COMUNICACIONES-2022-2.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-PLAN-DE-COMUNICACIONES-ANUAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PLAN-DE-COMUNICACIONES-ANUAL.pdf', 'documento', 'application/pdf', 'Plan de comunicaciones 2021 (informe anual)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PLAN-DE-COMUNICACIONES-ANUAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Comunicaciones-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Comunicaciones-2020.pdf', 'documento', 'application/pdf', 'Plan de comunicaciones 2020', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Comunicaciones-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE COMUNICACIONES HOSPITAL 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20COMUNICACIONES%20HOSPITAL%202019.pdf', 'documento', 'application/pdf', 'Plan de comunicaciones 2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20COMUNICACIONES%20HOSPITAL%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-MANTENIMIENTO-VIGENCIA-2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN-DE-MANTENIMIENTO-VIGENCIA-2022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Plan de mantenimiento hospitalario 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN-DE-MANTENIMIENTO-VIGENCIA-2022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-MANTENIMIENTO-VIGENCIA-2021- (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-MANTENIMIENTO-VIGENCIA-2021-%20(1).pdf', 'documento', 'application/pdf', 'Plan de mantenimiento hospitalario 2021', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-MANTENIMIENTO-VIGENCIA-2021-%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE MANTENIMIENTO HOSPITALARIO 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20MANTENIMIENTO%20HOSPITALARIO%202019.pdf', 'documento', 'application/pdf', 'Plan de mantenimiento hospitalario 2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20MANTENIMIENTO%20HOSPITALARIO%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN-DE-CONTINGENCIA-COVID-19-2021-V7-PDF.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-CONTINGENCIA-COVID-19-2021-V7-PDF.pdf', 'documento', 'application/pdf', 'Plan de contingencia COVID-19 2021 – versión 7', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-CONTINGENCIA-COVID-19-2021-V7-PDF.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RUTA CORONAVIRUS V4.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RUTA%20CORONAVIRUS%20V4.pdf', 'documento', 'application/pdf', 'Ruta de atención a paciente probable o confirmado para COVID-19 – versión 4', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RUTA%20CORONAVIRUS%20V4.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE CONTINGENCIA COVID-19 V4.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONTINGENCIA%20COVID-19%20V4.pdf', 'documento', 'application/pdf', 'Plan de contingencia contra coronavirus COVID-19 – versión 4', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONTINGENCIA%20COVID-19%20V4.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Contingencia Paro Nacional 21-11-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Contingencia%20Paro%20Nacional%2021-11-2019.pdf', 'documento', 'application/pdf', 'Plan de contingencia Paro Nacional del 21 de noviembre de 2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Contingencia%20Paro%20Nacional%2021-11-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Presentacion Hospital San Jose AGO 22.pptx', 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022.pptx', 'documento', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'Proyecto de fisioterapia – presentación (agosto de 2022)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022.pptx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Presentacion Hospital San Jose AGO 22 (1).pptx', 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022%20(1).pptx', 'documento', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'Proyecto de remodelación del hospital – presentación (agosto de 2022)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022%20(1).pptx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTA DE EMPALME YANIRA DEL PILAR SIERRA 01_06_2017 AL 30_11_2017_comprimida.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20EMPALME%20YANIRA%20DEL%20PILAR%20SIERRA%2001_06_2017%20AL%2030_11_2017_comprimida.pdf', 'documento', 'application/pdf', 'Informe de empalme del 1 de junio al 30 de noviembre de 2017', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20EMPALME%20YANIRA%20DEL%20PILAR%20SIERRA%2001_06_2017%20AL%2030_11_2017_comprimida.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE EMPALME CARLOS SEPÚLVEDA 11_11_2016 AL 31_03_2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20CARLOS%20SEP%C3%9ALVEDA%2011_11_2016%20AL%2031_03_2017.pdf', 'documento', 'application/pdf', 'Informe de empalme del 11 de noviembre de 2016 al 31 de marzo de 2017', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20CARLOS%20SEP%C3%9ALVEDA%2011_11_2016%20AL%2031_03_2017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE EMPALME FÉLIX CANO 18_02_2016 AL 10_11_2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20F%C3%89LIX%20CANO%2018_02_2016%20AL%2010_11_2016.pdf', 'documento', 'application/pdf', 'Informe de empalme del 18 de febrero al 10 de noviembre de 2016', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20F%C3%89LIX%20CANO%2018_02_2016%20AL%2010_11_2016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'informe-de-empalme.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/informe-de-empalme.pdf', 'documento', 'application/pdf', 'Informe de empalme del 1 de febrero de 2014 al 18 de febrero de 2016', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/informe-de-empalme.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE EMPALME AGOSTO 2011.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20AGOSTO%202011.pdf', 'documento', 'application/pdf', 'Informe de empalme del 24 de agosto de 2011', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20AGOSTO%202011.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe segundo trimestre 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20segundo%20trimestre%202026.pdf', 'documento', 'application/pdf', 'Informe de gestión – segundo trimestre 2026', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20segundo%20trimestre%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestion Primer Triemstre  26.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Primer%20Triemstre%20%2026.pdf', 'documento', 'application/pdf', 'Informe de gestión – primer trimestre 2026', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Primer%20Triemstre%20%2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión cuarto trimestre 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20cuarto%20trimestre%202025.pdf', 'documento', 'application/pdf', 'Informe de gestión – vigencia 2025 (cuarto trimestre)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20cuarto%20trimestre%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GESTION Tercer Trimestre 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20Tercer%20Trimestre%202025.pdf', 'documento', 'application/pdf', 'Informe de gestión – tercer trimestre 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20Tercer%20Trimestre%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GESTION SEGUNDO TRIMESTRE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20SEGUNDO%20TRIMESTRE%202025.pdf', 'documento', 'application/pdf', 'Informe de gestión – segundo trimestre 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20SEGUNDO%20TRIMESTRE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTION PRIMER TRIMESTRE VIGENCIA 2025..pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf', 'documento', 'application/pdf', 'Informe de gestión – primer trimestre 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTIÓN  2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTI%C3%93N%20%202024.doc', 'documento', 'application/msword', 'Informe de gestión 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTI%C3%93N%20%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestiòn_Anualizado año 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B2n_Anualizado%20a%C3%B1o%202023.pdf', 'documento', 'application/pdf', 'Informe de gestión anualizado 2023', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B2n_Anualizado%20a%C3%B1o%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTION VIGENCIA 2022 .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20VIGENCIA%202022%20.pdf', 'documento', 'application/pdf', 'Informe de gestión vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20VIGENCIA%202022%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestion Vg 2021-JD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Vg%202021-JD.pdf', 'documento', 'application/pdf', 'Informe de gestión e indicadores vigencia 2021 (Junta Directiva)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Vg%202021-JD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdos de Gestión - Oficina de Calidad.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Oficina%20de%20Calidad.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Oficina de Calidad 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Oficina%20de%20Calidad.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdos de Gestión - Administrativa.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Administrativa.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Subgerencia Administrativa y Financiera 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Administrativa.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'acuerdos de gestion 2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdos%20de%20gestion%202.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión 2025 (1)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdos%20de%20gestion%202.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'acuerdo de gestion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%20de%20gestion.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión 2025 (2)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%20de%20gestion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO-SUB_SERVICIOS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO-SUB_SERVICIOS.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Subgerencia de Servicios de Salud 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO-SUB_SERVICIOS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo de Gestión - Subgerencia Administrativa y Financiera.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Subgerencia%20Administrativa%20y%20Financiera.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Subgerencia Administrativa y Financiera 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Subgerencia%20Administrativa%20y%20Financiera.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo De Gestión - Oficina de Planeación .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Planeaci%C3%B3n%20.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Oficina de Planeación 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Planeaci%C3%B3n%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo De Gestión - Oficina de Control Interno Disciplinario .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Control%20Interno%20Disciplinario%20.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Oficina de Control Interno Disciplinario 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Control%20Interno%20Disciplinario%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo de Gestión - Juridica y Contrtación .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Juridica%20y%20Contrtaci%C3%B3n%20.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Jurídica y Contratación 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Juridica%20y%20Contrtaci%C3%B3n%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo de Gestión - Claudia Vanegas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Claudia%20Vanegas.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión – Oficina de Calidad 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Claudia%20Vanegas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO DE GESTIÓN ENTRE LA GERENTE Y PLANEACION-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20PLANEACION-2022.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión entre la Gerencia y Planeación 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20PLANEACION-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO DE GESTIÓN ENTRE LA GERENTE Y LA SUBGERENCIA ADMINISTRATIVA Y FINANCIERA-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20LA%20SUBGERENCIA%20ADMINISTRATIVA%20Y%20FINANCIERA-2022.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión entre la Gerencia y la Subgerencia Administrativa y Financiera 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20LA%20SUBGERENCIA%20ADMINISTRATIVA%20Y%20FINANCIERA-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO DE GESTIÓN ENTRE LA GERENTE Y EL SUBGERENTE DE SERVICIOS DE SALUD-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20EL%20SUBGERENTE%20DE%20SERVICIOS%20DE%20SALUD-2022.pdf', 'documento', 'application/pdf', 'Acuerdo de gestión entre la Gerencia y la Subgerencia de Servicios de Salud 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20EL%20SUBGERENTE%20DE%20SERVICIOS%20DE%20SALUD-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MANUAL DE CARACTERIZACION DE LOS GRUPOS DE VALOR 1 (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MANUAL%20DE%20CARACTERIZACION%20DE%20LOS%20GRUPOS%20DE%20VALOR%201%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Manual de caracterización de los grupos de valor', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MANUAL%20DE%20CARACTERIZACION%20DE%20LOS%20GRUPOS%20DE%20VALOR%201%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MANUAL DE MANEJO DE HISTORIA CLINICA (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(1).pdf', 'documento', 'application/pdf', 'Manual de manejo de historia clínica', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'manual de contratacion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion.pdf', 'documento', 'application/pdf', 'Manual de contratación', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MANUAL-DE-POLITICAS-CONTABLES-DEFINITIVO-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL-DE-POLITICAS-CONTABLES-DEFINITIVO-2020.pdf', 'documento', 'application/pdf', 'Manual de políticas contables 2020', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL-DE-POLITICAS-CONTABLES-DEFINITIVO-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion 026 Manual de Tarifas Institucional.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional.pdf', 'documento', 'application/pdf', 'Manual de tarifas institucional (Resolución 026)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion 026 Manual de Tarifas Institucional (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional%20(1).pdf', 'documento', 'application/pdf', 'Manual tarifario institucional de medicamentos y dispositivos médicos', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Manual de Correspondencia.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Manual%20de%20Correspondencia.pdf', 'documento', 'application/pdf', 'Manual de correspondencia', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Manual%20de%20Correspondencia.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 MANUAL DE MANEJO, CONTROL, CUSTODÍA Y BAJA DE LA PROPIEDAD, PLANTA Y EQUIPO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.pdf', 'documento', 'application/pdf', 'Manual de manejo, control, custodia y baja de la propiedad, planta y equipo', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Código de Integridad y Buen Gobierno ultimo 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf', 'documento', 'application/pdf', 'Código de integridad y buen gobierno 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0701 2025 Actualizacion de codigo de integridad y buen gobierno.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf', 'documento', 'application/pdf', 'Resolución 0701 de 2025 – Actualización del código de integridad y buen gobierno', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 0701 - 2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Resoluci%C3%B3n%200701%20-%202025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Resolución 0701 de 2025 (Word)', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Resoluci%C3%B3n%200701%20-%202025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CODIGO-DE-INTEGRIDAD.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Código de integridad y buen gobierno 2021', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf', 'documento', 'application/pdf', 'Código de integridad y buen gobierno 2020', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res-0844-integridad-y-buen-gobierno.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf', 'documento', 'application/pdf', 'Resolución 0844 de 2020 – Adopción del código de integridad y buen gobierno', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CODIGO BUEN GOBIERNO HSJG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf', 'documento', 'application/pdf', 'Código de buen gobierno 2019', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 PROTOCOLO CLASIFICACION DE PACIENTES (TRIAGE).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20CLASIFICACION%20DE%20PACIENTES%20(TRIAGE).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Protocolo de clasificación de pacientes «TRIAGE»', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20CLASIFICACION%20DE%20PACIENTES%20(TRIAGE).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 PROTO  LIMPI Y DESINFECCION DE URGENCIAS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTO%20%20LIMPI%20Y%20DESINFECCION%20DE%20URGENCIAS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Protocolo de limpieza y desinfección del servicio de urgencias', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTO%20%20LIMPI%20Y%20DESINFECCION%20DE%20URGENCIAS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '02 PROTOCOLO DE BIOSEGURIDAD DE URGENCIAS_compressed.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02%20PROTOCOLO%20DE%20BIOSEGURIDAD%20DE%20URGENCIAS_compressed.pdf', 'documento', 'application/pdf', 'Protocolo de normas de bioseguridad del servicio de urgencias', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02%20PROTOCOLO%20DE%20BIOSEGURIDAD%20DE%20URGENCIAS_compressed.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '03 PROTOCOLO DE RESIDUOS HOSPITALARIOS Y SIMILARES DEL SERVICIOS DE URGENCIAS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03%20PROTOCOLO%20DE%20RESIDUOS%20HOSPITALARIOS%20Y%20SIMILARES%20DEL%20SERVICIOS%20DE%20URGENCIAS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Protocolo de residuos hospitalarios y similares del servicio de urgencias', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03%20PROTOCOLO%20DE%20RESIDUOS%20HOSPITALARIOS%20Y%20SIMILARES%20DEL%20SERVICIOS%20DE%20URGENCIAS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '39 MODELO DE ATENCIoN INTEGRAL EN  SALUD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/39%20MODELO%20DE%20ATENCIoN%20INTEGRAL%20EN%20%20SALUD.pdf', 'documento', 'application/pdf', 'Modelo de atención integral en salud', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/39%20MODELO%20DE%20ATENCIoN%20INTEGRAL%20EN%20%20SALUD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FORMATO PARA OFICIOS, INFORMES HSJG 2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20PARA%20OFICIOS,%20INFORMES%20HSJG%202025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Formato de Word para oficios e informes 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20PARA%20OFICIOS,%20INFORMES%20HSJG%202025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Diapositivas HSG 2025.pptx', 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Diapositivas%20HSG%202025.pptx', 'documento', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'Formato de PowerPoint para presentaciones 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Diapositivas%20HSG%202025.pptx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Logo_Gerencia Hospital.png', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/Logo_Gerencia%20Hospital.png', 'imagen', 'image/png', 'Logo de la Gerencia', 'Logo de la Gerencia', 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/Logo_Gerencia%20Hospital.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'logo hospital.png', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/logo%20hospital.png', 'imagen', 'image/png', 'Logo del hospital', 'Logo del hospital', 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/logo%20hospital.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-politica-de-seguridad-de-la-informacion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-politica-de-seguridad-de-la-informacion.pdf', 'documento', 'application/pdf', 'Plan de seguridad y privacidad de la información 2021', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-politica-de-seguridad-de-la-informacion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Micrositio de rendición de cuentas 2025', 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-25/', 'otro', NULL, 'Micrositio de rendición de cuentas 2025', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-25/');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Micrositio de rendición de cuentas 2024', 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-24/', 'otro', NULL, 'Micrositio de rendición de cuentas 2024', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-24/');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Micrositio de rendición de cuentas 2023', 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-23/', 'otro', NULL, 'Micrositio de rendición de cuentas 2023', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-23/');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Técnico - Audiencia pública de cuentas - vigencia 2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Informe%20T%C3%A9cnico%20-%20Audiencia%20p%C3%BAblica%20de%20cuentas%20-%20vigencia%202022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe técnico de la audiencia pública de rendición de cuentas – vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Informe%20T%C3%A9cnico%20-%20Audiencia%20p%C3%BAblica%20de%20cuentas%20-%20vigencia%202022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Micrositio de rendición de cuentas 2022', 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-22/', 'otro', NULL, 'Micrositio de rendición de cuentas 2022', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-22/');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Técnico del desarrollo del componente de rendición de Cuentas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20T%C3%A9cnico%20del%20desarrollo%20del%20componente%20de%20rendici%C3%B3n%20de%20Cuentas.pdf', 'documento', 'application/pdf', 'Informe técnico del componente de rendición de cuentas – vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20T%C3%A9cnico%20del%20desarrollo%20del%20componente%20de%20rendici%C3%B3n%20de%20Cuentas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-PARTICIPACION-CIUDADANA (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA%20(1).pdf', 'documento', 'application/pdf', 'Política de participación ciudadana', NULL, 'esehospitalguaviare.gov.co (Planeación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA%20(1).pdf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2026', 'plan-de-accion-institucional-2026', 'Plan de acción institucional de la vigencia 2026.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%20Institucional%202026.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2025', 'plan-de-accion-institucional-2025', 'Plan de acción institucional de la vigencia 2025.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 20 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Accion%202025_V2.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2024', 'plan-de-accion-institucional-2024', 'Plan de acción institucional de la vigencia 2024.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 30 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Copia%20de%20Plan%20Accion%20Vg%202024.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2023', 'plan-de-accion-institucional-2023', 'Plan de acción institucional de la vigencia 2023.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 40 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Acci%C3%B3n%20Institucional-2023.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2022', 'plan-de-accion-institucional-2022', 'Plan de acción institucional de la vigencia 2022.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 50 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan-de-Accion-Vg-2022.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2021', 'plan-de-accion-institucional-2021', 'Plan de acción institucional de la vigencia 2021.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 60 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-ACCION-VIGENCIA-2021.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2020', 'plan-de-accion-institucional-2020', 'Plan de acción institucional de la vigencia 2020.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 70 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA-2020-5.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2019', 'plan-de-accion-institucional-2019', 'Plan de acción institucional de la vigencia 2019.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 80 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20-%20PLAN%20DE%20GESTI%C3%93N%202019.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2018', 'plan-de-accion-institucional-2018', 'Plan de acción institucional de la vigencia 2018.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 90 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCION%20VIGENCIA%202018.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2017', 'plan-de-accion-institucional-2017', 'Plan de acción institucional de la vigencia 2017.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 100 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/POA%20INSTITUCIONAL%202017.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de acción institucional 2016', 'plan-de-accion-institucional-2016', 'Plan de acción institucional de la vigencia 2016.', NULL, 'documento', 'Plan de acción institucional', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 110 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-accion-institucional-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-ACCION-INSTITUCIONAL-2016.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-accion-institucional-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión 2025-2027', 'plan-de-gestion-2025-2027', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 120 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-2025-2027');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20GESTI%C3%93N%202025-2027.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-2025-2027' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión 2024-2027', 'plan-de-gestion-2024-2027', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 130 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-2024-2027');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Gesti%C3%B3n%202024-2027.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-2024-2027' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión gerencial 2021-2023', 'plan-de-gestion-gerencial-2021-2023', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 140 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-gerencial-2021-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Gestion-2021-2023..pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-gerencial-2021-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión gerencial 2020-2023', 'plan-de-gestion-gerencial-2020-2023', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 150 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-gerencial-2020-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-GESTION-2020-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-gerencial-2020-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión gerencial 2018-2019', 'plan-de-gestion-gerencial-2018-2019', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 160 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-gerencial-2018-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20GESTION%202018%20-2019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-gerencial-2018-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de gestión 2018', 'plan-de-gestion-2018', 'Plan de gestión de la gerencia aprobado por la Junta Directiva.', NULL, 'documento', 'Plan de gestión gerencial', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-06-30 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 170 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-gestion-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20-%20VF.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-gestion-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de comunicaciones 2022', 'plan-de-comunicaciones-2022', 'Plan de comunicaciones institucional de la vigencia 2022.', NULL, 'documento', 'Plan de comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 180 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-comunicaciones-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN-DE-COMUNICACIONES-2022-2.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-comunicaciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de comunicaciones 2021', 'plan-de-comunicaciones-2021', 'Plan de comunicaciones institucional de la vigencia 2021.', NULL, 'documento', 'Plan de comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 190 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-comunicaciones-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PLAN-DE-COMUNICACIONES-ANUAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-comunicaciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de comunicaciones 2020', 'plan-de-comunicaciones-2020', 'Plan de comunicaciones institucional de la vigencia 2020.', NULL, 'documento', 'Plan de comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 200 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-comunicaciones-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Comunicaciones-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-comunicaciones-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de comunicaciones 2019', 'plan-de-comunicaciones-2019', 'Plan de comunicaciones institucional de la vigencia 2019.', NULL, 'documento', 'Plan de comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 210 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-comunicaciones-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20COMUNICACIONES%20HOSPITAL%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-comunicaciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de mantenimiento hospitalario 2022', 'plan-de-mantenimiento-hospitalario-2022', 'Plan de mantenimiento de la infraestructura y la dotación hospitalaria de la vigencia 2022.', NULL, 'documento', 'Plan de mantenimiento hospitalario', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 220 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-mantenimiento-hospitalario-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN-DE-MANTENIMIENTO-VIGENCIA-2022.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-mantenimiento-hospitalario-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de mantenimiento hospitalario 2021', 'plan-de-mantenimiento-hospitalario-2021', 'Plan de mantenimiento de la infraestructura y la dotación hospitalaria de la vigencia 2021.', NULL, 'documento', 'Plan de mantenimiento hospitalario', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 230 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-mantenimiento-hospitalario-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-MANTENIMIENTO-VIGENCIA-2021-%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-mantenimiento-hospitalario-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de mantenimiento hospitalario 2019', 'plan-de-mantenimiento-hospitalario-2019', 'Plan de mantenimiento de la infraestructura y la dotación hospitalaria de la vigencia 2019.', NULL, 'documento', 'Plan de mantenimiento hospitalario', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 240 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-mantenimiento-hospitalario-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20MANTENIMIENTO%20HOSPITALARIO%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-mantenimiento-hospitalario-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de contingencia COVID-19 2021 – versión 7', 'plan-de-contingencia-covid-19-2021-version-7', 'Plan de contingencia institucional.', NULL, 'documento', 'Planes de contingencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-06-30 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 250 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-contingencia-covid-19-2021-version-7');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-CONTINGENCIA-COVID-19-2021-V7-PDF.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-contingencia-covid-19-2021-version-7' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ruta de atención a paciente probable o confirmado para COVID-19 – versión 4', 'ruta-de-atencion-a-paciente-probable-o-confirmado-para-covid-19-version-4', 'Plan de contingencia institucional.', NULL, 'documento', 'Planes de contingencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-06-30 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 260 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ruta-de-atencion-a-paciente-probable-o-confirmado-para-covid-19-version-4');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RUTA%20CORONAVIRUS%20V4.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'ruta-de-atencion-a-paciente-probable-o-confirmado-para-covid-19-version-4' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de contingencia contra coronavirus COVID-19 – versión 4', 'plan-de-contingencia-contra-coronavirus-covid-19-version-4', 'Plan de contingencia institucional.', NULL, 'documento', 'Planes de contingencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-06-30 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 270 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-contingencia-contra-coronavirus-covid-19-version-4');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONTINGENCIA%20COVID-19%20V4.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-contingencia-contra-coronavirus-covid-19-version-4' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de contingencia Paro Nacional del 21 de noviembre de 2019', 'plan-de-contingencia-paro-nacional-del-21-de-noviembre-de-2019', 'Plan de contingencia institucional.', NULL, 'documento', 'Planes de contingencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-11-20 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 280 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'plan-de-accion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-contingencia-paro-nacional-del-21-de-noviembre-de-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Contingencia%20Paro%20Nacional%2021-11-2019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-de-accion'
 WHERE e.slug = 'plan-de-contingencia-paro-nacional-del-21-de-noviembre-de-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Proyectos en ejecución – vigencia 2022', 'proyectos-en-ejecucion-vigencia-2022', 'Presentaciones de los proyectos de fisioterapia y de remodelación del hospital (agosto de 2022).', NULL, 'documento', 'Programas y proyectos en ejecución', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'proyectos-de-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proyectos-en-ejecucion-vigencia-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022.pptx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'proyectos-de-inversion'
 WHERE e.slug = 'proyectos-en-ejecucion-vigencia-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Presentacion%20Hospital%20San%20Jose%20AGO%2022%20(1).pptx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'proyectos-de-inversion'
 WHERE e.slug = 'proyectos-en-ejecucion-vigencia-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de empalme del 1 de junio al 30 de noviembre de 2017', 'informe-de-empalme-del-1-de-junio-al-30-de-noviembre-de-2017', 'Informe de empalme entre administraciones de la gerencia.', NULL, 'documento', 'Informes de empalme', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-11-30 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-empalme'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-empalme-del-1-de-junio-al-30-de-noviembre-de-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20DE%20EMPALME%20YANIRA%20DEL%20PILAR%20SIERRA%2001_06_2017%20AL%2030_11_2017_comprimida.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-empalme'
 WHERE e.slug = 'informe-de-empalme-del-1-de-junio-al-30-de-noviembre-de-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de empalme del 11 de noviembre de 2016 al 31 de marzo de 2017', 'informe-de-empalme-del-11-de-noviembre-de-2016-al-31-de-marzo-de-2017', 'Informe de empalme entre administraciones de la gerencia.', NULL, 'documento', 'Informes de empalme', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-03-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 20 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-empalme'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-empalme-del-11-de-noviembre-de-2016-al-31-de-marzo-de-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20CARLOS%20SEP%C3%9ALVEDA%2011_11_2016%20AL%2031_03_2017.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-empalme'
 WHERE e.slug = 'informe-de-empalme-del-11-de-noviembre-de-2016-al-31-de-marzo-de-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de empalme del 18 de febrero al 10 de noviembre de 2016', 'informe-de-empalme-del-18-de-febrero-al-10-de-noviembre-de-2016', 'Informe de empalme entre administraciones de la gerencia.', NULL, 'documento', 'Informes de empalme', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-11-10 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 30 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-empalme'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-empalme-del-18-de-febrero-al-10-de-noviembre-de-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20F%C3%89LIX%20CANO%2018_02_2016%20AL%2010_11_2016.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-empalme'
 WHERE e.slug = 'informe-de-empalme-del-18-de-febrero-al-10-de-noviembre-de-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de empalme del 1 de febrero de 2014 al 18 de febrero de 2016', 'informe-de-empalme-del-1-de-febrero-de-2014-al-18-de-febrero-de-2016', 'Informe de empalme entre administraciones de la gerencia.', NULL, 'documento', 'Informes de empalme', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-02-18 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 40 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-empalme'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-empalme-del-1-de-febrero-de-2014-al-18-de-febrero-de-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/informe-de-empalme.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-empalme'
 WHERE e.slug = 'informe-de-empalme-del-1-de-febrero-de-2014-al-18-de-febrero-de-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de empalme del 24 de agosto de 2011', 'informe-de-empalme-del-24-de-agosto-de-2011', 'Informe de empalme entre administraciones de la gerencia.', NULL, 'documento', 'Informes de empalme', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2011-08-24 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 50 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-empalme'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-empalme-del-24-de-agosto-de-2011');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20EMPALME%20AGOSTO%202011.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-empalme'
 WHERE e.slug = 'informe-de-empalme-del-24-de-agosto-de-2011' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión 2026', 'informes-de-gestion-2026', 'Informes de gestión institucional de la vigencia 2026.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informes-de-gestion-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20segundo%20trimestre%202026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Primer%20Triemstre%20%2026.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión 2025', 'informes-de-gestion-2025', 'Informes de gestión institucional de la vigencia 2025.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 20 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informes-de-gestion-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20cuarto%20trimestre%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20Tercer%20Trimestre%202025.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20SEGUNDO%20TRIMESTRE%202025.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informes-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión 2024', 'informe-de-gestion-2024', 'Informes de gestión institucional de la vigencia 2024.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 30 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTI%C3%93N%20%202024.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informe-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión 2023', 'informe-de-gestion-2023', 'Informes de gestión institucional de la vigencia 2023.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 40 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B2n_Anualizado%20a%C3%B1o%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informe-de-gestion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión 2022', 'informe-de-gestion-2022', 'Informes de gestión institucional de la vigencia 2022.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 50 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20VIGENCIA%202022%20.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informe-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión 2021', 'informe-de-gestion-2021', 'Informes de gestión institucional de la vigencia 2021.', NULL, 'documento', 'Informes de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 60 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Vg%202021-JD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'informe-de-gestion-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Metas, objetivos e indicadores de gestión 2021', 'indicadores-de-gestion-2021', 'Informe de indicadores de gestión y desempeño de la vigencia 2021.', NULL, 'documento', 'Metas, objetivos e indicadores', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 70 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'indicadores-de-gestion-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gestion%20Vg%202021-JD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'indicadores-de-gestion-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de gestión 2025', 'acuerdos-de-gestion-2025', 'Acuerdos de gestión suscritos entre la Gerencia y los gerentes públicos en la vigencia 2025.', NULL, 'documento', 'Acuerdos de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 80 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-gestion-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Oficina%20de%20Calidad.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdos%20de%20Gesti%C3%B3n%20-%20Administrativa.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdos%20de%20gestion%202.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%20de%20gestion.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de gestión 2024', 'acuerdos-de-gestion-2024', 'Acuerdos de gestión suscritos entre la Gerencia y los gerentes públicos en la vigencia 2024.', NULL, 'documento', 'Acuerdos de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 90 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-gestion-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO-SUB_SERVICIOS.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Subgerencia%20Administrativa%20y%20Financiera.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Planeaci%C3%B3n%20.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20De%20Gesti%C3%B3n%20-%20Oficina%20de%20Control%20Interno%20Disciplinario%20.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Juridica%20y%20Contrtaci%C3%B3n%20.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20de%20Gesti%C3%B3n%20-%20Claudia%20Vanegas.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de gestión 2022', 'acuerdos-de-gestion-2022', 'Acuerdos de gestión suscritos entre la Gerencia y los gerentes públicos en la vigencia 2022.', NULL, 'documento', 'Acuerdos de gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 100 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-gestion-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20PLANEACION-2022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20LA%20SUBGERENCIA%20ADMINISTRATIVA%20Y%20FINANCIERA-2022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20DE%20GESTI%C3%93N%20ENTRE%20LA%20GERENTE%20Y%20EL%20SUBGERENTE%20DE%20SERVICIOS%20DE%20SALUD-2022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'acuerdos-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de caracterización de los grupos de valor', 'manual-de-caracterizacion-de-los-grupos-de-valor', 'Manual de caracterización de los grupos de valor de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-caracterizacion-de-los-grupos-de-valor');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MANUAL%20DE%20CARACTERIZACION%20DE%20LOS%20GRUPOS%20DE%20VALOR%201%20(1).docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-caracterizacion-de-los-grupos-de-valor' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de manejo de historia clínica', 'manual-de-manejo-de-historia-clinica', 'Manual de manejo de historia clínica de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 20 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-manejo-de-historia-clinica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-manejo-de-historia-clinica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de contratación', 'manual-de-contratacion', 'Manual de contratación de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 30 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-contratacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de políticas contables 2020', 'manual-de-politicas-contables-2020', 'Manual de políticas contables 2020 de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 40 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-politicas-contables-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL-DE-POLITICAS-CONTABLES-DEFINITIVO-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-politicas-contables-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de tarifas institucional (Resolución 026)', 'manual-de-tarifas-institucional-resolucion-026', 'Manual de tarifas institucional (Resolución 026) de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 50 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-tarifas-institucional-resolucion-026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-tarifas-institucional-resolucion-026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual tarifario institucional de medicamentos y dispositivos médicos', 'manual-tarifario-institucional-de-medicamentos-y-dispositivos-medicos', 'Manual tarifario institucional de medicamentos y dispositivos médicos de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 60 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-tarifario-institucional-de-medicamentos-y-dispositivos-medicos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20026%20Manual%20de%20Tarifas%20Institucional%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-tarifario-institucional-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de correspondencia', 'manual-de-correspondencia', 'Manual de correspondencia de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 70 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-correspondencia');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Manual%20de%20Correspondencia.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-correspondencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de manejo, control, custodia y baja de la propiedad, planta y equipo', 'manual-de-manejo-control-custodia-y-baja-de-la-propiedad-planta-y-equipo', 'Manual de manejo, control, custodia y baja de la propiedad, planta y equipo de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manuales', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 80 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-manejo-control-custodia-y-baja-de-la-propiedad-planta-y-equipo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-manejo-control-custodia-y-baja-de-la-propiedad-planta-y-equipo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de integridad y buen gobierno 2025', 'codigo-de-integridad-y-buen-gobierno-2025', 'Código de integridad y buen gobierno actualizado y adoptado mediante la Resolución 0701 de 2025.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 90 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'codigo-de-integridad-y-buen-gobierno-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Resoluci%C3%B3n%200701%20-%202025.docx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de integridad y buen gobierno 2021', 'codigo-de-integridad-y-buen-gobierno-2021', 'Código de integridad y buen gobierno de la vigencia 2021.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 100 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'codigo-de-integridad-y-buen-gobierno-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de integridad y buen gobierno 2020', 'codigo-de-integridad-y-buen-gobierno-2020', 'Código de integridad y buen gobierno adoptado mediante la Resolución 0844 de 2020.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 110 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'codigo-de-integridad-y-buen-gobierno-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-integridad-y-buen-gobierno-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de buen gobierno 2019', 'codigo-de-buen-gobierno-2019', 'Código de buen gobierno de la vigencia 2019.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 120 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'codigo-de-buen-gobierno-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'codigo-de-buen-gobierno-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo de clasificación de pacientes «TRIAGE»', 'protocolo-de-clasificacion-de-pacientes-triage', 'Protocolo interno del servicio de urgencias.', NULL, 'documento', 'Protocolos internos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 130 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'protocolo-de-clasificacion-de-pacientes-triage');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20CLASIFICACION%20DE%20PACIENTES%20(TRIAGE).docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-de-clasificacion-de-pacientes-triage' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo de limpieza y desinfección del servicio de urgencias', 'protocolo-de-limpieza-y-desinfeccion-del-servicio-de-urgencias', 'Protocolo interno del servicio de urgencias.', NULL, 'documento', 'Protocolos internos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 140 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'protocolo-de-limpieza-y-desinfeccion-del-servicio-de-urgencias');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTO%20%20LIMPI%20Y%20DESINFECCION%20DE%20URGENCIAS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-de-limpieza-y-desinfeccion-del-servicio-de-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo de normas de bioseguridad del servicio de urgencias', 'protocolo-de-normas-de-bioseguridad-del-servicio-de-urgencias', 'Protocolo interno del servicio de urgencias.', NULL, 'documento', 'Protocolos internos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 150 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'protocolo-de-normas-de-bioseguridad-del-servicio-de-urgencias');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02%20PROTOCOLO%20DE%20BIOSEGURIDAD%20DE%20URGENCIAS_compressed.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-de-normas-de-bioseguridad-del-servicio-de-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo de residuos hospitalarios y similares del servicio de urgencias', 'protocolo-de-residuos-hospitalarios-y-similares-del-servicio-de-urgencias', 'Protocolo interno del servicio de urgencias.', NULL, 'documento', 'Protocolos internos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 160 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'protocolo-de-residuos-hospitalarios-y-similares-del-servicio-de-urgencias');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03%20PROTOCOLO%20DE%20RESIDUOS%20HOSPITALARIOS%20Y%20SIMILARES%20DEL%20SERVICIOS%20DE%20URGENCIAS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'protocolo-de-residuos-hospitalarios-y-similares-del-servicio-de-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Modelo de atención integral en salud', 'modelo-de-atencion-integral-en-salud', 'Modelo integrado de atención en salud de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 170 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'modelo-de-atencion-integral-en-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/39%20MODELO%20DE%20ATENCIoN%20INTEGRAL%20EN%20%20SALUD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'modelo-de-atencion-integral-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de contratación', 'manual-de-contratacion', 'Manual de contratación de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Manual de contratación', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-contratacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
 WHERE e.slug = 'manual-de-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Formatos de Word y PowerPoint para documentos institucionales', 'formatos-de-word-y-powerpoint-para-documentos-institucionales', 'Plantillas de oficios, informes y presentaciones, y logos de la E.S.E. para documentos institucionales.', NULL, 'documento', 'Formatos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-01-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10100 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'talento-humano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'formatos-de-word-y-powerpoint-para-documentos-institucionales');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/FORMATO%20PARA%20OFICIOS,%20INFORMES%20HSJG%202025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'formatos-de-word-y-powerpoint-para-documentos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/PTT/Diapositivas%20HSG%202025.pptx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'formatos-de-word-y-powerpoint-para-documentos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/Logo_Gerencia%20Hospital.png'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'formatos-de-word-y-powerpoint-para-documentos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/logo%20hospital.png'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'talento-humano'
 WHERE e.slug = 'formatos-de-word-y-powerpoint-para-documentos-institucionales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan de Seguridad y Privacidad de la Información', 'plan-de-seguridad-y-privacidad-de-la-informacion-2021', 'Plan de seguridad y privacidad de la información de la vigencia 2021.', NULL, 'documento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'planes-decreto-612-de-2018'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'plan-de-seguridad-y-privacidad-de-la-informacion-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-politica-de-seguridad-de-la-informacion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'planes-decreto-612-de-2018'
 WHERE e.slug = 'plan-de-seguridad-y-privacidad-de-la-informacion-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rendición de cuentas 2025', 'rendicion-de-cuentas-2025', 'Micrositio de la audiencia pública de rendición de cuentas 2025.', NULL, 'documento', 'Rendición de cuentas por vigencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rendicion-de-cuentas-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-25/'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rendición de cuentas 2024', 'rendicion-de-cuentas-2024', 'Micrositio de la audiencia pública de rendición de cuentas 2024.', NULL, 'documento', 'Rendición de cuentas por vigencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 20 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rendicion-de-cuentas-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-24/'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rendición de cuentas 2023', 'rendicion-de-cuentas-2023', 'Micrositio de la audiencia pública de rendición de cuentas 2023.', NULL, 'documento', 'Rendición de cuentas por vigencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 30 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rendicion-de-cuentas-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-23/'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rendición de cuentas 2022', 'rendicion-de-cuentas-2022', 'Informe técnico y micrositio de la rendición de cuentas de la vigencia 2022.', NULL, 'documento', 'Rendición de cuentas por vigencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 40 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rendicion-de-cuentas-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Informe%20T%C3%A9cnico%20-%20Audiencia%20p%C3%BAblica%20de%20cuentas%20-%20vigencia%202022.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-22/'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rendición de cuentas 2021', 'rendicion-de-cuentas-2021', 'Informe técnico de la rendición de cuentas de la vigencia 2021.', NULL, 'documento', 'Rendición de cuentas por vigencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', (SELECT COALESCE(MAX(x.orden), 0) + 50 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rendicion-de-cuentas-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20T%C3%A9cnico%20del%20desarrollo%20del%20componente%20de%20rendici%C3%B3n%20de%20Cuentas.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas'
 WHERE e.slug = 'rendicion-de-cuentas-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Participación ciudadana en la formulación de políticas', 'participacion-ciudadana-en-la-formulacion-de-politicas', 'Quiénes pueden participar, por qué medios y qué áreas orientan y vigilan la participación en la formulación de políticas.', '<p>Mecanismos o procedimientos que deben seguir los ciudadanos, usuarios o interesados para participar en la formulación de políticas, en el control o en la evaluación de la gestión institucional.</p>
<h3>¿Quiénes pueden participar?</h3>
<p>Todos los ciudadanos interesados que deseen aportar en la construcción de políticas, planes y demás instrumentos, de acuerdo con la Ley 1712 de 2014 de transparencia y acceso a la información pública.</p>
<h3>Medios presenciales y electrónicos</h3>
<p>Puede participar de forma presencial en la sede principal y por los canales electrónicos de la entidad: el <a href="/pqrsf">formulario de PQRSFD</a>, el correo <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a> y los demás canales del <a href="/transparencia/informacion-de-la-entidad/directorio-institucional">directorio institucional</a>.</p>
<h3>Áreas responsables de la orientación y vigilancia</h3>
<ul>
<li><strong>Consolidación:</strong> el área de Planeación es la responsable de consolidar el Plan Anticorrupción y de Atención al Ciudadano y facilita todo el proceso de su elaboración.</li>
<li><strong>Monitoreo:</strong> en concordancia con la cultura del autocontrol, los líderes de los procesos y sus equipos hacen seguimiento y evaluación permanente al mapa de riesgos de corrupción.</li>
<li><strong>Seguimiento:</strong> la Oficina Asesora de Control Interno de Gestión hace seguimiento al cumplimiento de las orientaciones y obligaciones derivadas de este documento y publica en la página web las actividades realizadas.</li>
</ul>', 'articulo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, (SELECT COALESCE(MAX(x.orden), 0) + 10 FROM cms_entradas x WHERE x.pagina_id = p.id AND (x.migrado_de IS NULL OR x.migrado_de <> 'esehospitalguaviare.gov.co (Planeación)')), 'esehospitalguaviare.gov.co (Planeación)'
  FROM cms_paginas p WHERE p.slug = 'estrategia-de-participacion-ciudadana'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'participacion-ciudadana-en-la-formulacion-de-politicas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'estrategia-de-participacion-ciudadana'
 WHERE e.slug = 'participacion-ciudadana-en-la-formulacion-de-politicas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Planeación)';
