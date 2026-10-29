-- =====================================================================
-- 028 · Normatividad del portal anterior
--  - 2.1.2 Decreto Único Reglamentario: Decreto 780 de 2016
--  - 2.1.3 Normativa aplicable: estatutos, ordenanzas, nombramientos, resoluciones,
--    acuerdos, acuerdos de Junta Directiva, circulares, autos y normograma (por año)
--  - 2.1.4 Vínculo al Diario Oficial
--  - 2.1.5 Políticas, lineamientos y manuales: políticas institucionales por tema
--  - 2.2.2 Sistema de búsqueda de normas propio: normograma
-- 76 entradas y 269 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET url_externa = 'https://www.imprenta.gov.co/diario-oficial'
 WHERE slug = 'vinculo-al-diario-o-gaceta-oficial' AND (url_externa IS NULL OR url_externa = '');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'NORMOGRAMA HOSPITAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/NORMOGRAMA%20HOSPITAL.pdf', 'documento', 'application/pdf', 'Normograma de la E.S.E. Hospital San José del Guaviare', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/NORMOGRAMA%20HOSPITAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 013-2024 ESTATUTO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20013-2024%20ESTATUTO.pdf', 'documento', 'application/pdf', 'Estatutos de Contratación – Acuerdo 013 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20013-2024%20ESTATUTO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 005-2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20005-2024.pdf', 'documento', 'application/pdf', 'Estatutos Institucionales ESE Hospital San José del Guaviare: Acuerdo Nº 005 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20005-2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTATUTOS APROBADOS 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016.pdf', 'documento', 'application/pdf', 'Estatutos ESE Hospital San José del Guaviare: Acuerdo Nº 008 de 2016', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 0015 2008- deroga el acuerdo 01.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%200015%202008-%20deroga%20el%20acuerdo%2001.pdf', 'documento', 'application/pdf', 'Estatutos ESE Hospital San José del Guaviare: Acuerdo Nº 0015 de 2008', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%200015%202008-%20deroga%20el%20acuerdo%2001.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTATUTOS 003 DE 1998.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20003%20DE%201998.pdf', 'documento', 'application/pdf', 'Estatutos ESE Hospital San José del Guaviare: Acuerdo Nº 003 de 1998', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20003%20DE%201998.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ORDENANZA 002 ESE HOSPITAL SAN JOSE GUAVIARE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ORDENANZA%20002%20ESE%20HOSPITAL%20SAN%20JOSE%20GUAVIARE.pdf', 'documento', 'application/pdf', 'Ordenanza Nº 002 de 1996: Por medio de la cual se crea la Empresa Social del Estado Hospital San José del Guaviare, como una entidad pública del departamento del Guaviare', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ORDENANZA%20002%20ESE%20HOSPITAL%20SAN%20JOSE%20GUAVIARE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '21. NOMBRAMIENTO YENNY MURCIA ESTRADA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/21.%20NOMBRAMIENTO%20YENNY%20MURCIA%20ESTRADA.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Yenny Murcia Estrada', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/21.%20NOMBRAMIENTO%20YENNY%20MURCIA%20ESTRADA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '20. NOMBRAMIENTO DRO JOSE SEGUNDO POLO MORENO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20.%20NOMBRAMIENTO%20DRO%20JOSE%20SEGUNDO%20POLO%20MORENO.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dr. José Segundo Polo Moreno', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20.%20NOMBRAMIENTO%20DRO%20JOSE%20SEGUNDO%20POLO%20MORENO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '18. ACTOS NOMBRAMIENTO YERID NATALY SAAVEDRA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/18.%20ACTOS%20NOMBRAMIENTO%20YERID%20NATALY%20SAAVEDRA.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Yerid Nataly Saavedra', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/18.%20ACTOS%20NOMBRAMIENTO%20YERID%20NATALY%20SAAVEDRA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '17. ACTOS NOMBRAMIENTO ANA MARCELA MARTINEZ TORRES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/17.%20ACTOS%20NOMBRAMIENTO%20ANA%20MARCELA%20MARTINEZ%20TORRES.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Ana Marcela Martínez Torres', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/17.%20ACTOS%20NOMBRAMIENTO%20ANA%20MARCELA%20MARTINEZ%20TORRES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '16. ACTOS NOMBRAMIENTO MARIA FERNANDA GOMEZ CARO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/16.%20ACTOS%20NOMBRAMIENTO%20MARIA%20FERNANDA%20GOMEZ%20CARO.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. María Fernanda Gómez Caro', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/16.%20ACTOS%20NOMBRAMIENTO%20MARIA%20FERNANDA%20GOMEZ%20CARO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '15. ACTOS NOMBRAMIENTO LEIDI KORAIMA BARRIOS CARDENAS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/15.%20ACTOS%20NOMBRAMIENTO%20LEIDI%20KORAIMA%20BARRIOS%20CARDENAS.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Leidi Koraima Barrios Cárdenas', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/15.%20ACTOS%20NOMBRAMIENTO%20LEIDI%20KORAIMA%20BARRIOS%20CARDENAS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '14. ACTOS NOMBRAMIENTO LINDHEY KARINA TORRES LOPEZ.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/14.%20ACTOS%20NOMBRAMIENTO%20LINDHEY%20KARINA%20TORRES%20LOPEZ.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Lindhey Karina Torres López', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/14.%20ACTOS%20NOMBRAMIENTO%20LINDHEY%20KARINA%20TORRES%20LOPEZ.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '13. ACTOS NOMBRAMIENTO DERLLY BUITRAGO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/13.%20ACTOS%20NOMBRAMIENTO%20DERLLY%20BUITRAGO.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Derlly Buitrago', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/13.%20ACTOS%20NOMBRAMIENTO%20DERLLY%20BUITRAGO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '12. ACTOS NOMBRAMIENTO RODRIGO MIRANDA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/12.%20ACTOS%20NOMBRAMIENTO%20RODRIGO%20MIRANDA.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dr. Rodrigo Miranda', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/12.%20ACTOS%20NOMBRAMIENTO%20RODRIGO%20MIRANDA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '11. RESOLUCIÓN NOMBRAMIENTO SANDRA JULIETH MARTINEZ.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/11.%20RESOLUCI%C3%93N%20NOMBRAMIENTO%20SANDRA%20JULIETH%20MARTINEZ.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Sandra Julieth Martínez', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/11.%20RESOLUCI%C3%93N%20NOMBRAMIENTO%20SANDRA%20JULIETH%20MARTINEZ.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '10. ACTOS NOMBRAMIENTO DRA. ROSA EMILIANA MELO LOAIZA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/10.%20ACTOS%20NOMBRAMIENTO%20DRA.%20ROSA%20EMILIANA%20MELO%20LOAIZA.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Rosa Emiliana Melo Loaiza', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/10.%20ACTOS%20NOMBRAMIENTO%20DRA.%20ROSA%20EMILIANA%20MELO%20LOAIZA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9. ACTOS DE NOMBRAMIENTO MARTHA ANDREA PARRA PENAGOS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20ACTOS%20DE%20NOMBRAMIENTO%20MARTHA%20ANDREA%20PARRA%20PENAGOS.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Martha Andrea Parra Penagos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20ACTOS%20DE%20NOMBRAMIENTO%20MARTHA%20ANDREA%20PARRA%20PENAGOS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8. NOMBRAMIENTO ERIKA JULIETH PINTO REYES_20260401_175616.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20NOMBRAMIENTO%20ERIKA%20JULIETH%20PINTO%20REYES_20260401_175616.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Erika Julieth Pinto Reyes', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20NOMBRAMIENTO%20ERIKA%20JULIETH%20PINTO%20REYES_20260401_175616.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7. ACTOS DE POSESIÓN DRA. JENNY PATRICIA ERASO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20ACTOS%20DE%20POSESI%C3%93N%20DRA.%20JENNY%20PATRICIA%20ERASO.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Jenny Patricia Eraso', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20ACTOS%20DE%20POSESI%C3%93N%20DRA.%20JENNY%20PATRICIA%20ERASO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '6. ACTOS DE POSESIÓN DRO. JONHATAN MONTALVO VERGARA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/6.%20ACTOS%20DE%20POSESI%C3%93N%20DRO.%20JONHATAN%20MONTALVO%20VERGARA.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dr. Johnatan Montalvo Vergara', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/6.%20ACTOS%20DE%20POSESI%C3%93N%20DRO.%20JONHATAN%20MONTALVO%20VERGARA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '5. ACTOS DE NOMBRAMIENTO DRA. LAURA FERNANDA ARCE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/5.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20LAURA%20FERNANDA%20ARCE.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Laura Fernanda Arce', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/5.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20LAURA%20FERNANDA%20ARCE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4. ACTOS DE NOMBRAMIENTO DRA. DIANA SOFIA GONZALEZ.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20DIANA%20SOFIA%20GONZALEZ.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Diana Sofía González', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20DIANA%20SOFIA%20GONZALEZ.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3. ACTOS  DE NOMBRAMIENTO HELVER FERNEY MARIN VILLAR.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20ACTOS%20%20DE%20NOMBRAMIENTO%20HELVER%20FERNEY%20MARIN%20VILLAR.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dr. Helver Ferney Marín Villar', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20ACTOS%20%20DE%20NOMBRAMIENTO%20HELVER%20FERNEY%20MARIN%20VILLAR.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTOS DE NOMBRAMIENTO DRA. ELSA CASTRO SALCEDO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ELSA%20CASTRO%20SALCEDO.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Elsa Castro Salcedo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ELSA%20CASTRO%20SALCEDO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTOS DE NOMBRAMIENTO DRA. ADRIANA RODRIGUEZ ESQUI.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ADRIANA%20RODRIGUEZ%20ESQUI.pdf', 'documento', 'application/pdf', 'Acto administrativo de nombramiento Dra. Adriana Rodríguez Esquivel', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ADRIANA%20RODRIGUEZ%20ESQUI.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 906 de 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20906%20de%202026.pdf', 'documento', 'application/pdf', 'Resolución 0906 de 2026 – Asignación de funciones', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20906%20de%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 822 de 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20822%20de%202026.pdf', 'documento', 'application/pdf', 'Resolución 0822 de 2026 – Conformación de terna del personal profesional de la salud para el segundo representante del estamento científico ante la Junta Directiva', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20822%20de%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN INCREMENTO SALARIA 2026_CON ORDENANZA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20INCREMENTO%20SALARIA%202026_CON%20ORDENANZA.pdf', 'documento', 'application/pdf', 'Resolución 0733 de 2026 – Aprobación de incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20INCREMENTO%20SALARIA%202026_CON%20ORDENANZA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 0083.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200083.pdf', 'documento', 'application/pdf', 'Resolución 0083 de 2026 – Compraventa de equipos biomédicos y mobiliario hospitalario', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200083.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución No. 0610 COMITÉ COPASST.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST.pdf', 'documento', 'application/pdf', 'Resolución 0610 de 2025 – Conformación del Comité COPASST 2025-2027', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 768-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20768-2025.pdf', 'documento', 'application/pdf', 'Resolución 0768 de 2025 – Creación del Comité Paritario de Seguridad y Salud en el Trabajo (COPASST)', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20768-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INCREMENTO SALARIAL VIGENCIA 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202025.pdf', 'documento', 'application/pdf', 'Resolución No. 0734 del 25 de julio de 2025 – Incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION REACTIVOVIGILANCIA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20REACTIVOVIGILANCIA.pdf', 'documento', 'application/pdf', 'Resolución del programa de reactivovigilancia', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20REACTIVOVIGILANCIA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resoluciòn 419_Plan de Acciòn_V2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B2n%20419_Plan%20de%20Acci%C3%B2n_V2.pdf', 'documento', 'application/pdf', 'Resolución 0419 de 2025 – Plan de Acción', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B2n%20419_Plan%20de%20Acci%C3%B2n_V2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RES 1329  actuali Código de Etica..pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RES%201329%20%20actuali%20C%C3%B3digo%20de%20Etica..pdf', 'documento', 'application/pdf', 'Resolución 1329 de 2024 – Actualización del Código de Ética', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RES%201329%20%20actuali%20C%C3%B3digo%20de%20Etica..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion derechos y deberes.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf', 'documento', 'application/pdf', 'Resolución de derechos y deberes', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INCREMENTO SALARIAL VIGENCIA 2024 SERVIDORES PUBLICOS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202024%20SERVIDORES%20PUBLICOS.pdf', 'documento', 'application/pdf', 'Resolución No. 0326 del 27 de marzo de 2024 – Incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202024%20SERVIDORES%20PUBLICOS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0236 por medio de la cual se adopta la planta de empleos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200236%20por%20medio%20de%20la%20cual%20se%20adopta%20la%20planta%20de%20empleos.pdf', 'documento', 'application/pdf', 'Resolución 0236 de 2023 – Por medio de la cual se adopta la planta de empleos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200236%20por%20medio%20de%20la%20cual%20se%20adopta%20la%20planta%20de%20empleos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0234 por medio de la cual se suprimen unos empleos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200234%20por%20medio%20de%20la%20cual%20se%20suprimen%20unos%20empleos.pdf', 'documento', 'application/pdf', 'Resolución 0234 de 2023 – Por medio de la cual se suprimen unos empleos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200234%20por%20medio%20de%20la%20cual%20se%20suprimen%20unos%20empleos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0235 por medio de la cual se crean unos empleos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200235%20por%20medio%20de%20la%20cual%20se%20crean%20unos%20empleos.pdf', 'documento', 'application/pdf', 'Resolución 0235 de 2023 – Por medio de la cual se crean unos empleos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200235%20por%20medio%20de%20la%20cual%20se%20crean%20unos%20empleos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-110.-Plan-de-Accion-Institucional.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-110.-Plan-de-Accion-Institucional.pdf', 'documento', 'application/pdf', 'Resolución Nº 0110 de 2022: Por medio de la cual se adopta el plan de acción institucional de la ESE Hospital San José del Guaviare para la vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-110.-Plan-de-Accion-Institucional.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN No. 0737 DE 2022_INCREMENTO SALARIAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200737%20DE%202022_INCREMENTO%20SALARIAL.pdf', 'documento', 'application/pdf', 'Resolución No. 0737 del 15 de julio de 2022 – Incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200737%20DE%202022_INCREMENTO%20SALARIAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion N.1151 convocatoria a eleccion copasst.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20N.1151%20convocatoria%20a%20eleccion%20copasst.pdf', 'documento', 'application/pdf', 'Resolución Nº 1151 de 2022: Convocatoria a elección COPASST', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20N.1151%20convocatoria%20a%20eleccion%20copasst.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-0836-politicas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas.pdf', 'documento', 'application/pdf', 'Resolución Nº 0836 de 2020: Por la cual se adoptan las políticas de MIPG en la Empresa Social del Estado Hospital San José del Guaviare', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion-0620-28-octubre-de-2020-adopcion-medelo-MIPG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-0620-28-octubre-de-2020-adopcion-medelo-MIPG.pdf', 'documento', 'application/pdf', 'Resolución Nº 0620 de 2020: Por la cual se adoptan las políticas de MIPG en la Empresa Social del Estado Hospital San José del Guaviare', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-0620-28-octubre-de-2020-adopcion-medelo-MIPG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN No. 0794 DE 2021_INCREMENTO SALARIAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200794%20DE%202021_INCREMENTO%20SALARIAL.pdf', 'documento', 'application/pdf', 'Resolución No. 0794 del 30 de septiembre de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200794%20DE%202021_INCREMENTO%20SALARIAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-activacion-equipo-multidisciplinario.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-activacion-equipo-multidisciplinario.pdf', 'documento', 'application/pdf', 'Resolución Nº 0521 de 2021: Por medio de la cual se adiciona un capítulo transitorio a la Resolución Nº 1382 del 21 de noviembre de 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-activacion-equipo-multidisciplinario.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN  INCREMENTO SALARIAL VIGENCIA 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20%20INCREMENTO%20SALARIAL%20VIGENCIA%202020.pdf', 'documento', 'application/pdf', 'Resolución No. 0453 del 11 de agosto de 2020 – Incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20%20INCREMENTO%20SALARIAL%20VIGENCIA%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 0159 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%200159%20de%202020.pdf', 'documento', 'application/pdf', 'Resolución 0159 de 2020: Por medio de la cual se definen lineamientos institucionales para que la Oficina de Control Interno de Gestión cumpla con las actividades de evaluación independiente, auditoría interna y auditoría para el mejoramiento de…', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%200159%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Adopción Política Gestión Documental.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Adopci%C3%B3n%20Pol%C3%ADtica%20Gesti%C3%B3n%20Documental.pdf', 'documento', 'application/pdf', 'Resolución Nº 1388 de 2019: Por medio de la cual se adopta la Política de Gestión Documental', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Adopci%C3%B3n%20Pol%C3%ADtica%20Gesti%C3%B3n%20Documental.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PETI y Resolución Hospital San José del Guaviare.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PETI%20y%20Resoluci%C3%B3n%20Hospital%20San%20Jos%C3%A9%20del%20Guaviare.pdf', 'documento', 'application/pdf', 'Resolución Nº 1385 de 2019: Por medio de la cual se adopta el Plan Estratégico de Tecnologías de la Información y las Comunicaciones PETI 2019 – 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PETI%20y%20Resoluci%C3%B3n%20Hospital%20San%20Jos%C3%A9%20del%20Guaviare.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 1042 de 2019 Convocatoria comision de personal.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201042%20de%202019%20Convocatoria%20comision%20de%20personal.pdf', 'documento', 'application/pdf', 'Resolución Nº 1042 de 2019: Por medio de la cual se convoca a elección de los representantes de los empleados a la Comisión de Personal para la vigencia 2019 – 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201042%20de%202019%20Convocatoria%20comision%20de%20personal.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 1041 Elección representante COPASST.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201041%20Elecci%C3%B3n%20representante%20COPASST.pdf', 'documento', 'application/pdf', 'Resolución Nº 1041 de 2019: Por medio de la cual se convoca a elección de los representantes de los empleados ante el COPASST para la vigencia 2019 – 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201041%20Elecci%C3%B3n%20representante%20COPASST.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 335 de 2019 PAMEC (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC%20(2).pdf', 'documento', 'application/pdf', 'Resolución Nº 0335 de 2019: Por medio de la cual se establece la metodología para la autoevaluación de los estándares de acreditación en el ciclo del mejoramiento continuo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0333.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200333.pdf', 'documento', 'application/pdf', 'Resolución Nº 0333 de 2019: Por la cual se ordena un encargo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200333.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N°0164.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B00164.pdf', 'documento', 'application/pdf', 'Resolución Nº 0164 de 2019: Por medio de la cual se unifica y actualiza la normatividad del Comité de Conciliación y Defensa Judicial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B00164.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUSION Nº 0169.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUSION%20N%C2%BA%200169.pdf', 'documento', 'application/pdf', 'Resolución Nº 0169 de 2019: Por la cual se declara la apertura del proceso de convocatoria pública Nº 01 de 2019 – Prestación de servicio de raciones alimentarias', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUSION%20N%C2%BA%200169.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0231 de 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200231%20de%202019.pdf', 'documento', 'application/pdf', 'Resolución Nº 0231 de 2019: Por medio de la cual se convoca a la elección del Representante del Estamento Científico ante la Junta Directiva', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200231%20de%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 1611 de 2018 Política de Gestión del Riesgo.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201611%20de%202018%20Pol%C3%ADtica%20de%20Gesti%C3%B3n%20del%20Riesgo.pdf', 'documento', 'application/pdf', 'Resolución Nº 1611 de 2018: Por medio de la cual se adopta la Política de Gestión del Riesgo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201611%20de%202018%20Pol%C3%ADtica%20de%20Gesti%C3%B3n%20del%20Riesgo.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1382 de 2018 MIPG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201382%20de%202018%20MIPG.pdf', 'documento', 'application/pdf', 'Resolución Nº 1382 de 2018: Por medio de la cual se integra el Comité Institucional de Gestión y Desempeño', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201382%20de%202018%20MIPG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN No. 0862 DE 2018_INCREMENTO SALARIAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200862%20DE%202018_INCREMENTO%20SALARIAL.pdf', 'documento', 'application/pdf', 'Resolución No. 0862 de 2018 – Incremento salarial', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200862%20DE%202018_INCREMENTO%20SALARIAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 1285 de 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201285%20de%202017.pdf', 'documento', 'application/pdf', 'Resolución 1285 de 2017: Por medio de la cual se adopta el Sistema Institucional de Control Interno y se modifica el Comité Institucional de Coordinación del Sistema de Control Interno', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201285%20de%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución No. 1325 2017 - (Desagregación Presupuesto Vigencia 2018).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201325%202017%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202018).pdf', 'documento', 'application/pdf', 'Resolución Nº 1325 de 2017: Desagregación del Presupuesto de Ingresos y Gastos para la vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201325%202017%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202018).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Red 0890 2017 admción del riesgo.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Red%200890%202017%20admci%C3%B3n%20del%20riesgo.pdf', 'documento', 'application/pdf', 'Resolución Nº 0890 de 2017: Por medio de la cual se actualiza la Política de Administración del Riesgo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Red%200890%202017%20admci%C3%B3n%20del%20riesgo.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0463 de 2017, Ajuste  Tarifa GLUCOMETRIA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200463%20de%202017,%20Ajuste%20%20Tarifa%20GLUCOMETRIA.pdf', 'documento', 'application/pdf', 'Resolución Nº 0463 de 2017: Actualización de la tarifa del examen de glucometría', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200463%20de%202017,%20Ajuste%20%20Tarifa%20GLUCOMETRIA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4. Res 0448 2017 austeridad y gasto público.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%C3%BAblico.pdf', 'documento', 'application/pdf', 'Resolución Nº 0448 de 2017: Políticas de Austeridad, Racionalización de Costos y Gastos y Eficiencia Administrativa', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%C3%BAblico.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion DE  AMBULANCIA 004 de 1 de enero de 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20DE%20%20AMBULANCIA%20004%20de%201%20de%20enero%20de%202017.pdf', 'documento', 'application/pdf', 'Resolución Nº 0004 de 2017: Actualización de tarifas de traslado de pacientes en ambulancia básica, medicalizada y neonatal para la vigencia 2017', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20DE%20%20AMBULANCIA%20004%20de%201%20de%20enero%20de%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución No. 1316 de 2016 - (Desagregación Presupuesto Vigencia 2017).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201316%20de%202016%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202017).pdf', 'documento', 'application/pdf', 'Resolución Nº 1316 de 2016: Desagregación del Presupuesto de Ingresos y Gastos para la vigencia 2017', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201316%20de%202016%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202017).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Ambulancia Urbano Redondo 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Ambulancia%20Urbano%20Redondo%202016.pdf', 'documento', 'application/pdf', 'Resolución Nº 1109 de 2016: Tarifa de transporte terrestre en ambulancia básica y medicalizada urbano redondo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Ambulancia%20Urbano%20Redondo%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res 0943 2016 admcion del riesgo.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo.pdf', 'documento', 'application/pdf', 'Resolución Nº 0943 de 2016: Modificación de la Política de Administración del Riesgo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3. Res 0663 de 2016 Polítca de calidad.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20Res%200663%20de%202016%20Pol%C3%ADtca%20de%20calidad.pdf', 'documento', 'application/pdf', 'Resolución Nº 0663 de 2016: Por medio de la cual se adopta la Política y Objetivos de la Calidad', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20Res%200663%20de%202016%20Pol%C3%ADtca%20de%20calidad.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION MEDICAMENTOS 470   2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20MEDICAMENTOS%20470%20%20%202016.pdf', 'documento', 'application/pdf', 'Resolución Nº 0470 de 2016: Actualización de precios de medicamentos, dispositivos médicos e insumos para la vigencia 2016', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20MEDICAMENTOS%20470%20%20%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AMBULANCIA 383 DE 2016 REDONDO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AMBULANCIA%20383%20DE%202016%20REDONDO.pdf', 'documento', 'application/pdf', 'Resolución Nº 0383 de 2016: Tarifas para el traslado redondo de pacientes en ambulancia básica, medicalizada y neonatal', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AMBULANCIA%20383%20DE%202016%20REDONDO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION AMBULANCIA  2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202016.pdf', 'documento', 'application/pdf', 'Resolución Nº 0202 de 2016: Actualización de tarifas de traslado de pacientes en ambulancia para la vigencia 2016', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS Y PROCEDIMIENTOS 154 DEL 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20154%20DEL%202016.pdf', 'documento', 'application/pdf', 'Resolución Nº 0154 de 2016: Exámenes de laboratorio clínico y procedimientos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20154%20DEL%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1155 creación Ventanilla ünica.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201155%20creaci%C3%B3n%20Ventanilla%20%C3%BCnica.pdf', 'documento', 'application/pdf', 'Resolución Nº 1155 de 2015: Por medio de la cual se crea la Ventanilla Única de Correspondencia', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201155%20creaci%C3%B3n%20Ventanilla%20%C3%BCnica.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion 1000.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%201000.pdf', 'documento', 'application/pdf', 'Resolución Nº 1000 de 2015: Exámenes de laboratorio clínico y procedimientos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%201000.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS Y LABORATORIOS 872 DEL 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20Y%20LABORATORIOS%20872%20DEL%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0872 de 2015: Exámenes de laboratorio clínico y procedimientos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20Y%20LABORATORIOS%20872%20DEL%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS Y PROCEDIMIENTOS 770 DEL 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20770%20DEL%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0770 de 2015: Exámenes de laboratorio clínico y procedimientos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20770%20DEL%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '0735 DE 30 SEPTIEMBRE 2015 TARIFAS AMBULANCIA 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/0735%20DE%2030%20SEPTIEMBRE%202015%20TARIFAS%20AMBULANCIA%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0735 de 2015: Tarifa de transporte de víctimas de accidentes de tránsito y eventos catastróficos y de ambulancia medicalizada urbana', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/0735%20DE%2030%20SEPTIEMBRE%202015%20TARIFAS%20AMBULANCIA%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1094864 RESOLUCION_0520_TARIFA_AMBULANCIA  JULIO 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1094864%20RESOLUCION_0520_TARIFA_AMBULANCIA%20%20JULIO%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0520 de 2015: Modificación de la Resolución Nº 0211 de 2015 sobre tarifas de traslado de pacientes en ambulancia', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1094864%20RESOLUCION_0520_TARIFA_AMBULANCIA%20%20JULIO%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS Y PROCEDIMIENTOS 474 DEL 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20474%20DEL%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0474 de 2015: Exámenes de laboratorio clínico y procedimientos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20474%20DEL%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0372.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200372.pdf', 'documento', 'application/pdf', 'Resolución Nº 0372 de 2015: Por la cual se adopta el programa de seguridad del paciente', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200372.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res 0303 2015 admcion riesgo.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo.pdf', 'documento', 'application/pdf', 'Resolución Nº 0303 de 2015: Actualización de la Política de Administración del Riesgo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 211 TARIFAS AMBULANCIA  2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20211%20TARIFAS%20AMBULANCIA%20%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0211 de 2015: Tarifa de traslado de pacientes en ambulancia básica, medicalizada y neonatal', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20211%20TARIFAS%20AMBULANCIA%20%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS 008 DEL 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20008%20DEL%202015.pdf', 'documento', 'application/pdf', 'Resolución Nº 0008 de 2015: Tarifas de laboratorio clínico no definidas en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20008%20DEL%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1er-trimestre.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1er-trimestre.pdf', 'documento', 'application/pdf', 'Resoluciones del primer trimestre de 2015', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1er-trimestre.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2do-trimestre.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2do-trimestre.pdf', 'documento', 'application/pdf', 'Resoluciones del segundo trimestre de 2015', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2do-trimestre.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3er-trimestre.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3er-trimestre.pdf', 'documento', 'application/pdf', 'Resoluciones del tercer trimestre de 2015', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3er-trimestre.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4to-trimestre.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4to-trimestre.pdf', 'documento', 'application/pdf', 'Resoluciones del cuarto trimestre de 2015', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4to-trimestre.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0807.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200807.pdf', 'documento', 'application/pdf', 'Resolución Nº 0807 de 2014: Modificación del Comité de Infecciones', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200807.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0806.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200806.pdf', 'documento', 'application/pdf', 'Resolución Nº 0806 de 2014: Por la cual se adopta el Comité de Seguridad del Paciente y Eventos Adversos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200806.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0805.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200805.pdf', 'documento', 'application/pdf', 'Resolución Nº 0805 de 2014: Modificación del Comité de Ética Hospitalaria', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200805.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS 804 DEL 2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20804%20DEL%202014.pdf', 'documento', 'application/pdf', 'Resolución Nº 0804 de 2014: Exámenes de laboratorio clínico no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20804%20DEL%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion  0772 tarifas ambulancia 2013 y  2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20%200772%20tarifas%20ambulancia%202013%20y%20%202014.pdf', 'documento', 'application/pdf', 'Resolución Nº 0772 de 2014: Aclaración de tarifas de transporte terrestre de pacientes en ambulancia 2013 y 2014', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20%200772%20tarifas%20ambulancia%202013%20y%20%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIOS 0738 DEL 2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%200738%20DEL%202014.pdf', 'documento', 'application/pdf', 'Resolución Nº 0738 de 2014: Exámenes de laboratorio clínico no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%200738%20DEL%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0643.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200643.pdf', 'documento', 'application/pdf', 'Resolución Nº 0643 de 2014: Por la cual se crea el Comité Antitrámites y de Gobierno en Línea', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200643.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS QUIRURGICOS 594 DEL 2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%20594%20DEL%202014.pdf', 'documento', 'application/pdf', 'Resolución Nº 0594 de 2014: Procedimientos quirúrgicos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%20594%20DEL%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMEINTOS QUIRURGICOS MODIFICACION R 451 No 562.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMEINTOS%20QUIRURGICOS%20MODIFICACION%20R%20451%20No%20562.pdf', 'documento', 'application/pdf', 'Resolución Nº 0562 de 2014: Modificación de la Resolución 0451 de 2014 sobre nomenclatura de procedimientos quirúrgicos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMEINTOS%20QUIRURGICOS%20MODIFICACION%20R%20451%20No%20562.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EXAMENES DE LABORATORIOS 0518.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EXAMENES%20DE%20LABORATORIOS%200518.pdf', 'documento', 'application/pdf', 'Resolución Nº 0518 de 2014: Exámenes de laboratorio clínico no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EXAMENES%20DE%20LABORATORIOS%200518.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS QUIRURGICOS 0451.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%200451.pdf', 'documento', 'application/pdf', 'Resolución Nº 0451 de 2014: Procedimientos quirúrgicos no definidos en el Manual Tarifario SOAT', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%200451.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0449.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200449.pdf', 'documento', 'application/pdf', 'Resolución Nº 0449 de 2014: Funciones del Comité de Contratación conforme al Estatuto de Contratación', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200449.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 1014 de 2013.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201014%20de%202013.pdf', 'documento', 'application/pdf', 'Resolución Nº 1014 de 2013: Por medio de la cual se adopta el Mapa de Procesos y el Manual de Procesos y Procedimientos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201014%20de%202013.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LABORATORIO CLINICO LESMANIASIS 0893.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIO%20CLINICO%20LESMANIASIS%200893.pdf', 'documento', 'application/pdf', 'Resolución Nº 0893 de 2013: Creación de exámenes de laboratorio clínico de Leishmania', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIO%20CLINICO%20LESMANIASIS%200893.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0845.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200845.pdf', 'documento', 'application/pdf', 'Resolución Nº 0845 de 2013: Por la cual se adopta la guía para el manejo médico de código rojo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200845.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0672.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200672.pdf', 'documento', 'application/pdf', 'Resolución Nº 0672 de 2013: Por la cual se adoptan las guías y protocolos para el manejo médico', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200672.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0662.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200662.pdf', 'documento', 'application/pdf', 'Resolución Nº 0662 de 2013: Por la cual se adoptan las guías prehospitalarias para atención de pacientes', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200662.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0493.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200493.pdf', 'documento', 'application/pdf', 'Resolución Nº 0493 de 2013: Guía para el manejo inicial del trauma de tórax', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200493.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0492.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200492.pdf', 'documento', 'application/pdf', 'Resolución Nº 0492 de 2013: Guía para el manejo inicial de trauma craneoencefálico', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200492.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0490.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200490.pdf', 'documento', 'application/pdf', 'Resolución Nº 0490 de 2013: Por la cual se adopta el Comité AIEPI o Equipo para Bienestar y Salud de la Infancia', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200490.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución N 0489.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%200489.pdf', 'documento', 'application/pdf', 'Resolución Nº 0489 de 2013: Guía para el manejo de infección urinaria en el adulto', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%200489.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0485.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200485.pdf', 'documento', 'application/pdf', 'Resolución Nº 0485 de 2013: Guía para el manejo de hipertensión arterial primaria', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200485.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0484.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200484.pdf', 'documento', 'application/pdf', 'Resolución Nº 0484 de 2013: Guía para el manejo de trauma musculoesquelético', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200484.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0482.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200482.pdf', 'documento', 'application/pdf', 'Resolución Nº 0482 de 2013: Guía para el manejo inicial de trauma', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200482.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0481.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200481.pdf', 'documento', 'application/pdf', 'Resolución Nº 0481 de 2013: Guía para el manejo de trauma abdominal', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200481.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0480.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200480.pdf', 'documento', 'application/pdf', 'Resolución Nº 0480 de 2013: Guía para el manejo inicial de trauma de cuello', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200480.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0479.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200479.pdf', 'documento', 'application/pdf', 'Resolución Nº 0479 de 2013: Guía para el manejo del trauma en la gestante', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200479.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0469.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200469.pdf', 'documento', 'application/pdf', 'Resolución Nº 0469 de 2013: Programa, subprogramas y política de salud ocupacional', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200469.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0392.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200392.pdf', 'documento', 'application/pdf', 'Resolución Nº 0392 de 2013: Por medio de la cual se adopta la Política y Objetivos de Seguridad del Paciente', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200392.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N°. 353_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0.%20353_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 0353 de 2013: Por medio de la cual se adopta la Política de Responsabilidad Social', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0.%20353_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0318 DE 2013_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 0318 de 2013: Por medio de la cual se adopta la Política y los Objetivos de Calidad', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion 0265 de 2013- 30-04-2013 04.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200265%20de%202013-%2030-04-2013%2004.pdf', 'documento', 'application/pdf', 'Resolución Nº 0265 de 2013: Por medio de la cual se revoca la Resolución Nº 0879 de 2010', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200265%20de%202013-%2030-04-2013%2004.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion 0260 Manual de Tarifas Institucional_compressed.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200260%20Manual%20de%20Tarifas%20Institucional_compressed.pdf', 'documento', 'application/pdf', 'Resolución Nº 0260 de 2013: Manual tarifario institucional de medicamentos y dispositivos médicos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200260%20Manual%20de%20Tarifas%20Institucional_compressed.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0248 DE 2013_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200248%20DE%202013_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 0248 de 2013: Por medio de la cual se modifica y actualiza la Resolución Nº 0477 de 2011', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200248%20DE%202013_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0473.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200473.pdf', 'documento', 'application/pdf', 'Resolución Nº 0437 de 2012: Por la cual se crea el Comité Docencia-Servicio', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200473.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0195.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200195.pdf', 'documento', 'application/pdf', 'Resolución Nº 0195 de 2012: Por la cual se crea el Comité de Urgencias', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200195.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0194.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200194.pdf', 'documento', 'application/pdf', 'Resolución Nº 0194 de 2012: Por la cual se crea el Comité de Mortalidad Materno Perinatal', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200194.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion ambulancia 0084   2012.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20ambulancia%200084%20%20%202012.pdf', 'documento', 'application/pdf', 'Resolución Nº 0084 de 2012: Actualización de tarifas de transporte terrestre de pacientes', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20ambulancia%200084%20%20%202012.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0020_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200020_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 0020 de 2012: Por la cual se adopta la Política de Administración del Riesgo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200020_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0477_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200477_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 0477 de 2011: Por medio de la cual se adoptan los formatos de procesos y procedimientos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200477_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOL 0879 PLAT ESTRATEGICA 29-10-2010 derogado acuerdo 02.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOL%200879%20PLAT%20ESTRATEGICA%2029-10-2010%20derogado%20acuerdo%2002.pdf', 'documento', 'application/pdf', 'Resolución Nº 0879 de 2010: Por medio de la cual se modifica el Acuerdo Nº 0015 de 2008', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOL%200879%20PLAT%20ESTRATEGICA%2029-10-2010%20derogado%20acuerdo%2002.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9. Resolucion comite IAMI.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI.pdf', 'documento', 'application/pdf', 'Resolución Nº 0211 de 2010: Por medio de la cual se crea el comité de la IIAMI Integral', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION AMBULANCIA  2009.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202009.pdf', 'documento', 'application/pdf', 'Resolución Nº 0567 de 2009: Nuevos códigos de las tarifas para el cobro de traslados de pacientes en remisión', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202009.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 1426_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%201426_1.pdf', 'documento', 'application/pdf', 'Resolución Nº 1426 de 2008: Por la cual se adopta el manual de procesos y procedimientos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%201426_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0356.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200356.pdf', 'documento', 'application/pdf', 'Resolución Nº 0356 de 2007: Por la cual se crea el Comité de Farmacia y Terapéutica', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200356.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución Nº 0731.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200731.pdf', 'documento', 'application/pdf', 'Resolución Nº 0731 de 2003: Por medio de la cual se crea y conforma el Comité Científico Técnico', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200731.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002-2025.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 002 de 2025', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 001 de 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20001%20de%202019.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 001 de 2019: Adición al Presupuesto de Ingresos y Gastos para la vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20001%20de%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 01 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2001%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 01 de 2018: Adición al Presupuesto de Ingresos y Gastos para la vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2001%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 02 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2002%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 02 de 2018: Manual de manejo, control, custodia y baja de la propiedad, planta y equipo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2002%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 03 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2003%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 03 de 2018: Por medio del cual se expide el nuevo manual de contratación', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2003%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 04 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2004%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 04 de 2018: Por medio del cual se aprueba el Plan de Gestión Institucional del Gerente para el periodo 2018-2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2004%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 05 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2005%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 05 de 2018: Adición al Presupuesto de Ingresos y Gastos para la vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2005%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 06 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2006%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 06 de 2018: Actualización del manual de funciones, requisitos mínimos y competencias laborales', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2006%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 07 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2007%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 07 de 2018: Creación de las coordinaciones de los grupos internos de trabajo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2007%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 09 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2009%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 09 de 2018: Creación de un rubro en el Presupuesto de Gastos para la vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2009%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo Nº 010 de 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20010%20de%202018.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 010 de 2018: Aprobación del Presupuesto de Ingresos y Gastos para la vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20010%20de%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acto Administrativo Aprobación Presupuesto Ingresos y Gastos 2018 - ESE HSJG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202018%20-%20ESE%20HSJG.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 007 de 2017: Aprobación del presupuesto de ingresos y gastos para la vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202018%20-%20ESE%20HSJG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ESTATUTOS APROBADOS 2016 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016%20(1).pdf', 'documento', 'application/pdf', 'Acuerdo Nº 008 de 2016: Por medio del cual se adoptan los nuevos estatutos de la ESE Hospital San José del Guaviare', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acto Administrativo Aprobación Presupuesto Ingresos y Gastos 2017 - ESE HSJG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202017%20-%20ESE%20HSJG.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 009 de 2016: Aprobación del presupuesto de ingresos y gastos para la vigencia 2017', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202017%20-%20ESE%20HSJG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'decreto306actaposecion713.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/decreto306actaposecion713.pdf', 'documento', 'application/pdf', 'Decreto Nº 306 de 2016: Encargo de un servidor público de libre nombramiento y remoción en un cargo de periodo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/decreto306actaposecion713.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014.pdf', 'documento', 'application/pdf', 'Acuerdo Nº 005 de 2014: Por medio del cual se expide el nuevo estatuto de contratación', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'circular N° 10 de 2023 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/circular%20N%C2%B0%2010%20de%202023%20(1).pdf', 'documento', 'application/pdf', 'Circular Nº 10 de 2023: Entrega de formularios de afiliación a fondos de pensión y actualización de datos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/circular%20N%C2%B0%2010%20de%202023%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CIRCULAR O.7...pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20O.7...pdf', 'documento', 'application/pdf', 'Circular Nº 07 de 2023: Permiso del miércoles 5 de abril para los servidores de la E.S.E.', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20O.7...pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CIRCULAR N° 006 DE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N%C2%B0%20006%20DE%202023.pdf', 'documento', 'application/pdf', 'Circular Nº 06 de 2023: Actualización de hojas de vida y declaración de bienes y rentas en SIGEP II', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N%C2%B0%20006%20DE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'a173-12.htm', 'https://www.corteconstitucional.gov.co/relatoria/autos/2012/a173-12.htm', 'otro', NULL, 'Auto 173 de 2012 – Corte Constitucional', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.corteconstitucional.gov.co/relatoria/autos/2012/a173-12.htm');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 de 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202024.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 04 de 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202024.pdf', 'documento', 'application/pdf', 'Acuerdo 04 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 de 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202024.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 08 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 08 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 07 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 07 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 06 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 06 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 03 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 03 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 02 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 de 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202023.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2023', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 de 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202022.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 04 de 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202022.pdf', 'documento', 'application/pdf', 'Acuerdo 04 de 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 03 de 20222.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%2020222.pdf', 'documento', 'application/pdf', 'Acuerdo 03 de 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%2020222.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02 de 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202022.pdf', 'documento', 'application/pdf', 'Acuerdo 02 de 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 de 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202022.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2022', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 07 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 07 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 06 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 06 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 04 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 04 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 03 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 03 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 02 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 de 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202021.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 12 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2012%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 12 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2012%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 11 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2011%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 11 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2011%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 10 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2010%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 10 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2010%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 09 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 09 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 08 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 08 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 07 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 07 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 06 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 06 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 04 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 04 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 03 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 03 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 02 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 de 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202020.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 09 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 09 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 08 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 08 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 07 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 07 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 06 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 06 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 05 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 05 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'acuerdo 04 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%2004%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 04 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%2004%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 03 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 03 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 02 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 02 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 01 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%202019.pdf', 'documento', 'application/pdf', 'Acuerdo 01 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Decreto_780_de_2016_Sector_Salud_y_Protección_Social.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_780_de_2016_Sector_Salud_y_Protecci%C3%B3n_Social.pdf', 'documento', 'application/pdf', 'Decreto 780 de 2016 – Sector Salud y Protección Social', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_780_de_2016_Sector_Salud_y_Protecci%C3%B3n_Social.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION DE LA TECNOLOGIA BIOMEDICA V2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20TECNOLOGIA%20BIOMEDICA%20V2.pdf', 'documento', 'application/pdf', 'Política de Gestión de la Tecnología Biomédica V2', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20TECNOLOGIA%20BIOMEDICA%20V2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN 1351 Política de gestión de la Tecnolo.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201351%20Pol%C3%ADtica%20de%20gesti%C3%B3n%20de%20la%20Tecnolo.pdf', 'documento', 'application/pdf', 'Resolución 1351 de 2025', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201351%20Pol%C3%ADtica%20de%20gesti%C3%B3n%20de%20la%20Tecnolo.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE PRESTACIÓN DE SERVICIOS DE SALUD V2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20PRESTACI%C3%93N%20DE%20SERVICIOS%20DE%20SALUD%20V2.pdf', 'documento', 'application/pdf', 'Política de Prestación de Servicios de Salud V2', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20PRESTACI%C3%93N%20DE%20SERVICIOS%20DE%20SALUD%20V2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1350 Política de Prestación de Servicios de Salud.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201350%20Pol%C3%ADtica%20de%20Prestaci%C3%B3n%20de%20Servicios%20de%20Salud.pdf', 'documento', 'application/pdf', 'Resolución 1350 de 2025', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201350%20Pol%C3%ADtica%20de%20Prestaci%C3%B3n%20de%20Servicios%20de%20Salud.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Politica de Planeación Institucional.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20Planeaci%C3%B3n%20Institucional.pdf', 'documento', 'application/pdf', 'Política de Planeación Institucional', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20Planeaci%C3%B3n%20Institucional.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN 1639 DE 2024 POLITICAS INSTITUCIONALES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf', 'documento', 'application/pdf', 'Resolución 1639 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE RACIONALIZACIÓN.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20RACIONALIZACI%C3%93N.pdf', 'documento', 'application/pdf', 'Política de Racionalización', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20RACIONALIZACI%C3%93N.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Politica de SEGUIMIENTO Y EVALUACIÓN INSTITUCIONAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20SEGUIMIENTO%20Y%20EVALUACI%C3%93N%20INSTITUCIONAL.pdf', 'documento', 'application/pdf', 'Política de Seguimiento y Evaluación Institucional', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20SEGUIMIENTO%20Y%20EVALUACI%C3%93N%20INSTITUCIONAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICAS DE COMPRAS Y CONTRATACIÓN.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20DE%20COMPRAS%20Y%20CONTRATACI%C3%93N.pdf', 'documento', 'application/pdf', 'Políticas de Compras y Contratación', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20DE%20COMPRAS%20Y%20CONTRATACI%C3%93N.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICAS GESTION PRESUPUESTAL Y EFICIENCIA DEL GASTO PUBLICO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20GESTION%20PRESUPUESTAL%20Y%20EFICIENCIA%20DEL%20GASTO%20PUBLICO.pdf', 'documento', 'application/pdf', 'Políticas de Gestión Presupuestal y Eficiencia del Gasto Público', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20GESTION%20PRESUPUESTAL%20Y%20EFICIENCIA%20DEL%20GASTO%20PUBLICO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION DE LA INFORMACION ESTADISTICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20INFORMACION%20ESTADISTICA.pdf', 'documento', 'application/pdf', 'Política de Gestión de la Información Estadística', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20INFORMACION%20ESTADISTICA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE SERVICIO AL CIUDADANO (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf', 'documento', 'application/pdf', 'Política de Servicio al Ciudadano', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 1620 Politicas MIPG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201620%20Politicas%20MIPG.pdf', 'documento', 'application/pdf', 'Resolución 1620 – Políticas MIPG', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201620%20Politicas%20MIPG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 POLITICA DE FORTALECIMIENTO ORGANIZACIONAL Y SIMPLIFICACION DE PROCESOS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POLITICA%20DE%20FORTALECIMIENTO%20ORGANIZACIONAL%20Y%20SIMPLIFICACION%20DE%20PROCESOS.pdf', 'documento', 'application/pdf', 'Actualización de la Política de Fortalecimiento Organizacional y Simplificación de Procesos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POLITICA%20DE%20FORTALECIMIENTO%20ORGANIZACIONAL%20Y%20SIMPLIFICACION%20DE%20PROCESOS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FORMATO POLITICAS-Politica de Fortalecimiento organizacional y Simplificación de Procesos -Claudia.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/FORMATO%20POLITICAS-Politica%20de%20Fortalecimiento%20organizacional%20y%20Simplificaci%C3%B3n%20de%20Procesos%20-Claudia.pdf', 'documento', 'application/pdf', 'Política de Fortalecimiento Organizacional y Simplificación de Procesos', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/FORMATO%20POLITICAS-Politica%20de%20Fortalecimiento%20organizacional%20y%20Simplificaci%C3%B3n%20de%20Procesos%20-Claudia.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1107 adopción políticas Mipg de 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201107%20adopci%C3%B3n%20pol%C3%ADticas%20Mipg%20de%202022.pdf', 'documento', 'application/pdf', 'Resolución 1107 de 2022 – Adopción de políticas MIPG', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201107%20adopci%C3%B3n%20pol%C3%ADticas%20Mipg%20de%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE COMUNICACIONES 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20COMUNICACIONES%202024.pdf', 'documento', 'application/pdf', 'Política de Comunicaciones 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20COMUNICACIONES%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-COMUNICACIONES-.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-COMUNICACIONES-.pdf', 'documento', 'application/pdf', 'Política de Comunicaciones', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-COMUNICACIONES-.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-politicas-2021-MIPG-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG-1.pdf', 'documento', 'application/pdf', 'Resolución de políticas MIPG 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION DEL CONOCIMIENTO Y LA INNOVACION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DEL%20CONOCIMIENTO%20Y%20LA%20INNOVACION.pdf', 'documento', 'application/pdf', 'Política de Gestión del Conocimiento y la Innovación 2026', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DEL%20CONOCIMIENTO%20Y%20LA%20INNOVACION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 0099 DE 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200099%20DE%202026.pdf', 'documento', 'application/pdf', 'Resolución 0099 de 2026', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200099%20DE%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Politica-de-Gestion-del-Conocimiento-y-la-Innvacion-ESE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica-de-Gestion-del-Conocimiento-y-la-Innvacion-ESE.pdf', 'documento', 'application/pdf', 'Política de Gestión del Conocimiento y la Innovación', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica-de-Gestion-del-Conocimiento-y-la-Innvacion-ESE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-politicas-2021-MIPG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG.pdf', 'documento', 'application/pdf', 'Resolución de políticas MIPG 2021', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-PREVENCION-DEL-DANO-ANTIJURIDICO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PREVENCION-DEL-DANO-ANTIJURIDICO.pdf', 'documento', 'application/pdf', 'Política de Prevención del Daño Antijurídico', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PREVENCION-DEL-DANO-ANTIJURIDICO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION ANTIJURIDICO 0520 DE 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20ANTIJURIDICO%200520%20DE%202020.pdf', 'documento', 'application/pdf', 'Resolución Nº 0520 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20ANTIJURIDICO%200520%20DE%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-EMERGENCIAS-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-EMERGENCIAS-2020.pdf', 'documento', 'application/pdf', 'Política de Emergencias 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-EMERGENCIAS-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-0836-politicas (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf', 'documento', 'application/pdf', 'Resolución Nº 0836 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-GOBIERNO-DIGITAL 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL%202024.pdf', 'documento', 'application/pdf', 'Política de Gobierno Digital 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-GOBIERNO-DIGITAL-PLANEACION-2020-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL-PLANEACION-2020-1.pdf', 'documento', 'application/pdf', 'Política de Gobierno Digital 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL-PLANEACION-2020-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-SEGURIDAD-DE-LA-INFORMACION-DEF.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SEGURIDAD-DE-LA-INFORMACION-DEF.pdf', 'documento', 'application/pdf', 'Política de Seguridad de la Información 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SEGURIDAD-DE-LA-INFORMACION-DEF.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-EDL-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-EDL-2020.pdf', 'documento', 'application/pdf', 'Política de Evaluación del Desempeño Laboral 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-EDL-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-CONTROL-INTERNO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-CONTROL-INTERNO.pdf', 'documento', 'application/pdf', 'Política de Control Interno de Gestión 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-CONTROL-INTERNO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion-1463-POLITICA-CONTROL-INTERNO-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-1463-POLITICA-CONTROL-INTERNO-2020.pdf', 'documento', 'application/pdf', 'Resolución Nº 1463 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-1463-POLITICA-CONTROL-INTERNO-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE HUMANIZACIÓN DE LA ATENCIÓN EN SALUD V2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20HUMANIZACI%C3%93N%20DE%20LA%20ATENCI%C3%93N%20EN%20SALUD%20V2.pdf', 'documento', 'application/pdf', 'Política de Humanización de la Atención en Salud V2', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20HUMANIZACI%C3%93N%20DE%20LA%20ATENCI%C3%93N%20EN%20SALUD%20V2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 1230 POLITICA DE HUMANIZACION .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201230%20POLITICA%20DE%20HUMANIZACION%20.pdf', 'documento', 'application/pdf', 'Resolución 1230 del 21 de noviembre de 2025', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201230%20POLITICA%20DE%20HUMANIZACION%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 POLÍTICA DE GESTIÓN DEL RIESGO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POL%C3%8DTICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO.pdf', 'documento', 'application/pdf', 'Política de Gestión del Riesgo 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POL%C3%8DTICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTIÓN DEL RIESGO HSJG 1 (3).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO%20HSJG%201%20(3).pdf', 'documento', 'application/pdf', 'Política de Gestión del Riesgo 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO%20HSJG%201%20(3).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res 0303 2015 admcion riesgo (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo%20(1).pdf', 'documento', 'application/pdf', 'Resolución Nº 0303 de 2015', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res 0943 2016 admcion del riesgo (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo%20(1).pdf', 'documento', 'application/pdf', 'Resolución Nº 0943 de 2016', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION ESTRATEGICA DE TALENTO HUMANO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20ESTRATEGICA%20DE%20TALENTO%20HUMANO%202024.pdf', 'documento', 'application/pdf', 'Política de Gestión Estratégica de Talento Humano 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20ESTRATEGICA%20DE%20TALENTO%20HUMANO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-GESTION-TALENTO-HUMANO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-TALENTO-HUMANO.pdf', 'documento', 'application/pdf', 'Política de Gestión del Talento Humano 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-TALENTO-HUMANO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion-politicas-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020.pdf', 'documento', 'application/pdf', 'Resolución Nº 0620 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION DOCUMENTAL - 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DOCUMENTAL%20-%202024.pdf', 'documento', 'application/pdf', 'Política de Gestión Documental 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DOCUMENTAL%20-%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN 1639 DE 2024 POLITICAS INSTITUCIONALES_2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES_2024.pdf', 'documento', 'application/pdf', 'Resolución 1639 de 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES_2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN 0647 ADOPCIÓN DE POLITICA GESTIOÓN DOCUMENTAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%200647%20ADOPCI%C3%93N%20DE%20POLITICA%20GESTIO%C3%93N%20DOCUMENTAL.pdf', 'documento', 'application/pdf', 'Resolución 0647 – Adopción de la Política de Gestión Documental 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%200647%20ADOPCI%C3%93N%20DE%20POLITICA%20GESTIO%C3%93N%20DOCUMENTAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-GESTION-DOCUMENTAL-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-DOCUMENTAL-2019.pdf', 'documento', 'application/pdf', 'Política de Gestión Documental 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-DOCUMENTAL-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion-1388-de-2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-1388-de-2019.pdf', 'documento', 'application/pdf', 'Resolución Nº 1388 de 2019', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-1388-de-2019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf', 'documento', 'application/pdf', 'Política de Transparencia, Acceso a la Información Pública y Lucha contra la Corrupción 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion-politicas-2020 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(1).pdf', 'documento', 'application/pdf', 'Resolución Nº 0620 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE GESTION Y DESEMPEÑO ajustada.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20Y%20DESEMPE%C3%91O%20ajustada.pdf', 'documento', 'application/pdf', 'Política de Gestión y Desempeño 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20Y%20DESEMPE%C3%91O%20ajustada.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion-politicas-2020 (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(2).pdf', 'documento', 'application/pdf', 'Resolución Nº 0620 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-PARTICIPACION-CIUDADANA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA.pdf', 'documento', 'application/pdf', 'Política de Participación Ciudadana 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE INTEGRIDAD 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf', 'documento', 'application/pdf', 'Política de Integridad 2024', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-INTEGRIDAD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf', 'documento', 'application/pdf', 'Política de Integridad 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Anexo polit SST.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo%20polit%20SST.pdf', 'documento', 'application/pdf', 'Política del Sistema de Gestión de la Seguridad y Salud en el Trabajo', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo%20polit%20SST.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res 0467 de 2017 SST.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200467%20de%202017%20SST.pdf', 'documento', 'application/pdf', 'Resolución Nº 0469 de 2013', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200467%20de%202017%20SST.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-SIGC-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SIGC-2020.pdf', 'documento', 'application/pdf', 'Política de Calidad 0016 de 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SIGC-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION N° 0318 DE 2013_1 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1%20(1).pdf', 'documento', 'application/pdf', 'Resolución Nº 0318 de 2013', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLÍTICA DE AUSTERIDAD, RACIONALIZACION DE COSTOS Y GASTOS Y EFICIENCIA ADMINISTRATIVA.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/POL%C3%8DTICA%20DE%20AUSTERIDAD,%20RACIONALIZACION%20DE%20COSTOS%20Y%20GASTOS%20Y%20EFICIENCIA%20ADMINISTRATIVA.doc', 'documento', 'application/msword', 'Política de Austeridad, Racionalización de Costos y Gastos y Eficiencia Administrativa', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/POL%C3%8DTICA%20DE%20AUSTERIDAD,%20RACIONALIZACION%20DE%20COSTOS%20Y%20GASTOS%20Y%20EFICIENCIA%20ADMINISTRATIVA.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN No. 1204 APROBACIÓN POLITICA DE AUSTERIDAD DEL GASTO 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%201204%20APROBACI%C3%93N%20POLITICA%20DE%20AUSTERIDAD%20DEL%20GASTO%202021.pdf', 'documento', 'application/pdf', 'Resolución No. 1204 de 2021 – Aprobación de la Política de Austeridad del Gasto', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%201204%20APROBACI%C3%93N%20POLITICA%20DE%20AUSTERIDAD%20DEL%20GASTO%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '4. Res 0448 2017 austeridad y gasto pгblico (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%D0%B3blico%20(1).pdf', 'documento', 'application/pdf', 'Política y Resolución Nº 0448 de 2017', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%D0%B3blico%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MANUAL DE POLITICAS CONTABLES DEFINITIVO 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20POLITICAS%20CONTABLES%20DEFINITIVO%202020.pdf', 'documento', 'application/pdf', 'Manual de Políticas Contables 2020', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20POLITICAS%20CONTABLES%20DEFINITIVO%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE SEGURIDAD DEL PACIENTE V3.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20V3.pdf', 'documento', 'application/pdf', 'Política de Seguridad del Paciente V3', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20V3.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1209 Politica de seguridad del paciente.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201209%20Politica%20de%20seguridad%20del%20paciente.pdf', 'documento', 'application/pdf', 'Resolución 1209 del 14 de noviembre de 2025', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201209%20Politica%20de%20seguridad%20del%20paciente.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '7. Res 876 de 2018 Alcohol, tabaco, sust psicoat.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20Res%20876%20de%202018%20Alcohol,%20tabaco,%20sust%20psicoat.pdf', 'documento', 'application/pdf', 'Resolución Nº 0876 de 2018', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20Res%20876%20de%202018%20Alcohol,%20tabaco,%20sust%20psicoat.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '8. Res 0486 de 2013 AIEPI.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20Res%200486%20de%202013%20AIEPI.pdf', 'documento', 'application/pdf', 'Resolución Nº 0486 de 2013', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20Res%200486%20de%202013%20AIEPI.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '9. Resolucion comite IAMI (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI%20(1).pdf', 'documento', 'application/pdf', 'Resolución Nº 0211 de 2010', NULL, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI%20(1).pdf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Normograma', 'normograma', 'Compilación de las normas que rigen a la entidad.', NULL, 'documento', 'Normograma', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'normograma');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/NORMOGRAMA%20HOSPITAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'normograma' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estatutos', 'estatutos', 'Estatutos institucionales y de contratación de la E.S.E.', NULL, 'documento', 'Estatutos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-01-07 12:00:00', 20, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estatutos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20013-2024%20ESTATUTO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'estatutos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20005-2024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'estatutos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'estatutos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%200015%202008-%20deroga%20el%20acuerdo%2001.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'estatutos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20003%20DE%201998.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'estatutos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ordenanzas', 'ordenanzas', 'Ordenanza departamental de creación de la E.S.E.', NULL, 'documento', 'Ordenanzas', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 30, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ordenanzas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ORDENANZA%20002%20ESE%20HOSPITAL%20SAN%20JOSE%20GUAVIARE.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'ordenanzas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Nombramientos 2026', 'nombramientos-2026', 'Actos administrativos de nombramiento.', NULL, 'documento', 'Nombramientos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-10-09 12:00:00', 40, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'nombramientos-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/21.%20NOMBRAMIENTO%20YENNY%20MURCIA%20ESTRADA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20.%20NOMBRAMIENTO%20DRO%20JOSE%20SEGUNDO%20POLO%20MORENO.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/18.%20ACTOS%20NOMBRAMIENTO%20YERID%20NATALY%20SAAVEDRA.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/17.%20ACTOS%20NOMBRAMIENTO%20ANA%20MARCELA%20MARTINEZ%20TORRES.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/16.%20ACTOS%20NOMBRAMIENTO%20MARIA%20FERNANDA%20GOMEZ%20CARO.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/15.%20ACTOS%20NOMBRAMIENTO%20LEIDI%20KORAIMA%20BARRIOS%20CARDENAS.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/14.%20ACTOS%20NOMBRAMIENTO%20LINDHEY%20KARINA%20TORRES%20LOPEZ.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/13.%20ACTOS%20NOMBRAMIENTO%20DERLLY%20BUITRAGO.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/12.%20ACTOS%20NOMBRAMIENTO%20RODRIGO%20MIRANDA.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/11.%20RESOLUCI%C3%93N%20NOMBRAMIENTO%20SANDRA%20JULIETH%20MARTINEZ.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/10.%20ACTOS%20NOMBRAMIENTO%20DRA.%20ROSA%20EMILIANA%20MELO%20LOAIZA.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20ACTOS%20DE%20NOMBRAMIENTO%20MARTHA%20ANDREA%20PARRA%20PENAGOS.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20NOMBRAMIENTO%20ERIKA%20JULIETH%20PINTO%20REYES_20260401_175616.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20ACTOS%20DE%20POSESI%C3%93N%20DRA.%20JENNY%20PATRICIA%20ERASO.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/6.%20ACTOS%20DE%20POSESI%C3%93N%20DRO.%20JONHATAN%20MONTALVO%20VERGARA.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/5.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20LAURA%20FERNANDA%20ARCE.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20DIANA%20SOFIA%20GONZALEZ.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20ACTOS%20%20DE%20NOMBRAMIENTO%20HELVER%20FERNEY%20MARIN%20VILLAR.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ELSA%20CASTRO%20SALCEDO.pdf'), 18
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20DE%20NOMBRAMIENTO%20DRA.%20ADRIANA%20RODRIGUEZ%20ESQUI.pdf'), 19
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'nombramientos-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2026', 'resoluciones-2026', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-09-10 12:00:00', 50, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20906%20de%202026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20822%20de%202026.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20INCREMENTO%20SALARIA%202026_CON%20ORDENANZA.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200083.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2025', 'resoluciones-2025', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-09-11 12:00:00', 60, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%200610%20COMIT%C3%89%20COPASST.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20768-2025.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202025.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20REACTIVOVIGILANCIA.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B2n%20419_Plan%20de%20Acci%C3%B2n_V2.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2024', 'resoluciones-2024', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-11-07 12:00:00', 70, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RES%201329%20%20actuali%20C%C3%B3digo%20de%20Etica..pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INCREMENTO%20SALARIAL%20VIGENCIA%202024%20SERVIDORES%20PUBLICOS.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2023', 'resoluciones-2023', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-03 12:00:00', 80, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200236%20por%20medio%20de%20la%20cual%20se%20adopta%20la%20planta%20de%20empleos.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200234%20por%20medio%20de%20la%20cual%20se%20suprimen%20unos%20empleos.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200235%20por%20medio%20de%20la%20cual%20se%20crean%20unos%20empleos.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2022', 'resoluciones-2022', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-10-31 12:00:00', 90, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-110.-Plan-de-Accion-Institucional.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200737%20DE%202022_INCREMENTO%20SALARIAL.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20N.1151%20convocatoria%20a%20eleccion%20copasst.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-0620-28-octubre-de-2020-adopcion-medelo-MIPG.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2021', 'resoluciones-2021', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 100, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200794%20DE%202021_INCREMENTO%20SALARIAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-activacion-equipo-multidisciplinario.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2020', 'resoluciones-2020', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-02-03 12:00:00', 110, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20%20INCREMENTO%20SALARIAL%20VIGENCIA%202020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%200159%20de%202020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2019', 'resoluciones-2019', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 120, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Adopci%C3%B3n%20Pol%C3%ADtica%20Gesti%C3%B3n%20Documental.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PETI%20y%20Resoluci%C3%B3n%20Hospital%20San%20Jos%C3%A9%20del%20Guaviare.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201042%20de%202019%20Convocatoria%20comision%20de%20personal.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201041%20Elecci%C3%B3n%20representante%20COPASST.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC%20(2).pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200333.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B00164.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUSION%20N%C2%BA%200169.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200231%20de%202019.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2018', 'resoluciones-2018', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 130, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201611%20de%202018%20Pol%C3%ADtica%20de%20Gesti%C3%B3n%20del%20Riesgo.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201382%20de%202018%20MIPG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%200862%20DE%202018_INCREMENTO%20SALARIAL.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2017', 'resoluciones-2017', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-12-31 12:00:00', 140, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201285%20de%202017.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201325%202017%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202018).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Red%200890%202017%20admci%C3%B3n%20del%20riesgo.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200463%20de%202017,%20Ajuste%20%20Tarifa%20GLUCOMETRIA.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%C3%BAblico.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20DE%20%20AMBULANCIA%20004%20de%201%20de%20enero%20de%202017.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2016', 'resoluciones-2016', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-12-31 12:00:00', 150, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20No.%201316%20de%202016%20-%20(Desagregaci%C3%B3n%20Presupuesto%20Vigencia%202017).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20Ambulancia%20Urbano%20Redondo%202016.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20Res%200663%20de%202016%20Pol%C3%ADtca%20de%20calidad.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20MEDICAMENTOS%20470%20%20%202016.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AMBULANCIA%20383%20DE%202016%20REDONDO.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202016.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20154%20DEL%202016.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2015', 'resoluciones-2015', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2015-12-31 12:00:00', 160, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2015');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201155%20creaci%C3%B3n%20Ventanilla%20%C3%BCnica.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%201000.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20Y%20LABORATORIOS%20872%20DEL%202015.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20770%20DEL%202015.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/0735%20DE%2030%20SEPTIEMBRE%202015%20TARIFAS%20AMBULANCIA%202015.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1094864%20RESOLUCION_0520_TARIFA_AMBULANCIA%20%20JULIO%202015.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20Y%20PROCEDIMIENTOS%20474%20DEL%202015.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200372.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20211%20TARIFAS%20AMBULANCIA%20%202015.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20008%20DEL%202015.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1er-trimestre.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2do-trimestre.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3er-trimestre.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4to-trimestre.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2014', 'resoluciones-2014', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2014-12-31 12:00:00', 170, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2014');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200807.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200806.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200805.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%20804%20DEL%202014.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20%200772%20tarifas%20ambulancia%202013%20y%20%202014.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIOS%200738%20DEL%202014.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200643.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%20594%20DEL%202014.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMEINTOS%20QUIRURGICOS%20MODIFICACION%20R%20451%20No%20562.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EXAMENES%20DE%20LABORATORIOS%200518.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROCEDIMIENTOS%20QUIRURGICOS%200451.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200449.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2013', 'resoluciones-2013', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2013-12-31 12:00:00', 180, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2013');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201014%20de%202013.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LABORATORIO%20CLINICO%20LESMANIASIS%200893.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200845.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200672.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200662.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200493.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200492.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200490.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%200489.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200485.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200484.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200482.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200481.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200480.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200479.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200469.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200392.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0.%20353_1.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1.pdf'), 18
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200265%20de%202013-%2030-04-2013%2004.pdf'), 19
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%200260%20Manual%20de%20Tarifas%20Institucional_compressed.pdf'), 20
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200248%20DE%202013_1.pdf'), 21
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2012', 'resoluciones-2012', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2012-12-31 12:00:00', 190, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2012');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200473.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200195.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200194.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion%20ambulancia%200084%20%20%202012.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200020_1.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2011', 'resoluciones-2011', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2011-12-31 12:00:00', 200, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2011');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200477_1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2011' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2010', 'resoluciones-2010', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2010-12-31 12:00:00', 210, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2010');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOL%200879%20PLAT%20ESTRATEGICA%2029-10-2010%20derogado%20acuerdo%2002.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2010' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2010' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2009', 'resoluciones-2009', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2009-12-31 12:00:00', 220, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2009');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20AMBULANCIA%20%202009.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2009' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2008', 'resoluciones-2008', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2008-12-31 12:00:00', 230, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2008');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%201426_1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2008' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2007', 'resoluciones-2007', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2007-12-31 12:00:00', 240, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2007');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200356.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2007' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Resoluciones 2003', 'resoluciones-2003', 'Resoluciones expedidas por la Gerencia.', NULL, 'documento', 'Resoluciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2003-12-31 12:00:00', 250, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resoluciones-2003');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%200731.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'resoluciones-2003' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2025', 'acuerdos-2025', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-03-07 12:00:00', 260, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002-2025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2019', 'acuerdos-2019', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 270, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20001%20de%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2018', 'acuerdos-2018', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 280, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2001%20de%202018.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2002%20de%202018.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2003%20de%202018.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2004%20de%202018.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2005%20de%202018.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2006%20de%202018.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2007%20de%202018.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%2009%20de%202018.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20N%C2%BA%20010%20de%202018.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2017', 'acuerdos-2017', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-12-31 12:00:00', 290, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202018%20-%20ESE%20HSJG.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2016', 'acuerdos-2016', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-12-31 12:00:00', 300, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ESTATUTOS%20APROBADOS%202016%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acto%20Administrativo%20Aprobaci%C3%B3n%20Presupuesto%20Ingresos%20y%20Gastos%202017%20-%20ESE%20HSJG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/decreto306actaposecion713.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2014', 'acuerdos-2014', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2014-12-31 12:00:00', 310, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2014');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/estatuto-contratacion-ese-hospital-san-jose-acuerdo-005-2014.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2014' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos 2008', 'acuerdos-2008', 'Acuerdos de la Junta Directiva sobre presupuesto, estatutos y manuales.', NULL, 'documento', 'Acuerdos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2008-12-31 12:00:00', 320, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-2008');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%200015%202008-%20deroga%20el%20acuerdo%2001.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-2008' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Circulares 2023', 'circulares-2023', 'Circulares internas.', NULL, 'documento', 'Circulares', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-04-12 12:00:00', 330, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'circulares-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/circular%20N%C2%B0%2010%20de%202023%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'circulares-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20O.7...pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'circulares-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N%C2%B0%20006%20DE%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'circulares-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Autos 2012', 'autos-2012', 'Autos judiciales relacionados con la entidad.', NULL, 'documento', 'Autos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2012-12-31 12:00:00', 340, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'autos-2012');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.corteconstitucional.gov.co/relatoria/autos/2012/a173-12.htm'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'autos-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2024', 'acuerdos-de-junta-directiva-2024', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 350, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202024.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2023', 'acuerdos-de-junta-directiva-2023', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 360, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202023.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202023.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202023.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2022', 'acuerdos-de-junta-directiva-2022', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 370, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%2020222.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202022.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202022.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2021', 'acuerdos-de-junta-directiva-2021', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 380, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202021.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202021.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202021.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202021.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2020', 'acuerdos-de-junta-directiva-2020', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 390, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2012%20de%202020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2011%20de%202020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2010%20de%202020.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%20de%202020.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%20de%202020.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%20de%202020.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%20de%202020.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%20de%202020.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2004%20de%202020.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%20de%202020.pdf'), 9
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%20de%202020.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%20de%202020.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Acuerdos de Junta Directiva 2019', 'acuerdos-de-junta-directiva-2019', 'Acuerdos aprobados por la Junta Directiva.', NULL, 'documento', 'Acuerdos de Junta Directiva', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 400, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'normativa-aplicable'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'acuerdos-de-junta-directiva-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2009%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2008%202019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2007%202019.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2006%202019.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2005%202019.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/acuerdo%2004%202019.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2003%202019.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2002%202019.pdf'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%2001%202019.pdf'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'normativa-aplicable'
 WHERE e.slug = 'acuerdos-de-junta-directiva-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Decreto 780 de 2016 – Decreto Único Reglamentario del Sector Salud y Protección Social', 'decreto-780-de-2016-decreto-unico-reglamentario-del-sector-salud-y-proteccion-social', 'Compila las normas reglamentarias del sector salud y protección social.', NULL, 'documento', 'Decretos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-13 12:00:00', 10, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'decreto-unico-reglamentario'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'decreto-780-de-2016-decreto-unico-reglamentario-del-sector-salud-y-proteccion-social');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_780_de_2016_Sector_Salud_y_Protecci%C3%B3n_Social.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'decreto-unico-reglamentario'
 WHERE e.slug = 'decreto-780-de-2016-decreto-unico-reglamentario-del-sector-salud-y-proteccion-social' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Normograma de la E.S.E. Hospital San José del Guaviare', 'normograma-de-la-e-s-e-hospital-san-jose-del-guaviare', 'Relación de las normas que regulan la gestión de la entidad.', NULL, 'documento', 'Normograma', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'sistema-de-busqueda-de-normas-propio-de-la-entidad'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'normograma-de-la-e-s-e-hospital-san-jose-del-guaviare');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/NORMOGRAMA%20HOSPITAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'sistema-de-busqueda-de-normas-propio-de-la-entidad'
 WHERE e.slug = 'normograma-de-la-e-s-e-hospital-san-jose-del-guaviare' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión de la Tecnología Biomédica', 'politica-de-gestion-de-la-tecnologia-biomedica', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-19 12:00:00', 10, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-de-la-tecnologia-biomedica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20TECNOLOGIA%20BIOMEDICA%20V2.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-de-la-tecnologia-biomedica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201351%20Pol%C3%ADtica%20de%20gesti%C3%B3n%20de%20la%20Tecnolo.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-de-la-tecnologia-biomedica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Prestación de Servicios de Salud', 'politica-de-prestacion-de-servicios-de-salud', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-19 12:00:00', 20, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-prestacion-de-servicios-de-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20PRESTACI%C3%93N%20DE%20SERVICIOS%20DE%20SALUD%20V2.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-prestacion-de-servicios-de-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201350%20Pol%C3%ADtica%20de%20Prestaci%C3%B3n%20de%20Servicios%20de%20Salud.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-prestacion-de-servicios-de-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Planeación Institucional', 'politica-de-planeacion-institucional', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-planeacion-institucional');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20Planeaci%C3%B3n%20Institucional.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-planeacion-institucional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-planeacion-institucional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Racionalización', 'politica-de-racionalizacion', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-racionalizacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20RACIONALIZACI%C3%93N.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-racionalizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-racionalizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Seguimiento y Evaluación Institucional', 'politica-de-seguimiento-y-evaluacion-institucional', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 50, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-seguimiento-y-evaluacion-institucional');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica%20de%20SEGUIMIENTO%20Y%20EVALUACI%C3%93N%20INSTITUCIONAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-seguimiento-y-evaluacion-institucional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-seguimiento-y-evaluacion-institucional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Políticas de Compras y Contratación', 'politicas-de-compras-y-contratacion', NULL, NULL, 'documento', 'Financieras y contratación', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 60, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politicas-de-compras-y-contratacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20DE%20COMPRAS%20Y%20CONTRATACI%C3%93N.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-compras-y-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-compras-y-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Políticas de Gestión Presupuestal y Eficiencia del Gasto Público', 'politicas-de-gestion-presupuestal-y-eficiencia-del-gasto-publico', NULL, NULL, 'documento', 'Financieras y contratación', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 70, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politicas-de-gestion-presupuestal-y-eficiencia-del-gasto-publico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20GESTION%20PRESUPUESTAL%20Y%20EFICIENCIA%20DEL%20GASTO%20PUBLICO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-gestion-presupuestal-y-eficiencia-del-gasto-publico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-gestion-presupuestal-y-eficiencia-del-gasto-publico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión de la Información Estadística', 'politica-de-gestion-de-la-informacion-estadistica', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-17 12:00:00', 80, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-de-la-informacion-estadistica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DE%20LA%20INFORMACION%20ESTADISTICA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-de-la-informacion-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-de-la-informacion-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Servicio al Ciudadano', 'politica-de-servicio-al-ciudadano', NULL, NULL, 'documento', 'Servicio y participación ciudadana', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-03-01 12:00:00', 90, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-servicio-al-ciudadano');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-servicio-al-ciudadano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201620%20Politicas%20MIPG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-servicio-al-ciudadano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Fortalecimiento Organizacional y Simplificación de Procesos', 'politica-de-fortalecimiento-organizacional-y-simplificacion-de-procesos', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-05-16 12:00:00', 100, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-fortalecimiento-organizacional-y-simplificacion-de-procesos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POLITICA%20DE%20FORTALECIMIENTO%20ORGANIZACIONAL%20Y%20SIMPLIFICACION%20DE%20PROCESOS.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-fortalecimiento-organizacional-y-simplificacion-de-procesos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/FORMATO%20POLITICAS-Politica%20de%20Fortalecimiento%20organizacional%20y%20Simplificaci%C3%B3n%20de%20Procesos%20-Claudia.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-fortalecimiento-organizacional-y-simplificacion-de-procesos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201107%20adopci%C3%B3n%20pol%C3%ADticas%20Mipg%20de%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-fortalecimiento-organizacional-y-simplificacion-de-procesos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Comunicaciones', 'politica-de-comunicaciones', NULL, NULL, 'documento', 'Información, tecnología y comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 110, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-comunicaciones');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20COMUNICACIONES%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-comunicaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-comunicaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-COMUNICACIONES-.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-comunicaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG-1.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-comunicaciones' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión del Conocimiento y la Innovación', 'politica-de-gestion-del-conocimiento-y-la-innovacion', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-01-30 12:00:00', 120, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-del-conocimiento-y-la-innovacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DEL%20CONOCIMIENTO%20Y%20LA%20INNOVACION.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-conocimiento-y-la-innovacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%200099%20DE%202026.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-conocimiento-y-la-innovacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Politica-de-Gestion-del-Conocimiento-y-la-Innvacion-ESE.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-conocimiento-y-la-innovacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-politicas-2021-MIPG.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-conocimiento-y-la-innovacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Prevención del Daño Antijurídico', 'politica-de-prevencion-del-dano-antijuridico', NULL, NULL, 'documento', 'Control y riesgo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 130, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-prevencion-del-dano-antijuridico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PREVENCION-DEL-DANO-ANTIJURIDICO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-prevencion-del-dano-antijuridico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20ANTIJURIDICO%200520%20DE%202020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-prevencion-del-dano-antijuridico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Emergencias', 'politica-de-emergencias', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 140, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-emergencias');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-EMERGENCIAS-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-emergencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-emergencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gobierno Digital', 'politica-de-gobierno-digital', NULL, NULL, 'documento', 'Información, tecnología y comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 150, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gobierno-digital');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-GOBIERNO-DIGITAL-PLANEACION-2020-1.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Seguridad de la Información', 'politica-de-seguridad-de-la-informacion', NULL, NULL, 'documento', 'Información, tecnología y comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 160, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-seguridad-de-la-informacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SEGURIDAD-DE-LA-INFORMACION-DEF.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-seguridad-de-la-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-seguridad-de-la-informacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Evaluación del Desempeño Laboral', 'politica-de-evaluacion-del-desempeno-laboral', NULL, NULL, 'documento', 'Talento humano', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 170, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-evaluacion-del-desempeno-laboral');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-EDL-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-evaluacion-del-desempeno-laboral' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-0836-politicas%20(2).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-evaluacion-del-desempeno-laboral' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Control Interno de Gestión', 'politica-de-control-interno-de-gestion', NULL, NULL, 'documento', 'Control y riesgo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 180, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-control-interno-de-gestion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-CONTROL-INTERNO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-control-interno-de-gestion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion-1463-POLITICA-CONTROL-INTERNO-2020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-control-interno-de-gestion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Humanización de la Atención en Salud', 'politica-de-humanizacion-de-la-atencion-en-salud', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-11-27 12:00:00', 190, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-humanizacion-de-la-atencion-en-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20HUMANIZACI%C3%93N%20DE%20LA%20ATENCI%C3%93N%20EN%20SALUD%20V2.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-humanizacion-de-la-atencion-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201230%20POLITICA%20DE%20HUMANIZACION%20.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-humanizacion-de-la-atencion-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión del Riesgo', 'politica-de-gestion-del-riesgo', NULL, NULL, 'documento', 'Control y riesgo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-03-01 12:00:00', 200, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-del-riesgo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01%20POL%C3%8DTICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201620%20Politicas%20MIPG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTI%C3%93N%20DEL%20RIESGO%20HSJG%201%20(3).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200303%202015%20admcion%20riesgo%20(1).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200943%202016%20admcion%20del%20riesgo%20(1).pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Red%200890%202017%20admci%C3%B3n%20del%20riesgo.pdf'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%20N%C2%BA%201611%20de%202018%20Pol%C3%ADtica%20de%20Gesti%C3%B3n%20del%20Riesgo.pdf'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-riesgo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión del Talento Humano', 'politica-de-gestion-del-talento-humano', NULL, NULL, 'documento', 'Talento humano', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 210, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-del-talento-humano');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20ESTRATEGICA%20DE%20TALENTO%20HUMANO%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-TALENTO-HUMANO.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-del-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión Documental', 'politica-de-gestion-documental', NULL, NULL, 'documento', 'Información, tecnología y comunicaciones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-02-12 12:00:00', 220, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-documental');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20DOCUMENTAL%20-%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES_2024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%200647%20ADOPCI%C3%93N%20DE%20POLITICA%20GESTIO%C3%93N%20DOCUMENTAL.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-GESTION-DOCUMENTAL-2019.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-1388-de-2019.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Transparencia, Acceso a la Información Pública y Lucha contra la Corrupción', 'politica-de-transparencia-acceso-a-la-informacion-publica-y-lucha-contra-la-corrupcion', NULL, NULL, 'documento', 'Servicio y participación ciudadana', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 230, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-transparencia-acceso-a-la-informacion-publica-y-lucha-contra-la-corrupcion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-transparencia-acceso-a-la-informacion-publica-y-lucha-contra-la-corrupcion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(1).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-transparencia-acceso-a-la-informacion-publica-y-lucha-contra-la-corrupcion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Gestión y Desempeño', 'politica-de-gestion-y-desempeno', NULL, NULL, 'documento', 'Planeación y gestión', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 240, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-gestion-y-desempeno');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20GESTION%20Y%20DESEMPE%C3%91O%20ajustada.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-y-desempeno' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(2).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-gestion-y-desempeno' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Participación Ciudadana', 'politica-de-participacion-ciudadana', NULL, NULL, 'documento', 'Servicio y participación ciudadana', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 250, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-participacion-ciudadana');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-participacion-ciudadana' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(2).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-participacion-ciudadana' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Integridad', 'politica-de-integridad', NULL, NULL, 'documento', 'Control y riesgo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 260, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-integridad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-integridad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201639%20DE%202024%20POLITICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-integridad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-integridad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion-politicas-2020%20(2).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-integridad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política del Sistema de Gestión de la Seguridad y Salud en el Trabajo', 'politica-del-sistema-de-gestion-de-la-seguridad-y-salud-en-el-trabajo', NULL, NULL, 'documento', 'Talento humano', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 270, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-del-sistema-de-gestion-de-la-seguridad-y-salud-en-el-trabajo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo%20polit%20SST.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-del-sistema-de-gestion-de-la-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res%200467%20de%202017%20SST.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-del-sistema-de-gestion-de-la-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política y Objetivos de Calidad', 'politica-y-objetivos-de-calidad', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 280, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-y-objetivos-de-calidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SIGC-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-y-objetivos-de-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.%20Res%200663%20de%202016%20Pol%C3%ADtca%20de%20calidad.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-y-objetivos-de-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20N%C2%B0%200318%20DE%202013_1%20(1).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-y-objetivos-de-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Políticas de Austeridad, Racionalización de Costos, Gastos y Eficiencia Administrativa', 'politicas-de-austeridad-racionalizacion-de-costos-gastos-y-eficiencia-administrativa', NULL, NULL, 'documento', 'Financieras y contratación', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-06-14 12:00:00', 290, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politicas-de-austeridad-racionalizacion-de-costos-gastos-y-eficiencia-administrativa');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/POL%C3%8DTICA%20DE%20AUSTERIDAD,%20RACIONALIZACION%20DE%20COSTOS%20Y%20GASTOS%20Y%20EFICIENCIA%20ADMINISTRATIVA.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-austeridad-racionalizacion-de-costos-gastos-y-eficiencia-administrativa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%20No.%201204%20APROBACI%C3%93N%20POLITICA%20DE%20AUSTERIDAD%20DEL%20GASTO%202021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-austeridad-racionalizacion-de-costos-gastos-y-eficiencia-administrativa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/4.%20Res%200448%202017%20austeridad%20y%20gasto%20p%D0%B3blico%20(1).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politicas-de-austeridad-racionalizacion-de-costos-gastos-y-eficiencia-administrativa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Manual de Políticas Contables', 'manual-de-politicas-contables', NULL, NULL, 'documento', 'Financieras y contratación', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 300, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'manual-de-politicas-contables');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20POLITICAS%20CONTABLES%20DEFINITIVO%202020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'manual-de-politicas-contables' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política y Objetivos de Seguridad del Paciente', 'politica-y-objetivos-de-seguridad-del-paciente', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-11-27 12:00:00', 310, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-y-objetivos-de-seguridad-del-paciente');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20V3.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-y-objetivos-de-seguridad-del-paciente' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201209%20Politica%20de%20seguridad%20del%20paciente.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-y-objetivos-de-seguridad-del-paciente' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Prevención de Consumo de Alcohol, Tabaco y Sustancias Psicoactivas', 'politica-de-prevencion-de-consumo-de-alcohol-tabaco-y-sustancias-psicoactivas', NULL, NULL, 'documento', 'Talento humano', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 320, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-prevencion-de-consumo-de-alcohol-tabaco-y-sustancias-psicoactivas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/7.%20Res%20876%20de%202018%20Alcohol,%20tabaco,%20sust%20psicoat.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-de-prevencion-de-consumo-de-alcohol-tabaco-y-sustancias-psicoactivas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política para la Estrategia de Atención Integrada a las Enfermedades Prevalentes de la Infancia (AIEPI)', 'politica-para-la-estrategia-de-atencion-integrada-a-las-enfermedades-prevalentes-de-la-infancia-aiepi', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 330, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-para-la-estrategia-de-atencion-integrada-a-las-enfermedades-prevalentes-de-la-infancia-aiepi');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/8.%20Res%200486%20de%202013%20AIEPI.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-para-la-estrategia-de-atencion-integrada-a-las-enfermedades-prevalentes-de-la-infancia-aiepi' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política Institucional de la Iniciativa Instituciones Amigas de la Mujer y la Infancia Integral (IIAMI)', 'politica-institucional-de-la-iniciativa-instituciones-amigas-de-la-mujer-y-la-infancia-integral-iiami', NULL, NULL, 'documento', 'Atención en salud', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 340, 'esehospitalguaviare.gov.co (Normatividad)'
  FROM cms_paginas p WHERE p.slug = 'politicas-lineamientos-y-manuales'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-institucional-de-la-iniciativa-instituciones-amigas-de-la-mujer-y-la-infancia-integral-iiami');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/9.%20Resolucion%20comite%20IAMI%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'politicas-lineamientos-y-manuales'
 WHERE e.slug = 'politica-institucional-de-la-iniciativa-instituciones-amigas-de-la-mujer-y-la-infancia-integral-iiami' AND e.migrado_de = 'esehospitalguaviare.gov.co (Normatividad)';
