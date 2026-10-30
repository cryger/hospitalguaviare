-- =====================================================================
-- 036 · Estructura orgánica y talento humano del portal anterior (Res. 1519)
--  - Nueva plantilla de página "procesos": mapa de procesos y tarjetas por proceso
--    (estratégicos, misionales, apoyo) con su objetivo y documentos
--  - 1.1 Funciones y deberes
--  - 1.3 Mapas y cartas descriptivas de los procesos (sistema de gestión de calidad)
--  - 1.5 Directorio de servidores (archivo del portal anterior)
--  - 1.6 Directorio de entidades y 1.7 Directorio de agremiaciones (plantilla "directorio")
-- 69 entradas y 133 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes','plataforma','directorio','preguntas','glosario','procesos') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'procesos' WHERE slug = 'mapas-y-cartas-descriptivas-de-los-procesos' AND plantilla IN ('contenido', 'documentos');
UPDATE cms_paginas SET plantilla = 'directorio' WHERE slug IN ('directorio-de-entidades', 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes') AND plantilla = 'contenido';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MAPA DE PROCESOS 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MAPA%20DE%20PROCESOS%202024.pdf', 'documento', 'application/pdf', 'Mapa de procesos 2024', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MAPA%20DE%20PROCESOS%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 1117.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201117.pdf', 'documento', 'application/pdf', 'Resolución 1117 de 2024 – Adopción del mapa de procesos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201117.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DEL PROCESO.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Planeación estratégica – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'procedimientos de planeacion.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/procedimientos%20de%20planeacion.xls', 'documento', 'application/vnd.ms-excel', 'Planeación estratégica – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/procedimientos%20de%20planeacion.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 Formato Planeación Anual de Necesidades.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20Formato%20Planeaci%C3%B3n%20Anual%20de%20Necesidades.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Planeación estratégica – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20Formato%20Planeaci%C3%B3n%20Anual%20de%20Necesidades.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DE PROCESO ESTADISTICA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20ESTADISTICA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Estadística – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20ESTADISTICA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE ESTADISTICA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ESTADISTICA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Estadística – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ESTADISTICA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MANUAL DE MANEJO DE HISTORIA CLINICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA.pdf', 'documento', 'application/pdf', 'Estadística – Manual de manejo de historia clínica', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'E-ET-FO-01 FORMATO DE SOLICITUD DE COPIA DE HISTORIA CLINICA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Estadística – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DEL PROCESO gbd.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO%20gbd.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Gobierno digital – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO%20gbd.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE GOBIERNO EN LINEA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GOBIERNO%20EN%20LINEA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Gobierno digital – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GOBIERNO%20EN%20LINEA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FORMATO PARA LA INCLUSIÓN DE INFORMACION A LA PÁGINA WEB INSTITUCIONAL.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20PARA%20LA%20INCLUSI%C3%93N%20DE%20INFORMACION%20A%20LA%20P%C3%81GINA%20WEB%20INSTITUCIONAL.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Gobierno digital – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20PARA%20LA%20INCLUSI%C3%93N%20DE%20INFORMACION%20A%20LA%20P%C3%81GINA%20WEB%20INSTITUCIONAL.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE CALIDAD.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CALIDAD.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Calidad – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CALIDAD.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 FICHA TECNICA DE INDICADORES.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FICHA%20TECNICA%20DE%20INDICADORES.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Calidad – Ficha técnica de indicadores', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FICHA%20TECNICA%20DE%20INDICADORES.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '001FORMATO DE PAGO PARCIAL A CONTRATISTAS.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/001FORMATO%20DE%20PAGO%20PARCIAL%20A%20CONTRATISTAS.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Calidad – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/001FORMATO%20DE%20PAGO%20PARCIAL%20A%20CONTRATISTAS.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOAMBIENTALHSJG 2018.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOAMBIENTALHSJG%202018.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Gestión ambiental – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOAMBIENTALHSJG%202018.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOSHSJG.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSHSJG.xls', 'documento', 'application/vnd.ms-excel', 'Gestión ambiental – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSHSJG.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '04-PROGRAMA-DE-RECICLAJE-7-3.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/04-PROGRAMA-DE-RECICLAJE-7-3.pdf', 'documento', 'application/pdf', 'Gestión ambiental – Programa de reciclaje', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/04-PROGRAMA-DE-RECICLAJE-7-3.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '02-PROGRAMA-DE-USO-EFICIENTE-Y-AHORRO-DE-ENERGIA-7.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02-PROGRAMA-DE-USO-EFICIENTE-Y-AHORRO-DE-ENERGIA-7.pdf', 'documento', 'application/pdf', 'Gestión ambiental – Programa de uso eficiente y ahorro de energía', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02-PROGRAMA-DE-USO-EFICIENTE-Y-AHORRO-DE-ENERGIA-7.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '03-PROGRAMA-PARA-EL-USO-EFICIENTE-Y-AHORRO-DE-AGUA-8.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/03-PROGRAMA-PARA-EL-USO-EFICIENTE-Y-AHORRO-DE-AGUA-8.pdf', 'documento', 'application/pdf', 'Gestión ambiental – Programa para el uso eficiente y ahorro de agua', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/03-PROGRAMA-PARA-EL-USO-EFICIENTE-Y-AHORRO-DE-AGUA-8.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTO PARA LA GESTION DEL CAMBIO DE SG-SST.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTO%20PARA%20LA%20GESTION%20DEL%20CAMBIO%20DE%20SG-SST.xls', 'documento', 'application/vnd.ms-excel', 'Seguridad y salud en el trabajo – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTO%20PARA%20LA%20GESTION%20DEL%20CAMBIO%20DE%20SG-SST.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 FORMATO DE REPORTE DE INCIDENTE Y ACCIDENTE DE TRABAJO.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20REPORTE%20DE%20INCIDENTE%20Y%20ACCIDENTE%20DE%20TRABAJO.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguridad y salud en el trabajo – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20REPORTE%20DE%20INCIDENTE%20Y%20ACCIDENTE%20DE%20TRABAJO.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '04 PROGRAMA DE ELEMENTOS DE PROTECCION PERSONAL.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/04%20PROGRAMA%20DE%20ELEMENTOS%20DE%20PROTECCION%20PERSONAL.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Seguridad y salud en el trabajo – Programa de elementos de protección personal', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/04%20PROGRAMA%20DE%20ELEMENTOS%20DE%20PROTECCION%20PERSONAL.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 PROTOCOLO DE ACCIDENTE DE TRABAJO POR EXPOSICION AL RIESGO BIOLOGICO.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20DE%20ACCIDENTE%20DE%20TRABAJO%20POR%20EXPOSICION%20AL%20RIESGO%20BIOLOGICO.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Seguridad y salud en el trabajo – Protocolo de accidente de trabajo por riesgo biológico', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20DE%20ACCIDENTE%20DE%20TRABAJO%20POR%20EXPOSICION%20AL%20RIESGO%20BIOLOGICO.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/PROCEDIMIENTOS.rar', 'documento', 'application/vnd.rar', 'Talento humano – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/PROCEDIMIENTOS.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '02 FORMATO DE AUTORIZACION DE VERIFICACIÓN DE ANTECEDENTES.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/02%20FORMATO%20DE%20AUTORIZACION%20DE%20VERIFICACI%C3%93N%20DE%20ANTECEDENTES.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Talento humano – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/02%20FORMATO%20DE%20AUTORIZACION%20DE%20VERIFICACI%C3%93N%20DE%20ANTECEDENTES.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOSURGENCIAS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOSURGENCIAS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Urgencias – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOSURGENCIAS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS URGENCIAS.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20URGENCIAS.xls', 'documento', 'application/vnd.ms-excel', 'Urgencias – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20URGENCIAS.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 FORMATO DE VERIFICACION DE MEDICAMENTOS Y DISPOSITIVOS MEDICOS A KITS DE RESPUESTA RAPIDA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20VERIFICACION%20DE%20MEDICAMENTOS%20Y%20DISPOSITIVOS%20MEDICOS%20A%20KITS%20DE%20RESPUESTA%20RAPIDA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Urgencias – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20VERIFICACION%20DE%20MEDICAMENTOS%20Y%20DISPOSITIVOS%20MEDICOS%20A%20KITS%20DE%20RESPUESTA%20RAPIDA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'protocolo urgencia.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20urgencia.rar', 'documento', 'application/vnd.rar', 'Urgencias – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20urgencia.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO UMI.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20UMI.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Unidad materno infantil – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20UMI.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS UMI.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20UMI.xls', 'documento', 'application/vnd.ms-excel', 'Unidad materno infantil – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20UMI.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'UMI.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/UMI.rar', 'documento', 'application/vnd.rar', 'Unidad materno infantil – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/UMI.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'protocolos UMI.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20UMI.rar', 'documento', 'application/vnd.rar', 'Unidad materno infantil – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20UMI.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Listas de chequo.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Listas%20de%20chequo.rar', 'documento', 'application/vnd.rar', 'Unidad materno infantil – Listas de chequeo', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Listas%20de%20chequo.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO HOSPITALIZADOS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20HOSPITALIZADOS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Hospitalización – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20HOSPITALIZADOS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS HOSPITALIZACIÓN.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20HOSPITALIZACI%C3%93N.xls', 'documento', 'application/vnd.ms-excel', 'Hospitalización – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20HOSPITALIZACI%C3%93N.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO CIRUGIA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CIRUGIA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Cirugía – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CIRUGIA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS CIRUGIA.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20CIRUGIA.xls', 'documento', 'application/vnd.ms-excel', 'Cirugía – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20CIRUGIA.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formatos ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'protocolos ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'guias ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/guias%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Guías', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/guias%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'listas de chequeo ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20de%20chequeo%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Listas de chequeo', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20de%20chequeo%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 INSTRUCTIVO DE MANEJO DE MUESTRAS PATOLOGICAS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20INSTRUCTIVO%20DE%20MANEJO%20DE%20MUESTRAS%20PATOLOGICAS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Cirugía – Instructivo de manejo de muestras patológicas', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20INSTRUCTIVO%20DE%20MANEJO%20DE%20MUESTRAS%20PATOLOGICAS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'recomendaciones ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/recomendaciones%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Recomendaciones', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/recomendaciones%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'concentimientos informados ciru.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/concentimientos%20informados%20ciru.rar', 'documento', 'application/vnd.rar', 'Cirugía – Consentimientos informados', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/concentimientos%20informados%20ciru.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOESTERILIZACIONHSJGOK2013.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOESTERILIZACIONHSJGOK2013.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Esterilización – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOESTERILIZACIONHSJGOK2013.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MAPAPROCESOSYPROCEDIMIENTOS ESTERILIZACIÓNJULIO2013.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPAPROCESOSYPROCEDIMIENTOS%20ESTERILIZACI%C3%93NJULIO2013.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Esterilización – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPAPROCESOSYPROCEDIMIENTOS%20ESTERILIZACI%C3%93NJULIO2013.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'formatos esterilizacion.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20esterilizacion.rar', 'documento', 'application/vnd.rar', 'Esterilización – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20esterilizacion.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Protocolos ezterilizacion.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Protocolos%20ezterilizacion.rar', 'documento', 'application/vnd.rar', 'Esterilización – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Protocolos%20ezterilizacion.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 MANUAL DE BUENAS PRACTICAS DE ESTERILIZACION.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20BUENAS%20PRACTICAS%20DE%20ESTERILIZACION.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Esterilización – Manual de buenas prácticas de esterilización', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20BUENAS%20PRACTICAS%20DE%20ESTERILIZACION.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO CONSULTA EXTERNA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONSULTA%20EXTERNA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Consulta externa – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONSULTA%20EXTERNA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE CONSULTA EXTERNA.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CONSULTA%20EXTERNA.xls', 'documento', 'application/vnd.ms-excel', 'Consulta externa – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CONSULTA%20EXTERNA.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 FORMATO DE PRECONSULTA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20PRECONSULTA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Consulta externa – Formato de preconsulta', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20PRECONSULTA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'protocolos consulta externa.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20consulta%20externa.rar', 'documento', 'application/vnd.rar', 'Consulta externa – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20consulta%20externa.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 MANUAL DE PROCEDIMIENTOS DE ECOGRAFIA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20PROCEDIMIENTOS%20DE%20ECOGRAFIA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Consulta externa – Manual de procedimientos de ecografía', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20PROCEDIMIENTOS%20DE%20ECOGRAFIA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INSTRUCTIVO DE CONSTRATACION DE ESPECIALISTAS.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INSTRUCTIVO%20DE%20CONSTRATACION%20DE%20ESPECIALISTAS.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Consulta externa – Instructivo de contratación de especialistas', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INSTRUCTIVO%20DE%20CONSTRATACION%20DE%20ESPECIALISTAS.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '02 RECOMENDACIONES PARA TOMA DE CISTOSCOPIA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/02%20RECOMENDACIONES%20PARA%20TOMA%20DE%20CISTOSCOPIA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Consulta externa – Recomendaciones para toma de cistoscopia', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/02%20RECOMENDACIONES%20PARA%20TOMA%20DE%20CISTOSCOPIA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 SUBPROGRMA DE SEGURIDAD DEL PACIENTE DE CONSULTA EXTERNA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20SUBPROGRMA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20DE%20CONSULTA%20EXTERNA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Consulta externa – Subprograma de seguridad del paciente', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20SUBPROGRMA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20DE%20CONSULTA%20EXTERNA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOLABORATORIOCLÍNICO10-2018.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOLABORATORIOCL%C3%8DNICO10-2018.doc', 'documento', 'application/msword', 'Laboratorio clínico – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOLABORATORIOCL%C3%8DNICO10-2018.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOSLABORATORIOCLINICO - 2018.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSLABORATORIOCLINICO%20-%202018.xls', 'documento', 'application/vnd.ms-excel', 'Laboratorio clínico – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSLABORATORIOCLINICO%20-%202018.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de laboratorio clinico.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20laboratorio%20clinico.pdf', 'documento', 'application/pdf', 'Laboratorio clínico – Caracterización del proceso (pdf)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20laboratorio%20clinico.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos laboratorio clinico.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20laboratorio%20clinico.pdf', 'documento', 'application/pdf', 'Laboratorio clínico – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20laboratorio%20clinico.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO SERVICIO TRANSFUSIONAL2018.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20SERVICIO%20TRANSFUSIONAL2018.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Servicio transfusional – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20SERVICIO%20TRANSFUSIONAL2018.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SERVICIO TRANSFUSIONALHSJG - 2018.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SERVICIO%20TRANSFUSIONALHSJG%20-%202018.xls', 'documento', 'application/vnd.ms-excel', 'Servicio transfusional – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SERVICIO%20TRANSFUSIONALHSJG%20-%202018.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de servicio transfusional.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20servicio%20transfusional.pdf', 'documento', 'application/pdf', 'Servicio transfusional – Caracterización del proceso (pdf)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20servicio%20transfusional.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos servicio transfusional.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20servicio%20transfusional.pdf', 'documento', 'application/pdf', 'Servicio transfusional – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20servicio%20transfusional.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MACROPROCESO TERAPIA FÍSICA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MACROPROCESO%20TERAPIA%20F%C3%8DSICA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Terapia física – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MACROPROCESO%20TERAPIA%20F%C3%8DSICA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS TERAPIA FISICA ori.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TERAPIA%20FISICA%20ori.xls', 'documento', 'application/vnd.ms-excel', 'Terapia física – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TERAPIA%20FISICA%20ori.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'protocolo terapia.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20terapia.rar', 'documento', 'application/vnd.rar', 'Terapia física – Protocolos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20terapia.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de atencion del paciente en terapia fisica.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20fisica.pdf', 'documento', 'application/pdf', 'Terapia física – Caracterización del proceso (pdf)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20fisica.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos terapia fisica.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20fisica.pdf', 'documento', 'application/pdf', 'Terapia física – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20fisica.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO CONTABILIDAD caracterizacion ACTUAL 2018.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONTABILIDAD%20caracterizacion%20ACTUAL%202018.doc', 'documento', 'application/msword', 'Contabilidad – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONTABILIDAD%20caracterizacion%20ACTUAL%202018.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOSCONTABILIDADHSJG ACTUALIZADO 31-10.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSCONTABILIDADHSJG%20ACTUALIZADO%2031-10.xls', 'documento', 'application/vnd.ms-excel', 'Contabilidad – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSCONTABILIDADHSJG%20ACTUALIZADO%2031-10.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Formatos Conta.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20Conta.rar', 'documento', 'application/vnd.rar', 'Contabilidad – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20Conta.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO TESORERIA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20TESORERIA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Tesorería – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20TESORERIA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS TESORERIA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TESORERIA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Tesorería – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TESORERIA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOPRESUPUESTOHSJGOK (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOPRESUPUESTOHSJGOK%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Presupuesto – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOPRESUPUESTOHSJGOK%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOSPRESUPUESTOHSJGOK (1).xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSPRESUPUESTOHSJGOK%20(1).xls', 'documento', 'application/vnd.ms-excel', 'Presupuesto – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSPRESUPUESTOHSJGOK%20(1).xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO DE CARTERA.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20CARTERA.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Cartera – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20CARTERA.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MAPA DE PROCESOS DE CRATERA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPA%20DE%20PROCESOS%20DE%20CRATERA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Cartera – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPA%20DE%20PROCESOS%20DE%20CRATERA.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DE PROCESO actual.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20actual.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Costos – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20actual.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Procedimientos del área de costos Carlos Javier Arias.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procedimientos%20del%20%C3%A1rea%20de%20costos%20Carlos%20Javier%20Arias.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Costos – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procedimientos%20del%20%C3%A1rea%20de%20costos%20Carlos%20Javier%20Arias.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DE ACTIVOS FIJOS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ACTIVOS%20FIJOS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Activos fijos – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ACTIVOS%20FIJOS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE ACTIVOS FIJOS.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ACTIVOS%20FIJOS.xls', 'documento', 'application/vnd.ms-excel', 'Activos fijos – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ACTIVOS%20FIJOS.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 MANUAL DE MANEJO, CONTROL, CUSTODÍA Y BAJA DE LA PROPIEDAD, PLANTA Y EQUIPO.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.doc', 'documento', 'application/msword', 'Activos fijos – Manual de manejo, control, custodia y baja de la propiedad, planta y equipo', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01 FORMATO UNICO PARA EL MOVIMIENTO DE ACTIVOS.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20UNICO%20PARA%20EL%20MOVIMIENTO%20DE%20ACTIVOS.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Activos fijos – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20UNICO%20PARA%20EL%20MOVIMIENTO%20DE%20ACTIVOS.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARACTERIZACION DE ALMACEN Y SUMINISTROS.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ALMACEN%20Y%20SUMINISTROS.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Almacén y suministros – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ALMACEN%20Y%20SUMINISTROS.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE ALMACEN Y SUMINISTROS.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ALMACEN%20Y%20SUMINISTROS.xls', 'documento', 'application/vnd.ms-excel', 'Almacén y suministros – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ALMACEN%20Y%20SUMINISTROS.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'A-SA-FO-01 FORMATO DE SOLICITUD DE PEDIDO.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/A-SA-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20PEDIDO.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Almacén y suministros – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/A-SA-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20PEDIDO.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESO DE GESTION DOCUMENTAL.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20GESTION%20DOCUMENTAL.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Gestión documental – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20GESTION%20DOCUMENTAL.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE GESTION DOCUMENTAL.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GESTION%20DOCUMENTAL.xls', 'documento', 'application/vnd.ms-excel', 'Gestión documental – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GESTION%20DOCUMENTAL.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE JURIDICA.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20JURIDICA.xls', 'documento', 'application/vnd.ms-excel', 'Jurídica y contratación – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20JURIDICA.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Formatos juri.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20juri.rar', 'documento', 'application/vnd.rar', 'Jurídica y contratación – Formatos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20juri.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'listas juridi.rar', 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20juridi.rar', 'documento', 'application/vnd.rar', 'Jurídica y contratación – Listas de chequeo', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20juridi.rar');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCESOS DE CID.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOS%20DE%20CID.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Control interno disciplinario – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOS%20DE%20CID.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROCEDIMIENTOS DE CID.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CID.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Control interno disciplinario – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CID.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de informacion y atencion al usuario.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf', 'documento', 'application/pdf', 'Sistema de información y atención al usuario – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos sistema de informacion y atencion al usuario.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20sistema%20de%20informacion%20y%20atencion%20al%20usuario.pdf', 'documento', 'application/pdf', 'Sistema de información y atención al usuario – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20sistema%20de%20informacion%20y%20atencion%20al%20usuario.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de epidemiologia.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia.pdf', 'documento', 'application/pdf', 'Gestión de información epidemiológica – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de epidemiologia (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(1).pdf', 'documento', 'application/pdf', 'Gestión de información epidemiológica – Procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de epidemiologia (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(2).pdf', 'documento', 'application/pdf', 'Gestión de información epidemiológica – Caracterización del proceso (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de mantenimiento hospitalario.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario.pdf', 'documento', 'application/pdf', 'Gestión de mantenimiento hospitalario – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de mantenimiento hospitalario (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario%20(1).pdf', 'documento', 'application/pdf', 'Gestión de mantenimiento hospitalario – Caracterización del proceso (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de suministros.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros.pdf', 'documento', 'application/pdf', 'Gestión de suministros – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos suministros.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros.pdf', 'documento', 'application/pdf', 'Gestión de suministros – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de suministros (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros%20(1).pdf', 'documento', 'application/pdf', 'Gestión de suministros – Caracterización del proceso (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos suministros (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros%20(1).pdf', 'documento', 'application/pdf', 'Gestión de suministros – Mapa de procedimientos (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de recursos fisicos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20recursos%20fisicos.pdf', 'documento', 'application/pdf', 'Gestión de recursos físicos – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20recursos%20fisicos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos recursos fisicos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos.pdf', 'documento', 'application/pdf', 'Gestión de recursos físicos – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos recursos fisicos (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos%20(1).pdf', 'documento', 'application/pdf', 'Gestión de recursos físicos – Mapa de procedimientos (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de auditoria, cartera y facturacion (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20auditoria,%20cartera%20y%20facturacion%20(1).pdf', 'documento', 'application/pdf', 'Gestión de auditoría, cartera y facturación – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20auditoria,%20cartera%20y%20facturacion%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos auditoria, cartera y facturacion (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(1).pdf', 'documento', 'application/pdf', 'Gestión de auditoría, cartera y facturación – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos auditoria, cartera y facturacion (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(2).pdf', 'documento', 'application/pdf', 'Gestión de auditoría, cartera y facturación – Mapa de procedimientos (versión 2)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de trabajo social.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20trabajo%20social.pdf', 'documento', 'application/pdf', 'Gestión de trabajo social – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20trabajo%20social.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos trabajo social.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20trabajo%20social.pdf', 'documento', 'application/pdf', 'Gestión de trabajo social – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20trabajo%20social.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de imagenes disagnosticas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20imagenes%20disagnosticas.pdf', 'documento', 'application/pdf', 'Gestión de imágenes diagnósticas – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20imagenes%20disagnosticas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos imagenes diagnosticas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20imagenes%20diagnosticas.pdf', 'documento', 'application/pdf', 'Gestión de imágenes diagnósticas – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20imagenes%20diagnosticas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de medicamentos y dispositivos medicos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20medicamentos%20y%20dispositivos%20medicos.pdf', 'documento', 'application/pdf', 'Gestión de medicamentos y dispositivos médicos – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20medicamentos%20y%20dispositivos%20medicos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos de medicamentos y dispositivos medicos.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20de%20medicamentos%20y%20dispositivos%20medicos.pdf', 'documento', 'application/pdf', 'Gestión de medicamentos y dispositivos médicos – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20de%20medicamentos%20y%20dispositivos%20medicos.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de muestras patologicas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20muestras%20patologicas.pdf', 'documento', 'application/pdf', 'Gestión de muestras patológicas – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20muestras%20patologicas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos muestras patologicas.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20muestras%20patologicas.pdf', 'documento', 'application/pdf', 'Gestión de muestras patológicas – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20muestras%20patologicas.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de referencia y contrarreferencia de pacientes.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20referencia%20y%20contrarreferencia%20de%20pacientes.pdf', 'documento', 'application/pdf', 'Gestión de referencia y contrarreferencia de pacientes – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20referencia%20y%20contrarreferencia%20de%20pacientes.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de atencion del paciente en terapia respiratoria.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20respiratoria.pdf', 'documento', 'application/pdf', 'Atención del paciente en terapia respiratoria – Caracterización del proceso', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20respiratoria.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'mapa de procesos terapia respiratoria.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20respiratoria.pdf', 'documento', 'application/pdf', 'Atención del paciente en terapia respiratoria – Mapa de procedimientos', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20respiratoria.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-APRENDIZAJE-ORGANIZACIONAL-PAMEC-2020-ok.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-APRENDIZAJE-ORGANIZACIONAL-PAMEC-2020-ok.pdf', 'documento', 'application/pdf', 'Informe de aprendizaje organizacional PAMEC 2020', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-APRENDIZAJE-ORGANIZACIONAL-PAMEC-2020-ok.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 335 de 2019 PAMEC.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC.pdf', 'documento', 'application/pdf', 'Resolución 0335 de 2019 – Metodología para la autoevaluación de los estándares de acreditación', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Atributos de la Calidad.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/Atributos%20de%20la%20Calidad.jpg', 'imagen', 'image/jpeg', 'Atributos de la calidad', 'Atributos de la calidad', 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/Atributos%20de%20la%20Calidad.jpg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'principios de la calidad.png', 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/principios%20de%20la%20calidad.png', 'imagen', 'image/png', 'Principios de la calidad', 'Principios de la calidad', 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/principios%20de%20la%20calidad.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'QUE ES AUDITORIA.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/QUE%20ES%20AUDITORIA.jpg', 'imagen', 'image/jpeg', 'Tips para el mejoramiento de la calidad: ¿qué es auditoría?', 'Tips para el mejoramiento de la calidad: ¿qué es auditoría?', 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/QUE%20ES%20AUDITORIA.jpg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DESDOBLAMIENTO DE LA CALIDAD.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/DESDOBLAMIENTO%20DE%20LA%20CALIDAD.jpg', 'imagen', 'image/jpeg', 'Desdoblamiento de la calidad', 'Desdoblamiento de la calidad', 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/DESDOBLAMIENTO%20DE%20LA%20CALIDAD.jpg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EFECTOS DE NO CONTAR CON PROCESOS ESTANDARIZADOS.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/EFECTOS%20DE%20NO%20CONTAR%20CON%20PROCESOS%20ESTANDARIZADOS.jpg', 'imagen', 'image/jpeg', 'Efectos de no contar con procesos estandarizados', 'Efectos de no contar con procesos estandarizados', 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/EFECTOS%20DE%20NO%20CONTAR%20CON%20PROCESOS%20ESTANDARIZADOS.jpg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Directorio servidores.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Directorio%20servidores.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Directorio de servidores públicos, empleados y contratistas (enero de 2023)', NULL, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Directorio%20servidores.xlsx');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Funciones', 'funciones', 'Funciones de la E.S.E. Hospital San José del Guaviare.', '<ul><li>Contribuir al desarrollo social del país mejorando la calidad de la vida y reduciendo la morbilidad, la mortalidad, la incapacidad, el dolor y la angustia evitables en la población usuaria, en la medida en que esto esté a su alcance.</li><li>Producir servicios de salud eficientes y efectivos, que cumplan con las normas de calidad establecidas, de acuerdo con la reglamentación que se expida para tal propósito.</li><li>Prestar los servicios de salud que la población requiera y que la Empresa, de acuerdo con su desarrollo y recursos disponibles, pueda ofrecer.</li><li>Ofrecer a las Empresas Promotoras de Salud y demás personas naturales o jurídicas que lo demanden servicios y paquetes de servicios a tarifas competitivas en el mercado.</li><li>Satisfacer los requerimientos del entorno, adecuando continuamente sus servicios y funcionamiento.</li><li>Garantizar los mecanismos de participación ciudadana y comunitaria establecidos por la ley y los reglamentos.</li><li>Prestar servicios de salud que satisfagan de manera óptima las necesidades y expectativas de la población en relación con la promoción, el fomento y la conservación de la salud y la prevención, tratamiento y rehabilitación de la enfermedad.</li><li>Satisfacer las necesidades esenciales y secundarias de salud de la población usuaria a través de acciones gremiales, organizativas, técnico-científicas y técnico-administrativas.</li></ul>', 'articulo', 'Funciones', 'govco:clipboard-list', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mision-vision-funciones-y-deberes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'funciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Deberes', 'deberes', 'Objeto y deberes de la E.S.E. Hospital San José del Guaviare.', '<ul><li>El objeto de la E.S.E. Hospital San José del Guaviare será la prestación de los servicios de salud, entendidos como un servicio público a cargo del Estado y como parte integrante del Sistema de Seguridad Social en Salud; en consecuencia, en desarrollo de este objeto, adelantará acciones de promoción, prevención, tratamiento y rehabilitación de la salud.</li></ul>', 'articulo', 'Deberes', 'govco:gavel', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mision-vision-funciones-y-deberes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'deberes');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Mapa de procesos 2024', 'mapa-de-procesos-2024', 'Mapa de procesos institucional adoptado mediante la Resolución 1117 de 2024: procesos estratégicos, misionales y de apoyo.', NULL, 'documento', 'Mapa de procesos', 'govco:sitemap', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-11 12:00:00', 10, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'mapa-de-procesos-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MAPA%20DE%20PROCESOS%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'mapa-de-procesos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201117.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'mapa-de-procesos-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planeación estratégica', 'proceso-planeacion-estrategica', 'Orientar el cumplimiento de la misión, visión y objetivos estratégicos de la ESE Hospital San José del Guaviare, por medio de la formulación de herramientas y estrategias para la coordinación, medición, seguimiento y mejora continua de las metas e indicadores formulados.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-planeacion-estrategica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-planeacion-estrategica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/procedimientos%20de%20planeacion.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-planeacion-estrategica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20Formato%20Planeaci%C3%B3n%20Anual%20de%20Necesidades.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-planeacion-estrategica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estadística', 'proceso-estadistica', 'Presentar información y su comportamiento con relación a la calidad del servicio, producción y operación de la entidad con base en la recolección de los datos generados por parte de herramientas informáticas y registros de la atención a los usuarios, teniendo presente la conservación y custodia de las historias clínicas generadas de forma física.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-estadistica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20ESTADISTICA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ESTADISTICA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-estadistica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gobierno digital', 'proceso-gobierno-digital', 'Promover el uso y aprovechamiento de las tecnologías de la información y las comunicaciones para consolidar una entidad y usuarios competitivos, proactivos e innovadores, que generen valor público en un entorno de confianza digital.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gobierno-digital');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DEL%20PROCESO%20gbd.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GOBIERNO%20EN%20LINEA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FORMATO%20PARA%20LA%20INCLUSI%C3%93N%20DE%20INFORMACION%20A%20LA%20P%C3%81GINA%20WEB%20INSTITUCIONAL.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gobierno-digital' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Calidad', 'proceso-calidad', 'Implementar, revisar y mantener el Sistema Integrado de Gestión de Calidad (SIGC), en función de la misión institucional, el mejoramiento continuo y la satisfacción del usuario.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-calidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CALIDAD.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FICHA%20TECNICA%20DE%20INDICADORES.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/001FORMATO%20DE%20PAGO%20PARCIAL%20A%20CONTRATISTAS.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión ambiental', 'proceso-gestion-ambiental', 'Utilizar eficientemente los recursos naturales, reduciendo los riesgos sobre la salud y el medio ambiente ocasionados en las diferentes actividades de la ESE Hospital San José del Guaviare, con el fin de lograr un adecuado manejo ambiental.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-ambiental');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOAMBIENTALHSJG%202018.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-ambiental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSHSJG.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-ambiental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/04-PROGRAMA-DE-RECICLAJE-7-3.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-ambiental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/02-PROGRAMA-DE-USO-EFICIENTE-Y-AHORRO-DE-ENERGIA-7.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-ambiental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/03-PROGRAMA-PARA-EL-USO-EFICIENTE-Y-AHORRO-DE-AGUA-8.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-ambiental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguridad y salud en el trabajo', 'proceso-seguridad-y-salud-en-el-trabajo', NULL, NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-seguridad-y-salud-en-el-trabajo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTO%20PARA%20LA%20GESTION%20DEL%20CAMBIO%20DE%20SG-SST.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20REPORTE%20DE%20INCIDENTE%20Y%20ACCIDENTE%20DE%20TRABAJO.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/04%20PROGRAMA%20DE%20ELEMENTOS%20DE%20PROTECCION%20PERSONAL.docx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20PROTOCOLO%20DE%20ACCIDENTE%20DE%20TRABAJO%20POR%20EXPOSICION%20AL%20RIESGO%20BIOLOGICO.docx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-seguridad-y-salud-en-el-trabajo' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Talento humano', 'proceso-talento-humano', 'Administrar el personal vinculado a la ESE Hospital San José del Guaviare, promoviendo y desarrollando estrategias encaminadas a la gestión y desarrollo de los funcionarios de conformidad con la ley laboral, contribuyendo a la satisfacción de sus necesidades, para el cumplimiento de la misión, visión, objetivos institucionales y el logro del bienestar personal.', NULL, 'documento', 'Procesos estratégicos', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 80, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-talento-humano');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/PROCEDIMIENTOS.rar'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/02%20FORMATO%20DE%20AUTORIZACION%20DE%20VERIFICACI%C3%93N%20DE%20ANTECEDENTES.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-talento-humano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Urgencias', 'proceso-urgencias', 'Realizar procedimientos y/o intervenciones a las personas que requieran una atención oportuna, con el ánimo de mejorar el estado de salud, teniendo en cuenta el nivel de atención y el grado de complejidad de la ESE Hospital San José del Guaviare, basados en la evidencia científica, la ética y la normatividad vigente.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 90, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-urgencias');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOSURGENCIAS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20URGENCIAS.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20VERIFICACION%20DE%20MEDICAMENTOS%20Y%20DISPOSITIVOS%20MEDICOS%20A%20KITS%20DE%20RESPUESTA%20RAPIDA.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20urgencia.rar'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-urgencias' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Unidad materno infantil', 'proceso-unidad-materno-infantil', 'Brindar atención en salud a las pacientes gestantes y recién nacidos (as) que ingresan a la unidad materno infantil de manera oportuna y con calidad en la atención.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 100, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-unidad-materno-infantil');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20UMI.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-unidad-materno-infantil' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20UMI.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-unidad-materno-infantil' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/UMI.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-unidad-materno-infantil' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20UMI.rar'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-unidad-materno-infantil' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Listas%20de%20chequo.rar'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-unidad-materno-infantil' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Hospitalización', 'proceso-hospitalizacion', 'Garantizar la calidad y seguridad del paciente, con una atención humanizada y confidencial, a fin de asegurar el restablecimiento de la salud a través de la definición de una conducta adecuada.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 110, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-hospitalizacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20HOSPITALIZADOS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-hospitalizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20HOSPITALIZACI%C3%93N.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-hospitalizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cirugía', 'proceso-cirugia', 'Realizar procedimientos e intervenciones a personas que presentan alguna patología quirúrgica programada o de urgencia que permitan mejorar el estado de salud, proporcionando calidad y humanización en la atención del usuario.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 120, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-cirugia');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CIRUGIA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20CIRUGIA.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20ciru.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20ciru.rar'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/guias%20ciru.rar'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20de%20chequeo%20ciru.rar'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20INSTRUCTIVO%20DE%20MANEJO%20DE%20MUESTRAS%20PATOLOGICAS.docx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/recomendaciones%20ciru.rar'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/concentimientos%20informados%20ciru.rar'), 8
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cirugia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Esterilización', 'proceso-esterilizacion', 'Garantizar la esterilidad de un producto utilizando métodos validados y controlados adecuadamente que contribuyan a prevenir el deterioro del material, ropa e instrumental y reducir la carga microbiana.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 130, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-esterilizacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOESTERILIZACIONHSJGOK2013.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-esterilizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPAPROCESOSYPROCEDIMIENTOS%20ESTERILIZACI%C3%93NJULIO2013.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-esterilizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/formatos%20esterilizacion.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-esterilizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Protocolos%20ezterilizacion.rar'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-esterilizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20BUENAS%20PRACTICAS%20DE%20ESTERILIZACION.docx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-esterilizacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta externa', 'proceso-consulta-externa', 'Brindar atención a los usuarios por medio de la consulta especializada para dar solución a las necesidades en salud.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 140, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-consulta-externa');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONSULTA%20EXTERNA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CONSULTA%20EXTERNA.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20DE%20PRECONSULTA.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolos%20consulta%20externa.rar'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20PROCEDIMIENTOS%20DE%20ECOGRAFIA.docx'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INSTRUCTIVO%20DE%20CONSTRATACION%20DE%20ESPECIALISTAS.xlsx'), 5
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/02%20RECOMENDACIONES%20PARA%20TOMA%20DE%20CISTOSCOPIA.xlsx'), 6
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20SUBPROGRMA%20DE%20SEGURIDAD%20DEL%20PACIENTE%20DE%20CONSULTA%20EXTERNA.docx'), 7
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-consulta-externa' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Laboratorio clínico', 'proceso-laboratorio-clinico', 'Establecer la prestación de servicio de laboratorio clínico en la atención a pacientes del departamento del Guaviare y sus alrededores, utilizando los recursos tecnológicos adecuados de acuerdo a la oferta del servicio con el fin de garantizar resultados oportunos y confiables.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 150, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-laboratorio-clinico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOLABORATORIOCL%C3%8DNICO10-2018.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSLABORATORIOCLINICO%20-%202018.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20laboratorio%20clinico.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20laboratorio%20clinico.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicio transfusional', 'proceso-servicio-transfusional', 'Garantizar la correcta realización de pruebas transfusionales y el adecuado almacenamiento y entrega de componentes sanguíneos con fines terapéuticos o preventivos, mediante la aplicación de técnicas estandarizadas y controles de calidad e igualmente asistir a los profesionales asistenciales de los diferentes servicios intrahospitalarios en el uso apropiado de los hemocomponentes.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 160, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-servicio-transfusional');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20SERVICIO%20TRANSFUSIONAL2018.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-servicio-transfusional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SERVICIO%20TRANSFUSIONALHSJG%20-%202018.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-servicio-transfusional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20servicio%20transfusional.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-servicio-transfusional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20servicio%20transfusional.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-servicio-transfusional' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Terapia física', 'proceso-terapia-fisica', 'Brindar atención integral a pacientes con alteración de la mecánica y funcionalidad corporal, para mejorar su condición física y favorecer su desempeño tanto laboral como cotidiano contribuyendo a una mejor calidad de vida.', NULL, 'documento', 'Procesos misionales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 170, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-terapia-fisica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/MACROPROCESO%20TERAPIA%20F%C3%8DSICA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-terapia-fisica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TERAPIA%20FISICA%20ori.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-terapia-fisica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/protocolo%20terapia.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-terapia-fisica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20fisica.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-terapia-fisica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20fisica.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-terapia-fisica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contabilidad', 'proceso-contabilidad', 'Elaborar y presentar los estados financieros de la entidad, garantizando la calidad de la información, mediante el registro, análisis, verificación, ajuste y conciliación con las áreas que alimentan la información contable para la toma de decisiones de la administración.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 180, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-contabilidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20CONTABILIDAD%20caracterizacion%20ACTUAL%202018.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-contabilidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSCONTABILIDADHSJG%20ACTUALIZADO%2031-10.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-contabilidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20Conta.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-contabilidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Tesorería', 'proceso-tesoreria', 'Optimizar el manejo de los recursos financieros, garantizando el pago de los compromisos de manera transparente, eficiente y oportuna, que permitan el cumplimiento de los objetivos misionales de la entidad.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 190, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-tesoreria');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20TESORERIA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-tesoreria' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20TESORERIA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-tesoreria' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto', 'proceso-presupuesto', 'Planificar y controlar los recursos financieros que ingresan a la institución para el correcto control de la misma.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 200, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-presupuesto');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOPRESUPUESTOHSJGOK%20(1).docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-presupuesto' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOSPRESUPUESTOHSJGOK%20(1).xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-presupuesto' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cartera', 'proceso-cartera', 'Garantizar el adecuado flujo de recursos a la entidad mediante la gestión de la recuperación de los dineros invertidos por la entidad en la prestación de servicios y que son facturados a las diferentes EAPB.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 210, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-cartera');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20CARTERA.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cartera' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MAPA%20DE%20PROCESOS%20DE%20CRATERA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-cartera' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Costos', 'proceso-costos', 'Brindar herramientas que sirvan para la planeación y toma de decisiones con eficiencia y eficacia en el gasto.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 220, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-costos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20PROCESO%20actual.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-costos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procedimientos%20del%20%C3%A1rea%20de%20costos%20Carlos%20Javier%20Arias.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-costos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Activos fijos', 'proceso-activos-fijos', 'Identificar los parámetros del reconocimiento de un activo fijo, costo histórico, su clasificación, creación, plaqueo, depreciación y asignación a las áreas para su uso.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 230, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-activos-fijos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ACTIVOS%20FIJOS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-activos-fijos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ACTIVOS%20FIJOS.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-activos-fijos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/01%20MANUAL%20DE%20MANEJO,%20CONTROL,%20CUSTOD%C3%8DA%20Y%20BAJA%20DE%20LA%20PROPIEDAD,%20PLANTA%20Y%20EQUIPO.doc'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-activos-fijos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/01%20FORMATO%20UNICO%20PARA%20EL%20MOVIMIENTO%20DE%20ACTIVOS.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-activos-fijos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Almacén y suministros', 'proceso-almacen-y-suministros', 'Adquirir, distribuir y legalizar insumos y equipos biomédicos de manera efectiva mediante el plan de compras anual que permita el apoyo administrativo y correcto funcionamiento de las diferentes áreas de la institución.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 240, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-almacen-y-suministros');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CARACTERIZACION%20DE%20ALMACEN%20Y%20SUMINISTROS.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-almacen-y-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20ALMACEN%20Y%20SUMINISTROS.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-almacen-y-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/A-SA-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20PEDIDO.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-almacen-y-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión documental', 'proceso-gestion-documental', 'Detallar las actividades administrativas y técnicas tendientes a la planificación, manejo y organización de la documentación producida y recibida en el área de archivo central de la ESE Hospital San José del Guaviare.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 250, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-documental');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESO%20DE%20GESTION%20DOCUMENTAL.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20GESTION%20DOCUMENTAL.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Jurídica y contratación', 'proceso-juridica-y-contratacion', 'Garantizar el cumplimiento de la normatividad, brindando oportuna asesoría en conceptos jurídicos y administrativos y contratar la adquisición de bienes, servicios o la ejecución de obras, con base en el estatuto de contratación de la entidad y demás normas vigentes que le sean aplicables, para así garantizar el funcionamiento y lograr los fines misionales de la institución.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 260, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-juridica-y-contratacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20JURIDICA.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-juridica-y-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/Formatos%20juri.rar'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-juridica-y-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/comprimido/listas%20juridi.rar'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-juridica-y-contratacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno disciplinario', 'proceso-control-interno-disciplinario', 'Garantizar la aplicación de los principios constitucionales a los servidores y exservidores públicos de la ESE Hospital San José del Guaviare, cuando se determine si la conducta es constitutiva de falta disciplinaria.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 270, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-control-interno-disciplinario');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PROCESOS%20DE%20CID.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-control-interno-disciplinario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROCEDIMIENTOS%20DE%20CID.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-control-interno-disciplinario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sistema de información y atención al usuario', 'proceso-sistema-de-informacion-y-atencion-al-usuario', 'Orientar a los usuarios mediante la solución de inquietudes para una mejor prestación del servicio y satisfacción del mismo.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 280, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-sistema-de-informacion-y-atencion-al-usuario');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-sistema-de-informacion-y-atencion-al-usuario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20sistema%20de%20informacion%20y%20atencion%20al%20usuario.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-sistema-de-informacion-y-atencion-al-usuario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de información epidemiológica', 'proceso-gestion-de-informacion-epidemiologica', 'Observar y analizar de forma rutinaria tanto la ocurrencia y distribución de las enfermedades, como de los factores de riesgo pertinentes y su control, para la toma oportuna de acciones.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 290, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-informacion-epidemiologica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-informacion-epidemiologica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(1).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-informacion-epidemiologica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20epidemiologia%20(2).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-informacion-epidemiologica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de mantenimiento hospitalario', 'proceso-gestion-de-mantenimiento-hospitalario', 'Garantizar el adecuado funcionamiento, conservación y mantenimiento de los bienes e instalaciones de la institución, creando los mecanismos y lineamientos necesarios de acuerdo a la normatividad vigente para brindar calidad en el servicio y satisfacción al usuario.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 300, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-mantenimiento-hospitalario');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-mantenimiento-hospitalario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20mantenimiento%20hospitalario%20(1).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-mantenimiento-hospitalario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de suministros', 'proceso-gestion-de-suministros', 'Adquirir, distribuir y legalizar insumos y equipos biomédicos de manera efectiva mediante el plan de compras anual que permita el apoyo administrativo y correcto funcionamiento de las diferentes áreas de la institución.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 310, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-suministros');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros%20(1).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20suministros%20(1).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-suministros' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de recursos físicos', 'proceso-gestion-de-recursos-fisicos', 'Asegurar la eficiente administración de los bienes y servicios requeridos en la operación de los procesos para su adecuado desempeño y manejo, encaminados a un desarrollo sostenible.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 320, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-recursos-fisicos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20recursos%20fisicos.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-recursos-fisicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-recursos-fisicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20recursos%20fisicos%20(1).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-recursos-fisicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de auditoría, cartera y facturación', 'proceso-gestion-de-auditoria-cartera-y-facturacion', 'Garantizar la adecuada liquidación, revisión y recaudo de las facturas generadas por venta de servicios de salud.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 330, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-auditoria-cartera-y-facturacion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20auditoria,%20cartera%20y%20facturacion%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-auditoria-cartera-y-facturacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(1).pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-auditoria-cartera-y-facturacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20auditoria,%20cartera%20y%20facturacion%20(2).pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-auditoria-cartera-y-facturacion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de trabajo social', 'proceso-gestion-de-trabajo-social', 'Conocer, gestionar y promocionar los recursos existentes entre las instituciones y profesionales de otras ramas de las ciencias que puedan contribuir a la pronta solución de la problemática del paciente.', NULL, 'documento', 'Procesos de apoyo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 340, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-trabajo-social');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20trabajo%20social.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-trabajo-social' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20trabajo%20social.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-trabajo-social' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de imágenes diagnósticas', 'proceso-gestion-de-imagenes-diagnosticas', 'Contribuir al diagnóstico de los problemas de salud del usuario brindando calidad en el servicio y satisfacción al usuario.', NULL, 'documento', 'Otros procesos asistenciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 350, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-imagenes-diagnosticas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20imagenes%20disagnosticas.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-imagenes-diagnosticas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20imagenes%20diagnosticas.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-imagenes-diagnosticas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de medicamentos y dispositivos médicos', 'proceso-gestion-de-medicamentos-y-dispositivos-medicos', 'Proveer los medicamentos y dispositivos médicos requeridos por el usuario, garantizando su adecuada conservación, así como la información y asesoría en el uso adecuado de los mismos para contribuir de manera efectiva en la satisfacción de las necesidades de los usuarios.', NULL, 'documento', 'Otros procesos asistenciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 360, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-medicamentos-y-dispositivos-medicos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20medicamentos%20y%20dispositivos%20medicos.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20de%20medicamentos%20y%20dispositivos%20medicos.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de muestras patológicas', 'proceso-gestion-de-muestras-patologicas', 'Toma y recolección de las muestras patológicas mediante procedimientos de diagnóstico y/o quirúrgicos con el fin de diagnosticar y confirmar una enfermedad.', NULL, 'documento', 'Otros procesos asistenciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 370, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-muestras-patologicas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20muestras%20patologicas.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-muestras-patologicas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20muestras%20patologicas.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-muestras-patologicas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión de referencia y contrarreferencia de pacientes', 'proceso-gestion-de-referencia-y-contrarreferencia-de-pacientes', 'Recepcionar y enviar las remisiones de los diferentes servicios que ameriten por criterio médico otro nivel de complejidad, enviándolos al responsable del pago y a las diferentes IPS contratadas por las EPS y secretarías de salud, y así lograr la pronta ubicación del paciente.', NULL, 'documento', 'Otros procesos asistenciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 380, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-gestion-de-referencia-y-contrarreferencia-de-pacientes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20referencia%20y%20contrarreferencia%20de%20pacientes.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-gestion-de-referencia-y-contrarreferencia-de-pacientes' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención del paciente en terapia respiratoria', 'proceso-atencion-del-paciente-en-terapia-respiratoria', 'Realizar atención a todos los pacientes que por su patología y/o condición clínica ameritan tratamiento por terapia respiratoria atendiendo criterios médicos para mejorar el estado de salud del paciente.', NULL, 'documento', 'Otros procesos asistenciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 390, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proceso-atencion-del-paciente-en-terapia-respiratoria');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20atencion%20del%20paciente%20en%20terapia%20respiratoria.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-atencion-del-paciente-en-terapia-respiratoria' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/mapa%20de%20procesos%20terapia%20respiratoria.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'proceso-atencion-del-paciente-en-terapia-respiratoria' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Objetivos de calidad', 'objetivos-de-calidad', 'Objetivos del sistema de gestión de calidad de la E.S.E.', '<ul><li>Desarrollar acciones encaminadas a implementar el Sistema Obligatorio de Garantía de la Calidad en Salud (SOGCS), enfocadas al mejoramiento continuo y la satisfacción del usuario de acuerdo con sus necesidades.</li><li>Proporcionar servicios de salud a los pacientes enfocados en la atención oportuna, humanizada y en el respeto por su dignidad e individualidad.</li><li>Establecer, documentar e implementar un sistema de gestión de calidad, mejorando la eficacia, eficiencia y efectividad de la institución.</li><li>Asegurar la eficaz planificación, operación y control de los procesos de la institución.</li><li>Optimizar los recursos humanos, físicos, tecnológicos y financieros para garantizar la prestación del servicio de salud.</li></ul>', 'articulo', 'Sistema de gestión de calidad', 'govco:award', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 400, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'objetivos-de-calidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'PAMEC – Programa de auditoría para el mejoramiento de la calidad', 'pamec-programa-de-auditoria-para-el-mejoramiento-de-la-calidad', 'Informe de aprendizaje organizacional y metodología de autoevaluación de estándares de acreditación.', NULL, 'documento', 'Sistema de gestión de calidad', 'govco:clipboard-check', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 410, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pamec-programa-de-auditoria-para-el-mejoramiento-de-la-calidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-APRENDIZAJE-ORGANIZACIONAL-PAMEC-2020-ok.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'pamec-programa-de-auditoria-para-el-mejoramiento-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%20335%20de%202019%20PAMEC.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'pamec-programa-de-auditoria-para-el-mejoramiento-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cultura de la calidad', 'cultura-de-la-calidad', 'Atributos, principios, tips de mejoramiento y desdoblamiento de la calidad.', NULL, 'articulo', 'Sistema de gestión de calidad', 'govco:lightbulb', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 420, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cultura-de-la-calidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/Atributos%20de%20la%20Calidad.jpg'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'cultura-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/principios%20de%20la%20calidad.png'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'cultura-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/QUE%20ES%20AUDITORIA.jpg'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'cultura-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/DESDOBLAMIENTO%20DE%20LA%20CALIDAD.jpg'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'cultura-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgCalidad/EFECTOS%20DE%20NO%20CONTAR%20CON%20PROCESOS%20ESTANDARIZADOS.jpg'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'mapas-y-cartas-descriptivas-de-los-procesos'
 WHERE e.slug = 'cultura-de-la-calidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Directorio de servidores públicos, empleados y contratistas', 'directorio-de-servidores-publicos-empleados-y-contratistas', 'Directorio publicado en el portal anterior (actualizado a enero de 2023).', NULL, 'documento', 'Directorio', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-01-23 12:00:00', 10, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-servidores-publicos-empleados-o-contratistas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'directorio-de-servidores-publicos-empleados-y-contratistas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Directorio%20servidores.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'directorio-de-servidores-publicos-empleados-o-contratistas'
 WHERE e.slug = 'directorio-de-servidores-publicos-empleados-y-contratistas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Nueva EPS', 'nueva-eps', NULL, '<ul><li>Dirección: Carrera 23 Nº 10 – 190</li><li>Teléfono: (608) 584 9824</li><li>Sitio web: https://www.nuevaeps.com.co/</li></ul><p>Entidad encargada de la afiliación y registro de los afiliados al SGSSS, el recaudo de las cotizaciones y la responsable de organizar y garantizar directa o indirectamente la prestación del plan de beneficios a los afiliados.</p>', 'articulo', 'EPS', 'govco:id-card', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'nueva-eps');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fisiomed IPS E.U.', 'fisiomed-ips-e-u', NULL, '<ul><li>Dirección: Calle 12 N° 20 - 115, barrio La Esperanza</li><li>Correo: fisiomedzgv@yahoo.es</li></ul><p>Terapia física, respiratoria, ocupacional y de lenguaje; valoración por fonoaudiología, micronebulización, audiometría y rehabilitación funcional.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fisiomed-ips-e-u');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Medicenter IPS', 'medicenter-ips', NULL, '<ul><li>Dirección: Carrera 23 Nº 10 - 163</li><li>Teléfono: (608) 584 1739</li><li>Correo: medicenterips@hotmail.com</li></ul><p>Servicios de baja complejidad, como ecografías y actividades ambulatorias de promoción, prevención y asistenciales.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'medicenter-ips');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Médicos Asociados', 'medicos-asociados', NULL, '<ul><li>Dirección: Calle 12 N° 20 - 51</li><li>Teléfono: 311 572 2129</li><li>Teléfono: 313 499 5448</li></ul><p>Centro médico y de diagnóstico privado que presta atención médica a los usuarios del régimen especial.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'medicos-asociados');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Odontomedic IPS', 'odontomedic-ips', NULL, '<ul><li>Dirección: Carrera 22 Nº 19 - 20, barrio Bello Horizonte</li><li>Teléfono: (608) 584 0702</li><li>Teléfono: 314 250 7053</li><li>Correo: odontomedicips@gmail.com</li></ul><p>Centro médico y de diagnóstico privado que presta atención médica a los usuarios del régimen contributivo.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'odontomedic-ips');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'R&R Sersalud IPS S.A.S.', 'r-r-sersalud-ips-s-a-s', NULL, '<ul><li>Dirección: Carrera 19 Nº 12B - 13</li><li>Teléfono: 310 866 1413</li></ul><p>Transporte en ambulancia básico y medicalizado.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'r-r-sersalud-ips-s-a-s');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'E.S.E. Hospital San José del Guaviare', 'e-s-e-hospital-san-jose-del-guaviare', NULL, '<ul><li>Dirección: Calle 12 con Carrera 20 esquina, barrio La Esperanza</li><li>Teléfono: (608) 584 0045</li><li>Teléfono: (608) 584 0168</li><li>Correo: contactenos@esehospitalguaviare.gov.co</li><li>Sitio web: https://esehospitalguaviare.gov.co/</li></ul><p>IPS pública de segundo nivel que presta atención médica a los usuarios a través de sus servicios y centros de diagnóstico.</p>', 'articulo', 'IPS', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-entidades'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'e-s-e-hospital-san-jose-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Agropecuaria Turística y del Medio Ambiente de Sabanas de La Fuga', 'asociacion-agropecuaria-turistica-y-del-medio-ambiente-de-sabanas-de-la-fuga', NULL, '<ul><li>Representante legal: Pablo Omar Vergara Garzón</li><li>Dirección: Vereda Sabanas de la Fuga</li><li>Celular: 314 718 6868</li><li>Correo: asociacionasofuga@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-agropecuaria-turistica-y-del-medio-ambiente-de-sabanas-de-la-fuga');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Artístico Cultural Nuevos Vientos', 'asociacion-artistico-cultural-nuevos-vientos', NULL, '<ul><li>Representante legal: Oscar Augusto Zuluaga Muñoz</li><li>Dirección: Carrera 24A N° 13 - 30</li><li>Celular: 318 254 4546</li><li>Correo: nuevosvientosguaviare@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-artistico-cultural-nuevos-vientos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Biapora Andantes del Guaviare', 'asociacion-biapora-andantes-del-guaviare', NULL, '<ul><li>Representante legal: María Gilma Barbosa Corredor</li><li>Dirección: Calle 7 N° 23 - 07, barrio El Centro - Casa Grande</li><li>Celular: 313 384 0797</li><li>Correo: gilmilla46@hotmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-biapora-andantes-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Agropecuaria y Turística del Guaviare', 'asociacion-agropecuaria-y-turistica-del-guaviare', NULL, '<ul><li>Representante legal: Victor Miguel Niampira Pacheco</li><li>Dirección: Vereda Puerto Arturo</li><li>Celular: 321 286 0806</li><li>Correo: agrotug@hotmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-agropecuaria-y-turistica-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación El Colectivo de Mujeres Víctimas del Conflicto Interno de San José del Guaviare', 'asociacion-el-colectivo-de-mujeres-victimas-del-conflicto-interno-de-san-jose-del-guaviare', NULL, '<ul><li>Representante legal: Rosa Ceima Castaño Ospina</li><li>Dirección: MZ 6 CA 7, barrio La Victoria</li><li>Celular: 312 465 4220</li><li>Correo: rosaospina1981@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-el-colectivo-de-mujeres-victimas-del-conflicto-interno-de-san-jose-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Campesina Granja Los Girasoles', 'asociacion-campesina-granja-los-girasoles', NULL, '<ul><li>Representante legal: Pedro Emilio Fonseca Paez</li><li>Dirección: Vereda Colinas AETCR</li><li>Celular: 320 390 4396</li><li>Correo: pemfopa399@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-campesina-granja-los-girasoles');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Agrícola Cámbulos del Guaviare', 'asociacion-agricola-cambulos-del-guaviare', NULL, '<ul><li>Representante legal: Alexander Morales Ariza</li><li>Dirección: Vereda Los Cámbulos - Tienda El Desbare</li><li>Celular: 318 326 9586</li><li>Correo: yinethrojas93@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-agricola-cambulos-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Amigos del Camino Guaviare', 'asociacion-amigos-del-camino-guaviare', NULL, '<ul><li>Representante legal: Jimy Julián Casallas Cardona</li><li>Dirección: MZ B 2 TO A AP 110, barrio Villa Andrea</li><li>Celular: 318 841 4774</li><li>Celular: 312 867 3230</li><li>Correo: jimmy-pac@hotmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 80, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-amigos-del-camino-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Jóvenes Emprendedores del Campo RP', 'asociacion-jovenes-emprendedores-del-campo-rp', NULL, '<ul><li>Representante legal: Edison Javier Romero Peralta</li><li>Dirección: Calle 6 N° 17 - 101, barrio Primero de Octubre</li><li>Celular: 317 815 9804</li><li>Correo: enelcampogv@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 90, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-jovenes-emprendedores-del-campo-rp');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Apoyo y Refugio', 'asociacion-apoyo-y-refugio', NULL, '<ul><li>Representante legal: José Jesús Muñoz Quiceno</li><li>Dirección: Barrio Bicentenario 1 MZ H CA 6</li><li>Celular: 315 272 1486</li><li>Celular: 321 942 0958</li><li>Correo: tazmo371@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 100, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-apoyo-y-refugio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Brisas del Yurupary', 'asociacion-brisas-del-yurupary', NULL, '<ul><li>Representante legal: Olga Lucía Cardonelly Cardona</li><li>Dirección: MZ K CA 19, barrio Brisas del Yurupari</li><li>Celular: 321 970 1830</li><li>Correo: ocarbonelly@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 110, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-brisas-del-yurupary');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Academia de Historia del Departamento del Guaviare', 'asociacion-academia-de-historia-del-departamento-del-guaviare', NULL, '<ul><li>Representante legal: Gustavo Amado López</li><li>Dirección: Calle 19 A N° 22 - 95, barrio Bello Horizonte</li><li>Celular: 310 552 9642</li><li>Correo: amadogus57@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 120, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-academia-de-historia-del-departamento-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Centro Agroecoturístico Laguna Damas de Nare – ECONARE', 'asociacion-centro-agroecoturistico-laguna-damas-de-nare-econare', NULL, '<ul><li>Representante legal: Francisco Amaya Sarmiento</li><li>Dirección: Corregimiento Charras - Boquerón</li><li>Celular: 322 237 7125</li><li>Celular: 320 244 8022</li><li>Correo: econareguaviare@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 130, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-centro-agroecoturistico-laguna-damas-de-nare-econare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Capital de la Esperanza – ASOFAMILIA', 'asociacion-capital-de-la-esperanza-asofamilia', NULL, '<ul><li>Representante legal: Luis Enrique Castaño Muñoz</li><li>Dirección: Calle 19 N° 19A - 28, barrio La Granja</li><li>Celular: 320 812 5834</li><li>Correo: lcastanom@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 140, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-capital-de-la-esperanza-asofamilia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Ciudadela Arazá', 'asociacion-ciudadela-araza', NULL, '<ul><li>Representante legal: Carlos Mario Ramírez Ayala</li><li>Dirección: Barrio Ciudadela Arazá</li><li>Celular: 318 352 3211</li><li>Correo: jacke0730.car@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 150, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-ciudadela-araza');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Asociación Chagra Estudios', 'asociacion-chagra-estudios', NULL, '<ul><li>Representante legal: Juan Carlos Montaña Jiménez</li><li>Dirección: Calle 24 N° 19E - 54, barrio El Triunfo</li><li>Celular: 316 889 5770</li><li>Correo: lachagraestudios@gmail.com</li></ul>', 'articulo', 'Asociaciones', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 160, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'asociacion-chagra-estudios');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fuente', 'fuente', NULL, '<p>Asociaciones registradas en el directorio de organizaciones sociales de la Alcaldía de San José del Guaviare.</p>', 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 170, 'esehospitalguaviare.gov.co (Estructura orgánica y talento humano)'
  FROM cms_paginas p WHERE p.slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fuente');
