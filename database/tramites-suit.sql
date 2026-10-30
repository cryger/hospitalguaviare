-- =====================================================================
-- 041 · Trámites inscritos en el SUIT (portal anterior › Transparencia › 9)
--  Página «Trámites y otros procedimientos» (Transparencia › 5. Trámites):
--  - 6 trámites nuevos: urgencias, laboratorio, radiología, terapia,
--    dispensación de medicamentos y certificado de defunción
--  - Citas y copia de historia clínica: se agrega la ficha GOV.CO y su normatividad
--  - Cada trámite enlaza su ficha en GOV.CO y la normatividad que lo sustenta
-- 6 entradas nuevas, 38 archivos. No duplica ni borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 657 de 2001.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf', 'documento', 'application/pdf', 'Ley 657 de 2001', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 0023 DE 1981.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf', 'documento', 'application/pdf', 'Ley 23 de 1981', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 5261 de 1994.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf', 'documento', 'application/pdf', 'Resolución 5261 de 1994', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ley_0009_1979.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf', 'documento', 'application/pdf', 'Ley 9 de 1979', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DECRETO_1171_19974011015213224133470.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO_1171_19974011015213224133470.pdf', 'documento', 'application/pdf', 'Decreto 1171 de 1997', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO_1171_19974011015213224133470.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 5194 DE 2010.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%205194%20DE%202010.pdf', 'documento', 'application/pdf', 'Resolución 5194 de 2010', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%205194%20DE%202010.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCIÓN 1346 DE 1997.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201346%20DE%201997.pdf', 'documento', 'application/pdf', 'Resolución 1346 de 1997', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201346%20DE%201997.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '20191118-circular-unica-rc-e-identificacion-version-4-15-noviembre-2019_.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20191118-circular-unica-rc-e-identificacion-version-4-15-noviembre-2019_.pdf', 'documento', 'application/pdf', 'Circular Única de Registro Civil e Identificación – Versión 4', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20191118-circular-unica-rc-e-identificacion-version-4-15-noviembre-2019_.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Circular_externa_064_de_2008.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular_externa_064_de_2008.pdf', 'documento', 'application/pdf', 'Circular Externa N° 64 de 2008', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular_externa_064_de_2008.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2 CIRCULAR 019 DE 2007 cert de defuncion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2%20CIRCULAR%20019%20DE%202007%20cert%20de%20defuncion.pdf', 'documento', 'application/pdf', 'Circular Externa N° 19 de 2007', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2%20CIRCULAR%20019%20DE%202007%20cert%20de%20defuncion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 0036 DE 1993.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf', 'documento', 'application/pdf', 'Ley 36 de 1993', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Decreto 77 de 1997.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%2077%20de%201997.pdf', 'documento', 'application/pdf', 'Decreto 77 de 1997', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%2077%20de%201997.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CIRCULAR N.16.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N.16.pdf', 'documento', 'application/pdf', 'Circular N° 16 de 2014', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N.16.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Acuerdo 260 del 4 de febrero 2004 cuotas mo y cop.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20260%20del%204%20de%20febrero%202004%20cuotas%20mo%20y%20cop.pdf', 'documento', 'application/pdf', 'Acuerdo 260 de 2004', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20260%20del%204%20de%20febrero%202004%20cuotas%20mo%20y%20cop.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 100 DE 1993.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%20100%20DE%201993.pdf', 'documento', 'application/pdf', 'Ley 100 de 1993', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%20100%20DE%201993.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Decreto 2330-2006.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%202330-2006.pdf', 'documento', 'application/pdf', 'Decreto 2330 de 2006', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%202330-2006.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DECRETO 2200 DE 2005.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%202200%20DE%202005.pdf', 'documento', 'application/pdf', 'Decreto 2200 de 2005', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%202200%20DE%202005.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolución 1604 de 2013.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201604%20de%202013.pdf', 'documento', 'application/pdf', 'Resolución 1604 de 2013', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201604%20de%202013.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION 1403 DE 2007-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201403%20DE%202007-1.pdf', 'documento', 'application/pdf', 'Resolución 1403 de 2007', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201403%20DE%202007-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'resolucion001478de2006.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion001478de2006.pdf', 'documento', 'application/pdf', 'Resolución 1478 de 2006', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion001478de2006.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 260 DE 2004.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20260%20DE%202004.pdf', 'documento', 'application/pdf', 'Acuerdo 260 de 2004', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20260%20DE%202004.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley-100-de-1993.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf', 'documento', 'application/pdf', 'Ley 100 de 1993', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley-10-de-1990.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf', 'documento', 'application/pdf', 'Ley 10 de 1990', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ley_1122_200.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf', 'documento', 'application/pdf', 'Ley 1122 de 2007', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Dec19 de 2012.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dec19%20de%202012.pdf', 'documento', 'application/pdf', 'Decreto 19 de 2012', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dec19%20de%202012.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DECRETO 0783 DE 2000.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%200783%20DE%202000.pdf', 'documento', 'application/pdf', 'Decreto 0783 de 2000', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%200783%20DE%202000.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DECRETO 1295 DE 1994.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%201295%20DE%201994.pdf', 'documento', 'application/pdf', 'Decreto 1295 de 1994', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%201295%20DE%201994.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Decreto_412_de_1992_Normas_urgencias_.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_412_de_1992_Normas_urgencias_.pdf', 'documento', 'application/pdf', 'Decreto 412 de 1992', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_412_de_1992_Normas_urgencias_.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 528 de 1999.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf', 'documento', 'application/pdf', 'Ley 528 de 1999', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 1438 DE 2011.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf', 'documento', 'application/pdf', 'Ley 1438 de 2011', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'dec 4747 2007.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/dec%204747%202007.pdf', 'documento', 'application/pdf', 'Decreto 4747 de 2007', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/dec%204747%202007.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 1552 de 2013.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201552%20de%202013.pdf', 'documento', 'application/pdf', 'Resolución 1552 de 2013', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201552%20de%202013.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Circular 0016 de 2014.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular%200016%20de%202014.pdf', 'documento', 'application/pdf', 'Circular 16 de 2014', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular%200016%20de%202014.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ACUERDO 000260 DE 2004.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20000260%20DE%202004.pdf', 'documento', 'application/pdf', 'Acuerdo 260 de 2004', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20000260%20DE%202004.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 911 de 2004.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf', 'documento', 'application/pdf', 'Ley 911 de 2004', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion No 839 de 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20No%20839%20de%202017.pdf', 'documento', 'application/pdf', 'Resolución 839 de 2017', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20No%20839%20de%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'RESOLUCION_1995_1999.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_1995_1999.pdf', 'documento', 'application/pdf', 'Resolución 1995 de 1999', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_1995_1999.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Sentencia 182.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Sentencia%20182.pdf', 'documento', 'application/pdf', 'Sentencia 182 de 2009', NULL, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Sentencia%20182.pdf');

UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos' SET e.orden = 4 WHERE e.slug = 'resultados-de-laboratorio' AND e.orden = 2;
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos' SET e.orden = 9 WHERE e.slug = 'radicar-pqrsf' AND e.orden = 3;
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos' SET e.orden = 10 WHERE e.slug = 'seguimiento-solicitudes-contractuales' AND e.orden = 4;

INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dec19%20de%202012.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/dec%204747%202007.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%201552%20de%202013.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular%200016%20de%202014.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20000260%20DE%202004.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
   SET e.contenido = CONCAT(COALESCE(e.contenido, ''), '\n', '<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T46904" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>'), e.orden = 1
 WHERE e.slug = 'solicitar-cita-consulta-externa' AND COALESCE(e.contenido, '') NOT LIKE '%gov.co/ficha-tramites-y-servicios%';

INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dec19%20de%202012.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20No%20839%20de%202017.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION_1995_1999.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Sentencia%20182.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'copia-de-historia-clinica' AND e.contenido NOT LIKE '%gov.co/ficha-tramites-y-servicios%';
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
   SET e.contenido = CONCAT(COALESCE(e.contenido, ''), '\n', '<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T49559" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>'), e.orden = 2
 WHERE e.slug = 'copia-de-historia-clinica' AND COALESCE(e.contenido, '') NOT LIKE '%gov.co/ficha-tramites-y-servicios%';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención inicial de urgencia', 'atencion-inicial-de-urgencia', 'Atención de urgencias para cualquier persona, sin autorización previa de la EPS.', '<p>La atención inicial de urgencias es obligatoria y se presta a cualquier persona, sin importar su capacidad de pago ni su afiliación al sistema de salud, y sin necesidad de contrato ni autorización previa de la EPS.</p>
