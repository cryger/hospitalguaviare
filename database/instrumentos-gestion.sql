-- =====================================================================
-- 042 · Instrumentos de gestión de la información (portal anterior › Transparencia › 10 a 12)
--  - 7.1.3 Esquema de publicación: texto del esquema (la página pasa a plantilla «contenido»)
--  - 7.1.4 Programa de Gestión Documental: PGD, instrumentos archivísticos, FUID y transferencias
--  - 7.1.5 Tablas de Retención Documental y su aprobación
--  - Accesibilidad (pie de página): certificado de cumplimiento, Anexo técnico 1 de la Res. 1519
-- 7 entradas y 12 archivos. No duplica ni borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'contenido' WHERE slug = 'esquema-de-publicacion-de-la-informacion' AND plantilla = 'documentos';
UPDATE cms_paginas SET descripcion = 'Programa de Gestión Documental (PGD), instrumentos archivísticos, inventarios de fondos acumulados y transferencias documentales.' WHERE slug = 'programa-de-gestion-documental' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Tablas de Retención Documental (TRD) de la E.S.E. y actos administrativos de aprobación.' WHERE slug = 'tablas-de-retencion-documental' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Instrumento que organiza la información pública que publica la E.S.E.: responsable, formato y periodicidad.' WHERE slug = 'esquema-de-publicacion-de-la-informacion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'esquema-de-publicacion-de-la-informacion' SET e.orden = 10 WHERE e.slug = 'esquema-de-publicacion-de-la-informacion-datos-abiertos' AND e.orden = 0;

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROGRAMA-DE-GESTION-DOCUMENTAL.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROGRAMA-DE-GESTION-DOCUMENTAL.pdf', 'documento', 'application/pdf', 'Programa de Gestión Documental (PGD)', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROGRAMA-DE-GESTION-DOCUMENTAL.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME IMPLEMENTACIÓN- PGD - 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20IMPLEMENTACI%C3%93N-%20PGD%20-%202022.pdf', 'documento', 'application/pdf', 'Informe de implementación del PGD – 2022', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20IMPLEMENTACI%C3%93N-%20PGD%20-%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE CONSERVACIÓN DOCUMENTAL - 2022 - (SIC).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONSERVACI%C3%93N%20DOCUMENTAL%20-%202022%20-%20(SIC).pdf', 'documento', 'application/pdf', 'Plan de conservación documental – 2022 (SIC)', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONSERVACI%C3%93N%20DOCUMENTAL%20-%202022%20-%20(SIC).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE TRABAJO ARCHIVÍSTICO INTEGRAL INTERVENCIÓN FONDOS ACUMULADOS - 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20TRABAJO%20ARCHIV%C3%8DSTICO%20INTEGRAL%20INTERVENCI%C3%93N%20FONDOS%20ACUMULADOS%20-%202022.pdf', 'documento', 'application/pdf', 'Plan de trabajo archivístico integral – intervención de fondos acumulados 2022', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20TRABAJO%20ARCHIV%C3%8DSTICO%20INTEGRAL%20INTERVENCI%C3%93N%20FONDOS%20ACUMULADOS%20-%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DIAGNÓSTICO INTEGRAL DE ARCHIVOS HOSPITAL - 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DIAGN%C3%93STICO%20INTEGRAL%20DE%20ARCHIVOS%20HOSPITAL%20-%202022.pdf', 'documento', 'application/pdf', 'Diagnóstico integral de archivos – 2022 (informe)', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DIAGN%C3%93STICO%20INTEGRAL%20DE%20ARCHIVOS%20HOSPITAL%20-%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DIAGNÓSTICO INTEGRAL HOSPITAL SAN JOSE DEL GUAVIARE - 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/DIAGN%C3%93STICO%20INTEGRAL%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE%20-%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Diagnóstico integral de archivos – 2022 (matriz)', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/DIAGN%C3%93STICO%20INTEGRAL%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE%20-%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FUID FONDO ACUMULADO TESORERÍA..xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20TESORER%C3%8DA..xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'FUID fondo acumulado Tesorería – 2022', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20TESORER%C3%8DA..xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'FUID FONDO ACUMULADO JURIDICA..xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20JURIDICA..xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'FUID fondo acumulado Jurídica – 2022', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20JURIDICA..xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTA TRANSFERENCIA N.1 - 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20TRANSFERENCIA%20N.1%20-%202023.pdf', 'documento', 'application/pdf', 'Acta de transferencia documental N.° 1 – 2023', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20TRANSFERENCIA%20N.1%20-%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Tabla-Retencion-Documental-Hospital-San-Jose-Guaviare.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Tabla-Retencion-Documental-Hospital-San-Jose-Guaviare.pdf', 'documento', 'application/pdf', 'Tablas de Retención Documental (TRD)', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Tabla-Retencion-Documental-Hospital-San-Jose-Guaviare.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACTOS ADMINISTRATIVOS APROBACIÓN TRD 2013.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20ADMINISTRATIVOS%20APROBACI%C3%93N%20TRD%202013.pdf', 'documento', 'application/pdf', 'Actos administrativos de aprobación de las TRD – 2013', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20ADMINISTRATIVOS%20APROBACI%C3%93N%20TRD%202013.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Anexo_Tecnico 1._Certificado_de_Accesibilidad.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo_Tecnico%201._Certificado_de_Accesibilidad.pdf', 'documento', 'application/pdf', 'Certificado de cumplimiento de accesibilidad – Anexo técnico 1, Res. 1519 de 2020', NULL, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo_Tecnico%201._Certificado_de_Accesibilidad.pdf');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Programa de Gestión Documental (PGD)', 'pgd-programa-de-gestion-documental', 'Programa de Gestión Documental de la E.S.E. y su informe de implementación.', NULL, 'documento', 'Programa de Gestión Documental', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 10, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'programa-de-gestion-documental'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pgd-programa-de-gestion-documental');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROGRAMA-DE-GESTION-DOCUMENTAL.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-programa-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20IMPLEMENTACI%C3%93N-%20PGD%20-%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-programa-de-gestion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Instrumentos archivísticos 2022', 'pgd-instrumentos-archivisticos-2022', 'Plan de conservación documental (SIC), plan de trabajo archivístico integral y diagnóstico integral de archivos.', NULL, 'documento', 'Instrumentos archivísticos', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 20, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'programa-de-gestion-documental'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pgd-instrumentos-archivisticos-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20CONSERVACI%C3%93N%20DOCUMENTAL%20-%202022%20-%20(SIC).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-instrumentos-archivisticos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20TRABAJO%20ARCHIV%C3%8DSTICO%20INTEGRAL%20INTERVENCI%C3%93N%20FONDOS%20ACUMULADOS%20-%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-instrumentos-archivisticos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DIAGN%C3%93STICO%20INTEGRAL%20DE%20ARCHIVOS%20HOSPITAL%20-%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-instrumentos-archivisticos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/DIAGN%C3%93STICO%20INTEGRAL%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE%20-%202022.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-instrumentos-archivisticos-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Inventario de fondos documentales acumulados 2022 (FUID)', 'pgd-fondos-acumulados-2022', 'Formato Único de Inventario Documental de los fondos acumulados de Tesorería y Jurídica.', NULL, 'documento', 'Fondos acumulados y transferencias', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'programa-de-gestion-documental'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pgd-fondos-acumulados-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20TESORER%C3%8DA..xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-fondos-acumulados-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/FUID%20FONDO%20ACUMULADO%20JURIDICA..xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-fondos-acumulados-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Transferencias documentales 2023', 'pgd-transferencias-documentales-2023', 'Actas de transferencia documental al archivo central.', NULL, 'documento', 'Fondos acumulados y transferencias', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'programa-de-gestion-documental'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pgd-transferencias-documentales-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA%20TRANSFERENCIA%20N.1%20-%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'programa-de-gestion-documental'
 WHERE e.slug = 'pgd-transferencias-documentales-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Tablas de Retención Documental (TRD)', 'trd-tablas-de-retencion-documental', 'Tablas de Retención Documental de la E.S.E. y actos administrativos de aprobación.', NULL, 'documento', 'Tablas de Retención Documental', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2013-12-31 12:00:00', 10, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'tablas-de-retencion-documental'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'trd-tablas-de-retencion-documental');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Tabla-Retencion-Documental-Hospital-San-Jose-Guaviare.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tablas-de-retencion-documental'
 WHERE e.slug = 'trd-tablas-de-retencion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTOS%20ADMINISTRATIVOS%20APROBACI%C3%93N%20TRD%202013.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tablas-de-retencion-documental'
 WHERE e.slug = 'trd-tablas-de-retencion-documental' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Esquema de publicación de la información', 'esquema-de-publicacion', 'Qué información publica la E.S.E., quién la produce, en qué formato y cada cuánto se actualiza.', '<p>La E.S.E. Hospital San José del Guaviare, en cumplimiento de los principios de transparencia, acceso a la información pública y rendición de cuentas, pone a disposición de la ciudadanía el Esquema de Publicación de Información: el instrumento con el que la entidad identifica, organiza y facilita el acceso a la información pública que genera, administra y custodia.</p>
