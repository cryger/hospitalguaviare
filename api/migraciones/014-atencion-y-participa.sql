-- =====================================================================
-- 014 · Atención y servicios a la ciudadanía y Participa (portal anterior)
-- Agrega: Información para población vulnerable, Boletines de salud,
-- Perfil epidemiológico, Estrategia de participación ciudadana, PAAC,
-- Calendario de eventos, Normativas institucionales y Divulgación de resultados.
-- Contenido para Canales de atención, Transparencia 8 (grupos de interés)
-- y todas las secciones de Participa. No borra nada y no duplica.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Información para población vulnerable', 'informacion-para-poblacion-vulnerable', NULL, 'enlace', '/transparencia/informacion-especifica-para-grupos-de-interes', 4, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'informacion-para-poblacion-vulnerable');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Boletines de salud', 'boletines-de-salud', 'Boletines epidemiológicos, infografías y piezas informativas sobre fechas conmemorativas en salud.', 'listado', NULL, 5, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'boletines-de-salud');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Perfil epidemiológico', 'perfil-epidemiologico', 'Perfil epidemiológico institucional y boletines epidemiológicos trimestrales.', 'documentos', NULL, 6, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'atencion-y-servicios-a-la-ciudadania'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'perfil-epidemiologico');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Estrategia de participación ciudadana', 'estrategia-de-participacion-ciudadana', 'Cómo la E.S.E. articula a usuarios, familias, líderes y organizaciones en la planeación, el seguimiento y el control social.', 'contenido', NULL, 6, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'estrategia-de-participacion-ciudadana');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Plan Anticorrupción y de Atención al Ciudadano (PAAC)', 'plan-anticorrupcion-y-de-atencion-al-ciudadano', 'Acciones para prevenir la corrupción y mejorar la atención y el servicio a la ciudadanía.', 'contenido', NULL, 7, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'plan-anticorrupcion-y-de-atencion-al-ciudadano');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Calendario de eventos', 'calendario-de-participacion', NULL, 'enlace', '/transparencia/informacion-de-la-entidad/calendario-de-actividades-y-eventos', 8, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'calendario-de-participacion');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Normativas institucionales', 'normativas-institucionales', NULL, 'enlace', '/transparencia/normativa/normativa-de-la-entidad', 9, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'normativas-institucionales');
INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT n.menu_id, n.id, 'Divulgación de resultados', 'divulgacion-de-resultados', 'Avances y resultados de la gestión en el marco de la participación ciudadana.', 'contenido', NULL, 10, 1, 'publicada'
  FROM cms_paginas n WHERE n.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'divulgacion-de-resultados');
UPDATE cms_paginas SET descripcion = 'Solicite su cita, radique PQRSFD, pida copia de su historia clínica y consulte sus resultados de laboratorio.' WHERE slug = 'canales-de-atencion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Espacio para identificar y analizar las necesidades, expectativas y problemáticas de la comunidad en relación con los servicios de salud.' WHERE slug = 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'La comunidad participa en la definición de prioridades, la asignación de recursos y la formulación de planes y proyectos institucionales.' WHERE slug = 'planeacion-y-presupuesto-participativo' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Temas abiertos a consulta para que la comunidad aporte a las decisiones y políticas institucionales.' WHERE slug = 'consulta-ciudadana' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Co-creación de soluciones innovadoras a problemáticas de salud entre la institución, la comunidad y otros actores.' WHERE slug = 'colaboracion-e-innovacion-abierta' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes, audiencias públicas y mecanismos con los que la E.S.E. informa sobre su gestión, resultados y uso de recursos.' WHERE slug = 'rendicion-de-cuentas' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Espacios para que la comunidad conozca, vigile y evalúe la gestión institucional y el uso de los recursos públicos (Ley 850 de 2003 y Ley 1757 de 2015).' WHERE slug = 'control-social' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Información dirigida a niñas, niños y adolescentes, mujeres, grupos étnicos y poblaciones de atención diferencial.' WHERE slug = 'informacion-especifica-para-grupos-de-interes' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Enlaces seguros con información, juegos y orientación para niñas, niños y adolescentes.' WHERE slug = 'informacion-para-ninas-ninos-y-adolescentes' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Atención con enfoque diferencial para grupos étnicos, personas con discapacidad, personas adultas mayores y víctimas del conflicto armado.' WHERE slug = 'otros-grupos-de-interes' AND (descripcion IS NULL OR descripcion = '');

-- Biblioteca multimedia
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'E-ET-FO-01 FORMATO DE SOLICITUD DE COPIA DE HISTORIA CLINICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf', 'documento', 'application/pdf', 'Formato de solicitud de copia de historia clínica (E-ET-FO-01)', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'MANUAL DE MANEJO DE HISTORIA CLINICA (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(2).pdf', 'documento', 'application/pdf', 'Manual de manejo de historias clínicas', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'CARTA DE TRATO DIGNO REVISADA POR CALIDAD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf', 'documento', 'application/pdf', 'Carta de trato digno', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'infograma boletin III tri.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf', 'documento', 'application/pdf', 'Infografía del boletín epidemiológico – III trimestre de 2026', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFOGRAMA DE BOLETIN EPIDEMIOLOGICO III.png', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20III.png', 'imagen', 'image/png', 'Infografía del boletín epidemiológico – III trimestre de 2026', 'Infografía del boletín epidemiológico – III trimestre de 2026', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20III.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFOGRAMA DE BOLETIN EPIDEMIOLOGICO II.png', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20II.png', 'imagen', 'image/png', 'Infografía del boletín epidemiológico – II trimestre de 2026', 'Infografía del boletín epidemiológico – II trimestre de 2026', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20II.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFOGRAMA DE BOLETIN EPIDEMIOLOGICO.png', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO.png', 'imagen', 'image/png', 'Infografía del boletín epidemiológico – I trimestre de 2026', 'Infografía del boletín epidemiológico – I trimestre de 2026', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'PUBLICIDAD COMUNICACIÓN ASERTIVA E IDENTIDAD DEL SERVIDOR PÚBLICO.jpeg', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PUBLICIDAD%20COMUNICACI%C3%93N%20ASERTIVA%20E%20IDENTIDAD%20DEL%20SERVIDOR%20P%C3%9ABLICO.jpeg', 'imagen', 'image/jpeg', 'Boletín informativo – Comunicación asertiva e identidad del servidor público en salud', 'Boletín informativo – Comunicación asertiva e identidad del servidor público en salud', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PUBLICIDAD%20COMUNICACI%C3%93N%20ASERTIVA%20E%20IDENTIDAD%20DEL%20SERVIDOR%20P%C3%9ABLICO.jpeg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'BET-CUARTO-trimestre-2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf', 'documento', 'application/pdf', 'Boletín epidemiológico trimestral – IV trimestre de 2025', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'BOT_EPIDEMIOLOGICO.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/BOT_EPIDEMIOLOGICO.png', 'imagen', 'image/png', 'Boletín epidemiológico trimestral – IV trimestre de 2025', 'Boletín epidemiológico trimestral – IV trimestre de 2025', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/BOT_EPIDEMIOLOGICO.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'DÍA MUNDIAL DE PREVENCIÓN DEL CÁNCER DE CUELLO UTERINO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/D%C3%8DA%20MUNDIAL%20DE%20PREVENCI%C3%93N%20DEL%20C%C3%81NCER%20DE%20CUELLO%20UTERINO.pdf', 'documento', 'application/pdf', 'Día Mundial de Prevención del Cáncer de Cuello Uterino', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/D%C3%8DA%20MUNDIAL%20DE%20PREVENCI%C3%93N%20DEL%20C%C3%81NCER%20DE%20CUELLO%20UTERINO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'PREV_CANCER_UTERINO.jpeg', 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PREV_CANCER_UTERINO.jpeg', 'imagen', 'image/jpeg', 'Día Mundial de Prevención del Cáncer de Cuello Uterino', 'Día Mundial de Prevención del Cáncer de Cuello Uterino', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PREV_CANCER_UTERINO.jpeg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'Dia Internacional del Condon final.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dia%20Internacional%20del%20Condon%20final.pdf', 'documento', 'application/pdf', 'Día Internacional del Condón', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dia%20Internacional%20del%20Condon%20final.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'Dia Internacional del Condon final.jpeg', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/Dia%20Internacional%20del%20Condon%20final.jpeg', 'imagen', 'image/jpeg', 'Día Internacional del Condón', 'Día Internacional del Condón', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/Dia%20Internacional%20del%20Condon%20final.jpeg');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'VIH EN GESTANTES_3534543543.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/VIH%20EN%20GESTANTES_3534543543.pdf', 'documento', 'application/pdf', 'VIH en gestantes', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/VIH%20EN%20GESTANTES_3534543543.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'VIH EN GESTANTES_43543534.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/VIH%20EN%20GESTANTES_43543534.png', 'imagen', 'image/png', 'VIH en gestantes', 'VIH en gestantes', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/VIH%20EN%20GESTANTES_43543534.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'IVE (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/IVE%20(2).pdf', 'documento', 'application/pdf', 'Interrupción voluntaria del embarazo (IVE)', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/IVE%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'IVE.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/IVE.png', 'imagen', 'image/png', 'Interrupción voluntaria del embarazo (IVE)', 'Interrupción voluntaria del embarazo (IVE)', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/IVE.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'CANCER DE MAMA (2).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CANCER%20DE%20MAMA%20(2).pdf', 'documento', 'application/pdf', 'Prevención del cáncer de mama', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CANCER%20DE%20MAMA%20(2).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'CANCER DE MAMA.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CANCER%20DE%20MAMA.png', 'imagen', 'image/png', 'Prevención del cáncer de mama', 'Prevención del cáncer de mama', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CANCER%20DE%20MAMA.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'SALUD MATERNA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SALUD%20MATERNA.pdf', 'documento', 'application/pdf', 'Salud materna', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SALUD%20MATERNA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT '1000769940.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/1000769940.png', 'imagen', 'image/png', 'Salud materna', 'Salud materna', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/1000769940.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'La Hepatitis (1).png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/La%20Hepatitis%20(1).png', 'imagen', 'image/png', 'Día Mundial contra la Hepatitis', 'Día Mundial contra la Hepatitis', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/La%20Hepatitis%20(1).png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT '06 DÍA MUNDIAL DE LA ACTIVIDAD FÍSICA.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/06%20D%C3%8DA%20MUNDIAL%20DE%20LA%20ACTIVIDAD%20F%C3%8DSICA.png', 'imagen', 'image/png', 'Día Mundial de la Actividad Física', 'Día Mundial de la Actividad Física', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/06%20D%C3%8DA%20MUNDIAL%20DE%20LA%20ACTIVIDAD%20F%C3%8DSICA.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'AGUA.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/AGUA.png', 'imagen', 'image/png', 'Día Mundial del Agua', 'Día Mundial del Agua', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/AGUA.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'Día de la Mujer.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/D%C3%ADa%20de%20la%20Mujer.png', 'imagen', 'image/png', 'Día Internacional de la Mujer', 'Día Internacional de la Mujer', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/D%C3%ADa%20de%20la%20Mujer.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'CARDIOPATIAS.png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CARDIOPATIAS.png', 'imagen', 'image/png', 'Día Internacional de las Cardiopatías Congénitas', 'Día Internacional de las Cardiopatías Congénitas', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CARDIOPATIAS.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'MGF .png', 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/MGF%20.png', 'imagen', 'image/png', 'Día Internacional de Tolerancia Cero con la Mutilación Genital Femenina', 'Día Internacional de Tolerancia Cero con la Mutilación Genital Femenina', 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/MGF%20.png');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'perfil epi 2025 ESE HSJG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/perfil%20epi%202025%20ESE%20HSJG.pdf', 'documento', 'application/pdf', 'Perfil epidemiológico 2025 – E.S.E. Hospital San José del Guaviare', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/perfil%20epi%202025%20ESE%20HSJG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'BOLETIN II TRIMESTRE 2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BOLETIN%20II%20TRIMESTRE%202026.pdf', 'documento', 'application/pdf', 'Boletín epidemiológico – II trimestre de 2026', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BOLETIN%20II%20TRIMESTRE%202026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFORME DE PARTICIPACION CIUDADANA EN LA GESTIÓN DE LA ESE HOSPITAL SAN JOSE DEL GUAVIARE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20PARTICIPACION%20CIUDADANA%20EN%20LA%20GESTI%C3%93N%20DE%20LA%20ESE%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf', 'documento', 'application/pdf', 'Caja de herramientas del diagnóstico', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20PARTICIPACION%20CIUDADANA%20EN%20LA%20GESTI%C3%93N%20DE%20LA%20ESE%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'PLAN DE SEGURIDAD Y PRIVACIDAD DE LA INFORMACIÓN (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20SEGURIDAD%20Y%20PRIVACIDAD%20DE%20LA%20INFORMACI%C3%93N%20(1).pdf', 'documento', 'application/pdf', 'Plan de seguridad y privacidad de la información', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20SEGURIDAD%20Y%20PRIVACIDAD%20DE%20LA%20INFORMACI%C3%93N%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFORME DE GESTIÓN  2024.pdf', 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20%202024.pdf', 'documento', 'application/pdf', 'Informe de gestión 2024 – indicadores de gestión', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INFORME DE GESTION PRIMER TRIMESTRE VIGENCIA 2025..pdf', 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf', 'documento', 'application/pdf', 'Informe de gestión – primer trimestre de 2025', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de) SELECT 'INVITACION A PRESENTAR COTIZACION ALQUILER DE EQUIPOS DE COMPUTO, IMPRESIÓN Y FOTO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20ALQUILER%20DE%20EQUIPOS%20DE%20COMPUTO,%20IMPRESI%C3%93N%20Y%20FOTO.pdf', 'documento', 'application/pdf', 'Invitación a presentar cotización – alquiler de equipos de cómputo, impresión y fotocopiado', NULL, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20ALQUILER%20DE%20EQUIPOS%20DE%20COMPUTO,%20IMPRESI%C3%93N%20Y%20FOTO.pdf');

