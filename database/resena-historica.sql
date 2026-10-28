-- =====================================================================
-- 021 · Reseña histórica con portada, línea de tiempo y galería
--  - Nueva plantilla de página "historia" (administrable: Entradas + Multimedia)
--  - Fotografías de "Nuestra historia" del portal anterior
--  - La narración se divide en hitos (entradas cuyo título empieza por el año)
-- Solo cambia la introducción si aún tiene el texto original y no tiene imagen.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'historia' WHERE slug = 'resena-historica' AND plantilla = 'contenido';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'nuestra-historia-equipo.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/3.jpg', 'imagen', 'image/jpeg', 'Equipo de la E.S.E. Hospital San José del Guaviare', 'Integrantes del equipo del hospital, con uniforme azul y tapabocas, posan frente a la sede junto a las banderas de Colombia y del Guaviare.', 'esehospitalguaviare.gov.co (Nuestra historia)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/3.jpg');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'nuestra-historia-sede.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/1.jpg', 'imagen', 'image/jpeg', 'Instalaciones de la sede del hospital', 'Corredor exterior de una de las edificaciones de la sede, rodeado de jardines y árboles.', 'esehospitalguaviare.gov.co (Nuestra historia)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/1.jpg');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'nuestra-historia-personal.jpeg', 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/2.jpeg', 'imagen', 'image/jpeg', 'Personal asistencial durante la pandemia', 'Cuatro integrantes del personal asistencial, con gorro y tapabocas, saludan con la mano desde un pasillo del hospital.', 'esehospitalguaviare.gov.co (Nuestra historia)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/2.jpeg');

-- Introducción: portada, galería y texto (solo si nadie la ha editado)
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'resena-historica'
   SET e.resumen = 'Única institución pública de segundo nivel de complejidad del Guaviare y centro de referencia para el sur del Meta.',
       e.contenido = '<p>La ESE Hospital San José del Guaviare fue creada como Empresa Social del Estado mediante la Ordenanza 002 del 20 de marzo de 1996, como una entidad pública descentralizada del orden departamental, con autonomía administrativa y financiera. Es la única infraestructura hospitalaria pública de segundo nivel de complejidad del Guaviare, y es referencia no solo del departamento, sino del sur del Meta y de los departamentos circunvecinos.</p>
