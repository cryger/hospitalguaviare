-- =====================================================================
-- 060 · «Ética y transparencia» como repositorio de documentos
--  Cambia la página de plantilla «secciones» a «documentos» (estilo sobrio
--  con buscador y filtro por tipo), archiva la entrada informativa y
--  publica los documentos de ética ya existentes en el portal (código de
--  integridad, políticas y conflictos de interés) reutilizando sus archivos.
--  Idempotente; no borra archivos.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'documentos' WHERE slug = 'etica-y-transparencia' AND plantilla = 'secciones';
UPDATE cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id AND q.slug = 'etica-y-transparencia'
   SET x.estado = 'archivada' WHERE x.slug = 'etica-y-transparencia-ptee' AND x.estado = 'publicada';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Código de Integridad y Buen Gobierno ultimo 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf', 'documento', 'application/pdf', 'Código de Integridad y Buen Gobierno 2025', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion 0701 2025 Actualizacion de codigo de integridad y buen gobierno.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf', 'documento', 'application/pdf', 'Resolución 0701 de 2025 (adopción)', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CODIGO-DE-INTEGRIDAD.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Código de Integridad y Buen Gobierno 2021', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf', 'documento', 'application/pdf', 'Código de Integridad y Buen Gobierno 2020', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Res-0844-integridad-y-buen-gobierno.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf', 'documento', 'application/pdf', 'Resolución 0844 (adopción)', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CODIGO BUEN GOBIERNO HSJG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf', 'documento', 'application/pdf', 'Código de Buen Gobierno 2019', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-INTEGRIDAD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf', 'documento', 'application/pdf', 'Política de Integridad', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE INTEGRIDAD 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf', 'documento', 'application/pdf', 'Política de Integridad 2024', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf', 'documento', 'application/pdf', 'Política de Transparencia y Lucha contra la Corrupción', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROTOCOLO PARA LA DECLARACIÓN Y GESTIÓN DE CONFLICTO DE INTERES E IMPEDIMENTOS Y REACUSACIONES V2 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf', 'documento', 'application/pdf', 'Protocolo de conflictos de intereses V2', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '05 FORMATO DE DECLARACIÓN DE SITUACIONES DE CONFLICTO DE INTERESES V1 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf', 'documento', 'application/pdf', 'Formato de declaración de conflicto de intereses V1', NULL, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de Integridad y Buen Gobierno 2025', 'codigo-integridad-buen-gobierno-2025', 'Versión vigente del Código de Integridad y Buen Gobierno de la E.S.E.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-06-01 12:00:00', 0, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'codigo-integridad-buen-gobierno-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-integridad-buen-gobierno-2025'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/C%C3%B3digo%20de%20Integridad%20y%20Buen%20Gobierno%20ultimo%202025.pdf'), 0;
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-integridad-buen-gobierno-2025'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%200701%202025%20Actualizacion%20de%20codigo%20de%20integridad%20y%20buen%20gobierno.pdf'), 1;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de Integridad y Buen Gobierno 2021', 'codigo-integridad-buen-gobierno-2021', 'Código de Integridad y Buen Gobierno – versión 2021.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-01-01 12:00:00', 1, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'codigo-integridad-buen-gobierno-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-integridad-buen-gobierno-2021'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/word/CODIGO-DE-INTEGRIDAD.docx'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de Integridad y Buen Gobierno 2020', 'codigo-integridad-buen-gobierno-2020', 'Código de Integridad y Buen Gobierno – versión 2020 y su acto de adopción.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-01-01 12:00:00', 2, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'codigo-integridad-buen-gobierno-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-integridad-buen-gobierno-2020'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Codigo-de-Integridad-y-Buen-Gobierno-2020.pdf'), 0;
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-integridad-buen-gobierno-2020'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Res-0844-integridad-y-buen-gobierno.pdf'), 1;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Código de Buen Gobierno 2019', 'codigo-buen-gobierno-2019', 'Código de Buen Gobierno – versión 2019.', NULL, 'documento', 'Código de integridad y buen gobierno', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-01-01 12:00:00', 3, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'codigo-buen-gobierno-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='codigo-buen-gobierno-2019'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CODIGO%20BUEN%20GOBIERNO%20HSJG.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Integridad', 'politica-de-integridad', 'Política de Integridad de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'Políticas', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 4, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'politica-de-integridad');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='politica-de-integridad'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-INTEGRIDAD.pdf'), 0;
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='politica-de-integridad'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20INTEGRIDAD%202024.pdf'), 1;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de Transparencia, Acceso a la Información Pública y Lucha contra la Corrupción', 'politica-transparencia-lucha-corrupcion', 'Política institucional de transparencia, acceso a la información y lucha contra la corrupción.', NULL, 'documento', 'Políticas', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-01-01 12:00:00', 5, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'politica-transparencia-lucha-corrupcion');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='politica-transparencia-lucha-corrupcion'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-TRANSPARENCIA-ACCESO-A-LA-INFORMACION-PUBLICA-Y-LUCHA-CONTRA-LA-CORRUPCION.pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Protocolo para la declaración y gestión de conflictos de intereses, impedimentos y recusaciones', 'protocolo-conflictos-de-interes', 'Protocolo para declarar y gestionar conflictos de intereses, impedimentos y recusaciones.', NULL, 'documento', 'Conflictos de interés', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 6, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'protocolo-conflictos-de-interes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='protocolo-conflictos-de-interes'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PROTOCOLO%20PARA%20LA%20DECLARACI%C3%93N%20Y%20GESTI%C3%93N%20DE%20CONFLICTO%20DE%20INTERES%20E%20IMPEDIMENTOS%20Y%20REACUSACIONES%20V2%20(1).pdf'), 0;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Formato de declaración de situaciones de conflicto de intereses', 'formato-declaracion-conflicto-interes', 'Formato para declarar situaciones de conflicto de intereses.', NULL, 'documento', 'Conflictos de interés', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-01-01 12:00:00', 7, 'Micrositio de ética y transparencia (documentos institucionales)'
  FROM cms_paginas p WHERE p.slug = 'etica-y-transparencia'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x JOIN cms_paginas q ON q.id = x.pagina_id WHERE q.slug = 'etica-y-transparencia' AND x.slug = 'formato-declaracion-conflicto-interes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT (SELECT x.id FROM cms_entradas x JOIN cms_paginas q ON q.id=x.pagina_id WHERE q.slug='etica-y-transparencia' AND x.slug='formato-declaracion-conflicto-interes'),
       (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url='https://esehospitalguaviare.gov.co/resourses/archivos/pdf/05%20FORMATO%20DE%20DECLARACI%C3%93N%20DE%20SITUACIONES%20DE%20CONFLICTO%20DE%20INTERESES%20V1%20(1).pdf'), 0;
