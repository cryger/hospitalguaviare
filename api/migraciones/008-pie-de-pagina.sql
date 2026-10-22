-- =====================================================================
-- 008 · Pie de página
-- Publica las páginas del menú "Pie de página" (políticas, términos,
-- accesibilidad y mapa del sitio) con su contenido inicial.
-- No borra nada: si una página o entrada ya existe, se respeta.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Políticas de privacidad y tratamiento de datos', 'politicas-de-privacidad', 'Cómo recolectamos, usamos y protegemos sus datos personales, y cómo puede ejercer sus derechos como titular.', 'contenido', NULL, 0, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'politicas-de-privacidad');

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Términos y condiciones', 'terminos-y-condiciones', 'Condiciones de uso del portal web de la E.S.E. Hospital San José del Guaviare.', 'contenido', NULL, 1, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'terminos-y-condiciones');

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Accesibilidad', 'accesibilidad', 'Herramientas y compromisos para que todas las personas puedan usar este portal.', 'contenido', NULL, 2, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'accesibilidad');

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado)
SELECT (SELECT id FROM cms_menus WHERE ubicacion = 'pie' ORDER BY id LIMIT 1), NULL, 'Mapa del sitio', 'mapa-del-sitio', NULL, 'enlace', '/mapa-del-sitio', 3, 1, 'publicada' FROM DUAL
 WHERE NOT EXISTS (SELECT 1 FROM (SELECT slug FROM cms_paginas) t WHERE t.slug = 'mapa-del-sitio');

-- Las páginas de políticas y términos venían en borrador y sin descripción
UPDATE cms_paginas SET estado = 'publicada' WHERE slug IN ('politicas-de-privacidad', 'terminos-y-condiciones') AND estado = 'borrador';
UPDATE cms_paginas SET descripcion = 'Cómo recolectamos, usamos y protegemos sus datos personales, y cómo puede ejercer sus derechos como titular.' WHERE slug = 'politicas-de-privacidad' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Condiciones de uso del portal web de la E.S.E. Hospital San José del Guaviare.' WHERE slug = 'terminos-y-condiciones' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Herramientas y compromisos para que todas las personas puedan usar este portal.' WHERE slug = 'accesibilidad' AND (descripcion IS NULL OR descripcion = '');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Políticas de privacidad y tratamiento de datos', 'politica-de-tratamiento-de-datos-personales', 'Política de tratamiento de datos personales de la E.S.E. Hospital San José del Guaviare (Ley 1581 de 2012).', '<h3>1. Responsable del tratamiento</h3>
<p><strong>E.S.E. Hospital San José del Guaviare</strong>, empresa social del Estado del orden departamental, con domicilio en la Calle 12 con Carrera 20, Barrio La Esperanza, San José del Guaviare (Guaviare). Teléfono (608) 584 0531. Correo electrónico <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a>.</p>

<h3>2. Marco normativo</h3>
<p>Esta política se fundamenta en los artículos 15 y 20 de la Constitución Política, la Ley Estatutaria 1581 de 2012, el Decreto 1377 de 2013 (compilado en el Decreto 1074 de 2015), la Ley 1712 de 2014 de transparencia y acceso a la información pública, y las normas sobre historia clínica (Ley 23 de 1981 y Resolución 1995 de 1999 del Ministerio de Salud y Protección Social).</p>

<h3>3. Datos que tratamos y finalidades</h3>
<p>El hospital recolecta y trata datos personales de pacientes, acompañantes, usuarios del portal, proveedores, contratistas y servidores públicos, con las siguientes finalidades:</p>
<ul>
<li>Prestar los servicios de salud, asignar citas y diligenciar y custodiar la historia clínica.</li>
<li>Facturar y gestionar el cobro de los servicios ante las EPS, aseguradoras y demás entidades responsables del pago.</li>
<li>Recibir, tramitar y responder peticiones, quejas, reclamos, sugerencias y denuncias (PQRSD).</li>
<li>Adelantar los procesos de contratación, talento humano y gestión administrativa de la entidad.</li>
<li>Reportar la información exigida por los organismos de control, vigilancia y salud pública.</li>
<li>Enviar información institucional, campañas de salud y resultados de encuestas de satisfacción.</li>
</ul>

