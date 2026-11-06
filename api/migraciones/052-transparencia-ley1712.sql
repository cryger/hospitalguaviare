-- =====================================================================
-- 052 · Transparencia (Ley 1712 de 2012) · 9 páginas de «documentos» vacías
--  El portal anterior no publicaba documentos propios para estas secciones
--  (su esquema de Transparencia era anterior y las dejaba sin contenido).
--  Para cumplir la Ley 1712 de 2012 y la Res. 1519 de 2020 (ITA), cada una
--  pasa de plantilla «documentos» a «contenido» y se publica un texto
--  normativo con los enlaces oficiales a los sistemas del Estado donde
--  reside la información (SUIN-Juriscol, SECOP, SIGEP II, etc.).
--
--  No se inventan cifras ni documentos: se describe el marco legal y se
--  remite a la fuente oficial o a la sección interna correspondiente.
--  Idempotente: no duplica ni borra nada.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- ---- 1) Las 9 páginas pasan a plantilla «contenido» --------------------------
UPDATE cms_paginas SET plantilla = 'contenido'
 WHERE plantilla = 'documentos' AND slug IN (
   'leyes',
   'agenda-regulatoria',
   'proyectos-de-normas-para-comentarios',
   'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas',
   'informacion-sobre-decisiones-que-pueden-afectar-al-publico',
   'publicacion-de-hojas-de-vida',
   'publicacion-de-la-ejecucion-de-los-contratos',
   'costos-de-reproduccion-de-la-informacion-publica',
   'reporte-de-informacion-especifica'
 );

-- ---- 2) Descripción breve de cada página (si está vacía) ----------------------
UPDATE cms_paginas SET descripcion = 'Leyes, decretos y demás normas nacionales aplicables a la E.S.E., con consulta en el Sistema Único de Información Normativa (SUIN-Juriscol).' WHERE slug = 'leyes' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Agenda regulatoria de la entidad conforme al Decreto 1081 de 2015. Naturaleza de la E.S.E. frente a la expedición de normas de carácter general.' WHERE slug = 'agenda-regulatoria' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Proyectos de actos administrativos de carácter general puestos a disposición de la ciudadanía para comentarios.' WHERE slug = 'proyectos-de-normas-para-comentarios' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Procedimientos para la toma de decisiones en las diferentes áreas: mapa de procesos y manual de procesos y procedimientos de la E.S.E.' WHERE slug = 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Canales por los que la E.S.E. informa a la ciudadanía las decisiones que pueden afectar al público y los mecanismos para participar.' WHERE slug = 'informacion-sobre-decisiones-que-pueden-afectar-al-publico' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Hojas de vida de los servidores públicos y contratistas de la E.S.E., consultables en el SIGEP II de la Función Pública.' WHERE slug = 'publicacion-de-hojas-de-vida' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Ejecución de los contratos de la E.S.E. publicada en el SECOP, con enlaces de consulta ciudadana.' WHERE slug = 'publicacion-de-la-ejecucion-de-los-contratos' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Costos de reproducción de la información pública conforme al artículo 24 de la Ley 1712 de 2012. El acceso por medios electrónicos es gratuito.' WHERE slug = 'costos-de-reproduccion-de-la-informacion-publica' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Reportes de información específica que la E.S.E., como entidad del sector salud, remite a los organismos de inspección, vigilancia y control.' WHERE slug = 'reporte-de-informacion-especifica' AND (descripcion IS NULL OR descripcion = '');

-- ---- 3) Contenido de cada página (una entrada por página, si no existe) --------

