-- =====================================================================
-- 063 · «Leyes» (2.1.1) como repositorio de documentos con filtro
--  La página informativa pasa a plantilla «documentos» (estilo sobrio con
--  buscador y filtro) y publica las leyes aplicables que el portal ya aloja
--  (salud y seguridad social; ejercicio de las profesiones), reutilizando
--  sus archivos. Archiva la entrada informativa. Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'documentos' WHERE slug = 'leyes' AND plantilla IN ('contenido','secciones');
UPDATE cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id AND q.slug = 'leyes'
   SET x.estado = 'archivada' WHERE x.slug = 'leyes-normatividad-aplicable' AND x.estado = 'publicada';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ley_0009_1979.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf', 'documento', 'application/pdf', 'Ley 9 de 1979', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley-10-de-1990.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf', 'documento', 'application/pdf', 'Ley 10 de 1990', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley-100-de-1993.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf', 'documento', 'application/pdf', 'Ley 100 de 1993', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'ley_1122_200.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf', 'documento', 'application/pdf', 'Ley 1122 de 2007', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 1438 DE 2011.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf', 'documento', 'application/pdf', 'Ley 1438 de 2011', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 0023 DE 1981.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf', 'documento', 'application/pdf', 'Ley 23 de 1981', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'LEY 0036 DE 1993.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf', 'documento', 'application/pdf', 'Ley 36 de 1993', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 528 de 1999.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf', 'documento', 'application/pdf', 'Ley 528 de 1999', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 657 de 2001.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf', 'documento', 'application/pdf', 'Ley 657 de 2001', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Ley 911 de 2004.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf', 'documento', 'application/pdf', 'Ley 911 de 2004', NULL, 'Leyes aplicables (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 9 de 1979', 'ley-9-de-1979', 'Código Sanitario Nacional: medidas sanitarias para la protección del medio ambiente y la salud.', NULL, 'documento', 'Salud y seguridad social', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 0, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-9-de-1979');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-9-de-1979'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_0009_1979.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 10 de 1990', 'ley-10-de-1990', 'Reorganiza el Sistema Nacional de Salud.', NULL, 'documento', 'Salud y seguridad social', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 1, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-10-de-1990');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-10-de-1990'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-10-de-1990.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 100 de 1993', 'ley-100-de-1993', 'Crea el Sistema General de Seguridad Social en Salud.', NULL, 'documento', 'Salud y seguridad social', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 2, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-100-de-1993');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-100-de-1993'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley-100-de-1993.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 1122 de 2007', 'ley-1122-de-2007', 'Modificaciones al Sistema General de Seguridad Social en Salud.', NULL, 'documento', 'Salud y seguridad social', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 3, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-1122-de-2007');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-1122-de-2007'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ley_1122_200.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 1438 de 2011', 'ley-1438-de-2011', 'Fortalecimiento del Sistema General de Seguridad Social en Salud.', NULL, 'documento', 'Salud y seguridad social', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 4, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-1438-de-2011');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-1438-de-2011'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%201438%20DE%202011.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 23 de 1981', 'ley-23-de-1981', 'Normas en materia de ética médica.', NULL, 'documento', 'Ejercicio de las profesiones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 5, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-23-de-1981');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-23-de-1981'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200023%20DE%201981.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 36 de 1993', 'ley-36-de-1993', 'Ejercicio de la profesión de bacteriología.', NULL, 'documento', 'Ejercicio de las profesiones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 6, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-36-de-1993');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-36-de-1993'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/LEY%200036%20DE%201993.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 528 de 1999', 'ley-528-de-1999', 'Ejercicio de la profesión de fisioterapia.', NULL, 'documento', 'Ejercicio de las profesiones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 7, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-528-de-1999');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-528-de-1999'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20528%20de%201999.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 657 de 2001', 'ley-657-de-2001', 'Reglamenta la especialidad médica de anestesiología.', NULL, 'documento', 'Ejercicio de las profesiones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 8, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-657-de-2001');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-657-de-2001'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20657%20de%202001.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ley 911 de 2004', 'ley-911-de-2004', 'Responsabilidad deontológica para el ejercicio de la enfermería.', NULL, 'documento', 'Ejercicio de las profesiones', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 9, 'Leyes aplicables (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-911-de-2004');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='leyes' AND x.slug='ley-911-de-2004'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Ley%20911%20de%202004.pdf'), 0;