<h3>Objetivos</h3>
<ul>
<li><strong>Transparencia:</strong> facilitar el acceso de la ciudadanía a la información pública de la institución.</li>
<li><strong>Accesibilidad:</strong> organizar la información para facilitar su búsqueda y consulta.</li>
<li><strong>Participación:</strong> fortalecer la participación ciudadana y el control social sobre la gestión institucional.</li>
<li><strong>Rendición de cuentas:</strong> facilitar el seguimiento ciudadano a los resultados y actuaciones de la entidad.</li>
</ul>
<h3>Información publicada</h3>
<table>
<thead><tr><th scope="col">Información</th><th scope="col">Responsable</th><th scope="col">Formato</th><th scope="col">Periodicidad</th></tr></thead>
<tbody>
<tr><td><a href="/transparencia/informacion-de-la-entidad">Información institucional</a></td><td>Planeación</td><td>PDF / HTML</td><td>Cuando se modifique</td></tr>
<tr><td><a href="/transparencia/planeacion-presupuesto-e-informes">Planes institucionales</a></td><td>Planeación</td><td>PDF</td><td>Anual</td></tr>
<tr><td><a href="/transparencia/planeacion-presupuesto-e-informes">Presupuesto y ejecución</a></td><td>Área Financiera</td><td>PDF / XLSX</td><td>Periódica</td></tr>
<tr><td><a href="/transparencia/contratacion">Procesos contractuales</a></td><td>Contratación</td><td>PDF / HTML</td><td>Permanente</td></tr>
<tr><td><a href="/nuestro-hospital/talento-humano">Talento humano</a></td><td>Talento Humano</td><td>PDF / HTML</td><td>Según actualización</td></tr>
<tr><td><a href="/pqrsf">PQRSD</a></td><td>Atención al Usuario</td><td>HTML / PDF</td><td>Permanente</td></tr>
<tr><td><a href="/transparencia/planeacion-presupuesto-e-informes">Informes de control</a></td><td>Control Interno</td><td>PDF</td><td>Según programación</td></tr>
<tr><td><a href="/transparencia/datos-abiertos/seccion-de-datos-abiertos">Datos abiertos</a></td><td>Gobierno Digital</td><td>CSV / XLSX</td><td>Según actualización</td></tr>
</tbody>
</table>
<h3>Formatos de publicación</h3>
<ul>
<li><strong>HTML:</strong> información disponible directamente en el portal institucional.</li>
<li><strong>PDF:</strong> documentos e informes institucionales para consulta.</li>
<li><strong>XLSX:</strong> información estructurada para consulta y análisis.</li>
<li><strong>CSV:</strong> datos estructurados para procesamiento y reutilización.</li>
</ul>
<h3>Periodicidad de actualización</h3>
<ul>
<li><strong>Permanente:</strong> información disponible de manera continua.</li>
<li><strong>Mensual:</strong> información actualizada periódicamente durante la vigencia.</li>
<li><strong>Trimestral:</strong> información que se actualiza cada trimestre.</li>
<li><strong>Anual:</strong> instrumentos de planeación y gestión anual.</li>
<li><strong>Cuando se modifique:</strong> información que cambia cuando hay una modificación institucional.</li>
</ul>
<h3>Responsables de la información</h3>
<ul>
<li><strong>Oficina de Planeación:</strong> planeación institucional, seguimiento, indicadores y gestión.</li>
<li><strong>Gobierno Digital / TIC:</strong> contenidos digitales, portal web, datos abiertos y Gobierno Digital.</li>
<li><strong>Contratación:</strong> procesos y gestión contractual.</li>
<li><strong>Área Financiera:</strong> información presupuestal, financiera y contable.</li>
<li><strong>Talento Humano:</strong> personal y estructura de cargos.</li>
<li><strong>Control Interno:</strong> informes de auditoría, evaluación y seguimiento.</li>
</ul>
<p>Para solicitar información que no encuentre publicada, use el <a href="/pqrsf">formulario de PQRSFD</a>.</p>', 'articulo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'esquema-de-publicacion-de-la-informacion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'esquema-de-publicacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Certificado de cumplimiento de accesibilidad', 'certificado-de-accesibilidad', 'Certificado de cumplimiento del Anexo técnico 1 (accesibilidad web) de la Resolución 1519 de 2020 de MinTIC.', '<p>Certificado de cumplimiento de los criterios de accesibilidad web del Anexo técnico 1 de la Resolución 1519 de 2020 del Ministerio de Tecnologías de la Información y las Comunicaciones.</p>', 'articulo', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 20, 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)'
  FROM cms_paginas p WHERE p.slug = 'accesibilidad'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'certificado-de-accesibilidad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Anexo_Tecnico%201._Certificado_de_Accesibilidad.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'accesibilidad'
 WHERE e.slug = 'certificado-de-accesibilidad' AND e.migrado_de = 'esehospitalguaviare.gov.co (Instrumentos de gestión de la información)';