-- 2.1.1 Leyes
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Leyes y normatividad aplicable',
  'leyes-normatividad-aplicable',
  'Marco normativo nacional aplicable a la E.S.E. y consulta oficial en SUIN-Juriscol.',
  CONCAT(
    '<p>La E.S.E. Hospital San José del Guaviare, como Empresa Social del Estado del orden departamental, se rige por la Constitución Política de Colombia y por la normatividad nacional vigente, en especial la <strong>Ley 100 de 1993</strong> (Sistema General de Seguridad Social en Salud), la <strong>Ley 1438 de 2011</strong>, el <strong>Decreto-Ley 1298 de 1994</strong>, la <strong>Ley 1712 de 2012</strong> (transparencia y acceso a la información pública) y sus decretos reglamentarios.</p>',
    '<h2>Consulta de la normatividad</h2>',
    '<p>Las leyes, decretos, resoluciones y demás normas de carácter nacional pueden consultarse de manera oficial y actualizada en el <strong>Sistema Único de Información Normativa — SUIN-Juriscol</strong> del Ministerio de Justicia y del Derecho:</p>',
    '<ul>',
      '<li><a href="https://www.suin-juriscol.gov.co/" target="_blank" rel="noopener">SUIN-Juriscol — Sistema Único de Información Normativa</a></li>',
      '<li><a href="https://www.funcionpublica.gov.co/eva/gestornormativo/" target="_blank" rel="noopener">Gestor Normativo — Función Pública</a></li>',
    '</ul>',
    '<p>La normatividad propia de la entidad (resoluciones, acuerdos de junta directiva y demás actos administrativos) se encuentra en la sección <a href="/normativa">Normativa</a> de este portal.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'leyes'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'leyes-normatividad-aplicable');

-- 2.1.6 Agenda regulatoria
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Agenda regulatoria',
  'agenda-regulatoria-info',
  'Alcance de la agenda regulatoria para la E.S.E. conforme al Decreto 1081 de 2015.',
  CONCAT(
    '<p>De conformidad con el <strong>Decreto 1081 de 2015</strong> (modificado por el Decreto 270 de 2017), las entidades y organismos de la Rama Ejecutiva que expiden actos administrativos de carácter general deben publicar una agenda regulatoria con los proyectos de regulación que prevén elaborar durante el año.</p>',
    '<h2>Aplicación en la E.S.E.</h2>',
    '<p>La E.S.E. Hospital San José del Guaviare, por su naturaleza de Empresa Social del Estado prestadora de servicios de salud, no expide de manera ordinaria normas de carácter general con efectos regulatorios externos a la ciudadanía. Por tanto, para la vigencia en curso no se cuenta con una agenda regulatoria de proyectos normativos de carácter general.</p>',
    '<p>En caso de que la entidad proyecte expedir actos administrativos de carácter general sujetos a este deber, se publicarán en esta sección y en <a href="/proyectos-de-normas-para-comentarios">Proyectos de normas para comentarios</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'agenda-regulatoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'agenda-regulatoria-info');

-- 2.3 Proyectos de normas para comentarios
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Proyectos de normas para comentarios',
  'proyectos-de-normas-info',
  'Publicación de proyectos de actos administrativos para observaciones de la ciudadanía.',
  CONCAT(
    '<p>En cumplimiento del <strong>numeral 8 del artículo 8 de la Ley 1437 de 2011</strong> (CPACA) y de la <strong>Ley 1712 de 2012</strong>, los proyectos de actos administrativos de carácter general que elabore la E.S.E. se ponen a disposición de la ciudadanía para que presente opiniones, sugerencias o propuestas alternativas antes de su expedición.</p>',
    '<h2>Proyectos vigentes</h2>',
    '<p>Actualmente la E.S.E. Hospital San José del Guaviare no tiene proyectos de normas de carácter general publicados para comentarios. Cuando existan, se publicarán en esta sección indicando el plazo y el canal para remitir las observaciones.</p>',
    '<p>La ciudadanía también puede participar de las decisiones de la entidad a través del módulo de <a href="/participacion">Participación ciudadana</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'proyectos-de-normas-para-comentarios'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'proyectos-de-normas-info');

-- 1.9 Procedimientos para tomar decisiones
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procedimientos para la toma de decisiones',
  'procedimientos-toma-decisiones-info',
  'Mapa de procesos y manual de procesos y procedimientos de la E.S.E.',
  CONCAT(
    '<p>Las decisiones de la E.S.E. Hospital San José del Guaviare se adoptan con sujeción al Sistema Integrado de Gestión y al Modelo Integrado de Planeación y Gestión (MIPG), a través de sus procesos estratégicos, misionales, de apoyo y de evaluación.</p>',
    '<h2>Dónde consultar los procedimientos</h2>',
    '<ul>',
      '<li><a href="/mapas-y-cartas-descriptivas-de-los-procesos">Mapa de procesos</a> de la entidad, con el objetivo y los documentos de cada proceso.</li>',
      '<li><a href="/estructura-organica-organigrama">Estructura orgánica</a> y funciones de las dependencias.</li>',
      '<li><a href="/instrumentos-de-gestion-de-la-informacion">Instrumentos de gestión de la información</a>, incluidas las Tablas de Retención Documental.</li>',
    '</ul>',
    '<p>La junta directiva y la gerencia adoptan sus decisiones mediante acuerdos y resoluciones, publicados en la sección <a href="/normativa">Normativa</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procedimientos-toma-decisiones-info');

-- 1.12 Información sobre decisiones que pueden afectar al público
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Información sobre decisiones que pueden afectar al público',
  'decisiones-afectan-publico-info',
  'Canales por los que la E.S.E. informa decisiones de interés y permite la participación ciudadana.',
  CONCAT(
    '<p>La E.S.E. Hospital San José del Guaviare informa de manera oportuna a la ciudadanía las decisiones de carácter general que puedan afectar al público —cambios en la prestación de servicios, horarios, sedes, tarifas o programas— a través de los siguientes canales:</p>',
    '<ul>',
      '<li><a href="/noticias">Noticias y avisos</a> del portal institucional.</li>',
      '<li><a href="/normativa">Normativa</a>: acuerdos, resoluciones y circulares de la entidad.</li>',
      '<li><a href="/participacion">Participación ciudadana</a>: consultas y convocatorias para aportar a las decisiones.</li>',
      '<li>Rendición de cuentas y audiencias públicas de la entidad.</li>',
    '</ul>',
    '<p>Para presentar peticiones, quejas, reclamos, sugerencias, felicitaciones o denuncias, la ciudadanía dispone del canal de <a href="/pqrsf">PQRSFD</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'informacion-sobre-decisiones-que-pueden-afectar-al-publico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'decisiones-afectan-publico-info');

-- 1.14 Publicación de hojas de vida
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Publicación de hojas de vida',
  'publicacion-hojas-de-vida-info',
  'Consulta de las hojas de vida de los servidores públicos y contratistas en el SIGEP II.',
  CONCAT(
    '<p>En cumplimiento de la <strong>Ley 190 de 1995</strong>, la <strong>Ley 909 de 2004</strong> y el <strong>Decreto 1083 de 2015</strong>, las hojas de vida de los servidores públicos, directivos y contratistas de la E.S.E. Hospital San José del Guaviare se registran y publican en el <strong>Sistema de Información y Gestión del Empleo Público — SIGEP II</strong>, administrado por el Departamento Administrativo de la Función Pública.</p>',
    '<h2>Consulta ciudadana</h2>',
    '<p>Las hojas de vida pueden consultarse de forma pública en:</p>',
    '<ul>',
      '<li><a href="https://www.funcionpublica.gov.co/web/sigep2" target="_blank" rel="noopener">SIGEP II — Función Pública</a></li>',
    '</ul>',
    '<p>La información sobre la planta de personal, el directorio de servidores y la escala salarial se encuentra además en la sección <a href="/estructura-organica-organigrama">Estructura orgánica</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-hojas-de-vida'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'publicacion-hojas-de-vida-info');

-- 3.3 Publicación de la ejecución de los contratos
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Publicación de la ejecución de los contratos',
  'ejecucion-contratos-info',
  'Seguimiento a la ejecución contractual de la E.S.E. en el SECOP.',
  CONCAT(
    '<p>La E.S.E. Hospital San José del Guaviare publica su actividad contractual —desde la planeación hasta la ejecución y liquidación— en el <strong>Sistema Electrónico de Contratación Pública (SECOP)</strong>, conforme a la Ley 1150 de 2007, la Ley 1712 de 2012 y las circulares de Colombia Compra Eficiente sobre el uso obligatorio del SECOP II.</p>',
    '<h2>Consulta de la ejecución contractual</h2>',
    '<ul>',
      '<li><a href="https://www.colombiacompra.gov.co/secop/secop-ii" target="_blank" rel="noopener">SECOP II — Colombia Compra Eficiente</a> (contratación transaccional en línea).</li>',
      '<li><a href="https://consultaprocesos.colombiacompra.gov.co" target="_blank" rel="noopener">Consulta pública de procesos de contratación</a>.</li>',
      '<li><a href="https://www.contratos.gov.co" target="_blank" rel="noopener">SECOP I — contratos.gov.co</a> (procesos históricos).</li>',
    '</ul>',
    '<p>El plan anual de adquisiciones y demás información del proceso contractual se encuentran en la sección <a href="/contratacion">Contratación</a> de este portal.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'publicacion-de-la-ejecucion-de-los-contratos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ejecucion-contratos-info');

-- 7.1.6 Costos de reproducción de la información pública
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Costos de reproducción de la información pública',
  'costos-reproduccion-info',
  'Gratuidad del acceso electrónico y costos de reproducción conforme al artículo 24 de la Ley 1712 de 2012.',
  CONCAT(
    '<p>De acuerdo con el <strong>artículo 26 de la Ley 1712 de 2012</strong> y el <strong>Decreto 1081 de 2015</strong>, el acceso a la información pública es <strong>gratuito</strong> y no puede cobrarse valor alguno por permitir el acceso ni por su entrega a través de medios electrónicos.</p>',
    '<h2>Reproducción en físico</h2>',
    '<p>Únicamente cuando la persona solicite la información en medio físico o requiera su reproducción (fotocopias, impresiones o medios magnéticos), la entidad podrá cobrar el <strong>costo de reproducción</strong>, el cual no superará el valor de los insumos y del tiempo requerido, sin generar lucro, conforme lo establece la ley.</p>',
    '<p>Los valores aplicables se fijan mediante acto administrativo motivado de la E.S.E. Cuando este se expida o actualice, se publicará en esta sección. La entrega por correo electrónico o por medios digitales seguirá siendo gratuita.</p>',
    '<p>Las solicitudes de información pueden presentarse a través del canal de <a href="/pqrsf">PQRSFD</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'costos-de-reproduccion-de-la-informacion-publica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'costos-reproduccion-info');

-- 9. Obligación de reporte de información específica
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Obligación de reporte de información específica',
  'reporte-informacion-especifica-info',
  'Reportes que la E.S.E., como entidad del sector salud, remite a los organismos de control.',
  CONCAT(
    '<p>Como Empresa Social del Estado del sector salud, la E.S.E. Hospital San José del Guaviare está obligada a reportar periódicamente información específica a los organismos de inspección, vigilancia y control, a través de los sistemas oficiales del Estado:</p>',
    '<ul>',
      '<li><a href="https://www.minsalud.gov.co/" target="_blank" rel="noopener">Ministerio de Salud y Protección Social</a> — Decreto 2193 de 2004 (SIHO) y registros del SISPRO.</li>',
      '<li><a href="https://www.supersalud.gov.co/" target="_blank" rel="noopener">Superintendencia Nacional de Salud</a> — reportes de la circular única (SNS).</li>',
      '<li><a href="https://www.adres.gov.co/" target="_blank" rel="noopener">ADRES</a> — información de recursos del aseguramiento en salud.</li>',
      '<li><a href="https://www.chip.gov.co/" target="_blank" rel="noopener">CHIP — Contaduría General de la Nación</a> — información financiera y presupuestal.</li>',
      '<li><a href="https://www.contraloria.gov.co/" target="_blank" rel="noopener">Contraloría General de la República</a> — SIRECI.</li>',
    '</ul>',
    '<p>Los informes de gestión, financieros y presupuestales de la entidad se encuentran también en las secciones <a href="/presupuesto">Presupuesto</a> y <a href="/planeacion">Planeación</a>.</p>'
  ),
  'articulo', 'Transparencia', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-05 12:00:00', 0, 'Cumplimiento Ley 1712 de 2012 / Res. 1519 de 2020'
  FROM cms_paginas p WHERE p.slug = 'reporte-de-informacion-especifica'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reporte-informacion-especifica-info');
