-- =====================================================================
-- 043 · 7.1.3 Esquema de publicación con la estructura del portal anterior
--  Plantilla «esquema»: encabezado destacado, secciones numeradas, objetivos y
--  formatos en tarjetas, 16 categorías que enlazan, tabla con «Consultar»,
--  periodicidad, responsables y llamado a solicitar información.
--  Solo cambia el texto si sigue igual al de la migración 042 (nadie lo editó).
-- =====================================================================
SET NAMES utf8mb4;

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes','plataforma','directorio','preguntas','glosario','procesos','esquema') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'esquema' WHERE slug = 'esquema-de-publicacion-de-la-informacion' AND plantilla IN ('documentos', 'contenido');
UPDATE cms_paginas SET descripcion = 'Instrumento para facilitar el acceso organizado, oportuno y transparente a la información pública de la E.S.E. Hospital San José del Guaviare.' WHERE slug = 'esquema-de-publicacion-de-la-informacion' AND (descripcion IS NULL OR descripcion = '' OR descripcion LIKE 'Instrumento que organiza la información pública%');
UPDATE cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'esquema-de-publicacion-de-la-informacion'
   SET e.contenido = '<p>La E.S.E. Hospital San José del Guaviare, en cumplimiento de los principios de transparencia, acceso a la información pública y rendición de cuentas, pone a disposición de la ciudadanía el Esquema de Publicación de Información.</p>