-- Entradas
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Solicite su cita – Consulta externa', 'solicite-su-cita', 'Agende su cita de consulta externa por WhatsApp.', '<p>Solicite su cita de <strong>consulta externa</strong> escribiéndonos por WhatsApp. Tenga a mano su documento de identidad, la orden médica o autorización de su EPS y un número de contacto.</p>
<ul>
<li><strong>WhatsApp de citas:</strong> <a href="https://wa.me/573102033803?text=Buenos%20d%C3%ADas%2C%20deseo%20solicitar%20una%20cita" target="_blank" rel="noopener">+57 310 203 3803</a></li>
</ul>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'solicite-su-cita');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Canales oficiales para PQRSFD', 'canales-oficiales-pqrsfd', 'Radique sus peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias.', '<p>Sus comentarios o manifestaciones relacionadas con la atención que se le brindó en nuestro hospital pueden ser radicados en alguno de los siguientes medios:</p>
<ul>
<li><strong>Módulo web:</strong> diligencie su PQRSFD en <a href="/pqrsf">el formulario en línea</a>.</li>
<li><strong>Correo electrónico:</strong> <a href="mailto:pqrs@esehospitalguaviare.gov.co">pqrs@esehospitalguaviare.gov.co</a></li>
<li><strong>Línea telefónica:</strong> <a href="tel:+573185689597">+57 318 568 9597</a></li>
<li><strong>Oficinas:</strong> Atención al Usuario y Ventanilla Única.</li>
<li><strong>Buzones:</strong> Consulta Externa, Ecografías, Laboratorio Clínico, Hospitalización, UCIM, Etnopabellón, Sala de Cirugía, Pediatría, Urgencias, Unidad Materno Infantil y Fisioterapia.</li>
</ul>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'canales-oficiales-pqrsfd');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Solicitud de copia de historia clínica', 'copia-de-historia-clinica', 'Descargue el formato, diligéncielo y envíelo por correo electrónico.', '<ol>
<li>Descargue el <strong>formato de solicitud de copia de historia clínica</strong> (E-ET-FO-01).</li>
<li>Diligéncielo completamente y fírmelo.</li>
<li>Envíelo al correo <a href="mailto:historiaclinica@esehospitalguaviare.gov.co">historiaclinica@esehospitalguaviare.gov.co</a> junto con la copia del documento de identidad.</li>
</ol>
<p>Consulte también el manual de manejo de historias clínicas de la entidad.</p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 2, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'copia-de-historia-clinica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'canales-de-atencion' WHERE e.slug = 'copia-de-historia-clinica' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(2).pdf'), 1 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'canales-de-atencion' WHERE e.slug = 'copia-de-historia-clinica' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/MANUAL%20DE%20MANEJO%20DE%20HISTORIA%20CLINICA%20(2).pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Encuestas de satisfacción', 'encuestas-de-satisfaccion', 'Cuéntenos cómo fue su experiencia en la institución.', '<p>Nuestro compromiso es brindar un servicio de salud de calidad y, para lograrlo, su opinión es de máxima importancia. La información que usted suministre se traducirá en beneficios para los usuarios y los servicios que presta la E.S.E. Hospital San José del Guaviare.</p>
<ul>
<li><strong>Encuesta de satisfacción:</strong> <a href="https://e.almeraim.com/survey?data=eyJhcGlrZXkiOiJlZDJkMDk3Y2JjYzQxYzhhZTVjMGYxMDI3OTUyZDQ5ZWY2ZWNkNmM0YTViNTk5NTIxZWNjOTk2NzVlZmMyZWJiIiwiY29ubmVjdGlvbiI6InNnaWVzZWhvc3BpdGFsZ3VhdmlhcmUiLCJlbmRwb2ludCI6Imh0dHBzJTNBJTJGJTJGc2dpLmFsbWVyYWltLmNvbSUyRnNnaSUyRmFwaSUyRnYyJTJGIiwiY29kZSI6Ik0tTUUtT1QtMDEifQ" target="_blank" rel="noopener">diligenciar la encuesta de satisfacción</a></li>
<li><strong>Encuesta de ambiente físico:</strong> <a href="https://e.almeraim.com/survey?data=eyJhcGlrZXkiOiIxZjcyZjU1MmIwM2NjZWYzMzZlZmNhMjBiY2RlYWIwZGY2YmE4ODQ4OTJiMDc4YzA1ODQ2M2E0N2QzY2I3ODQ4IiwiY29ubmVjdGlvbiI6InNnaWVzZWhvc3BpdGFsZ3VhdmlhcmUiLCJlbmRwb2ludCI6Imh0dHBzJTNBJTJGJTJGc2dpLmFsbWVyYWltLmNvbSUyRnNnaSUyRmFwaSUyRnYyJTJGIiwiY29kZSI6IiJ9" target="_blank" rel="noopener">diligenciar la encuesta de ambiente físico</a> (según el servicio donde fue atendido).</li>
</ul>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 3, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'encuestas-de-satisfaccion');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Carta de trato digno', 'carta-de-trato-digno', 'Derechos de los usuarios y medios dispuestos para garantizarlos.', '<p>Conozca la carta de trato digno de la E.S.E. Hospital San José del Guaviare: los derechos que le asisten como usuario y los canales dispuestos para garantizarlos.</p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 4, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'carta-de-trato-digno');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'canales-de-atencion' WHERE e.slug = 'carta-de-trato-digno' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Descarga de resultados de laboratorio', 'descarga-de-resultados', 'Consulte y descargue los resultados de sus exámenes.', '<p>Ingrese a la plataforma de resultados del laboratorio clínico para consultar y descargar sus exámenes.</p>
<ul><li><a href="http://177.93.49.210:9000/resultados/" target="_blank" rel="noopener">Ir a la plataforma de resultados</a></li></ul>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 5, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'canales-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'descarga-de-resultados');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Infografía del boletín epidemiológico – III trimestre de 2026', 'boletin-epidemiologico-iii-trimestre-2026', 'Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el tercer trimestre de 2026.', '<p>Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el tercer trimestre de 2026.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2026-10-16 12:00:00', 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletin-epidemiologico-iii-trimestre-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'boletin-epidemiologico-iii-trimestre-2026' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20III.png') WHERE e.slug = 'boletin-epidemiologico-iii-trimestre-2026' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Infografía del boletín epidemiológico – II trimestre de 2026', 'boletin-epidemiologico-ii-trimestre-2026', 'Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el segundo trimestre de 2026.', '<p>Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el segundo trimestre de 2026.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2026-06-30 12:00:00', 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletin-epidemiologico-ii-trimestre-2026');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO%20II.png') WHERE e.slug = 'boletin-epidemiologico-ii-trimestre-2026' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Infografía del boletín epidemiológico – I trimestre de 2026', 'boletin-epidemiologico-i-trimestre-2026', 'Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el primer trimestre de 2026.', '<p>Análisis consolidado del comportamiento de los principales eventos de interés en salud pública registrados durante el primer trimestre de 2026.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2026-06-29 12:00:00', 2, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletin-epidemiologico-i-trimestre-2026');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/INFOGRAMA%20DE%20BOLETIN%20EPIDEMIOLOGICO.png') WHERE e.slug = 'boletin-epidemiologico-i-trimestre-2026' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Boletín informativo – Comunicación asertiva e identidad del servidor público en salud', 'comunicacion-asertiva-e-identidad-del-servidor-publico', 'Capacitación para promover la atención humanizada, el trabajo en equipo y la identidad como servidores públicos del sector salud, orientada por una psicóloga especialista en SST de la ARL SURA.', '<p>Capacitación para promover la atención humanizada, el trabajo en equipo y la identidad como servidores públicos del sector salud, orientada por una psicóloga especialista en SST de la ARL SURA.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2026-04-10 12:00:00', 3, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'comunicacion-asertiva-e-identidad-del-servidor-publico');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PUBLICIDAD%20COMUNICACI%C3%93N%20ASERTIVA%20E%20IDENTIDAD%20DEL%20SERVIDOR%20P%C3%9ABLICO.jpeg') WHERE e.slug = 'comunicacion-asertiva-e-identidad-del-servidor-publico' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Boletín epidemiológico trimestral – IV trimestre de 2025', 'boletin-epidemiologico-iv-trimestre-2025', 'Describe y analiza el comportamiento de los eventos de interés en salud pública notificados durante octubre, noviembre y diciembre de 2025.', '<p>Describe y analiza el comportamiento de los eventos de interés en salud pública notificados durante octubre, noviembre y diciembre de 2025.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2026-01-16 12:00:00', 4, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletin-epidemiologico-iv-trimestre-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'boletin-epidemiologico-iv-trimestre-2025' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/BOT_EPIDEMIOLOGICO.png') WHERE e.slug = 'boletin-epidemiologico-iv-trimestre-2025' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Mundial de Prevención del Cáncer de Cuello Uterino', 'dia-mundial-prevencion-cancer-de-cuello-uterino', 'La prevención y el diagnóstico oportuno del cáncer de cuello uterino: vacunación contra el VPH y chequeos médicos regulares.', '<p>La prevención y el diagnóstico oportuno del cáncer de cuello uterino: vacunación contra el VPH y chequeos médicos regulares.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2025-03-26 12:00:00', 5, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-mundial-prevencion-cancer-de-cuello-uterino');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/D%C3%8DA%20MUNDIAL%20DE%20PREVENCI%C3%93N%20DEL%20C%C3%81NCER%20DE%20CUELLO%20UTERINO.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'dia-mundial-prevencion-cancer-de-cuello-uterino' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/D%C3%8DA%20MUNDIAL%20DE%20PREVENCI%C3%93N%20DEL%20C%C3%81NCER%20DE%20CUELLO%20UTERINO.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/img/PREV_CANCER_UTERINO.jpeg') WHERE e.slug = 'dia-mundial-prevencion-cancer-de-cuello-uterino' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Internacional del Condón', 'dia-internacional-del-condon', 'El condón es una herramienta segura, accesible y eficaz para prevenir infecciones de transmisión sexual y embarazos no planificados. ¡Infórmate, protégete y promueve el autocuidado!', '<p>El condón es una herramienta segura, accesible y eficaz para prevenir infecciones de transmisión sexual y embarazos no planificados. ¡Infórmate, protégete y promueve el autocuidado!</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2025-02-13 12:00:00', 6, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-internacional-del-condon');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dia%20Internacional%20del%20Condon%20final.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'dia-internacional-del-condon' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Dia%20Internacional%20del%20Condon%20final.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/Dia%20Internacional%20del%20Condon%20final.jpeg') WHERE e.slug = 'dia-internacional-del-condon' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'VIH en gestantes', 'vih-en-gestantes', 'El VIH puede transmitirse al tener relaciones sexuales sin protección, durante el embarazo, el parto o la lactancia, o al compartir agujas.', '<p>El VIH puede transmitirse al tener relaciones sexuales sin protección, durante el embarazo, el parto o la lactancia, o al compartir agujas.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-12-03 12:00:00', 7, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'vih-en-gestantes');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/VIH%20EN%20GESTANTES_3534543543.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'vih-en-gestantes' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/VIH%20EN%20GESTANTES_3534543543.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/VIH%20EN%20GESTANTES_43543534.png') WHERE e.slug = 'vih-en-gestantes' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Interrupción voluntaria del embarazo (IVE)', 'interrupcion-voluntaria-del-embarazo', 'La IVE está permitida sin restricciones hasta la semana 24 de gestación (Sentencia C-055 de 2022) y puede solicitarse al sector salud sin necesidad de justificar la decisión.', '<p>La IVE está permitida sin restricciones hasta la semana 24 de gestación (Sentencia C-055 de 2022) y puede solicitarse al sector salud sin necesidad de justificar la decisión.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-12-02 12:00:00', 8, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'interrupcion-voluntaria-del-embarazo');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/IVE%20(2).pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'interrupcion-voluntaria-del-embarazo' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/IVE%20(2).pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/IVE.png') WHERE e.slug = 'interrupcion-voluntaria-del-embarazo' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prevención del cáncer de mama', 'prevencion-del-cancer-de-mama', 'El 19 de octubre se conmemora el Día Mundial de la Lucha contra el Cáncer de Mama: entre más temprano se detecte, mayores son las posibilidades de éxito en el tratamiento.', '<p>El 19 de octubre se conmemora el Día Mundial de la Lucha contra el Cáncer de Mama: entre más temprano se detecte, mayores son las posibilidades de éxito en el tratamiento.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-10-17 12:00:00', 9, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prevencion-del-cancer-de-mama');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CANCER%20DE%20MAMA%20(2).pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'prevencion-del-cancer-de-mama' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CANCER%20DE%20MAMA%20(2).pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CANCER%20DE%20MAMA.png') WHERE e.slug = 'prevencion-del-cancer-de-mama' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Salud materna', 'salud-materna', 'Información para el cuidado de la salud de la madre durante la gestación, el parto y el posparto.', '<p>Información para el cuidado de la salud de la madre durante la gestación, el parto y el posparto.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-09-26 12:00:00', 10, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'salud-materna');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SALUD%20MATERNA.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' WHERE e.slug = 'salud-materna' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SALUD%20MATERNA.pdf');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/1000769940.png') WHERE e.slug = 'salud-materna' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Mundial contra la Hepatitis', 'dia-mundial-contra-la-hepatitis', 'Se estima que el 57 % de los casos de cirrosis hepática y el 78 % de los casos de cáncer primario de hígado son causados por los virus de la hepatitis B y C.', '<p>Se estima que el 57 % de los casos de cirrosis hepática y el 78 % de los casos de cáncer primario de hígado son causados por los virus de la hepatitis B y C.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-07-28 12:00:00', 11, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-mundial-contra-la-hepatitis');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/La%20Hepatitis%20(1).png') WHERE e.slug = 'dia-mundial-contra-la-hepatitis' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Mundial de la Actividad Física', 'dia-mundial-de-la-actividad-fisica', 'Moverse a diario es una de las mejores formas de cuidar la salud.', '<p>Moverse a diario es una de las mejores formas de cuidar la salud.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-04-06 12:00:00', 12, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-mundial-de-la-actividad-fisica');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/06%20D%C3%8DA%20MUNDIAL%20DE%20LA%20ACTIVIDAD%20F%C3%8DSICA.png') WHERE e.slug = 'dia-mundial-de-la-actividad-fisica' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Mundial del Agua', 'dia-internacional-del-agua', 'El agua es vida: cuidarla es responsabilidad de todos.', '<p>El agua es vida: cuidarla es responsabilidad de todos.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-03-22 12:00:00', 13, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-internacional-del-agua');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/AGUA.png') WHERE e.slug = 'dia-internacional-del-agua' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Internacional de la Mujer', 'dia-internacional-de-la-mujer', 'Una fecha que recuerda la lucha de las mujeres de todo el mundo por la igualdad, la justicia, la paz y el desarrollo.', '<p>Una fecha que recuerda la lucha de las mujeres de todo el mundo por la igualdad, la justicia, la paz y el desarrollo.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-03-08 12:00:00', 14, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-internacional-de-la-mujer');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/D%C3%ADa%20de%20la%20Mujer.png') WHERE e.slug = 'dia-internacional-de-la-mujer' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Internacional de las Cardiopatías Congénitas', 'dia-internacional-cardiopatias-congenitas', 'Información sobre las cardiopatías congénitas y la importancia de su detección temprana.', '<p>Información sobre las cardiopatías congénitas y la importancia de su detección temprana.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-02-14 12:00:00', 15, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'dia-internacional-cardiopatias-congenitas');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/CARDIOPATIAS.png') WHERE e.slug = 'dia-internacional-cardiopatias-congenitas' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Día Internacional de Tolerancia Cero con la Mutilación Genital Femenina', 'tolerancia-cero-mutilacion-genital-femenina', 'Una práctica que vulnera los derechos de niñas y mujeres y que debe erradicarse.', '<p>Una práctica que vulnera los derechos de niñas y mujeres y que debe erradicarse.</p>', 'noticia', 'publicada', 'E.S.E. Hospital San José del Guaviare', '2024-02-06 12:00:00', 16, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'boletines-de-salud'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'tolerancia-cero-mutilacion-genital-femenina');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'boletines-de-salud' SET e.imagen_destacada_id = (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/imgBoletines/MGF%20.png') WHERE e.slug = 'tolerancia-cero-mutilacion-genital-femenina' AND e.imagen_destacada_id IS NULL;
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Perfil epidemiológico 2025', 'perfil-epidemiologico-2025', 'Perfil epidemiológico de la E.S.E. Hospital San José del Guaviare.', NULL, 'documento', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'perfil-epidemiologico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'perfil-epidemiologico-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/perfil%20epi%202025%20ESE%20HSJG.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'perfil-epidemiologico' WHERE e.slug = 'perfil-epidemiologico-2025' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/perfil%20epi%202025%20ESE%20HSJG.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Boletines epidemiológicos 2026', 'boletines-epidemiologicos-2026', 'Boletines epidemiológicos trimestrales de la vigencia 2026.', NULL, 'documento', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'perfil-epidemiologico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletines-epidemiologicos-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'perfil-epidemiologico' WHERE e.slug = 'boletines-epidemiologicos-2026' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/infograma%20boletin%20III%20tri.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BOLETIN%20II%20TRIMESTRE%202026.pdf'), 1 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'perfil-epidemiologico' WHERE e.slug = 'boletines-epidemiologicos-2026' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BOLETIN%20II%20TRIMESTRE%202026.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Boletines epidemiológicos 2025', 'boletines-epidemiologicos-2025', 'Boletines epidemiológicos trimestrales de la vigencia 2025.', NULL, 'documento', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 2, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'perfil-epidemiologico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'boletines-epidemiologicos-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'perfil-epidemiologico' WHERE e.slug = 'boletines-epidemiologicos-2025' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/BET-CUARTO-trimestre-2025.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Información para población vulnerable', 'informacion-para-poblacion-vulnerable', 'Políticas e intervenciones para lograr la equidad en salud de los grupos en situación de mayor vulnerabilidad.', '<p>Conjunto de políticas e intervenciones sectoriales y transectoriales que buscan el reconocimiento de las diferencias sociales y, en consecuencia, la aplicación de medidas en favor de aquellos grupos sociales en los que esas diferencias significan desventaja o situación de mayor vulnerabilidad, encaminadas a lograr la equidad en salud en el marco de los derechos de sujetos y colectivos.</p>
<p>Las acciones transversales a las poblaciones que presentan mayor vulnerabilidad se enmarcan en los siguientes componentes:</p>
<ul>
<li><a href="/transparencia/informacion-especifica-para-grupos-de-interes/informacion-para-ninas-ninos-y-adolescentes">Niñas, niños y adolescentes</a></li>
<li><a href="/transparencia/informacion-especifica-para-grupos-de-interes/otros-grupos-de-interes">Grupos étnicos</a></li>
<li><a href="/transparencia/informacion-especifica-para-grupos-de-interes/otros-grupos-de-interes">Personas en situación de discapacidad, personas adultas mayores y personas víctimas del conflicto armado</a> (atención con enfoque diferencial)</li>
</ul>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'informacion-especifica-para-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informacion-para-poblacion-vulnerable');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Enlaces de interés para niñas, niños y adolescentes', 'enlaces-para-ninas-ninos-y-adolescentes', 'Experimentos, uso responsable de internet, protección y salud infantil.', '<h3>Experimentos para niños</h3>
<p>Aprende cómo realizar todo tipo de experimentos desde casa, con la ayuda de un adulto responsable. <a href="https://www.facebook.com/payasosdelaciencia" target="_blank" rel="noopener">Ingresa aquí</a></p>
<h3>En TIC confío</h3>
<p>En TIC confío enseña a usar las nuevas tecnologías e internet de forma responsable, al tiempo que previene a los usuarios sobre sus posibles riesgos. <a href="https://www.enticconfio.gov.co/" target="_blank" rel="noopener">Ingresa aquí</a></p>
<h3>Protección a la infancia y adolescencia – Policía Nacional</h3>
<p>La Policía Nacional integra el Sistema Nacional de Bienestar Familiar y tiene como misión garantizar la protección integral de los niños, niñas y adolescentes en el marco de las competencias que le asigna la ley. <a href="https://www.policia.gov.co/jefatura-nacional-del-servicio-de-policia/dipro/infancia-y-adolescencia/proteccion-integral-ninos-ninas-adolescentes" target="_blank" rel="noopener">Ingresa aquí</a></p>
<h3>Niños y niñas saludables</h3>
<p>Información de vital importancia proporcionada por el Ministerio de Salud y Protección Social. <a href="https://www.minsalud.gov.co/pais-protegido/home.html" target="_blank" rel="noopener">Ingresa aquí</a></p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'informacion-para-ninas-ninos-y-adolescentes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'enlaces-para-ninas-ninos-y-adolescentes');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Grupos étnicos', 'grupos-etnicos', 'Atención integral en salud con enfoque diferencial, intercultural y de respeto por la diversidad étnica y cultural del territorio.', '<h3>Enfoque diferencial étnico e intercultural</h3>
<p>La E.S.E. Hospital San José del Guaviare reconoce la diversidad étnica y cultural del departamento del Guaviare y promueve acciones orientadas a garantizar el acceso a los servicios de salud bajo principios de equidad, respeto por la diversidad cultural, participación comunitaria, interculturalidad y reconocimiento de los saberes propios.</p>
<p>El enfoque diferencial étnico busca que las acciones de promoción de la salud, prevención de la enfermedad, atención, rehabilitación y gestión del riesgo respondan a las características culturales, territoriales, sociales y comunitarias de los pueblos indígenas y demás grupos étnicos presentes en el territorio.</p>
<h3>¿Qué entendemos por enfoque diferencial étnico?</h3>
<p>Una perspectiva que permite reconocer las condiciones particulares de los pueblos y comunidades étnicas, con el propósito de eliminar barreras de acceso y garantizar una atención en salud pertinente, respetuosa y culturalmente adecuada.</p>
<ul>
<li><strong>Diversidad cultural:</strong> reconocimiento y respeto de las diferentes culturas, tradiciones, conocimientos y formas de vida.</li>
<li><strong>Atención humanizada:</strong> atención digna, respetuosa y libre de cualquier forma de discriminación.</li>
<li><strong>Equidad:</strong> acciones orientadas a disminuir las barreras que afectan el acceso a los servicios de salud.</li>
<li><strong>Interculturalidad:</strong> diálogo respetuoso entre los conocimientos del sistema de salud y los saberes propios.</li>
</ul>
<h3>Comunidades étnicas del territorio</h3>
<p>El departamento del Guaviare cuenta con una importante diversidad étnica y cultural, especialmente representada por pueblos indígenas, cuyas comunidades hacen parte fundamental del territorio y de la identidad cultural de la región. Las acciones institucionales promueven el diálogo permanente con las autoridades tradicionales, líderes comunitarios, organizaciones indígenas y demás representantes de las comunidades étnicas.</p>
<h3>Atención intercultural en salud</h3>
<ul>
<li><strong>Diálogo intercultural:</strong> espacios de comunicación y concertación entre el personal de salud, las autoridades tradicionales, líderes y comunidades.</li>
<li><strong>Acceso a los servicios:</strong> eliminación de barreras que dificulten el acceso de las comunidades étnicas a los servicios de salud.</li>
<li><strong>Reconocimiento de saberes propios:</strong> respeto por los conocimientos, prácticas tradicionales y formas propias de cuidado dentro del marco de la normatividad vigente.</li>
<li><strong>Participación comunitaria:</strong> participación de las comunidades en la identificación de necesidades y en la construcción de alternativas de atención.</li>
</ul>
<h3>Líneas de acción institucional</h3>
<ol>
<li><strong>Caracterización y diagnóstico:</strong> identificación de las principales necesidades y condiciones de salud de las comunidades étnicas, teniendo en cuenta aspectos sociales, culturales, territoriales y ambientales.</li>
<li><strong>Promoción de la salud y prevención de la enfermedad:</strong> educación para la salud, salud sexual y reproductiva, salud materno-infantil, vacunación, nutrición, salud mental, prevención de enfermedades transmisibles, hábitos de vida saludables y gestión del riesgo en salud.</li>
<li><strong>Formación del talento humano:</strong> enfoque diferencial étnico, derechos de las comunidades étnicas, atención y comunicación intercultural, prevención de la discriminación y respeto por los saberes tradicionales.</li>
<li><strong>Participación de las comunidades:</strong> espacios de diálogo con autoridades tradicionales, líderes indígenas, organizaciones comunitarias y demás actores relacionados con la atención en salud.</li>
</ol>
<h3>Articulación con las autoridades tradicionales</h3>
<p>La E.S.E. reconoce la importancia de las autoridades tradicionales y organizaciones representativas de las comunidades indígenas como actores fundamentales para el desarrollo de acciones de salud con pertinencia cultural: institución de salud, autoridades tradicionales, comunidad y entidades territoriales trabajando juntas.</p>
<h3>Salud propia e intercultural</h3>
<p>La salud de los pueblos indígenas comprende dimensiones individuales, familiares, comunitarias, territoriales, culturales y espirituales. Por esta razón, las acciones de atención en salud reconocen que las comunidades poseen conocimientos, prácticas y mecanismos propios para el cuidado de la salud, y la E.S.E. promueve espacios de diálogo intercultural que permitan avanzar hacia una atención integral y pertinente.</p>
<h3>Jornadas y acciones comunitarias</h3>
<p>Como parte de las estrategias de acercamiento a las comunidades se desarrollan jornadas de salud y actividades extramurales para poblaciones con barreras geográficas, culturales o sociales: valoraciones en salud, educación en salud, vacunación, salud oral, enfermería, promoción y prevención, orientación de rutas y participación comunitaria.</p>
<h3>Ruta de atención con enfoque diferencial</h3>
<ol>
<li><strong>Identificación:</strong> reconocimiento de la pertenencia étnica y de las necesidades particulares de la persona o comunidad.</li>
<li><strong>Orientación:</strong> información clara sobre los servicios disponibles y las rutas de atención.</li>
<li><strong>Atención:</strong> prestación del servicio bajo principios de calidad, seguridad, humanización y respeto por la diversidad.</li>
<li><strong>Articulación:</strong> coordinación con autoridades tradicionales, entidades territoriales, EPS y demás actores relacionados con la atención.</li>
<li><strong>Seguimiento:</strong> seguimiento de las situaciones identificadas y de las acciones requeridas para garantizar la continuidad de la atención.</li>
</ol>
<h3>Derechos de las comunidades étnicas en salud</h3>
<ul>
<li>Recibir una atención digna, respetuosa y sin discriminación.</li>
<li>Acceder a los servicios de salud con calidad y oportunidad.</li>
<li>Recibir información clara y comprensible.</li>
<li>Recibir atención con respeto por su identidad cultural y sus particularidades culturales.</li>
<li>Participar en los asuntos relacionados con su salud.</li>
<li>Recibir orientación sobre las rutas y servicios disponibles.</li>
</ul>
<p>La E.S.E. Hospital San José del Guaviare rechaza cualquier forma de discriminación relacionada con la pertenencia étnica o cultural.</p>
<h3>Información y orientación</h3>
<p>Para información, orientación o solicitudes relacionadas con la atención a comunidades étnicas, escriba a <a href="mailto:gbenlinea@esehospitalguaviare.gov.co">gbenlinea@esehospitalguaviare.gov.co</a> o utilice los <a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">canales de atención al ciudadano</a>.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'grupos-etnicos');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención con enfoque diferencial', 'atencion-con-enfoque-diferencial', 'Personas en situación de discapacidad, personas adultas mayores y personas víctimas del conflicto armado.', '<p>La E.S.E. Hospital San José del Guaviare reconoce la diversidad de las personas y las diferentes condiciones sociales, físicas, culturales y territoriales que pueden influir en el acceso a los servicios de salud. Por esta razón, promueve acciones orientadas a facilitar el acceso a la información, la atención humanizada, la orientación y la eliminación de barreras para las personas que requieren medidas de atención diferencial.</p>
<h3>Personas en situación de discapacidad</h3>
<p>La E.S.E. promueve condiciones de atención que contribuyan a disminuir las barreras de acceso a los servicios de salud y a la información institucional, fortaleciendo la accesibilidad física, comunicacional y tecnológica de acuerdo con las capacidades institucionales y las necesidades de las personas usuarias.</p>
<ul>
<li>Atención con trato digno y respetuoso.</li>
<li>Orientación para acceder a los servicios.</li>
<li>Identificación de barreras de acceso.</li>
<li>Fortalecimiento progresivo de la accesibilidad.</li>
</ul>
<h3>Personas adultas mayores</h3>
<p>La atención a las personas adultas mayores considera sus necesidades particulares, condiciones de movilidad, comunicación y acceso a los servicios. La institución promueve el trato digno, la orientación clara y el acompañamiento durante el acceso a los servicios.</p>
<ul>
<li>Información clara y comprensible.</li>
<li>Orientación sobre servicios disponibles.</li>
<li>Trato digno y respetuoso.</li>
<li>Identificación de necesidades de apoyo.</li>
</ul>
<h3>Personas víctimas del conflicto armado</h3>
<p>La E.S.E. reconoce las condiciones particulares de las personas que han sido afectadas por situaciones relacionadas con el conflicto armado y promueve una atención respetuosa, humanizada y libre de discriminación, orientándolas hacia los servicios de salud y los canales institucionales correspondientes.</p>
<ul>
<li>Orientación para el acceso a los servicios.</li>
<li>Atención con enfoque diferencial.</li>
<li>Trato digno y libre de discriminación.</li>
<li>Orientación hacia los canales institucionales.</li>
</ul>
<h3>Principios de atención</h3>
<ul>
<li><strong>Trato digno:</strong> atención respetuosa, humanizada y orientada a las necesidades de cada persona.</li>
<li><strong>Accesibilidad:</strong> promoción de condiciones que faciliten el acceso a la información y a los servicios.</li>
<li><strong>Equidad:</strong> reconocimiento de las diferencias y necesidades particulares de los usuarios.</li>
<li><strong>No discriminación:</strong> atención basada en el respeto por la dignidad y los derechos de las personas.</li>
</ul>
<h3>Canales de orientación</h3>
<ul>
<li><a href="/pqrsf">PQRSFD: peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias</a></li>
<li><a href="/transparencia/informacion-de-la-entidad/directorio-institucional">Correos institucionales (directorio)</a></li>
<li><a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">Canales de atención al ciudadano</a></li>
</ul>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'otros-grupos-de-interes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'atencion-con-enfoque-diferencial');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Participación ciudadana', 'participacion-ciudadana', 'Espacios, mecanismos y acciones de participación ciudadana en la gestión pública.', '<p>Aquí encontrará información sobre los espacios, mecanismos y acciones que la E.S.E. Hospital San José del Guaviare viene implementando en cumplimiento de la política de participación ciudadana en la gestión pública, con el propósito de fortalecer la vinculación de la ciudadanía y de los grupos de interés y de valor en las decisiones y acciones públicas, durante las fases del ciclo de la gestión pública (diagnóstico, formulación, implementación, evaluación y seguimiento).</p>
<p>Lo anterior, a partir de lo establecido en la Ley 1757 de 2015, la Ley 1712 de 2014, la Ley 489 de 1998, el Decreto 1499 de 2017, la Resolución 1519 de 2020 del Ministerio de Tecnologías de la Información y las Comunicaciones, así como los lineamientos del Departamento Administrativo de la Función Pública.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'participacion-ciudadana');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Caja de herramientas del diagnóstico', 'caja-de-herramientas-del-diagnostico', 'Guía para que la ciudadanía identifique necesidades y problemas relacionados con los servicios de salud.', '<p>Documento guía que orienta a la ciudadanía en la identificación de necesidades y problemas relacionados con los servicios de salud, como parte de la fase de diagnóstico participativo de la E.S.E. Hospital San José del Guaviare.</p>
<h3>Objetivo del ejercicio</h3>
<p>Facilitar la participación ciudadana mediante herramientas metodológicas que permitan recoger opiniones, percepciones y propuestas de mejora sobre la prestación de los servicios de salud, garantizando la inclusión de todos los grupos de interés.</p>
<h3>Paso a paso para participar</h3>
<ol>
<li>Descargue la <strong>Caja de herramientas del diagnóstico</strong> (PDF).</li>
<li>Lea las instrucciones y los ejemplos incluidos en el documento.</li>
<li>Complete el formulario <a href="https://forms.office.com/r/gSgaykKEqt?origin=lprLink" target="_blank" rel="noopener">Opinar en línea</a> o envíe sus aportes al correo institucional dispuesto para la participación.</li>
<li>Consulte la <a href="/politicas-de-privacidad">política de tratamiento de datos</a> antes de enviar su información.</li>
</ol>
<h3>Canal de soporte</h3>
<p>Si tiene dudas o desea ampliar la información, escriba a <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a>.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'participa'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'caja-de-herramientas-del-diagnostico');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20PARTICIPACION%20CIUDADANA%20EN%20LA%20GESTI%C3%93N%20DE%20LA%20ESE%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'participa' WHERE e.slug = 'caja-de-herramientas-del-diagnostico' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20PARTICIPACION%20CIUDADANA%20EN%20LA%20GESTI%C3%93N%20DE%20LA%20ESE%20HOSPITAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20SEGURIDAD%20Y%20PRIVACIDAD%20DE%20LA%20INFORMACI%C3%93N%20(1).pdf'), 1 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'participa' WHERE e.slug = 'caja-de-herramientas-del-diagnostico' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20DE%20SEGURIDAD%20Y%20PRIVACIDAD%20DE%20LA%20INFORMACI%C3%93N%20(1).pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Principales procedimientos para el diagnóstico de necesidades', 'procedimientos-diagnostico-de-necesidades', 'Procesos de diagnóstico participativo, sus fechas y estado.', '<table><thead><tr><th scope="col">Subtema / proceso</th><th scope="col">Descripción</th><th scope="col">Fecha de inicio</th><th scope="col">Fecha final</th><th scope="col">Estado</th></tr></thead><tbody><tr><td><a href="https://forms.office.com/r/jdCiTQz6zS?origin=lprLink" target="_blank" rel="noopener">Diagnóstico participativo de necesidades en salud 2024</a></td><td>Identificación y priorización de problemáticas en salud mediante consulta ciudadana</td><td>15/01/2024</td><td>15/03/2024</td><td>Completado</td></tr>
<tr><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GESTION%20SEGUNDO%20TRIMESTRE%202025.pdf" target="_blank" rel="noopener">Informe de gestión – segundo trimestre 2025</a></td><td>Informe de gestión en la prestación de los servicios de salud</td><td>01/02/2024</td><td>31/03/2024</td><td>Completado</td></tr>
<tr><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/08%20PROGRAMA%20DE%20HUMANIZACI%C3%93N%20EN%20LA%20ATENCI%C3%93N%20EN%20SALUD%20COMPLETO.pdf" target="_blank" rel="noopener">Programa de humanización en la atención en salud</a></td><td>Consolidación de una cultura de humanización que permita mejorar los servicios de salud</td><td>10/03/2024</td><td>10/05/2024</td><td>Completado</td></tr>
<tr><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PETI%20Hospital%20San%20Jos%C3%A9%20del%20Guaviare%20V2.docx.pdf" target="_blank" rel="noopener">Plan Estratégico de Tecnologías de la Información (PETI)</a></td><td>Participación ciudadana en la formulación del plan estratégico de tecnologías y comunicaciones</td><td>01/04/2024</td><td>30/06/2024</td><td>Completado</td></tr>
<tr><td><a href="https://esehospitalguaviare.gov.co/documentos/foros/mejora-tiempos-espera-2024.pdf" target="_blank" rel="noopener">Foros virtuales – Mejora de tiempos de espera</a></td><td>Discusión comunitaria sobre estrategias para optimizar los tiempos de atención</td><td>15/05/2024</td><td>15/07/2024</td><td>Completado</td></tr>
<tr><td><a href="https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-23/" target="_blank" rel="noopener">Audiencia pública de rendición de cuentas 2023</a></td><td>Presentación de resultados de gestión y espacio para preguntas de la comunidad</td><td>20/02/2024</td><td>20/02/2024</td><td>Completado</td></tr>
<tr><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-MANTENIMIENTO-VIGENCIA-2021-%20(1).pdf" target="_blank" rel="noopener">Consulta previa – Ampliación de servicios y mejora de la infraestructura</a></td><td>Participación comunitaria en el proyecto de expansión de la infraestructura hospitalaria</td><td>01/06/2024</td><td>31/08/2024</td><td>Completado</td></tr>
<tr><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO.pdf" target="_blank" rel="noopener">Política de servicio al ciudadano</a></td><td>Diseño y puesta en marcha del programa PNSC</td><td>10/04/2024</td><td>10/06/2024</td><td>Completado</td></tr>
<tr><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%201ER%20TRIMESTRE%20ENERO-MARZO%202025..pdf" target="_blank" rel="noopener">Informe de gestión PQRSF – primer trimestre 2025</a></td><td>Análisis estadístico de peticiones, quejas, reclamos, sugerencias y felicitaciones recibidas</td><td>15/01/2025</td><td>15/03/2025</td><td>Completado</td></tr>
<tr><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-PARTICIPACION-CIUDADANA.pdf" target="_blank" rel="noopener">Política de participación ciudadana</a></td><td>Documento marco que establece los lineamientos para la participación comunitaria</td><td>01/01/2024</td><td>31/12/2025</td><td>Vigente</td></tr></tbody></table>
<p>¿Quiere aportar? Diligencie la <a href="https://forms.office.com/r/gSgaykKEqt?origin=lprLink" target="_blank" rel="noopener">encuesta de participación</a> o consulte las <a href="/noticias">noticias institucionales</a>.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procedimientos-diagnostico-de-necesidades');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planeación y presupuesto participativo', 'planeacion-participativa-2025', 'Componentes del proceso, calendario de hitos 2025 y decisiones adoptadas a partir de aportes ciudadanos.', '<h3>Componentes del proceso</h3>
<ul>
<li>Asambleas ciudadanas para priorización de proyectos.</li>
<li>Presupuesto participativo con enfoque en salud.</li>
<li>Planificación estratégica con participación comunitaria.</li>
<li>Control y seguimiento ciudadano a la ejecución.</li>
<li>Rendición de cuentas sobre el uso de recursos.</li>
</ul>
<h3>Calendario de hitos del plan de participación ciudadana 2025</h3>
<p>Con el objetivo de fomentar la transparencia y la participación de la comunidad en la gestión institucional, la Oficina de Gobierno Digital publica las fechas clave del proceso de planeación participativa y presupuestaria.</p>
<table><thead><tr><th scope="col">Etapa / actividad</th><th scope="col">Descripción</th><th scope="col">Fecha estimada</th><th scope="col">Responsable</th></tr></thead><tbody><tr><td>Convocatoria de participación ciudadana</td><td>Publicación de la invitación para recepción de propuestas y aportes ciudadanos.</td><td>15 al 31 de enero de 2025</td><td>Oficina de Gobierno Digital</td></tr>
<tr><td>Recepción y consolidación de aportes</td><td>Revisión de las observaciones y propuestas recibidas por los canales habilitados.</td><td>1 al 28 de febrero de 2025</td><td>Oficina de Planeación</td></tr>
<tr><td>Mesas de diálogo y socialización</td><td>Espacios presenciales y virtuales con la comunidad para discutir propuestas.</td><td>10 al 20 de marzo de 2025</td><td>Coordinación de Participación Social</td></tr>
<tr><td>Integración de aportes al plan institucional</td><td>Incorporación de las sugerencias viables al Plan de Acción y Presupuesto.</td><td>1 al 15 de abril de 2025</td><td>Oficina Asesora de Planeación</td></tr>
<tr><td>Publicación del plan ajustado</td><td>Publicación en la página web institucional del documento final.</td><td>30 de abril de 2025</td><td>Oficina de Gobierno Digital</td></tr>
<tr><td>Seguimiento y evaluación de compromisos</td><td>Monitoreo del cumplimiento de los compromisos y acciones adoptadas.</td><td>Mayo a diciembre de 2025</td><td>Comité de Seguimiento Institucional</td></tr></tbody></table>
<h3>Decisiones adoptadas a partir de aportes ciudadanos</h3>
<p>Decisiones institucionales adoptadas como resultado de los procesos de participación ciudadana, planeación participativa y presupuesto participativo, que demuestran el impacto de las contribuciones de la comunidad en la gestión hospitalaria.</p>
<table><thead><tr><th scope="col">Decisión adoptada</th><th scope="col">Fecha de aprobación</th><th scope="col">Responsable</th><th scope="col">Acta / acto administrativo</th><th scope="col">Origen del aporte</th></tr></thead><tbody><tr><td><strong>Ampliación de horarios de servicio</strong><br>Extensión de la atención los sábados en la mañana, respondiendo a solicitud ciudadana.</td><td>15/03/2024</td><td>Oficina de Planeación</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20RACIONALIZACI%C3%93N.pdf" target="_blank" rel="noopener">Política de racionalización</a></td><td>Consulta pública – Diagnóstico participativo 2024</td></tr>
<tr><td><strong>Reasignación presupuestal para mejora de señalización</strong><br>Destinación de $85 millones para señalización interna y externa del hospital.</td><td>28/02/2024</td><td>Oficina de Planeación</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICAS%20GESTION%20PRESUPUESTAL%20Y%20EFICIENCIA%20DEL%20GASTO%20PUBLICO.pdf" target="_blank" rel="noopener">Política de gestión presupuestal</a></td><td>Mesas de trabajo – Humanización de servicios</td></tr>
<tr><td><strong>Ajuste de metas del Plan de Acción 2024</strong><br>Inclusión de 3 nuevas metas relacionadas con telemedicina y atención domiciliaria.</td><td>10/04/2024</td><td>Dirección General</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/excel/Copia%20de%20Plan%20Accion%20Vg%202024.xlsx" target="_blank" rel="noopener">Plan de Acción – vigencia 2024</a></td><td>Planeación participativa – Plan de desarrollo</td></tr>
<tr><td><strong>Programa de acompañamiento a adultos mayores</strong><br>Implementación de ruta preferencial para pacientes geriátricos.</td><td>05/03/2024</td><td>Coordinación de Proyectos Sociales</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO.pdf" target="_blank" rel="noopener">Política de servicio al ciudadano</a></td><td>Encuesta grupos vulnerables 2024</td></tr>
<tr><td><strong>Gestión de suministros y almacén</strong><br>Adquirir, distribuir y legalizar insumos y equipos biomédicos de manera efectiva mediante el plan de compras anual.</td><td>18/01/2024</td><td>Técnico de suministros</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20suministros.pdf" target="_blank" rel="noopener">Gestión de suministros y almacén</a></td><td>Gestión de suministros y almacén</td></tr>
<tr><td><strong>Plan Institucional de Capacitación</strong><br>Programa de formación continua en trato humanizado.</td><td>12/04/2024</td><td>Talento Humano</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-Institucional-de-Capacitacion-2020.pdf" target="_blank" rel="noopener">Plan Institucional de Capacitación 2020</a></td><td>Audiencia pública de rendición de cuentas</td></tr></tbody></table>
<h3>Seguimiento a las decisiones</h3>
<table><thead><tr><th scope="col">Decisión</th><th scope="col">Estado</th><th scope="col">Avance</th><th scope="col">Próxima actualización</th></tr></thead><tbody><tr><td>Mejoramiento de la infraestructura hospitalaria para el área de urgencias (obra)</td><td>En ejecución</td><td>40 %</td><td>15/11/2025</td></tr>
<tr><td>Ruta cultural comunitaria (programa)</td><td>Planificado</td><td>20 %</td><td>01/12/2025</td></tr>
<tr><td>Proyecto de reasignación presupuestal</td><td>Retrasado</td><td>8 %</td><td>10/01/2026</td></tr></tbody></table>
<p><small>Última actualización: 7 de noviembre de 2025.</small></p>
<p>Estas decisiones representan el compromiso de la E.S.E. con la participación ciudadana efectiva: cada una surge de procesos de consulta, diálogo y construcción colectiva con la comunidad.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'planeacion-y-presupuesto-participativo'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'planeacion-participativa-2025');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta ciudadana', 'temas-abiertos-a-consulta', 'Temas abiertos a consulta y compromiso institucional con los aportes recibidos.', '<p>La <strong>E.S.E. Hospital San José del Guaviare</strong>, en el marco de su compromiso con la participación ciudadana y la transparencia, pone a disposición este espacio para promover la consulta ciudadana. Este mecanismo busca que la comunidad, los usuarios, trabajadores y grupos de interés participen activamente en la toma de decisiones, en la construcción de políticas institucionales y en la mejora continua de la calidad de los servicios de salud.</p>
<p>Cada comentario recibido será revisado por el Comité de Gobierno Digital y los responsables de planeación institucional, con el propósito de garantizar una gestión más incluyente y participativa.</p>
<h3>Temas abiertos a consulta</h3>
<ul>
<li><strong>Actualización del Plan de Acción Institucional:</strong> observaciones sobre los programas y proyectos prioritarios del próximo año. Fecha límite: 15 de diciembre de 2025.</li>
<li><strong>Diseño de la Política de Innovación y Transformación Digital:</strong> ideas para fortalecer el uso de tecnologías que mejoren la atención y los servicios de salud. Fecha límite: 31 de enero de 2026.</li>
<li><strong>Plan Estratégico de Participación Ciudadana:</strong> percepciones sobre los mecanismos de participación actuales y nuevas estrategias de acercamiento con la ciudadanía. Fecha límite: 28 de febrero de 2026.</li>
</ul>
<p><a href="https://forms.office.com/r/jdCiTQz6zS?origin=lprLink" target="_blank" rel="noopener">Participar en la consulta</a></p>
<h3>Compromiso institucional</h3>
<p>Los aportes recibidos serán sistematizados y analizados por el equipo técnico del hospital. Posteriormente se publicará un informe con los resultados y las decisiones adoptadas en función de las observaciones ciudadanas.</p>
<p>Este proceso forma parte de la estrategia de Gobierno Abierto y Transparencia Activa, en cumplimiento de la Ley 1712 de 2014 y la Política de Participación Ciudadana en la Gestión Pública.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'consulta-ciudadana'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'temas-abiertos-a-consulta');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reto de Innovación Tecnológica', 'reto-de-innovacion-tecnologica', 'Convocatoria para proponer soluciones tecnológicas que fortalezcan la transformación digital del hospital.', '<p>La E.S.E. Hospital San José del Guaviare, a través de su <strong>Oficina de Gobierno Digital</strong>, invita al personal asistencial, administrativo y a la comunidad hospitalaria a participar en el <strong>Reto de Innovación Tecnológica 2025</strong>.</p>
<p>Este espacio busca recoger ideas, propuestas y soluciones tecnológicas que contribuyan a fortalecer la transformación digital, optimizar los procesos institucionales, mejorar la atención al usuario y promover una cultura de innovación dentro del hospital. Todas las ideas serán analizadas por el Comité de Innovación y Gobierno Digital para su evaluación y posible implementación.</p>
<ul>
<li><strong>Acceso al reto:</strong> <a href="https://forms.office.com/r/SxTtFtTk38?origin=lprLink" target="_blank" rel="noopener">regístrese en el Reto de Innovación Tecnológica</a></li>
<li><strong>Plazo para participar:</strong> hasta el 15 de diciembre de 2025.</li>
<li><strong>Contacto:</strong> <a href="mailto:gbenlinea@esehospitalguaviare.gov.co">gbenlinea@esehospitalguaviare.gov.co</a> – Oficina de Gobierno Digital.</li>
</ul>
<p>En caso de ser seleccionada su propuesta, recibirá comunicación directa en el correo electrónico registrado. Consulte también la sección de <a href="/transparencia/datos-abiertos">datos abiertos</a> y responda la <a href="https://forms.office.com/r/p8FpNNr6Gt?origin=lprLink" target="_blank" rel="noopener">encuesta de satisfacción</a>.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'colaboracion-e-innovacion-abierta'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reto-de-innovacion-tecnologica');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Mecanismos de rendición de cuentas', 'mecanismos-de-rendicion-de-cuentas', 'Informes de gestión periódicos, audiencias públicas, indicadores de gestión e informes financieros.', '<p>Proceso mediante el cual la institución informa a la ciudadanía sobre su gestión, resultados y uso de recursos, promoviendo la transparencia y la confianza.</p>
<ul>
<li>Informes de gestión periódicos.</li>
<li>Audiencias públicas de rendición de cuentas.</li>
<li><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20%202024.pdf" target="_blank" rel="noopener">Publicación de indicadores de gestión</a></li>
<li><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf" target="_blank" rel="noopener">Informes financieros</a></li>
<li>Espacios de diálogo con la comunidad.</li>
</ul>', 'documento', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'mecanismos-de-rendicion-de-cuentas');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20%202024.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas' WHERE e.slug = 'mecanismos-de-rendicion-de-cuentas' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20%202024.pdf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf'), 1 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'rendicion-de-cuentas' WHERE e.slug = 'mecanismos-de-rendicion-de-cuentas' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION%20PRIMER%20TRIMESTRE%20VIGENCIA%202025..pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Audiencia pública de rendición de cuentas – vigencia 2024', 'audiencia-publica-rendicion-de-cuentas-2024', 'Grabación de la audiencia pública de rendición de cuentas de la vigencia 2024.', '<p>Vea la grabación de la audiencia pública de rendición de cuentas de la vigencia 2024 de la E.S.E. Hospital San José del Guaviare: <a href="https://www.youtube.com/watch?v=ObbPeLG23pU" target="_blank" rel="noopener">ver video en YouTube</a>.</p>
<p>Consulte también la <a href="https://www.esehospitalguaviare.gov.co/rendicion-de-cuentas-23/" target="_blank" rel="noopener">audiencia pública de rendición de cuentas 2023</a>.</p>', 'documento', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'rendicion-de-cuentas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'audiencia-publica-rendicion-de-cuentas-2024');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Registro de observaciones ciudadanas', 'registro-de-observaciones-ciudadanas', 'Observaciones recibidas, decisión institucional y evidencia.', '<table><thead><tr><th scope="col">Fecha</th><th scope="col">Tema</th><th scope="col">Observación ciudadana</th><th scope="col">Decisión institucional</th><th scope="col">Estado</th><th scope="col">Evidencia</th></tr></thead><tbody><tr><td>06/03/1992</td><td>Atención al usuario</td><td>Decreto 412 de 1992</td><td>Por el cual se reglamentan parcialmente los servicios de urgencias y se dictan otras disposiciones.</td><td>Atendida</td><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Decreto_412_de_1992_Normas_urgencias_.pdf" target="_blank" rel="noopener">Ver decreto</a></td></tr>
<tr><td>12/09/2025</td><td>Infraestructura</td><td>Inconformidad por deterioro de áreas comunes.</td><td>Aprobación del plan de mantenimiento locativo 2025–2026.</td><td>En trámite</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN-DE-MANTENIMIENTO-VIGENCIA-2021-%20(1).pdf" target="_blank" rel="noopener">Ver evidencia</a></td></tr>
<tr><td>20/07/2025</td><td>Comunicación</td><td>Solicitud de mejora en los canales de información.</td><td>Implementación del boletín institucional mensual.</td><td>Atendida</td><td><a href="https://www.esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-Estrategico-de-Tecnologias-de-la-Informacion-PETI-2021-1.pdf" target="_blank" rel="noopener">Ver documento</a></td></tr></tbody></table>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'control-social'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'registro-de-observaciones-ciudadanas');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Modalidades de control social', 'modalidades-de-control-social', 'Gestión institucional, contratación, programas y proyectos, y planeación y presupuesto participativo.', '<p>El control social es el mecanismo mediante el cual la ciudadanía ejerce su derecho a participar en la vigilancia, seguimiento y evaluación de la gestión pública. Fortalece la transparencia institucional, fomenta la corresponsabilidad y construye confianza entre la entidad y la comunidad.</p>
<h3>1. Control social a la gestión institucional</h3>
<ul>
<li><strong>¿Qué es?</strong> Participación ciudadana orientada a evaluar el desempeño general de la entidad, su cumplimiento de metas y la calidad de los servicios prestados.</li>
<li><strong>Momento de aplicación:</strong> Durante la planeación anual, la ejecución de proyectos y los procesos de rendición de cuentas.</li>
<li><strong>¿Cómo participa la ciudadanía?</strong> A través de audiencias, reuniones comunitarias y encuestas de percepción.</li>
<li><strong>Enfoque principal:</strong> Evaluar la gestión institucional y promover la mejora continua en la atención al usuario.</li>
<li><strong>Canales disponibles:</strong> audiencias públicas de rendición de cuentas; correo <a href="mailto:contacto@esehospitalguaviare.gov.co">contacto@esehospitalguaviare.gov.co</a>; formulario de participación ciudadana en la web.</li>
</ul><h3>2. Control social a la contratación</h3>
<ul>
<li><strong>¿Qué es?</strong> Mecanismo que permite conocer, analizar y hacer seguimiento a los procesos de contratación de la entidad.</li>
<li><strong>Momento de aplicación:</strong> Desde la publicación del proceso en el SECOP hasta la ejecución y cierre del contrato.</li>
<li><strong>¿Cómo participa la ciudadanía?</strong> Consultando los procesos en SECOP y emitiendo observaciones o recomendaciones sobre los contratos publicados.</li>
<li><strong>Enfoque principal:</strong> Transparencia y control ciudadano sobre el uso de los recursos públicos.</li>
<li><strong>Canales disponibles:</strong> portal <a href="https://www.colombiacompra.gov.co/" target="_blank" rel="noopener">SECOP</a>; correo <a href="mailto:planeacion@esehospitalguaviare.gov.co">planeacion@esehospitalguaviare.gov.co</a>; Ventanilla Única de Atención al Ciudadano.</li>
</ul><h3>3. Control social a programas y proyectos</h3>
<ul>
<li><strong>¿Qué es?</strong> Vigilancia ciudadana sobre los programas y proyectos del hospital orientados a mejorar la atención y el bienestar comunitario.</li>
<li><strong>Momento de aplicación:</strong> Durante todas las fases: formulación, ejecución y evaluación.</li>
<li><strong>¿Cómo participa la ciudadanía?</strong> Integrándose en veedurías, asistiendo a reuniones de seguimiento o presentando observaciones sobre la ejecución.</li>
<li><strong>Enfoque principal:</strong> Corresponsabilidad ciudadana y mejora de los programas de salud.</li>
<li><strong>Canales disponibles:</strong> comités de veeduría ciudadana en salud; Oficina de Participación Social y Atención al Usuario; correo <a href="mailto:participacion@esehospitalguaviare.gov.co">participacion@esehospitalguaviare.gov.co</a>.</li>
</ul><h3>4. Control social a la planeación y presupuesto participativo</h3>
<ul>
<li><strong>¿Qué es?</strong> Proceso mediante el cual la comunidad participa en la definición de prioridades y en la asignación de recursos institucionales.</li>
<li><strong>Momento de aplicación:</strong> Durante la elaboración del Plan de Acción y del presupuesto anual, y en su seguimiento.</li>
<li><strong>¿Cómo participa la ciudadanía?</strong> Asistiendo a espacios de planeación participativa o enviando aportes por medios digitales.</li>
<li><strong>Enfoque principal:</strong> Decisiones colectivas sobre la asignación de recursos públicos.</li>
<li><strong>Canales disponibles:</strong> mesas de planeación participativa; encuestas en línea sobre priorización de proyectos; correo <a href="mailto:planeacion@esehospitalguaviare.gov.co">planeacion@esehospitalguaviare.gov.co</a>.</li>
</ul>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 1, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'control-social'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'modalidades-de-control-social');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Convocatoria de vigilancia ciudadana', 'convocatoria-de-vigilancia-ciudadana', 'Alquiler de equipos de cómputo, impresión y fotocopiado multifuncionales y de función simple.', '<ul>
<li><strong>Objeto:</strong> la E.S.E. Hospital San José del Guaviare tiene la necesidad de contratar el “Alquiler de equipos de cómputo, impresión y fotocopiado multifuncionales y de función simple”.</li>
<li><strong>Alcance:</strong> invita a ciudadanos, veedurías, asociaciones y organizaciones sociales interesadas en ejercer control social sobre la ejecución del contrato.</li>
<li><strong>Estado actual:</strong> abierta.</li>
</ul>
<h3>Cronograma</h3>
<ul>
<li><strong>Publicación de la convocatoria:</strong> 12 de agosto de 2025.</li>
<li><strong>Inscripciones de participantes:</strong> del 12 al 25 de noviembre de 2025.</li>
<li><strong>Reunión de socialización del contrato:</strong> 27 de noviembre de 2025.</li>
<li><strong>Seguimiento y observaciones ciudadanas:</strong> del 28 de noviembre al 30 de diciembre de 2025.</li>
</ul>
<h3>Requisitos</h3>
<ul>
<li>Carta de presentación de la propuesta.</li>
<li>Consentimiento de verificación de antecedentes.</li>
<li>Certificado de existencia y representación legal o acto jurídico de creación de la entidad ejecutora, con fecha de expedición no mayor a 60 días.</li>
<li>Copia legible de la cédula de ciudadanía del representante legal o de la persona natural.</li>
<li>Certificados con fecha de expedición no mayor a 30 días: antecedentes fiscales, disciplinarios y judiciales, Registro Nacional de Medidas Correctivas (RNMC) y Registro de Deudores Alimentarios Morosos (REDAM).</li>
<li>Registro Único Tributario (RUT) actualizado.</li>
<li>Certificado de manifestación de inhabilidades e incompatibilidades.</li>
<li>Carta de compromiso anticorrupción.</li>
<li>Copia de un contrato ejecutado y/o un acta de liquidación con objeto igual o similar al que se va a contratar.</li>
<li>Certificación bancaria.</li>
</ul>
<h3>Requisitos específicos</h3>
<p>Hoja de vida del técnico encargado de los mantenimientos preventivos y correctivos de las impresoras, con certificado de estudios técnicos en instalación de equipos informáticos o afines, y sus certificados de antecedentes fiscales, disciplinarios y judiciales, RNMC, inhabilidad por delitos sexuales y REDAM, con fecha de expedición no mayor a 30 días.</p>
<h3>Responsable institucional</h3>
<p>Subgerencia Administrativa y Financiera – <a href="mailto:subadmin@esehospitalguaviare.gov.co">subadmin@esehospitalguaviare.gov.co</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 2, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'control-social'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'convocatoria-de-vigilancia-ciudadana');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden) SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20ALQUILER%20DE%20EQUIPOS%20DE%20COMPUTO,%20IMPRESI%C3%93N%20Y%20FOTO.pdf'), 0 FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'control-social' WHERE e.slug = 'convocatoria-de-vigilancia-ciudadana' AND EXISTS (SELECT 1 FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20ALQUILER%20DE%20EQUIPOS%20DE%20COMPUTO,%20IMPRESI%C3%93N%20Y%20FOTO.pdf');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Fichas resumen de procesos vigilados', 'fichas-de-procesos-vigilados', 'Procesos actualmente vigilados por la ciudadanía.', '<table><tbody>
<tr><th scope="row">Proceso vigilado</th><td>Contratar el “Alquiler de equipos de cómputo, impresión y fotocopiado multifuncionales y de función simple”.</td></tr>
<tr><th scope="row">Objeto</th><td>Alquiler de equipos de cómputo, impresión y fotocopiado multifuncionales y de función simple, para atender las necesidades administrativas y asistenciales como apoyo a la misionalidad.</td></tr>
<tr><th scope="row">Plazo</th><td>4 meses.</td></tr>
<tr><th scope="row">Metas</th><td>Realizar mantenimiento al 100 % de los equipos registrados en el inventario institucional.</td></tr>
<tr><th scope="row">Indicadores</th><td>Porcentaje de equipos en funcionamiento ≥ 95 %.</td></tr>
<tr><th scope="row">Riesgos identificados</th><td>Ninguno.</td></tr>
<tr><th scope="row">Evidencia</th><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INVITACION%20A%20PRESENTAR%20COTIZACION%20ALQUILER%20DE%20EQUIPOS%20DE%20COMPUTO,%20IMPRESI%C3%93N%20Y%20FOTO.pdf" target="_blank" rel="noopener">Ver ficha técnica</a></td></tr>
</tbody></table>
<h3>Informe de austeridad en el gasto – III trimestre 2025</h3>
<p><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_III_TRIMESTRE_2025%20(1).pdf" target="_blank" rel="noopener">Informe de austeridad en el gasto – tercer trimestre de 2025</a></p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 3, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'control-social'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'fichas-de-procesos-vigilados');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Observaciones de veedurías y plan de mejora', 'observaciones-y-plan-de-mejora', 'Observaciones de las veedurías ciudadanas, respuestas de la entidad y plan de mejora del proceso vigilado.', '<h3>Observaciones de control social</h3>
<p>Observaciones realizadas por las veedurías ciudadanas y grupos de control social sobre los procesos institucionales, junto con las respuestas emitidas por la entidad.</p>
<table><thead><tr><th scope="col">ID</th><th scope="col">Fecha</th><th scope="col">Veeduría</th><th scope="col">Observación</th><th scope="col">Respuesta institucional</th><th scope="col">Estado</th></tr></thead><tbody><tr><td>001</td><td>2025-10-05</td><td>Veeduría Ciudadana de Salud</td><td>Solicitud de publicación de informes trimestrales de ejecución presupuestal en la página web institucional.</td><td>Los informes han sido cargados en el micrositio de Transparencia y estarán disponibles de forma trimestral.</td><td>Atendida</td></tr>
<tr><td>002</td><td>2025-09-18</td><td>Comité Comunitario del Guaviare</td><td>Inquietud por el proceso de contratación de mantenimiento locativo.</td><td>El proceso fue publicado en el SECOP, con la respectiva documentación de transparencia contractual.</td><td>En trámite</td></tr>
<tr><td>003</td><td>2025-08-30</td><td>Red de Usuarios del Hospital</td><td>Recomendación de mejorar la señalización interna para usuarios y visitantes.</td><td>Se incluyó la actividad de señalización en el Plan de Mantenimiento 2025–2026.</td><td>Atendida</td></tr>
<tr><td>004</td><td>2025-07-20</td><td>Asociación de Líderes Comunitarios</td><td>Observación sobre demoras en la entrega de resultados de laboratorio.</td><td>Se implementó un sistema de turnos digitales para optimizar la entrega de resultados.</td><td>Atendida</td></tr>
<tr><td>005</td><td>2025-06-10</td><td>Veeduría Juvenil en Salud</td><td>Solicitud de información sobre programas de promoción y prevención dirigidos a jóvenes.</td><td>Se programó una jornada de socialización del Plan de Promoción y Prevención Juvenil 2025.</td><td>En trámite</td></tr></tbody></table>
<h3>Plan de mejora – alquiler de equipos de cómputo, impresión y fotocopiado</h3>
<p>Plan de mejora del proceso vigilado, orientado a fortalecer el seguimiento y la eficiencia en la ejecución contractual.</p>
<table><thead><tr><th scope="col">Acción de mejora</th><th scope="col">Responsable</th><th scope="col">Fecha límite</th><th scope="col">Estado</th><th scope="col">Evidencia</th></tr></thead><tbody><tr><td>Control mensual del cumplimiento del servicio de alquiler y mantenimiento de los equipos contratados.</td><td>Coordinador de Mantenimiento y Sistemas</td><td>30/11/2025</td><td>En trámite</td><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-SEGUIMIENTO-ALQUILER.pdf" target="_blank" rel="noopener">Ver informe de seguimiento</a></td></tr>
<tr><td>Registro digital de control para los reportes de fallas y mantenimientos ejecutados.</td><td>Área de Tecnología</td><td>15/12/2025</td><td>Atendida</td><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REGISTRO-MANTENIMIENTOS.pdf" target="_blank" rel="noopener">Ver registro digital</a></td></tr>
<tr><td>Fortalecer la comunicación con los proveedores para garantizar tiempos óptimos de respuesta ante incidentes técnicos.</td><td>Oficina de Contratación</td><td>05/01/2026</td><td>En trámite</td><td><a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/ACTA-REUNION-PROVEEDORES.pdf" target="_blank" rel="noopener">Acta de reunión</a></td></tr>
<tr><td>Verificar y documentar el cumplimiento de los indicadores de funcionamiento de la ficha técnica (≥ 95 % de equipos operativos).</td><td>Coordinador de Calidad</td><td>15/01/2026</td><td>Pendiente</td><td>Por cargar</td></tr></tbody></table>
<p>Para realizar observaciones o participar en los espacios de control social, escriba a <a href="mailto:contacto@esehospitalguaviare.gov.co">contacto@esehospitalguaviare.gov.co</a> o diríjase a la Oficina de Atención al Ciudadano.</p>', 'servicio', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 4, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'control-social'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'observaciones-y-plan-de-mejora');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estrategia de participación ciudadana', 'estrategia-de-participacion', 'Propósito, principios, mecanismos, plan de acciones e indicadores.', '<p>La estrategia de participación ciudadana de la E.S.E. Hospital San José del Guaviare busca articular a usuarios, familiares, líderes comunitarios y organizaciones locales en procesos de planeación, seguimiento, control social y mejora continua de los servicios de salud, garantizando que las decisiones institucionales respondan a las necesidades del territorio.</p>
<h3>Propósito</h3>
<p>Fortalecer la comunicación y el trabajo conjunto entre la institución y la comunidad, promover la corresponsabilidad en la gestión de los servicios de salud y garantizar que las decisiones institucionales respondan a las necesidades reales de la población guaviarense.</p>
<h3>Principios</h3>
<ul>
<li>Transparencia y acceso a la información.</li>
<li>Inclusión con enfoque diferencial (pueblos indígenas, población rural y urbana).</li>
<li>Corresponsabilidad y diálogo social.</li>
<li>Respeto y participación efectiva.</li>
<li>Mejora continua basada en las voces ciudadanas.</li>
</ul>
<h3>Población objetivo</h3>
<p>Usuarios y sus familias, líderes comunitarios, asociaciones de usuarios, comunidades indígenas, juntas de acción comunal y organizaciones sociales del Guaviare.</p>
<h3>Mecanismos de participación</h3>
<ul>
<li>Audiencias públicas de rendición de cuentas.</li>
<li>Comité de Participación Ciudadana (CPC) institucional.</li>
<li>Veedurías ciudadanas en servicios críticos.</li>
<li>Buzón físico y línea de WhatsApp para quejas y sugerencias.</li>
<li>Encuestas de satisfacción y grupos focales de usuarios.</li>
<li>Jornadas educativas y de empoderamiento comunitario.</li>
</ul>
<h3>Plan de acciones</h3>
<table><thead><tr><th scope="col">Acción</th><th scope="col">Plazo</th><th scope="col">Responsable</th></tr></thead><tbody><tr><td>Fortalecer el Comité de Participación Ciudadana (CPC)</td><td>Primer trimestre</td><td>Dirección / Oficina de Participación</td></tr>
<tr><td>Realizar audiencias públicas</td><td>Semestral</td><td>Gerencia / Comunicaciones</td></tr>
<tr><td>Implementar buzón y línea de WhatsApp</td><td>60 días</td><td>Gestión de Calidad / TI</td></tr>
<tr><td>Aplicar encuestas de satisfacción</td><td>Trimestral</td><td>Gestión de Calidad</td></tr>
<tr><td>Desarrollar jornadas rurales y educativas</td><td>Trimestral</td><td>Promoción y Prevención</td></tr></tbody></table>
<h3>Indicadores de seguimiento</h3>
<ul>
<li>Cumplimiento de compromisos ciudadanos (meta ≥ 75 %).</li>
<li>Satisfacción de usuarios (meta ≥ 80 %).</li>
<li>Tiempo promedio de respuesta a quejas (meta ≤ 10 días hábiles).</li>
<li>Líderes comunitarios capacitados (meta: 100 por año).</li>
<li>Participación en audiencias públicas (meta: aumento anual del 10 %).</li>
</ul>
<h3>Responsables</h3>
<ul>
<li><strong>Gerencia:</strong> aval institucional y recursos.</li>
<li><strong>Oficina de Participación:</strong> coordinación operativa.</li>
<li><strong>Comité de Participación:</strong> seguimiento y priorización.</li>
<li><strong>Gestión de Calidad:</strong> sistematización de la información.</li>
<li><strong>Comunidad:</strong> participación activa en los espacios convocados.</li>
</ul>
<h3>Transparencia y comunicación</h3>
<p>Los resultados, actas y compromisos se publican en los canales digitales del hospital (página web y WhatsApp). Se emite un boletín ciudadano trimestral con avances, compromisos cumplidos y nuevos espacios de participación.</p>
<h3>Contacto</h3>
<p>Oficina de Participación Ciudadana / Gestión de Calidad – teléfono <a href="tel:+573185689597">+57 318 568 9597</a> – <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a></p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'estrategia-de-participacion-ciudadana'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estrategia-de-participacion');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Plan Anticorrupción y de Atención al Ciudadano (PAAC)', 'paac-y-planes-institucionales', 'Instrumento de gestión con las acciones para prevenir la corrupción y mejorar la atención a la ciudadanía.', '<p>Instrumento de gestión que establece las acciones para prevenir la corrupción y mejorar la atención y el servicio a la ciudadanía. Los documentos de cada vigencia se publican en la sección <a href="/nuestro-hospital/planes-decreto-612-de-2018">Planes Decreto 612 de 2018</a>.</p>
<table><thead><tr><th scope="col">Tipo de plan</th><th scope="col">Vigencias disponibles</th><th scope="col">Observaciones</th></tr></thead><tbody><tr><td><strong>Plan Institucional de Archivo (PINAR)</strong></td><td>2020 – 2025</td><td>Versiones anuales disponibles en el portal institucional.</td></tr>
<tr><td><strong>Plan Anual de Adquisiciones (PAA)</strong></td><td>2018 – 2025</td><td>Incluye documentos y actualizaciones desde 2018.</td></tr>
<tr><td><strong>Plan Anual de Vacantes</strong></td><td>2019 – 2025</td><td>Contiene las vacantes programadas por vigencia.</td></tr>
<tr><td><strong>Plan de Previsión de Recursos Humanos</strong></td><td>2021 – 2025</td><td>Incluye avances del plan 2022 y vigencias posteriores.</td></tr>
<tr><td><strong>Plan Institucional de Capacitación (PIC)</strong></td><td>2019 – 2025</td><td>Programas de formación y fortalecimiento del talento humano.</td></tr>
<tr><td><strong>Plan Institucional de Bienestar Social e Incentivos</strong></td><td>2019 – 2025</td><td>Actividades y beneficios para el personal del hospital.</td></tr>
<tr><td><strong>Plan de Trabajo Anual en Seguridad y Salud en el Trabajo (SG-SST)</strong></td><td>2019 – 2025</td><td>Metas, actividades y seguimiento de seguridad laboral.</td></tr>
<tr><td><strong>Plan Anticorrupción y de Atención al Ciudadano</strong></td><td>2018 – 2025</td><td>Incluye mapa de riesgos y mecanismos de participación ciudadana.</td></tr>
<tr><td><strong>Plan Estratégico de Tecnologías de la Información (PETI)</strong></td><td>2019 – 2025</td><td>Estrategia institucional para la gestión y modernización tecnológica.</td></tr>
<tr><td><strong>Plan de Seguridad y Privacidad de la Información</strong></td><td>2023 – 2025</td><td>Políticas y controles para la protección de datos institucionales.</td></tr>
<tr><td><strong>Plan Estratégico de Talento Humano</strong></td><td>2020 – 2025</td><td>Desarrollo, retención y proyección del personal de la E.S.E.</td></tr>
<tr><td><strong>Plan de Tratamiento de Riesgos de Seguridad y Privacidad de la Información</strong></td><td>2023 – 2025</td><td>Controles específicos para la gestión de riesgos informáticos.</td></tr></tbody></table>
<p><a href="/nuestro-hospital/planes-decreto-612-de-2018">Consultar los planes institucionales (Decreto 612 de 2018)</a></p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'plan-anticorrupcion-y-de-atencion-al-ciudadano'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'paac-y-planes-institucionales');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Divulgación de resultados', 'resultados-participacion-ciudadana', 'Avances y resultados de la gestión en el marco de la participación ciudadana.', '<p>Compartimos con la ciudadanía los avances y resultados de nuestra gestión en el desarrollo del marco de participación ciudadana.</p>
<p><a href="https://view.genially.com/690cb72c1ad73ca16f4d4a38" target="_blank" rel="noopener">Ver la presentación de resultados (Genially)</a></p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0, 'esehospitalguaviare.gov.co (Atención al ciudadano y Participa)'
  FROM cms_paginas p WHERE p.slug = 'divulgacion-de-resultados'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'resultados-participacion-ciudadana');