<p>Su historia empezó hace décadas como un puesto de salud y hoy es un hospital con 91 camas, especialistas permanentes y servicios de apoyo diagnóstico. Con una capacidad física y un equipo médico-científico altamente calificado, la ESE brinda servicios de salud de calidad, con atención integral, diferencial y humanizada, y renueva su compromiso con la salud de la comunidad del Guaviare y el sur del Meta.</p>',
       e.imagen_destacada_id = (SELECT id FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/3.jpg' LIMIT 1),
       e.orden = 0
 WHERE e.slug = 'nuestra-historia' AND e.imagen_destacada_id IS NULL AND e.contenido LIKE '%Su origen se remonta al año 1967%';

INSERT INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, m.id, CASE m.url WHEN 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/1.jpg' THEN 0 WHEN 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/2.jpeg' THEN 1 ELSE 2 END
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'resena-historica'
  JOIN cms_multimedia m ON m.url IN ('https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/1.jpg', 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/2.jpeg', 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/3.jpg')
 WHERE e.slug = 'nuestra-historia'
   AND NOT EXISTS (SELECT 1 FROM cms_entrada_multimedia x WHERE x.entrada_id = e.id);

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '1967 · De puesto a centro de salud', 'hito-1967-de-puesto-a-centro-de-salud', 'El puesto de salud se transformó en centro de salud.', '<p>El puesto de salud de San José del Guaviare se transformó en centro de salud, en las instalaciones donde hoy funciona la Secretaría de Salud Departamental.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 10, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-1967-de-puesto-a-centro-de-salud');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '1983 · Comienza la construcción de la sede', 'hito-1983-comienza-la-construccion-de-la-sede', 'El Fondo Nacional Hospitalario inicia la obra de la sede actual.', '<p>A inicios de 1983, el Fondo Nacional Hospitalario comenzó la construcción del espacio físico de la actual sede del hospital.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 11, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-1983-comienza-la-construccion-de-la-sede');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '1990 · Abre sus puertas la sede actual', 'hito-1990-abre-sus-puertas-la-sede-actual', 'El 2 de abril de 1990 abre la sede de la Carrera 20 con Calle 12.', '<p>El 2 de abril de 1990 el hospital abrió sus puertas al público en la Carrera 20 con Calle 12, donde funciona hasta hoy.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), (SELECT id FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/1.jpg' LIMIT 1), 12, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-1990-abre-sus-puertas-la-sede-actual');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '1996 · Nace la Empresa Social del Estado', 'hito-1996-nace-la-empresa-social-del-estado', 'Ordenanza 002 del 20 de marzo de 1996.', '<p>Mediante la Ordenanza 002 del 20 de marzo de 1996 se creó la Empresa Social del Estado Hospital San José del Guaviare, entidad pública descentralizada del orden departamental, con autonomía administrativa y financiera.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 13, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-1996-nace-la-empresa-social-del-estado');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '2003 · Nueva sede de urgencias', 'hito-2003-nueva-sede-de-urgencias', 'Se construye la nueva área de urgencias.', '<p>Se construyó la nueva sede del área de urgencias, puerta de entrada de la mayoría de los usuarios del hospital.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 14, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-2003-nueva-sede-de-urgencias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '2004 · Tres quirófanos y nueva área administrativa', 'hito-2004-tres-quirofanos-y-nueva-area-administrativa', 'Remodelación de cirugía y terminación del segundo piso.', '<p>Se remodeló el área de cirugía, habilitando tres quirófanos. En 2005 se terminó el área administrativa del segundo piso.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 15, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-2004-tres-quirofanos-y-nueva-area-administrativa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '2007 · Unidad Materno Infantil', 'hito-2007-unidad-materno-infantil', 'Se construye la Unidad Materno Infantil.', '<p>Se construyó la Unidad Materno Infantil para la atención de las madres gestantes, los recién nacidos y la primera infancia.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 16, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-2007-unidad-materno-infantil');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '2016 · Etnopabellón', 'hito-2016-etnopabellon', 'Doce camas para la internación de población indígena.', '<p>Se construyó el Etnopabellón, con capacidad de doce camas para la internación de población indígena, con un enfoque diferencial e intercultural.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 17, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-2016-etnopabellon');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, '2020 · Frente a la pandemia', 'hito-2020-frente-a-la-pandemia', 'Unidad de Cuidados Intermedios y fortalecimiento de la dotación.', '<p>Se adecuó el Etnopabellón como área de atención de urgencias respiratorias y se construyó la Unidad de Cuidados Intermedios para garantizar la atención durante la pandemia por covid-19. También se remodeló la central de esterilización y se fortaleció la dotación de mobiliario hospitalario, equipos industriales y equipos biomédicos de alta tecnología (intensificador “arco en C”, rayos X portátil, máquina de anestesia, desfibriladores, monitores de signos vitales, entre otros), con recursos del municipio de San José del Guaviare, la Gobernación del Guaviare y el Ministerio de Salud y Protección Social.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), (SELECT id FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/imgNuestarHistoria/2.jpeg' LIMIT 1), 18, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-2020-frente-a-la-pandemia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, imagen_destacada_id, orden, migrado_de)
SELECT p.id, 'Hoy · 91 camas y atención especializada', 'hito-hoy-91-camas-y-atencion-especializada', 'Capacidad instalada y servicios del hospital.', '<p>La ESE cuenta con una capacidad instalada de 91 camas distribuidas en los servicios de Cirugía, Ortopedia, Medicina Interna, Pediatría, Gineco-Obstetricia y Unidad de Cuidados Intermedios adulto, con valoración diaria por especialista y enfermería en todos los servicios las 24 horas.</p>
<ul>
<li><strong>Especialidades clínicas permanentes:</strong> Medicina Interna, Pediatría, Radiología y Urgencias.</li>
<li><strong>Especialidades quirúrgicas permanentes:</strong> Cirugía General, Ginecología y Obstetricia, Ortopedia y Traumatología, Anestesiología.</li>
<li><strong>Especialidades clínicas en jornadas:</strong> Urología, Dermatología, Endocrinología, Oftalmología, Nefrología, Neumología, Psiquiatría, Reumatología, Gastroenterología y Neurología, entre otras.</li>
</ul>
<p>Cuenta además con laboratorio clínico de mediana complejidad, imagenología, terapia física, terapia respiratoria, transporte asistencial básico y medicalizado, y servicio farmacéutico.</p>
<p>Como el municipio capital no cuenta con un hospital de primer nivel, el servicio de urgencias atiende el 100 % de la demanda, lo que genera congestión para la atención propia de su nivel de complejidad.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), NULL, 19, 'Reseña histórica (portal anterior)'
  FROM cms_paginas p
 WHERE p.slug = 'resena-historica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'hito-hoy-91-camas-y-atencion-especializada');