<h3>4. Datos sensibles y de menores de edad</h3>
<p>Los datos relativos a la salud son <strong>datos sensibles</strong> y están sometidos a reserva. Solo se usan para la atención en salud y los fines autorizados por la ley, y únicamente pueden ser conocidos por el paciente, el equipo de salud y las autoridades en los casos previstos legalmente. Usted no está obligado a responder preguntas sobre datos sensibles que no sean necesarias para su atención. Los datos de niñas, niños y adolescentes se tratan respetando su interés superior y sus derechos fundamentales.</p>

<h3>5. Derechos de los titulares</h3>
<p>Como titular de los datos usted puede:</p>
<ul>
<li>Conocer, actualizar y rectificar sus datos personales.</li>
<li>Solicitar prueba de la autorización otorgada, salvo cuando la ley no la exija.</li>
<li>Ser informado sobre el uso que se ha dado a sus datos.</li>
<li>Presentar quejas ante la Superintendencia de Industria y Comercio por infracciones a la ley.</li>
<li>Revocar la autorización o solicitar la supresión de sus datos, cuando no exista un deber legal o contractual de conservarlos (por ejemplo, la historia clínica debe conservarse por el tiempo que fija la ley).</li>
<li>Acceder en forma gratuita a sus datos personales.</li>
</ul>

<h3>6. ¿Cómo ejercer sus derechos?</h3>
<p>Puede presentar su consulta o reclamo por cualquiera de estos canales:</p>
<ul>
<li>Correo electrónico: <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a>.</li>
<li>Formulario de <a href="/pqrsf">PQRSD</a> de este portal.</li>
<li>De forma presencial en la sede principal, en el horario de atención al usuario.</li>
</ul>
<p>Las <strong>consultas</strong> se responden en un plazo máximo de diez (10) días hábiles, prorrogable por cinco (5) días hábiles más. Los <strong>reclamos</strong> se atienden en un plazo máximo de quince (15) días hábiles, prorrogable por ocho (8) días hábiles más, de acuerdo con los artículos 14 y 15 de la Ley 1581 de 2012.</p>

<h3>7. Información recolectada en este portal</h3>
<p>El portal no exige registro para consultar la información pública. Los datos que usted suministra en los formularios (por ejemplo, PQRSD) se usan solo para tramitar su solicitud. Las preferencias de accesibilidad (contraste y tamaño de letra) se guardan únicamente en su navegador.</p>

<h3>8. Seguridad de la información</h3>
<p>El hospital aplica medidas técnicas, humanas y administrativas para proteger los datos contra pérdida, consulta, uso o acceso no autorizado. Consulte la <a href="https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA-DE-SEGURIDAD-DE-LA-INFORMACION-DEF.pdf" target="_blank" rel="noopener">Política de seguridad de la información</a>.</p>

<h3>9. Vigencia</h3>
<p>Esta política rige a partir de su publicación. Cualquier cambio sustancial será informado a través de este portal.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0
  FROM cms_paginas p
 WHERE p.slug = 'politicas-de-privacidad'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'politica-de-tratamiento-de-datos-personales');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Términos y condiciones', 'terminos-y-condiciones-de-uso', 'Condiciones de uso del portal web de la E.S.E. Hospital San José del Guaviare.', '<h3>1. Aceptación</h3>
<p>Al ingresar y usar el portal web de la <strong>E.S.E. Hospital San José del Guaviare</strong> usted acepta estos términos y condiciones. Si no está de acuerdo con ellos, le solicitamos abstenerse de usar el portal.</p>

<h3>2. Objeto del portal</h3>
<p>El portal informa a la ciudadanía sobre los servicios de salud, trámites, canales de atención, contratación y demás información pública de la entidad, en cumplimiento de la Ley 1712 de 2014 y la Resolución 1519 de 2020 del Ministerio de Tecnologías de la Información y las Comunicaciones.</p>

<h3>3. Uso adecuado</h3>
<p>Usted se compromete a usar el portal de forma lícita y a no:</p>
<ul>
<li>Introducir virus o cualquier código que pueda dañar el portal o los equipos de otros usuarios.</li>
<li>Intentar acceder a zonas restringidas, como el panel de administración, sin autorización.</li>
<li>Suplantar la identidad de otra persona o suministrar información falsa en los formularios.</li>
<li>Usar la información del portal para fines contrarios a la ley o a la moral.</li>
</ul>

<h3>4. Información en salud</h3>
<p>Los contenidos sobre salud publicados en el portal tienen fines informativos y <strong>no reemplazan la consulta con un profesional de la salud</strong>. En caso de urgencia acuda al servicio de urgencias o comuníquese a la línea 316 744 0324, disponible las 24 horas.</p>