<p>Este instrumento permite identificar, organizar y facilitar el acceso a la información pública generada, administrada y custodiada por la entidad, promoviendo una gestión institucional transparente y orientada al servicio de la ciudadanía.</p>
<h3>¿Qué es el Esquema de Publicación?</h3>
<p><em>Una herramienta para organizar y facilitar la consulta de información pública.</em></p>
<p>El Esquema de Publicación de Información es un instrumento mediante el cual la E.S.E. identifica y organiza la información que genera, administra y custodia, estableciendo categorías que permiten a la ciudadanía localizar de manera sencilla los contenidos disponibles en el portal institucional.</p>
<p>Su implementación contribuye al fortalecimiento de la transparencia activa, el acceso a la información pública, la rendición de cuentas y la participación ciudadana.</p>
<h3>Objetivos</h3>
<p><em>Principales propósitos del esquema de publicación.</em></p>
<ul>
<li><strong>Transparencia:</strong> Facilitar el acceso de la ciudadanía a la información pública de la institución.</li>
<li><strong>Accesibilidad:</strong> Organizar la información para facilitar su búsqueda y consulta.</li>
<li><strong>Participación:</strong> Fortalecer la participación ciudadana y el control social sobre la gestión institucional.</li>
<li><strong>Rendición de cuentas:</strong> Facilitar el seguimiento ciudadano a los resultados y actuaciones de la entidad.</li>
</ul>
<h3>Categorías de información</h3>
<p><em>Consulte las principales categorías de información publicada por la E.S.E.</em></p>
<ul>
<li><a href="/transparencia/informacion-de-la-entidad">Información institucional</a>: Estructura, funciones, misión, visión, organización, sedes y canales institucionales.</li>
<li><a href="/nuestro-hospital/planes-decreto-612-de-2018">Planeación y gestión</a>: Planes institucionales, estrategias, indicadores y seguimiento.</li>
<li><a href="/transparencia/planeacion-presupuesto-e-informes/presupuesto-general-de-ingresos-gastos-e-inversion">Presupuesto</a>: Presupuesto, ejecución presupuestal, modificaciones e informes.</li>
<li><a href="/transparencia/contratacion">Contratación</a>: Procesos contractuales, contratos, ejecución y supervisión.</li>
<li><a href="/nuestro-hospital/talento-humano">Talento humano</a>: Información sobre estructura de personal, cargos, perfiles y directorio institucional.</li>
<li><a href="/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos">Trámites y servicios</a>: Información sobre servicios, requisitos, procedimientos y rutas de atención.</li>
<li><a href="/participa">Participación ciudadana</a>: Mecanismos y espacios de participación de la ciudadanía.</li>
<li><a href="/atencion-y-servicios-a-la-ciudadania">Atención al ciudadano</a>: PQRSD, canales de atención y mecanismos de servicio a la ciudadanía.</li>
<li><a href="/transparencia/planeacion-presupuesto-e-informes/informacion-publica-yo-relevante">Información financiera</a>: Estados financieros, informes contables y demás información financiera.</li>
<li><a href="/transparencia/planeacion-presupuesto-e-informes/informes-de-la-oficina-de-control-interno">Control y evaluación</a>: Auditorías, informes de control interno, planes de mejoramiento y seguimiento.</li>
<li><a href="/transparencia/datos-abiertos/instrumentos-de-gestion-de-la-informacion/programa-de-gestion-documental">Gestión documental</a>: Instrumentos archivísticos, gestión de documentos e información institucional.</li>
<li><a href="/transparencia/datos-abiertos/seccion-de-datos-abiertos">Datos abiertos</a>: Conjuntos de datos públicos disponibles para consulta y reutilización.</li>
<li><a href="/transparencia/datos-abiertos">Gobierno Digital</a>: Estrategias, proyectos y acciones de transformación y gestión digital.</li>
<li><a href="/transparencia/informacion-especifica-para-grupos-de-interes">Grupos étnicos</a>: Información sobre enfoque diferencial, interculturalidad y participación comunitaria.</li>
<li><a href="/participa/rendicion-de-cuentas">Rendición de cuentas</a>: Informes, estrategias, evidencias y resultados de los ejercicios de rendición de cuentas.</li>
<li><a href="/transparencia">Transparencia activa</a>: Información publicada de manera proactiva para facilitar el acceso ciudadano.</li>
</ul>
<h3>Esquema de publicación</h3>
<p><em>Organización de la información pública institucional.</em></p>
<table>
<thead><tr><th>Información</th><th>Responsable</th><th>Formato</th><th>Periodicidad</th></tr></thead>
<tbody>
<tr><td><a href="/transparencia/informacion-de-la-entidad">Información institucional</a></td><td>Planeación</td><td>PDF / HTML</td><td>Cuando se modifique</td></tr>
<tr><td><a href="/nuestro-hospital/planes-decreto-612-de-2018">Planes institucionales</a></td><td>Planeación</td><td>PDF</td><td>Anual</td></tr>
<tr><td><a href="/transparencia/planeacion-presupuesto-e-informes/presupuesto-general-de-ingresos-gastos-e-inversion">Presupuesto y ejecución</a></td><td>Área Financiera</td><td>PDF / XLSX</td><td>Periódica</td></tr>
<tr><td><a href="/transparencia/contratacion">Procesos contractuales</a></td><td>Contratación</td><td>PDF / HTML</td><td>Permanente</td></tr>
<tr><td><a href="/nuestro-hospital/talento-humano">Talento humano</a></td><td>Talento Humano</td><td>PDF / HTML</td><td>Según actualización</td></tr>
<tr><td><a href="/pqrsf">PQRSD</a></td><td>Atención al Usuario</td><td>HTML / PDF</td><td>Permanente</td></tr>
<tr><td><a href="/transparencia/planeacion-presupuesto-e-informes/informes-de-la-oficina-de-control-interno">Informes de control</a></td><td>Control Interno</td><td>PDF</td><td>Según programación</td></tr>
<tr><td><a href="/transparencia/datos-abiertos/seccion-de-datos-abiertos">Datos abiertos</a></td><td>Gobierno Digital</td><td>CSV / XLSX</td><td>Según actualización</td></tr>
</tbody>
</table>
<h3>Formatos y medios de publicación</h3>
<p><em>Diferentes formatos utilizados para facilitar el acceso y reutilización de la información.</em></p>
<ul>
<li><strong>HTML:</strong> Información disponible directamente en el portal institucional.</li>
<li><strong>PDF:</strong> Documentos e informes institucionales disponibles para consulta.</li>
<li><strong>XLSX:</strong> Información estructurada disponible para consulta y análisis.</li>
<li><strong>CSV:</strong> Datos estructurados disponibles para procesamiento y reutilización.</li>
</ul>
<h3>Periodicidad de actualización</h3>
<p><em>La información se actualiza de acuerdo con su naturaleza y las obligaciones aplicables.</em></p>
<ul>
<li><strong>Permanente:</strong> Información disponible de manera continua.</li>
<li><strong>Mensual:</strong> Información actualizada periódicamente durante la vigencia.</li>
<li><strong>Trimestral:</strong> Información que se actualiza cada trimestre de acuerdo con su naturaleza.</li>
<li><strong>Anual:</strong> Información correspondiente a instrumentos de planeación y gestión anual.</li>
<li><strong>Cuando se modifique:</strong> Información que se actualiza cuando existe una modificación institucional.</li>
</ul>
<h3>Responsables de la información</h3>
<p><em>Las diferentes áreas institucionales participan en la generación, actualización y publicación.</em></p>
<ul>
<li><strong>Oficina de Planeación:</strong> Planeación institucional, seguimiento, indicadores y gestión.</li>
<li><strong>Gobierno Digital / TIC:</strong> Gestión de contenidos digitales, portal web, datos abiertos y Gobierno Digital.</li>
<li><strong>Contratación:</strong> Información relacionada con procesos y gestión contractual.</li>
<li><strong>Área Financiera:</strong> Información presupuestal, financiera y contable.</li>
<li><strong>Talento Humano:</strong> Información relacionada con personal y estructura de cargos.</li>
<li><strong>Control Interno:</strong> Informes de auditoría, evaluación y seguimiento institucional.</li>
</ul>
<h3>¿No encuentra la información que necesita?</h3>
<p>Si la información que busca no se encuentra publicada en el portal institucional, puede presentar una solicitud de acceso a la información pública a través de los canales de atención dispuestos por la E.S.E.</p>
<p><a href="/pqrsf">Solicitar información</a></p>
<p><a href="mailto:gbenlinea@esehospitalguaviare.gov.co">gbenlinea@esehospitalguaviare.gov.co</a></p>', e.resumen = 'Qué información publica la E.S.E., quién la produce, en qué formato y cada cuánto se actualiza.'
 WHERE e.slug = 'esquema-de-publicacion' AND e.contenido LIKE '%<h3>Información publicada</h3>%';
