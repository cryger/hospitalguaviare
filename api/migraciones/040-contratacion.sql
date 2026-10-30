-- =====================================================================
-- 040 · Contratación del portal anterior (Res. 1519)
--  - 3.1 Plan Anual de Adquisiciones 2019-2026 y su seguimiento
--  - 3.2 Relación mensual de contratos 2019-2025 y consulta en el SECOP
--  - 3.4 Manuales de contratación 2014, 2018 y 2024 · 3.5 Formatos de contratación
-- 23 entradas y 117 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET descripcion = 'Plan Anual de Adquisiciones por vigencia con sus modificaciones y seguimientos.' WHERE slug = 'plan-anual-de-adquisiciones' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Relación mensual de los contratos suscritos por la E.S.E. y consulta de los procesos en el SECOP.' WHERE slug = 'publicacion-de-la-informacion-contractual' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Formatos y listas de chequeo para los procesos de contratación.' WHERE slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo' AND (descripcion IS NULL OR descripcion = '');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 014-2024 MANUAL DE CONTRATACION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20014-2024%20MANUAL%20DE%20CONTRATACION.pdf', 'documento', 'application/pdf', 'Manual de contratación – Acuerdo N.º 014 de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20014-2024%20MANUAL%20DE%20CONTRATACION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'manual de contratacion (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion%20(1).pdf', 'documento', 'application/pdf', 'Manual de contratación – Acuerdo N.º 03 del 13 de marzo de 2018', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014%20(1).pdf', 'documento', 'application/pdf', 'Manual de contratación – Acuerdo N.º 005 del 27 de mayo de 2014', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO I CUATRIMESTRE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20I%20CUATRIMESTRE.pdf', 'documento', 'application/pdf', 'Seguimiento al Plan Anual de Adquisiciones I cuatrimestre – Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20I%20CUATRIMESTRE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO PAA VIG 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20PAA%20VIG%202025.pdf', 'documento', 'application/pdf', 'Seguimiento al Plan Anual de Adquisiciones – cierre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20PAA%20VIG%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO PAA VIG 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20PAA%20VIG%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento al Plan Anual de Adquisiciones – Vigencia 2025 (Excel)', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20PAA%20VIG%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTA No 003 PAA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20003%20PAA.pdf', 'documento', 'application/pdf', 'Plan Anual de Adquisiciones 2026 – Acta de modificación 003', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20003%20PAA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTA No 002 PAA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20002%20PAA.pdf', 'documento', 'application/pdf', 'Plan Anual de Adquisiciones 2026 – Acta de modificación 002', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20002%20PAA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTA No 0012026 MODIFICACION PAA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%200012026%20MODIFICACION%20PAA.pdf', 'documento', 'application/pdf', 'Plan Anual de Adquisiciones 2026 – Acta de modificación 001', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%200012026%20MODIFICACION%20PAA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_Modificacion No1.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_Modificacion%20No1.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2026 – Modificación 1 (Excel)', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_Modificacion%20No1.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_833279_1_0f3e9bd8-d7b1-4a41-9efe-a708d917040e.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_833279_1_0f3e9bd8-d7b1-4a41-9efe-a708d917040e.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones – Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_833279_1_0f3e9bd8-d7b1-4a41-9efe-a708d917040e.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 1305-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201305-2025.pdf', 'documento', 'application/pdf', 'Resolución 1305 de 2025 – Adopción del Plan Anual de Adquisiciones 2026', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201305-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN ANUAL DE ADQUISICIONES VIG 2025 MAYO VER 2.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20ADQUISICIONES%20VIG%202025%20MAYO%20VER%202.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones – Vigencia 2025 (versión 2, mayo)', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20ADQUISICIONES%20VIG%202025%20MAYO%20VER%202.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_ENERO 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_ENERO%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones – Vigencia 2025 (enero)', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_ENERO%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PAA VIGENCIA 2024 PUBLICAR.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PAA%20VIGENCIA%202024%20PUBLICAR.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2024 – Diciembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PAA%20VIGENCIA%202024%20PUBLICAR.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_482648_1_6403e27f-6f22-45a1-a14e-a3b1c87e466a septiembre 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_482648_1_6403e27f-6f22-45a1-a14e-a3b1c87e466a%20septiembre%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2024 – Septiembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_482648_1_6403e27f-6f22-45a1-a14e-a3b1c87e466a%20septiembre%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58 enero2024 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2024 – Abril', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_435822_1_04fa65f3-f0f7-48f6-91b4-53075b559e96 FEBRERO 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_04fa65f3-f0f7-48f6-91b4-53075b559e96%20FEBRERO%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2024 – Febrero', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_04fa65f3-f0f7-48f6-91b4-53075b559e96%20FEBRERO%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58 enero2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2024 – Enero', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_294244_1_3f4f272e-b62f-43ab-9d8d-3f1d16e55581 DIC 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_3f4f272e-b62f-43ab-9d8d-3f1d16e55581%20DIC%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2023 – Diciembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_3f4f272e-b62f-43ab-9d8d-3f1d16e55581%20DIC%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_294244_1_5c4d97d4-9897-4e1c-9434-c187faa63411 mayo de 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_5c4d97d4-9897-4e1c-9434-c187faa63411%20mayo%20de%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2023 – Mayo', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_5c4d97d4-9897-4e1c-9434-c187faa63411%20mayo%20de%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_294244_1_1ed31235-ff19-491c-86d5-a80b0c16a7e1ABRIL2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_1ed31235-ff19-491c-86d5-a80b0c16a7e1ABRIL2023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2023 – Abril', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_1ed31235-ff19-491c-86d5-a80b0c16a7e1ABRIL2023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_260643_1_22d64b0f-67a3-4d6f-b6bd-7650941ae534.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_260643_1_22d64b0f-67a3-4d6f-b6bd-7650941ae534.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2023 – Enero', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_260643_1_22d64b0f-67a3-4d6f-b6bd-7650941ae534.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_258595_1_8f138426-39ea-41f0-b37e-6288b3cae633noviembre30.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_258595_1_8f138426-39ea-41f0-b37e-6288b3cae633noviembre30.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2022 – Noviembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_258595_1_8f138426-39ea-41f0-b37e-6288b3cae633noviembre30.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_194770_1_2ca951ea-69db-4e89-90dd-71efa088c073octubre final.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_2ca951ea-69db-4e89-90dd-71efa088c073octubre%20final.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2022 – Octubre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_2ca951ea-69db-4e89-90dd-71efa088c073octubre%20final.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_194770_1_92610fc5-9c71-4328-939e-ea7dbc618ba9.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_92610fc5-9c71-4328-939e-ea7dbc618ba9.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2022 – Agosto', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_92610fc5-9c71-4328-939e-ea7dbc618ba9.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2022 – Mayo', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022 (2).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022%20(2).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2022 – Marzo', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022%20(2).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_143515_1_9192ceaa-ba04-49cb-9b51-3123aabf309c30112021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_9192ceaa-ba04-49cb-9b51-3123aabf309c30112021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2021 – Noviembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_9192ceaa-ba04-49cb-9b51-3123aabf309c30112021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_143515_1_b6156ca8-acf8-4db6-a27e-52c5ac1e65b1SEPTIEMBRE (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_b6156ca8-acf8-4db6-a27e-52c5ac1e65b1SEPTIEMBRE%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2021 – Septiembre', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_b6156ca8-acf8-4db6-a27e-52c5ac1e65b1SEPTIEMBRE%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_143515_1_3f66ae55-6644-4116-82c2-65d64db9d5ea (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_3f66ae55-6644-4116-82c2-65d64db9d5ea%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2021 – Agosto', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_3f66ae55-6644-4116-82c2-65d64db9d5ea%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AdquisicionesPAA_abril-2021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_abril-2021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2021 – Abril', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_abril-2021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Adquisiciones-PAA-2021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Adquisiciones-PAA-2021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2021 – Enero', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Adquisiciones-PAA-2021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan Anual de Adquisiciones 2 de Enero de 2020 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Adquisiciones%202%20de%20Enero%20de%202020%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan Anual de Adquisiciones 2020 – 2 de enero de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Adquisiciones%202%20de%20Enero%20de%202020%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'plan de adquisiciones 2019.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/plan%20de%20adquisiciones%202019.rar', 'documento', 'application/vnd.rar', 'Plan Anual de Adquisiciones – Vigencia 2019 (comprimido)', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/plan%20de%20adquisiciones%202019.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Consulta de los procesos contractuales en el SECOP', 'https://www.contratos.gov.co/consultas/inicioConsulta.do', 'otro', NULL, 'Consulta de los procesos contractuales en el SECOP', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.contratos.gov.co/consultas/inicioConsulta.do');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LISTA-DE-CHEQUEO03-08-2021-PARA-LA-DOCUMENTACION-DE-CONTRATACION-DIRECTA-DE-APOYO-A-LA-GESTION-03-08-2021-1-1.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/LISTA-DE-CHEQUEO03-08-2021-PARA-LA-DOCUMENTACION-DE-CONTRATACION-DIRECTA-DE-APOYO-A-LA-GESTION-03-08-2021-1-1.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Lista de chequeo para la documentación de contratación directa de apoyo a la gestión', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/LISTA-DE-CHEQUEO03-08-2021-PARA-LA-DOCUMENTACION-DE-CONTRATACION-DIRECTA-DE-APOYO-A-LA-GESTION-03-08-2021-1-1.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '03-08-2021-FORMATO-DE-AUTORIZACION-DE-VERIFICACION-DE-ANTECEDENTES-1-1.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03-08-2021-FORMATO-DE-AUTORIZACION-DE-VERIFICACION-DE-ANTECEDENTES-1-1.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Formato de autorización de verificación de antecedentes', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03-08-2021-FORMATO-DE-AUTORIZACION-DE-VERIFICACION-DE-ANTECEDENTES-1-1.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9 CONTRATACION SEPTIEMBRE DE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8 CONTRATACION AGOSTO DE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7 CONTRATACION JULIO DE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '6 CONTRATACION JUNIO DE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5 CONTRATACION MAYO DE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4 CONTRATACION ABRIL 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3 CONTRATACION MARZO 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2 CONTRATACION FEBRERO 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 CONTRATACION ENERO 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2025', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '12 CONTRATACION DICIEMBRE DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '11 CONTRATACION NOVIEMBRE DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10 CONTRATACION OCTUBRE DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9 CONTRATACION SEPTIEMBRE DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8 CONTRATACION AGOSTO DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7 CONTRATACION JULIO DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '6 CONTRATACION JUNIO DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5 CONTRATACION MAYO DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4 CONTRATACION ABRIL DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3 CONTRATACION MARZO DE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2 CONTRATACION FEBRERO 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 CONTRATACION ENERO 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2024', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '12 CONTRATACION DICIEMBRE DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '11 CONTRATACION NOVIEMBRE DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10 CONTRATACION OTUBRE DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OTUBRE%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OTUBRE%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9 CONTRATACION SEPTIEMBRE DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8 CONTRATACION AGOSTO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7 CONTRATACION JULIO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '6 CONTRATACION JUNIO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5 CONTRATACION MAYO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4 CONTRATACION ABRIL DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3 CONTRATACION MARZO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2 CONTRATACION FEBRERO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 CONTRATACION ENERO DE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%20DE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2023', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%20DE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACON DICIEMBRE 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACON%20DICIEMBRE%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACON%20DICIEMBRE%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'NOVIEMBRE 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/NOVIEMBRE%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/NOVIEMBRE%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10 CONTRATACION OCTUBRE A 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20A%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20A%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION SEPTIEMBRE 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20SEPTIEMBRE%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20SEPTIEMBRE%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION AGOSTO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20AGOSTO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20AGOSTO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION JULIO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JULIO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JULIO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION JUNIO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JUNIO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JUNIO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION MAYO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION ABRIL 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ABRIL%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ABRIL%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION MARZO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MARZO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MARZO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION FEBRERO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20FEBRERO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20FEBRERO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION ENERO 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ENERO%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2022', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ENERO%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '12-CONTRATACION-DICIEMBRE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '11-CONTRATACION-NOVIEMBRE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10-CONTRATACION-OCTUBRE-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9-CONTRATACION-SEPTIEMBRE-DE-2021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7-CONTRATACION-JULIO-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5-CONTRATACION-MAYO-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4-CONTRATACION-ABRIL-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3-CONTRATACION-MARZO-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3-CONTRATACION-MARZO-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3-CONTRATACION-MARZO-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2-CONTRATACION-FEBRERO-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2-CONTRATACION-FEBRERO-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2-CONTRATACION-FEBRERO-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1-CONTRATACION-DE-ENERO-DE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1-CONTRATACION-DE-ENERO-DE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2021', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1-CONTRATACION-DE-ENERO-DE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '12-CONTRATACION-DICIEMBRE-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '11-CONTRATACION-NOVIEMBRE-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10-CONTRATACION-OCTUBRE-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9-CONTRATACION-SEPTIEMBRE-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8-CONTRATACION-AGOSTO-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8-CONTRATACION-AGOSTO-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8-CONTRATACION-AGOSTO-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7-CONTRATACION-JULIO-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '6-CONTRATACION-JUNIO-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6-CONTRATACION-JUNIO-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6-CONTRATACION-JUNIO-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5-CONTRATACION-MAYO-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4-CONTRATACION-ABRIL-DE-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN MARZO DE 2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN FEBRERO DE 2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20FEBRERO%20DE%202020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20FEBRERO%20DE%202020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN ENERO DE 2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2020', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATOS DICIEMBRE DE 2019 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DICIEMBRE%20DE%202019%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – diciembre de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DICIEMBRE%20DE%202019%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN NOVIEMBRE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20NOVIEMBRE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – noviembre de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20NOVIEMBRE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION OCTUBRE DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20OCTUBRE%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – octubre de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20OCTUBRE%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATOS SEPTIEMBRE DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20SEPTIEMBRE%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – septiembre de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20SEPTIEMBRE%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN AGOSTO 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20AGOSTO%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – agosto de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20AGOSTO%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN  JULIO 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20%20JULIO%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – julio de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20%20JULIO%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN JUNIO DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20JUNIO%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – junio de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20JUNIO%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACION MAYO DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – mayo de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATOS ABRIL DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20ABRIL%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – abril de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20ABRIL%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN MARZO DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – marzo de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATOS DEL MES DE FEBRERO DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DEL%20MES%20DE%20FEBRERO%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – febrero de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DEL%20MES%20DE%20FEBRERO%20DE%202019.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CONTRATACIÓN ENERO DE 2019.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202019.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Contratación – enero de 2019', NULL, 'esehospitalguaviare.gov.co (Contratación)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202019.xlsx');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de contratación – Acuerdo N.º 014 de 2024', 'ctr-manual-de-contratacion-acuerdo-n-014-de-2024', 'Manual de contratación – vigencia 2024.', NULL, 'documento', 'Manual de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 10, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-manual-de-contratacion-acuerdo-n-014-de-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20014-2024%20MANUAL%20DE%20CONTRATACION.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
 WHERE e.slug = 'ctr-manual-de-contratacion-acuerdo-n-014-de-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de contratación – Acuerdo N.º 03 del 13 de marzo de 2018', 'ctr-manual-de-contratacion-acuerdo-n-03-del-13-de-marzo-de-2018', 'Manual de contratación – vigencia 2018.', NULL, 'documento', 'Manual de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-03-13 12:00:00', 20, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-manual-de-contratacion-acuerdo-n-03-del-13-de-marzo-de-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/manual%20de%20contratacion%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
 WHERE e.slug = 'ctr-manual-de-contratacion-acuerdo-n-03-del-13-de-marzo-de-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de contratación – Acuerdo N.º 005 del 27 de mayo de 2014', 'ctr-manual-de-contratacion-acuerdo-n-005-del-27-de-mayo-de-2014', 'Manual de contratación – vigencia 2014.', NULL, 'documento', 'Manual de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2014-05-27 12:00:00', 30, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-manual-de-contratacion-acuerdo-n-005-del-27-de-mayo-de-2014');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'manual-de-contratacion-adquisicion-yo-compras'
 WHERE e.slug = 'ctr-manual-de-contratacion-acuerdo-n-005-del-27-de-mayo-de-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anual de Adquisiciones 2026', 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2026', 'Seguimiento al Plan Anual de Adquisiciones – vigencia 2026.', NULL, 'documento', 'Seguimiento al Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-05-05 12:00:00', 10, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20I%20CUATRIMESTRE.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anual de Adquisiciones 2025', 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2025', 'Seguimiento al Plan Anual de Adquisiciones – vigencia 2025.', NULL, 'documento', 'Seguimiento al Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 20, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO%20PAA%20VIG%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20PAA%20VIG%202025.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-seguimiento-al-plan-anual-de-adquisiciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2026', 'ctr-plan-anual-de-adquisiciones-2026', 'Plan Anual de Adquisiciones – vigencia 2026.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-15 12:00:00', 30, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20003%20PAA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%20002%20PAA.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20No%200012026%20MODIFICACION%20PAA.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_Modificacion%20No1.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_833279_1_0f3e9bd8-d7b1-4a41-9efe-a708d917040e.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201305-2025.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2025', 'ctr-plan-anual-de-adquisiciones-2025', 'Plan Anual de Adquisiciones – vigencia 2025.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-06-02 12:00:00', 40, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20ADQUISICIONES%20VIG%202025%20MAYO%20VER%202.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_ENERO%202025.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2024', 'ctr-plan-anual-de-adquisiciones-2024', 'Plan Anual de Adquisiciones – vigencia 2024.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 50, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PAA%20VIGENCIA%202024%20PUBLICAR.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_482648_1_6403e27f-6f22-45a1-a14e-a3b1c87e466a%20septiembre%202024.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024%20(1).xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_04fa65f3-f0f7-48f6-91b4-53075b559e96%20FEBRERO%202024.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_435822_1_c5ce8449-8a9b-4978-b67d-b9f94597ad58%20enero2024.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2023', 'ctr-plan-anual-de-adquisiciones-2023', 'Plan Anual de Adquisiciones – vigencia 2023.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 60, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_3f4f272e-b62f-43ab-9d8d-3f1d16e55581%20DIC%202023.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_5c4d97d4-9897-4e1c-9434-c187faa63411%20mayo%20de%202023.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_294244_1_1ed31235-ff19-491c-86d5-a80b0c16a7e1ABRIL2023.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_260643_1_22d64b0f-67a3-4d6f-b6bd-7650941ae534.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2022', 'ctr-plan-anual-de-adquisiciones-2022', 'Plan Anual de Adquisiciones – vigencia 2022.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-05 12:00:00', 70, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_258595_1_8f138426-39ea-41f0-b37e-6288b3cae633noviembre30.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_2ca951ea-69db-4e89-90dd-71efa088c073octubre%20final.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_194770_1_92610fc5-9c71-4328-939e-ea7dbc618ba9.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_168115_1_6c5dc654-5830-449d-b11d-a87b78fb04a5-PAAMARZO2022%20(2).xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2021', 'ctr-plan-anual-de-adquisiciones-2021', 'Plan Anual de Adquisiciones – vigencia 2021.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 80, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_9192ceaa-ba04-49cb-9b51-3123aabf309c30112021%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_b6156ca8-acf8-4db6-a27e-52c5ac1e65b1SEPTIEMBRE%20(1).xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_143515_1_3f66ae55-6644-4116-82c2-65d64db9d5ea%20(1).xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/AdquisicionesPAA_abril-2021%20(1).xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Adquisiciones-PAA-2021%20(1).xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2020', 'ctr-plan-anual-de-adquisiciones-2020', 'Plan Anual de Adquisiciones – vigencia 2020.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 90, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Adquisiciones%202%20de%20Enero%20de%202020%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anual de Adquisiciones 2019', 'ctr-plan-anual-de-adquisiciones-2019', 'Plan Anual de Adquisiciones – vigencia 2019.', NULL, 'documento', 'Plan Anual de Adquisiciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 100, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'plan-anual-de-adquisiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-plan-anual-de-adquisiciones-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/plan%20de%20adquisiciones%202019.rar'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'plan-anual-de-adquisiciones'
 WHERE e.slug = 'ctr-plan-anual-de-adquisiciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procesos de contratación en el SECOP', 'ctr-procesos-de-contratacion-en-el-secop', 'Procesos de contratación en el SECOP.', NULL, 'documento', 'Procesos de contratación en el SECOP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-procesos-de-contratacion-en-el-secop');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.contratos.gov.co/consultas/inicioConsulta.do'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-procesos-de-contratacion-en-el-secop' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Lista de chequeo para la documentación de contratación directa de apoyo a la gestión', 'ctr-lista-de-chequeo-para-la-documentacion-de-contratacion-directa-de-apoyo-a-la-gestion', 'Formatos de contratación.', NULL, 'documento', 'Formatos de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 10, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-lista-de-chequeo-para-la-documentacion-de-contratacion-directa-de-apoyo-a-la-gestion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/LISTA-DE-CHEQUEO03-08-2021-PARA-LA-DOCUMENTACION-DE-CONTRATACION-DIRECTA-DE-APOYO-A-LA-GESTION-03-08-2021-1-1.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo'
 WHERE e.slug = 'ctr-lista-de-chequeo-para-la-documentacion-de-contratacion-directa-de-apoyo-a-la-gestion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Formato de autorización de verificación de antecedentes', 'ctr-formato-de-autorizacion-de-verificacion-de-antecedentes', 'Formatos de contratación.', NULL, 'documento', 'Formatos de contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 20, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-formato-de-autorizacion-de-verificacion-de-antecedentes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/03-08-2021-FORMATO-DE-AUTORIZACION-DE-VERIFICACION-DE-ANTECEDENTES-1-1.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'formatos-o-modelos-de-contratos-o-pliegos-tipo'
 WHERE e.slug = 'ctr-formato-de-autorizacion-de-verificacion-de-antecedentes' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2025', 'ctr-relacion-mensual-de-contratos-2025', 'Relación mensual de contratos – vigencia 2025.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-10-10 12:00:00', 20, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202025.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202025.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202025.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202025.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%202025.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%202025.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202025.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202025.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2024', 'ctr-relacion-mensual-de-contratos-2024', 'Relación mensual de contratos – vigencia 2024.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202024.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202024.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20DE%202024.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202024.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202024.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202024.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202024.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202024.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202024.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202024.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%202024.xlsx'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%202024.xlsx'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2023', 'ctr-relacion-mensual-de-contratos-2023', 'Relación mensual de contratos – vigencia 2023.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12%20CONTRATACION%20DICIEMBRE%20DE%202023.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11%20CONTRATACION%20NOVIEMBRE%20DE%202023.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OTUBRE%20DE%202023.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9%20CONTRATACION%20SEPTIEMBRE%20DE%202023.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8%20CONTRATACION%20AGOSTO%20DE%202023.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7%20CONTRATACION%20JULIO%20DE%202023.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6%20CONTRATACION%20JUNIO%20DE%202023.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5%20CONTRATACION%20MAYO%20DE%202023.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4%20CONTRATACION%20ABRIL%20DE%202023.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3%20CONTRATACION%20MARZO%20DE%202023.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2%20CONTRATACION%20FEBRERO%20DE%202023.xlsx'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20CONTRATACION%20ENERO%20DE%202023.xlsx'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2022', 'ctr-relacion-mensual-de-contratos-2022', 'Relación mensual de contratos – vigencia 2022.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 50, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACON%20DICIEMBRE%202022.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/NOVIEMBRE%202022.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10%20CONTRATACION%20OCTUBRE%20A%202022.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20SEPTIEMBRE%202022.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20AGOSTO%202022.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JULIO%202022.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20JUNIO%202022.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%202022.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ABRIL%202022.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MARZO%202022.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20FEBRERO%202022.xlsx'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20ENERO%202022.xlsx'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2021', 'ctr-relacion-mensual-de-contratos-2021', 'Relación mensual de contratos – vigencia 2021.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 60, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-2021.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-2021.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2021.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2021%20(1).xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2021.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2021.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2021.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/3-CONTRATACION-MARZO-DE-2021.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2-CONTRATACION-FEBRERO-DE-2021.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1-CONTRATACION-DE-ENERO-DE-2021.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2020', 'ctr-relacion-mensual-de-contratos-2020', 'Relación mensual de contratos – vigencia 2020.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 70, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/12-CONTRATACION-DICIEMBRE-DE-2020.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/11-CONTRATACION-NOVIEMBRE-DE-2020.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/10-CONTRATACION-OCTUBRE-DE-2020.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/9-CONTRATACION-SEPTIEMBRE-DE-2020.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/8-CONTRATACION-AGOSTO-DE-2020.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/7-CONTRATACION-JULIO-DE-2020.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/6-CONTRATACION-JUNIO-DE-2020.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/5-CONTRATACION-MAYO-DE-2020.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/4-CONTRATACION-ABRIL-DE-2020.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202020.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20FEBRERO%20DE%202020.xlsx'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202020.xlsx'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Relación mensual de contratos 2019', 'ctr-relacion-mensual-de-contratos-2019', 'Relación mensual de contratos – vigencia 2019.', NULL, 'documento', 'Relación mensual de contratos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 80, 'esehospitalguaviare.gov.co (Contratación)'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-informacion-contractual'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctr-relacion-mensual-de-contratos-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DICIEMBRE%20DE%202019%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20NOVIEMBRE%202019.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20OCTUBRE%20DE%202019.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20SEPTIEMBRE%20DE%202019.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20AGOSTO%202019.xlsx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20%20JULIO%202019.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20JUNIO%20DE%202019.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACION%20MAYO%20DE%202019.xlsx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20ABRIL%20DE%202019.xlsx'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20MARZO%20DE%202019.xlsx'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATOS%20DEL%20MES%20DE%20FEBRERO%20DE%202019.xlsx'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/CONTRATACI%C3%93N%20ENERO%20DE%202019.xlsx'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'publicacion-de-la-informacion-contractual'
 WHERE e.slug = 'ctr-relacion-mensual-de-contratos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Contratación)';