<h3>5. Propiedad intelectual</h3>
<p>Los textos, imágenes, logotipos y demás contenidos del portal son propiedad de la E.S.E. Hospital San José del Guaviare o se usan con autorización de sus titulares, y están protegidos por la Ley 23 de 1982 y demás normas de derechos de autor. La información pública puede reproducirse citando la fuente, salvo los contenidos que indiquen lo contrario.</p>

<h3>6. Enlaces a otros sitios</h3>
<p>El portal contiene enlaces a sitios de otras entidades (por ejemplo, GOV.CO, SECOP o el SUIN-Juriscol). El hospital no se hace responsable del contenido, la disponibilidad ni las políticas de privacidad de esos sitios.</p>

<h3>7. Responsabilidad</h3>
<p>El hospital procura que la información publicada sea veraz, completa y actualizada, pero no garantiza la ausencia de errores ni la disponibilidad permanente del portal, que puede suspenderse por mantenimiento o causas técnicas.</p>

<h3>8. Datos personales</h3>
<p>El tratamiento de los datos personales que usted suministre se rige por la <a href="/politicas-de-privacidad">Política de privacidad y tratamiento de datos</a>.</p>

<h3>9. Modificaciones y ley aplicable</h3>
<p>El hospital puede modificar estos términos en cualquier momento; los cambios rigen desde su publicación en el portal. Estos términos se rigen por las leyes de la República de Colombia.</p>

<p>Si tiene preguntas sobre estos términos escriba a <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a>.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0
  FROM cms_paginas p
 WHERE p.slug = 'terminos-y-condiciones'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'terminos-y-condiciones-de-uso');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, autor, fecha_publicacion, orden)
SELECT p.id, 'Accesibilidad', 'declaracion-de-accesibilidad', 'Herramientas y compromisos para que todas las personas puedan usar este portal.', '<p>La <strong>E.S.E. Hospital San José del Guaviare</strong> trabaja para que su portal web pueda ser usado por todas las personas, incluidas las personas con discapacidad, siguiendo los lineamientos de accesibilidad del Anexo 1 de la Resolución 1519 de 2020 del MinTIC, la Norma Técnica Colombiana NTC 5854 y las pautas WCAG 2.1 nivel AA.</p>

<h3>Herramientas disponibles</h3>
<p>En el costado derecho de todas las páginas encontrará la barra de accesibilidad con estas opciones:</p>
<ul>
<li><strong>Contraste:</strong> cambia los colores a alto contraste para facilitar la lectura.</li>
<li><strong>Reducir letra (A−) y aumentar letra (A+):</strong> ajusta el tamaño del texto.</li>
<li><strong>Lectura de pantalla:</strong> lee en voz alta el contenido de la página.</li>
<li><strong>Centro de Relevo:</strong> enlace al servicio del MinTIC que facilita la comunicación de personas sordas mediante intérprete de lengua de señas.</li>
</ul>

<h3>Otras características del portal</h3>
<ul>
<li>Se puede navegar completamente con el teclado: use <kbd>Tab</kbd> para avanzar, <kbd>Shift</kbd> + <kbd>Tab</kbd> para retroceder y <kbd>Enter</kbd> para abrir un enlace o menú; con <kbd>Esc</kbd> se cierran los menús.</li>
<li>Los elementos con foco se resaltan con un borde amarillo visible.</li>
<li>Las imágenes informativas tienen texto alternativo.</li>
<li>El diseño se adapta a computadores, tabletas y teléfonos.</li>
<li>Puede ampliar el contenido con el zoom del navegador (<kbd>Ctrl</kbd> + <kbd>+</kbd>) sin perder información.</li>
</ul>

<h3>¿Encontró una barrera de acceso?</h3>
<p>Si tiene dificultades para acceder a algún contenido o necesita la información en otro formato, escríbanos a <a href="mailto:contactenos@esehospitalguaviare.gov.co">contactenos@esehospitalguaviare.gov.co</a> o use el formulario de <a href="/pqrsf">PQRSD</a>, indicando la página y el problema encontrado. Le responderemos y buscaremos una alternativa para entregarle la información.</p>', 'articulo', 'publicada', 'E.S.E. Hospital San José del Guaviare', UTC_TIMESTAMP(), 0
  FROM cms_paginas p
 WHERE p.slug = 'accesibilidad'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas e WHERE e.pagina_id = p.id AND e.slug = 'declaracion-de-accesibilidad');
