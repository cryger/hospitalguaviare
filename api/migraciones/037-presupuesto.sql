-- =====================================================================
-- 037 · Presupuesto del portal anterior (Res. 1519)
--  - 4.1 Presupuesto general: presupuesto desagregado por vigencia (2019-2026)
--  - 4.2 Ejecución presupuestal: ejecución mensual de ingresos (activa) y gastos (pasiva)
--    2021-2026, histórico 2013-2020 e informes de gestión presupuestal 2014-2025
--  - 4.6 Información pública y/o relevante: estados financieros comparativos 2018-2026
-- 42 entradas y 235 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET descripcion = 'Presupuesto desagregado de ingresos, gastos e inversión aprobado para cada vigencia fiscal.' WHERE slug = 'presupuesto-general-de-ingresos-gastos-e-inversion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes mensuales de ejecución del presupuesto de ingresos (activa) y de gastos (pasiva), e informes de gestión presupuestal.' WHERE slug = 'ejecucion-presupuestal' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Estados financieros comparativos de la E.S.E. con sus notas y revelaciones.' WHERE slug = 'informacion-publica-yo-relevante' AND (descripcion IS NULL OR descripcion = '');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRESUPUESTO DESAGREGADO VIGENCIA FISCAL 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202026/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202026.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202026/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRESUPUESTO DESAGREGADO VIGENCIA FISCAL 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202025.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRESUPUESTO DESAGREGADO VIGENCIA FISCAL 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202024.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Presupuesto Desagregado Vigencia Fiscal 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202023.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Presupuesto Desagregado Vigencia Fiscal 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202022.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Presupuesto Desagregado Vigencia Fiscal 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202021.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRESUPUESTO DESAGREGADO VIGENCIA 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%202020.pdf', 'documento', 'application/pdf', 'Presupuesto desagregado de ingresos y gastos – Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'APROBACION-PRESUPUESTO-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/APROBACION-PRESUPUESTO-2019.pdf', 'documento', 'application/pdf', 'Aprobación del presupuesto – Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/APROBACION-PRESUPUESTO-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JULIO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JULIO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JULIO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JUNIO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JUNIO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JUNIO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MAYO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MAYO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MAYO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ABRIL 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ABRIL%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ABRIL%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MARZO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MARZO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MARZO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA FEBRERO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20FEBRERO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20FEBRERO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ENERO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ENERO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ENERO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA DICIEMRBE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20DICIEMRBE%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Diciembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20DICIEMRBE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA NOVIEMBRE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20NOVIEMBRE%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Noviembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20NOVIEMBRE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA OCTUBRE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20OCTUBRE%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Octubre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20OCTUBRE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA SEPTIEMBRE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20SEPTIEMBRE%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Septiembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20SEPTIEMBRE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA AGOSTO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20AGOSTO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Agosto 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20AGOSTO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JULIO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JULIO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JULIO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JUNIO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JUNIO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JUNIO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MAYO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MAYO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MAYO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ABRIL 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ABRIL%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ABRIL%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MARZO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MARZO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MARZO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA FEBRERO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20FEBRERO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20FEBRERO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ENERO 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ENERO%202025.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ENERO%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA DICIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20DICIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Diciembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20DICIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA NOVIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20NOVIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Noviembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20NOVIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA OCTUBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20OCTUBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Octubre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20OCTUBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA SEPTIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20SEPTIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Septiembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20SEPTIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA AGOSTO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20AGOSTO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Agosto 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20AGOSTO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JULIO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JULIO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JULIO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JUNIO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JUNIO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JUNIO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MAYO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20MAYO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20MAYO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS ABRIL 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL INGRESOS MARZO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20MARZO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20MARZO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL INGRESOS FEBRERO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20FEBRERO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20FEBRERO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL INGRESOS ENERO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20ENERO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20ENERO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS DICIEMBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20DICIEMBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Diciembre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20DICIEMBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS NOVIEMBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20NOVIEMBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Noviembre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20NOVIEMBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS OCTUBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20OCTUBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Octubre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20OCTUBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS SEPTIEMBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20SEPTIEMBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Septiembre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20SEPTIEMBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS AGOSTO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20AGOSTO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Agosto 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20AGOSTO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS JULIO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JULIO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JULIO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS JUNIO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JUNIO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JUNIO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS MAYO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MAYO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MAYO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS ABRIL 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS MARZO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MARZO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MARZO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS FEBRERO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20FEBRERO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20FEBRERO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO INGRESOS ENERO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ENERO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ENERO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Activa Diciembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Diciembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Diciembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Diciembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Activa Noviembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Noviembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Noviembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Noviembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Activa Octubre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Octubre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Octubre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Octubre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Activa Septiembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Septiembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Septiembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Septiembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Activa Agosto 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Agosto%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Agosto 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Agosto%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JULIO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JULIO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JULIO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA JUNIO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JUNIO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JUNIO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MAYO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MAYO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MAYO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ABRIL 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ABRIL%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ABRIL%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA MARZO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MARZO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MARZO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA FEBRERO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20FEBRERO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20FEBRERO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION ACTIVA ENERO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ENERO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ENERO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Diciembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Diciembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Diciembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Diciembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Noviembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Noviembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Noviembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Noviembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Octubre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Octubre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Octubre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Octubre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Septiembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Septiembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Septiembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Septiembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Agosto 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Agosto%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Agosto 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Agosto%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Julio 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Julio%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Julio 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Julio%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Junio 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Junio%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Junio 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Junio%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Mayo 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Mayo%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Mayo 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Mayo%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Abril 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Abril%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Abril 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Abril%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Marzo 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Marzo%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Marzo 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Marzo%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Febrero 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Febrero%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Febrero 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Febrero%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Ingresos Enero 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Enero%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de ingresos (activa) – Enero 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Enero%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTIVA 2013 a 2020.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/ACTIVA%202013%20a%202020.rar', 'documento', 'application/vnd.rar', 'Ejecución presupuestal de ingresos (activa) 2013 a 2020 (comprimido)', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/ACTIVA%202013%20a%202020.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JULIO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JULIO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JULIO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JUNIO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JUNIO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JUNIO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA MAYO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MAYO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MAYO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA ABRIL 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ABRIL%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ABRIL%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA MARZO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MARZO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MARZO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA FEBRERO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20FEBRERO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20FEBRERO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA ENERO 202620260929.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ENERO%20202620260929.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2026', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ENERO%20202620260929.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva12.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva12.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Diciembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva12.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva11.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva11.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Noviembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva11.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva10.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva10.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Octubre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva10.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva9.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva9.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Septiembre 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva9.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva8.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva8.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Agosto 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva8.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva7.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva7.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva7.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva6.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva6.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva6.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva5.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva5.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva5.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva4.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva4.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva4.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva3.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva3.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva3.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva2.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formato_202513_f06_cdg_ejecucionpasiva1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva1.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA DICIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20DICIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Diciembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20DICIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA NOVIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20NOVIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Noviembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20NOVIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA OCTUBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20OCTUBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Octubre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20OCTUBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA SEPTIEMBRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20SEPTIEMBRE%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Septiembre 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20SEPTIEMBRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA AGOSTO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20AGOSTO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Agosto 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20AGOSTO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JULIO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JULIO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JULIO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JUNIO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JUNIO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JUNIO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA MAYO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20MAYO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20MAYO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS ABRIL 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL GASTOS MARZO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20MARZO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20MARZO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL GASTOS FEBRERO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20FEBRERO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20FEBRERO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCIÓN PRESUPUESTAL GASTOS ENERO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20ENERO%202024.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20ENERO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS NOVIEMBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20NOVIEMBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Noviembre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20NOVIEMBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS OCTUBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20OCTUBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Octubre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20OCTUBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS SEPTIEMBRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20SEPTIEMBRE%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Septiembre 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20SEPTIEMBRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS AGOSTO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20AGOSTO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Agosto 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20AGOSTO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS JULIO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JULIO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JULIO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS JUNIO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JUNIO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JUNIO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS MAYO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MAYO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MAYO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS ABRIL 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS MARZO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MARZO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MARZO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS FEBRERO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20FEBRERO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20FEBRERO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PRESUPUESTO GASTOS ENERO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ENERO%202023.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ENERO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Pasiva Diciembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Diciembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Diciembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Diciembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Pasiva Noviembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Noviembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Noviembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Noviembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Pasiva Octubre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Octubre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Octubre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Octubre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Pasiva Septiembre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Septiembre%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Septiembre 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Septiembre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecución Pasiva Agosto 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Agosto%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Agosto 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Agosto%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JULIO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JULIO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JULIO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA JUNIO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JUNIO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JUNIO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA MAYO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MAYO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MAYO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA ABRIL 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ABRIL%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ABRIL%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA MARZO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MARZO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MARZO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA FEBRERO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20FEBRERO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20FEBRERO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EJECUCION PASIVA ENERO 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ENERO%202022.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ENERO%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Diciembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Diciembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Diciembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Diciembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Noviembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Noviembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Noviembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Noviembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Octubre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Octubre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Octubre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Octubre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Septiembre 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Septiembre%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Septiembre 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Septiembre%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Agosto 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Agosto%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Agosto 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Agosto%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Julio 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Julio%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Julio 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Julio%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Junio 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Junio%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Junio 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Junio%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Mayo 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Mayo%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Mayo 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Mayo%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Abril 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Abril%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Abril 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Abril%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Marzo 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Marzo%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Marzo 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Marzo%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Febrero 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Febrero%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Febrero 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Febrero%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ejecuciвn Presupuesto Gastos Enero 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Enero%202021.pdf', 'documento', 'application/pdf', 'Ejecución presupuestal de gastos (pasiva) – Enero 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Enero%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Pasiva 2013-2020.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Pasiva%202013-2020.rar', 'documento', 'application/vnd.rar', 'Ejecución presupuestal de gastos (pasiva) 2013 a 2020 (comprimido)', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Pasiva%202013-2020.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GESTION PRESUPUESTAL 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/INFORME%20GESTION%20PRESUPUESTAL%202025.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/INFORME%20GESTION%20PRESUPUESTAL%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GESTION PRESUPUESTAL 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/INFORME%20GESTION%20PRESUPUESTAL%202024.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/INFORME%20GESTION%20PRESUPUESTAL%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GESTION PRESUPUESTO INGRESOS Y GASTOS VF 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20PRESUPUESTO%20INGRESOS%20Y%20GASTOS%20VF%202023.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20PRESUPUESTO%20INGRESOS%20Y%20GASTOS%20VF%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuestal 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202022.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuesto (Diciembre - 2021).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuesto%20(Diciembre%20-%202021).pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuesto%20(Diciembre%20-%202021).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-de-Gestion-Presupuestal-a-Septiembre-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-a-Septiembre-2020.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-a-Septiembre-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-de-Gestion-Presupuestal-Diciembre-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-Diciembre-2019.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-Diciembre-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuestal 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202018.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Gestión Presupuesto Ingresos y Gastos Corte 31 de Diciembre de 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Gesti%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%20Corte%2031%20de%20Diciembre%20de%202017.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2017', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Gesti%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%20Corte%2031%20de%20Diciembre%20de%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuestal 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202016.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2016', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuestal 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202015.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2015', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Presupuestal 2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202014.pdf', 'documento', 'application/pdf', 'Informe de gestión presupuestal 2014', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS II TRIMESTRE 202620260729.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20II%20TRIMESTRE%20202620260729.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2026-2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20II%20TRIMESTRE%20202620260729.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS MARZO 2026-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202026-2025.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos y revelaciones – Marzo 2026-2025', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202026-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados financieros y revelaciones 2025-2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20y%20revelaciones%202025-2024.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos y revelaciones – Diciembre 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20y%20revelaciones%202025-2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS COMPARATIVOS NOVIEMBRE 2025-2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20NOVIEMBRE%202025-2024.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20NOVIEMBRE%202025-2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS COMPARATIVOS OCTUBRE 2025-2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20OCTUBRE%202025-2026.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20OCTUBRE%202025-2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS SEPT.2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPT.2025.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPT.2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS AGOSTO 2025-204.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202025-204.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202025-204.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS JULIO 2025-2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202025-2024.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202025-2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS JUNIO 2025-2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202025-2024.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202025-2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS MARZO 2024-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202024-2025.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2025-2024', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202024-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS CERTIFICADOS 2024-2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20CERTIFICADOS%202024-2023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Diciembre 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20CERTIFICADOS%202024-2023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'REVELACIONES  CONTABILIDAD HSJG 2024- FINALES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REVELACIONES%20%20CONTABILIDAD%20HSJG%202024-%20FINALES.pdf', 'documento', 'application/pdf', 'Notas a los estados financieros (revelaciones) – Diciembre 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REVELACIONES%20%20CONTABILIDAD%20HSJG%202024-%20FINALES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS SEPTIEMBRE 2024-2023EDITABLE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPTIEMBRE%202024-2023EDITABLE.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPTIEMBRE%202024-2023EDITABLE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS A AGOSTO 2024-AGOSTO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20AGOSTO%202024-AGOSTO%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20AGOSTO%202024-AGOSTO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS JULIO 2024 - JULIO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20JULIO%202024%20-%20JULIO%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20JULIO%202024%20-%20JULIO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'estados financiero a junio2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estados%20financiero%20a%20junio2024.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estados%20financiero%20a%20junio2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS A MAYO 2024-MAYO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20MAYO%202024-MAYO%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20MAYO%202024-MAYO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS ABRIL 2024- ABRIL 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202024-%20ABRIL%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202024-%20ABRIL%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS  A MARZO  2024 - 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20A%20MARZO%20%202024%20-%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20A%20MARZO%20%202024%20-%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS  FEBRERO 2024 - 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20FEBRERO%202024%20-%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20FEBRERO%202024%20-%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS  COMPARATIVOS  A ENERO 2024 - 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20%20COMPARATIVOS%20%20A%20ENERO%202024%20-%202023.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2024-2023', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20%20COMPARATIVOS%20%20A%20ENERO%202024%20-%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS DICIEMBRE  2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20DICIEMBRE%20%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Diciembre 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20DICIEMBRE%20%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARTIVOS NOVIEMBRE 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARTIVOS%20NOVIEMBRE%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARTIVOS%20NOVIEMBRE%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS OCTUBRE 2023- 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20OCTUBRE%202023-%202022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20OCTUBRE%202023-%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados financieros comparativos septiembre 2023-2022 editable.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20comparativos%20septiembre%202023-2022%20editable.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20comparativos%20septiembre%202023-2022%20editable.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS AGOSTO 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS JULIO 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS JUNIO 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS MAYO 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MAYO%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MAYO%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS COMPARATIVOS ABRIL 2023-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202023-2022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202023-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS EDITABLES A MARZO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20EDITABLES%20A%20MARZO.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20EDITABLES%20A%20MARZO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos Febrero 2023- Febrero 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Febrero%202023-%20Febrero%202022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Febrero%202023-%20Febrero%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos Enero 2023-Enero 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%202023-Enero%202022.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2023-2022', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%202023-Enero%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS FINANCIEROS Y REVELACIONES 2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20Y%20REVELACIONES%202022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos y revelaciones – Diciembre 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20Y%20REVELACIONES%202022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos Nov - Noviembre  2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Nov%20-%20Noviembre%20%202022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Nov%20-%20Noviembre%20%202022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos Enero- Octubre 2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero-%20Octubre%202022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero-%20Octubre%202022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos Enero - Agosto 2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%20-%20Agosto%202022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%20-%20Agosto%202022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Estados Financieros Comparativos  Julio 2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20%20Julio%202022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20%20Julio%202022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-JUNIO-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-JUNIO-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-JUNIO-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-MAYO-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MAYO-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MAYO-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-ABRIL-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ABRIL-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ABRIL-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-MARZO-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MARZO-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MARZO-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-FEBRERO-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-FEBRERO-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-FEBRERO-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS -FINANCIEROS-COMPARTIVOS-ENERO-2022-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ENERO-2022-2021.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2022-2021', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ENERO-2022-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Diciembre 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2021-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2021-2020.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2021-2020', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2021-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Diciembre 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVO-NOVIEMBRE-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVO-NOVIEMBRE-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVO-NOVIEMBRE-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2020-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2020-2019.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2020-2019', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2020-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE- 2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-%202019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Diciembre 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-%202019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Noviembre 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Octubre 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Septiembre 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Agosto 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Julio 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Junio 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Mayo 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Abril 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Marzo 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS- FINANCIEROS-COMPARATIVOS-FEBRERO- 2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-%20FINANCIEROS-COMPARATIVOS-FEBRERO-%202019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Febrero 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-%20FINANCIEROS-COMPARATIVOS-FEBRERO-%202019-2018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2019-2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2019-2018.pdf', 'documento', 'application/pdf', 'Estados financieros comparativos – Enero 2019-2018', NULL, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2019-2018.pdf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2026', 'presupuesto-vigencia-fiscal-2026', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2026.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-02-15 12:00:00', 10, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202026/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2025', 'presupuesto-vigencia-fiscal-2025', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2025.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-02-15 12:00:00', 20, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2024', 'presupuesto-vigencia-fiscal-2024', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2024.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-02-15 12:00:00', 30, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%20FISCAL%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2023', 'presupuesto-vigencia-fiscal-2023', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2023.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-02-27 12:00:00', 40, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2022', 'presupuesto-vigencia-fiscal-2022', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2022.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-02-27 12:00:00', 50, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2021', 'presupuesto-vigencia-fiscal-2021', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2021.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-02-27 12:00:00', 60, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Presupuesto%20Desagregado%20Vigencia%20Fiscal%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2020', 'presupuesto-vigencia-fiscal-2020', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2020.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 70, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRESUPUESTO%20DESAGREGADO%20VIGENCIA%202020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto vigencia fiscal 2019', 'presupuesto-vigencia-fiscal-2019', 'Presupuesto desagregado de ingresos, gastos e inversión de la vigencia fiscal 2019.', NULL, 'documento', 'Presupuesto aprobado', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 80, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto-vigencia-fiscal-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/APROBACION-PRESUPUESTO-2019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'presupuesto-general-de-ingresos-gastos-e-inversion'
 WHERE e.slug = 'presupuesto-vigencia-fiscal-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2026', 'ejecucion-presupuestal-de-ingresos-2026', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2026, hasta julio.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-15 12:00:00', 10, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JULIO%20202620260929.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20JUNIO%20202620260929.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MAYO%20202620260929.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ABRIL%20202620260929.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20MARZO%20202620260929.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20FEBRERO%20202620260929.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202026/EJECUCION%20ACTIVA%20ENERO%20202620260929.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2025', 'ejecucion-presupuestal-de-ingresos-2025', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2025, hasta diciembre.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-01-15 12:00:00', 20, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20DICIEMRBE%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20NOVIEMBRE%202025.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20OCTUBRE%202025.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20SEPTIEMBRE%202025.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20AGOSTO%202025.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JULIO%202025.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20JUNIO%202025.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MAYO%202025.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ABRIL%202025.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20MARZO%202025.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20FEBRERO%202025.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%202025/EJECUCION%20ACTIVA%20ENERO%202025.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2024', 'ejecucion-presupuestal-de-ingresos-2024', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2024, hasta diciembre.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-01-15 12:00:00', 30, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20DICIEMBRE%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20NOVIEMBRE%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20OCTUBRE%202024.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20SEPTIEMBRE%202024.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20AGOSTO%202024.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JULIO%202024.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20JUNIO%202024.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20ACTIVA%20VIGENCIA%202024/EJECUCION%20ACTIVA%20MAYO%202024.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202024.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20MARZO%202024.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20FEBRERO%202024.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20INGRESOS%20ENERO%202024.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2023', 'ejecucion-presupuestal-de-ingresos-2023', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2023, hasta diciembre.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-15 12:00:00', 40, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20DICIEMBRE%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20NOVIEMBRE%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20OCTUBRE%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20SEPTIEMBRE%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20AGOSTO%202023.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JULIO%202023.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20JUNIO%202023.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MAYO%202023.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ABRIL%202023.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20MARZO%202023.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20FEBRERO%202023.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20INGRESOS%20ENERO%202023.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2022', 'ejecucion-presupuestal-de-ingresos-2022', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2022, hasta diciembre.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-01-15 12:00:00', 50, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Diciembre%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Noviembre%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Octubre%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Septiembre%202022.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Activa%20Agosto%202022.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JULIO%202022.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20JUNIO%202022.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MAYO%202022.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ABRIL%202022.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20MARZO%202022.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20FEBRERO%202022.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20ACTIVA%20ENERO%202022.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2021', 'ejecucion-presupuestal-de-ingresos-2021', 'Informes mensuales de ejecución del presupuesto de ingresos (activa) de la vigencia 2021, hasta diciembre.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-01-15 12:00:00', 60, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Diciembre%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Noviembre%202021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Octubre%202021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Septiembre%202021.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Agosto%202021.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Julio%202021.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Junio%202021.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Mayo%202021.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Abril%202021.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Marzo%202021.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Febrero%202021.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Ingresos%20Enero%202021.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de ingresos 2013 a 2020', 'ejecucion-presupuestal-de-ingresos-2013-a-2020', 'Archivo comprimido con la ejecución presupuestal de ingresos de las vigencias 2013 a 2020.', NULL, 'documento', 'Ejecución de ingresos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 70, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-ingresos-2013-a-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/ACTIVA%202013%20a%202020.rar'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-ingresos-2013-a-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2026', 'ejecucion-presupuestal-de-gastos-2026', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2026, hasta julio.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-15 12:00:00', 80, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JULIO%20202620260929.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20JUNIO%20202620260929.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MAYO%20202620260929.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ABRIL%20202620260929.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20MARZO%20202620260929.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20FEBRERO%20202620260929.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202026/EJECUCION%20PASIVA%20ENERO%20202620260929.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2025', 'ejecucion-presupuestal-de-gastos-2025', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2025, hasta diciembre.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-01-15 12:00:00', 90, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva12.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva11.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva10.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva9.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva8.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva7.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva6.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva5.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva4.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva3.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva2.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%202025/formato_202513_f06_cdg_ejecucionpasiva1.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2024', 'ejecucion-presupuestal-de-gastos-2024', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2024, hasta diciembre.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-01-15 12:00:00', 100, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20DICIEMBRE%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20NOVIEMBRE%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20OCTUBRE%202024.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20SEPTIEMBRE%202024.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20AGOSTO%202024.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JULIO%202024.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20JUNIO%202024.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/EJECUCION%20PASIVA%20VIGENCIA%202024/EJECUCION%20PASIVA%20MAYO%202024.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202024.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20MARZO%202024.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20FEBRERO%202024.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCI%C3%93N%20PRESUPUESTAL%20GASTOS%20ENERO%202024.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2023', 'ejecucion-presupuestal-de-gastos-2023', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2023, hasta noviembre.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-15 12:00:00', 110, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20NOVIEMBRE%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20OCTUBRE%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20SEPTIEMBRE%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20AGOSTO%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JULIO%202023.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20JUNIO%202023.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MAYO%202023.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ABRIL%202023.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20MARZO%202023.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20FEBRERO%202023.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PRESUPUESTO%20GASTOS%20ENERO%202023.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2022', 'ejecucion-presupuestal-de-gastos-2022', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2022, hasta diciembre.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-01-15 12:00:00', 120, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Diciembre%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Noviembre%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Octubre%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Septiembre%202022.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%C3%B3n%20Pasiva%20Agosto%202022.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JULIO%202022.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20JUNIO%202022.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MAYO%202022.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ABRIL%202022.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20MARZO%202022.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20FEBRERO%202022.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EJECUCION%20PASIVA%20ENERO%202022.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2021', 'ejecucion-presupuestal-de-gastos-2021', 'Informes mensuales de ejecución del presupuesto de gastos (pasiva) de la vigencia 2021, hasta diciembre.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-01-15 12:00:00', 130, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Diciembre%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Noviembre%202021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Octubre%202021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Septiembre%202021.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Agosto%202021.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Julio%202021.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Junio%202021.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Mayo%202021.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Abril%202021.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Marzo%202021.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Febrero%202021.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ejecuci%D0%B2n%20Presupuesto%20Gastos%20Enero%202021.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ejecución presupuestal de gastos 2013 a 2020', 'ejecucion-presupuestal-de-gastos-2013-a-2020', 'Archivo comprimido con la ejecución presupuestal de gastos de las vigencias 2013 a 2020.', NULL, 'documento', 'Ejecución de gastos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 140, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-presupuestal-de-gastos-2013-a-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Pasiva%202013-2020.rar'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'ejecucion-presupuestal-de-gastos-2013-a-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2025', 'informe-de-gestion-presupuestal-2025', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2025.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-02-15 12:00:00', 150, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202025/INFORME%20GESTION%20PRESUPUESTAL%202025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2024', 'informe-de-gestion-presupuestal-2024', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2024.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-02-15 12:00:00', 160, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/presupuesto/INFORMES%202024/INFORME%20GESTION%20PRESUPUESTAL%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2023', 'informe-de-gestion-presupuestal-2023', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2023.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-02-27 12:00:00', 170, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20PRESUPUESTO%20INGRESOS%20Y%20GASTOS%20VF%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2022', 'informe-de-gestion-presupuestal-2022', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2022.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-02-27 12:00:00', 180, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2021', 'informe-de-gestion-presupuestal-2021', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2021.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-01-12 12:00:00', 190, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuesto%20(Diciembre%20-%202021).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2020', 'informe-de-gestion-presupuestal-2020', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2020 (con corte a septiembre).', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 200, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-a-Septiembre-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2019', 'informe-de-gestion-presupuestal-2019', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2019.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 210, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-de-Gestion-Presupuestal-Diciembre-2019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2018', 'informe-de-gestion-presupuestal-2018', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2018.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 220, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202018.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2017', 'informe-de-gestion-presupuestal-2017', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2017.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 230, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Gesti%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%20Corte%2031%20de%20Diciembre%20de%202017.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2016', 'informe-de-gestion-presupuestal-2016', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2016.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 240, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202016.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2015', 'informe-de-gestion-presupuestal-2015', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2015.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 250, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2015');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202015.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informe de gestión presupuestal 2014', 'informe-de-gestion-presupuestal-2014', 'Informe de gestión del presupuesto de ingresos y gastos de la vigencia 2014.', NULL, 'documento', 'Informes de gestión presupuestal', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 260, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'ejecucion-presupuestal'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informe-de-gestion-presupuestal-2014');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Presupuestal%202014.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'ejecucion-presupuestal'
 WHERE e.slug = 'informe-de-gestion-presupuestal-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2026-2025', 'estados-financieros-comparativos-2026-2025', 'Estados financieros comparativos de la vigencia 2026 frente a 2025, con notas y revelaciones.', NULL, 'documento', 'Estados financieros 2026 - 2025', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-06-28 12:00:00', 10, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2026-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20II%20TRIMESTRE%20202620260729.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2026-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202026-2025.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2026-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2025-2024', 'estados-financieros-comparativos-2025-2024', 'Estados financieros comparativos de la vigencia 2025 frente a 2024, con notas y revelaciones.', NULL, 'documento', 'Estados financieros 2025 - 2024', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-02-27 12:00:00', 20, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2025-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20y%20revelaciones%202025-2024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20NOVIEMBRE%202025-2024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20COMPARATIVOS%20OCTUBRE%202025-2026.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPT.2025.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202025-204.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202025-2024.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202025-2024.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MARZO%202024-2025.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2025-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2024-2023', 'estados-financieros-comparativos-2024-2023', 'Estados financieros comparativos de la vigencia 2024 frente a 2023, con notas y revelaciones.', NULL, 'documento', 'Estados financieros 2024 - 2023', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-02-28 12:00:00', 30, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2024-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20CERTIFICADOS%202024-2023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REVELACIONES%20%20CONTABILIDAD%20HSJG%202024-%20FINALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20SEPTIEMBRE%202024-2023EDITABLE.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20AGOSTO%202024-AGOSTO%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20JULIO%202024%20-%20JULIO%202023.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estados%20financiero%20a%20junio2024.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20A%20MAYO%202024-MAYO%202023.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202024-%20ABRIL%202023.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20A%20MARZO%20%202024%20-%202023.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20%20FEBRERO%202024%20-%202023.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20%20COMPARATIVOS%20%20A%20ENERO%202024%20-%202023.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2024-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2023-2022', 'estados-financieros-comparativos-2023-2022', 'Estados financieros comparativos de la vigencia 2023 frente a 2022.', NULL, 'documento', 'Estados financieros 2023 - 2022', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-02-20 12:00:00', 40, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2023-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20DICIEMBRE%20%202023-2022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARTIVOS%20NOVIEMBRE%202023-2022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20OCTUBRE%202023-%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20financieros%20comparativos%20septiembre%202023-2022%20editable.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20AGOSTO%202023-2022.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JULIO%202023-2022.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20JUNIO%202023-2022.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20MAYO%202023-2022.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20COMPARATIVOS%20ABRIL%202023-2022.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20EDITABLES%20A%20MARZO.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Febrero%202023-%20Febrero%202022.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%202023-Enero%202022.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2023-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2022-2021', 'estados-financieros-comparativos-2022-2021', 'Estados financieros comparativos de la vigencia 2022 frente a 2021, con notas y revelaciones.', NULL, 'documento', 'Estados financieros 2022 - 2021', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-03-06 12:00:00', 50, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2022-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20FINANCIEROS%20Y%20REVELACIONES%202022-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Nov%20-%20Noviembre%20%202022-2021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero-%20Octubre%202022-2021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20Enero%20-%20Agosto%202022-2021.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Estados%20Financieros%20Comparativos%20%20Julio%202022-2021.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-JUNIO-2022-2021.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MAYO-2022-2021.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ABRIL-2022-2021.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-MARZO-2022-2021.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-FEBRERO-2022-2021.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS%20-FINANCIEROS-COMPARTIVOS-ENERO-2022-2021.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2022-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2021-2020', 'estados-financieros-comparativos-2021-2020', 'Estados financieros comparativos de la vigencia 2021 frente a 2020.', NULL, 'documento', 'Estados financieros 2021 - 2020', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 60, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2021-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2021-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2021-2020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2021-2020.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2021-2020.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2021-2020.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2021-2020.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2021-2020.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2021-2020.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2021-2020.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2021-2020.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2021-2020.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2021-2020.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2021-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2020-2019', 'estados-financieros-comparativos-2020-2019', 'Estados financieros comparativos de la vigencia 2020 frente a 2019.', NULL, 'documento', 'Estados financieros 2020 - 2019', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 70, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2020-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-2020-2019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVO-NOVIEMBRE-2020-2019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2020-2019.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2020-2019.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2020-2019.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2020-2019.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2020-2019.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2020-2019.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2020-2019.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2020-2019.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-FEBRERO-2020-2019.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2020-2019.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2020-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estados financieros comparativos 2019-2018', 'estados-financieros-comparativos-2019-2018', 'Estados financieros comparativos de la vigencia 2019 frente a 2018.', NULL, 'documento', 'Estados financieros 2019 - 2018', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 80, 'esehospitalguaviare.gov.co (Presupuesto)'
  FROM cms_paginas p WHERE p.slug = 'informacion-publica-yo-relevante'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estados-financieros-comparativos-2019-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-DICIEMBRE-%202019-2018.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-NOVIEMBRE-2019-2018.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-OCTUBRE-2019-2018.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-SEPTIEMBRE-2019-2018.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-AGOSTO-2019-2018.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JULIO-2019-2018.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-JUNIO-2019-2018.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MAYO-2019-2018.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ABRIL-2019-2018.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-MARZO-2019-2018.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-%20FINANCIEROS-COMPARATIVOS-FEBRERO-%202019-2018.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTADOS-FINANCIEROS-COMPARATIVOS-ENERO-2019-2018.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informacion-publica-yo-relevante'
 WHERE e.slug = 'estados-financieros-comparativos-2019-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Presupuesto)';