<h3>¿Cómo acceder?</h3>
<ol>
<li>Acérquese al servicio de Urgencias del hospital.</li>
<li>Presente su documento de identidad si lo tiene; no tenerlo no impide la atención.</li>
<li>Pase al triage, donde se clasifica la prioridad de atención según la gravedad.</li>
</ol>
<p><strong>Costo:</strong> según su régimen de afiliación pueden aplicar cuotas moderadoras o copagos (Acuerdo 260 de 2004).</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T46573" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'atencion-inicial-de-urgencia');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dec19%20de%202012.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%200783%20DE%202000.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%201295%20DE%201994.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_412_de_1992_Normas_urgencias_.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'atencion-inicial-de-urgencia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Examen de laboratorio clínico', 'examen-de-laboratorio-clinico', 'Toma y procesamiento de las muestras de laboratorio ordenadas por un profesional de la salud.', '<p>Realización de los exámenes de laboratorio clínico ordenados por un profesional de la salud.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>Tenga a mano la orden médica vigente y, si su EPS la exige, la autorización.</li>
<li>Acérquese al Laboratorio Clínico con su documento de identidad y siga las indicaciones de preparación (por ejemplo, ayuno cuando se requiera).</li>
<li>Consulte sus resultados en línea en la opción «Consulta y descarga de resultados de laboratorio» de esta página.</li>
</ol>
<p><strong>Costo:</strong> según su régimen de afiliación pueden aplicar cuotas moderadoras o copagos (Acuerdo 260 de 2004).</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T60504" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 3, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'examen-de-laboratorio-clinico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%2077%20de%201997.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CIRCULAR%20N.16.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Acuerdo%20260%20del%204%20de%20febrero%202004%20cuotas%20mo%20y%20cop.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'examen-de-laboratorio-clinico' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Radiología e imágenes diagnósticas', 'radiologia-e-imagenes-diagnosticas', 'Estudios de rayos X, ecografías y otras imágenes ordenadas por un profesional de la salud.', '<p>Realización de los estudios de radiología e imágenes diagnósticas ordenados por un profesional de la salud.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>Tenga a mano la orden médica vigente y, si su EPS la exige, la autorización.</li>
<li>Solicite la cita por los canales de atención del hospital.</li>
<li>Preséntese el día de la cita con su documento de identidad y la preparación indicada para el estudio.</li>
</ol>
<p><strong>Costo:</strong> según su régimen de afiliación pueden aplicar cuotas moderadoras o copagos (Acuerdo 260 de 2004).</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T60324" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 5, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'radiologia-e-imagenes-diagnosticas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'radiologia-e-imagenes-diagnosticas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'radiologia-e-imagenes-diagnosticas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'radiologia-e-imagenes-diagnosticas' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Terapia', 'terapia', 'Sesiones de terapia ordenadas por un profesional de la salud, como fisioterapia.', '<p>Prestación de las sesiones de terapia ordenadas por un profesional de la salud.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>Tenga a mano la orden médica vigente y, si su EPS la exige, la autorización.</li>
<li>Solicite la asignación de las sesiones por los canales de atención del hospital.</li>
<li>Asista a cada sesión con su documento de identidad.</li>
</ol>
<p><strong>Costo:</strong> según su régimen de afiliación pueden aplicar cuotas moderadoras o copagos (Acuerdo 260 de 2004).</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T60322" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 6, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'terapia');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'terapia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'terapia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'terapia' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Dispensación de medicamentos y dispositivos médicos', 'dispensacion-de-medicamentos-y-dispositivos-medicos', 'Entrega de los medicamentos y dispositivos médicos formulados por un profesional de la salud.', '<p>Entrega de los medicamentos y dispositivos médicos formulados por un profesional de la salud.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>Tenga a mano la fórmula médica vigente y, si su EPS la exige, la autorización.</li>
<li>Acérquese al servicio farmacéutico con su documento de identidad.</li>
<li>Reciba los medicamentos y las indicaciones sobre su uso y conservación.</li>
</ol>
<p><strong>Costo:</strong> según su régimen de afiliación pueden aplicar cuotas moderadoras o copagos (Acuerdo 260 de 2004).</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T46600" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 7, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%20100%20DE%201993.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto%202330-2006.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO%202200%20DE%202005.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%201604%20de%202013.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCION%201403%20DE%202007-1.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/resolucion001478de2006.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%205261%20de%201994.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACUERDO%20260%20DE%202004.pdf'), 18
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'dispensacion-de-medicamentos-y-dispositivos-medicos' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Certificado de defunción', 'certificado-de-defuncion', 'Expedición del certificado médico de defunción, necesario para el registro civil de defunción.', '<p>Expedición del certificado médico de defunción por muerte natural ocurrida en la institución. Con este certificado los familiares tramitan el registro civil de defunción ante la Registraduría o una notaría.</p>
<h3>¿Cómo hacerlo?</h3>
<ol>
<li>El médico que confirma el fallecimiento expide el certificado de defunción.</li>
<li>El familiar o responsable presenta su documento de identidad y el del fallecido.</li>
<li>Con el certificado, realice el registro civil de defunción.</li>
</ol>
<p><strong>Costo:</strong> gratuito.</p>
<h3>Más información</h3>
<p><a href="https://www.gov.co/ficha-tramites-y-servicios/T59317" target="_blank" rel="noopener">Ver la ficha del trámite en GOV.CO</a> (requisitos, pasos y canales registrados en el SUIT).</p>', 'servicio', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 8, 'esehospitalguaviare.gov.co (Trámites y servicios)'
  FROM cms_paginas p WHERE p.slug = 'tramites-y-otros-procedimientos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'certificado-de-defuncion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 10
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf'), 11
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/DECRETO_1171_19974011015213224133470.pdf'), 12
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resoluci%C3%B3n%205194%20DE%202010.pdf'), 13
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/RESOLUCI%C3%93N%201346%20DE%201997.pdf'), 14
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/20191118-circular-unica-rc-e-identificacion-version-4-15-noviembre-2019_.pdf'), 15
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Circular_externa_064_de_2008.pdf'), 16
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/2%20CIRCULAR%20019%20DE%202007%20cert%20de%20defuncion.pdf'), 17
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'tramites-y-otros-procedimientos'
 WHERE e.slug = 'certificado-de-defuncion' AND e.migrado_de = 'esehospitalguaviare.gov.co (Trámites y servicios)';
