-- =====================================================================
-- 045 · Grupos étnicos, Atención con enfoque diferencial y Gobierno Digital
--  Páginas del portal anterior (/grupos_etnicos/61, /enfoque-diferencial/65 y
--  /gobierno_digital/63) con la plantilla «esquema» (secciones numeradas y tarjetas).
--  Además: Evaluación del Plan de Acción III trimestre 2026 (publicada el 30/10/2026)
--  y la versión nueva del formato de solicitud de copia de historia clínica.
-- =====================================================================
SET NAMES utf8mb4;

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, icono, orden, visible_en_menu, estado)
SELECT a.menu_id, a.id, 'Grupos étnicos', 'grupos-etnicos', 'Atención integral en salud con enfoque diferencial, intercultural y de respeto por la diversidad étnica y cultural del territorio.', 'esquema', 'govco:globe-americas', 0, 1, 'publicada'
  FROM cms_paginas a WHERE a.slug = 'otros-grupos-de-interes' AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'grupos-etnicos');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Grupos étnicos', 'grupos-etnicos', 'Atención integral en salud con enfoque diferencial, intercultural y de respeto por la diversidad étnica y cultural del territorio.', '<p>La E.S.E. Hospital San José del Guaviare reconoce la diversidad étnica y cultural del departamento del Guaviare y promueve acciones orientadas a garantizar el acceso a los servicios de salud bajo principios de equidad, respeto por la diversidad cultural, participación comunitaria, interculturalidad y reconocimiento de los saberes propios.</p>
<p>El enfoque diferencial étnico busca que las acciones de promoción de la salud, prevención de la enfermedad, atención, rehabilitación y gestión del riesgo respondan a las características culturales, territoriales, sociales y comunitarias de los pueblos indígenas y demás grupos étnicos presentes en el territorio.</p>
<p>La institución trabaja para fortalecer una atención que reconozca las particularidades de cada comunidad y promueva el diálogo entre los conocimientos y prácticas propias de los pueblos y el sistema de salud.</p>
<h3>¿Qué entendemos por enfoque diferencial étnico?</h3>
<p><em>Una atención en salud basada en el reconocimiento, respeto y protección de la diversidad cultural.</em></p>
<p>El enfoque diferencial étnico es una perspectiva que permite reconocer las condiciones particulares de los pueblos y comunidades étnicas, con el propósito de eliminar barreras de acceso y garantizar una atención en salud pertinente, respetuosa y culturalmente adecuada.</p>
<ul>
<li><strong>Diversidad cultural:</strong> Reconocimiento y respeto de las diferentes culturas, tradiciones, conocimientos y formas de vida.</li>
<li><strong>Atención humanizada:</strong> Atención digna, respetuosa y libre de cualquier forma de discriminación.</li>
<li><strong>Equidad:</strong> Acciones orientadas a disminuir las barreras que afectan el acceso a los servicios de salud.</li>
<li><strong>Interculturalidad:</strong> Diálogo respetuoso entre los conocimientos del sistema de salud y los saberes propios.</li>
</ul>
<h3>Comunidades étnicas del territorio</h3>
<p><em>Reconocimiento de la diversidad cultural del departamento del Guaviare.</em></p>
<p>El departamento del Guaviare cuenta con una importante diversidad étnica y cultural, especialmente representada por pueblos indígenas, cuyas comunidades hacen parte fundamental del territorio y de la identidad cultural de la región.</p>
<p>La E.S.E. Hospital San José del Guaviare reconoce a las comunidades étnicas como actores fundamentales para la construcción de acciones de salud pertinentes y participativas.</p>
<ul>
<li><strong>Territorio</strong></li>
<li><strong>Comunidad</strong></li>
<li><strong>Saberes propios</strong></li>
<li><strong>Salud intercultural</strong></li>
</ul>
<p>Las acciones institucionales deben promover el diálogo permanente con las autoridades tradicionales, líderes comunitarios, organizaciones indígenas y demás representantes de las comunidades étnicas.</p>
<h3>Atención intercultural en salud</h3>
<p><em>Construcción de puentes entre los saberes propios y los servicios institucionales de salud.</em></p>
<p>La atención intercultural busca generar un diálogo respetuoso entre el conocimiento científico y los saberes tradicionales de las comunidades.</p>
<ul>
<li><strong>Diálogo intercultural:</strong> Promover espacios de comunicación y concertación entre el personal de salud, las autoridades tradicionales, líderes y comunidades.</li>
<li><strong>Acceso a los servicios:</strong> Contribuir a la eliminación de barreras que dificulten el acceso de las comunidades étnicas a los servicios de salud.</li>
<li><strong>Reconocimiento de saberes propios:</strong> Respetar los conocimientos, prácticas tradicionales y formas propias de cuidado dentro del marco de la normatividad vigente.</li>
<li><strong>Participación comunitaria:</strong> Fortalecer la participación de las comunidades en la identificación de necesidades y construcción de alternativas de atención.</li>
</ul>
<h3>Líneas de acción institucional</h3>
<p><em>Acciones orientadas al fortalecimiento de la atención diferencial e intercultural.</em></p>
<ul>
<li><strong>Caracterización y diagnóstico:</strong> Identificación de las principales necesidades y condiciones de salud de las comunidades étnicas del territorio, teniendo en cuenta aspectos sociales, culturales, territoriales y ambientales.</li>
<li><strong>Promoción de la salud y prevención de la enfermedad:</strong> Desarrollo de acciones de promoción de la salud y gestión del riesgo dirigidas a las comunidades étnicas, teniendo en cuenta sus características culturales y territoriales. Incluye: educación para la salud; prevención de enfermedades; salud sexual y reproductiva; salud materno-infantil; vacunación; nutrición; salud mental; prevención de enfermedades transmisibles; hábitos y estilos de vida saludables; gestión del riesgo en salud.</li>
<li><strong>Formación del talento humano:</strong> Fortalecimiento de las competencias del talento humano de la institución para brindar una atención con enfoque diferencial e intercultural. Incluye: enfoque diferencial étnico; derechos de las comunidades étnicas; atención intercultural; comunicación intercultural; prevención de la discriminación; respeto por los saberes tradicionales; participación comunitaria; atención humanizada y diferencial.</li>
<li><strong>Participación de las comunidades:</strong> Promoción de espacios de participación y diálogo con autoridades tradicionales, líderes indígenas, organizaciones comunitarias, representantes de las comunidades y demás actores relacionados con la atención en salud.</li>
</ul>
<h3>Articulación con las autoridades tradicionales</h3>
<p><em>Participación y concertación para fortalecer las acciones de salud en el territorio.</em></p>
<p>La E.S.E. Hospital San José del Guaviare reconoce la importancia de las autoridades tradicionales y organizaciones representativas de las comunidades indígenas como actores fundamentales para el desarrollo de acciones de salud con pertinencia cultural.</p>
<ul>
<li><strong>Institución de salud</strong></li>
<li><strong>Autoridades tradicionales</strong></li>
<li><strong>Comunidad</strong></li>
<li><strong>Entidades territoriales</strong></li>
</ul>
<h3>Salud propia e intercultural</h3>
<p><em>Reconocimiento de las formas propias de cuidado de las comunidades.</em></p>
<p>La salud de los pueblos indígenas comprende dimensiones individuales, familiares, comunitarias, territoriales, culturales y espirituales.</p>
<p>Por esta razón, las acciones de atención en salud deben reconocer que las comunidades poseen conocimientos, prácticas y mecanismos propios para el cuidado de la salud.</p>
<p>La E.S.E. Hospital San José del Guaviare promueve el respeto por estos conocimientos y busca fortalecer espacios de diálogo intercultural que permitan avanzar hacia una atención integral y pertinente.</p>
<h3>Jornadas y acciones comunitarias</h3>
<p><em>Acercamiento de los servicios de salud a las comunidades del territorio.</em></p>
<p>Como parte de las estrategias de acercamiento a las comunidades, se podrán desarrollar jornadas de salud y actividades extramurales orientadas a acercar los servicios institucionales a las poblaciones que presentan barreras geográficas, culturales o sociales.</p>
<ul>
<li><strong>Valoraciones en salud</strong></li>
<li><strong>Educación en salud</strong></li>
<li><strong>Vacunación</strong></li>
<li><strong>Salud oral</strong></li>
<li><strong>Enfermería</strong></li>
<li><strong>Promoción y prevención</strong></li>
<li><strong>Orientación de rutas</strong></li>
<li><strong>Participación comunitaria</strong></li>
</ul>
<h3>Ruta de atención con enfoque diferencial</h3>
<p><em>Orientación para una atención integral, respetuosa y pertinente.</em></p>
<ul>
<li><strong>Identificación:</strong> Reconocimiento de la pertenencia étnica y de las necesidades particulares de la persona o comunidad.</li>
<li><strong>Orientación:</strong> Información clara sobre los servicios disponibles y las rutas de atención.</li>
<li><strong>Atención:</strong> Prestación del servicio bajo principios de calidad, seguridad, humanización y respeto por la diversidad.</li>
<li><strong>Articulación:</strong> Coordinación con autoridades tradicionales, entidades territoriales, EPS y demás actores relacionados con la atención.</li>
<li><strong>Seguimiento:</strong> Seguimiento de las situaciones identificadas y de las acciones requeridas para garantizar la continuidad de la atención.</li>
</ul>
<h3>Derechos de las comunidades étnicas en salud</h3>
<p><em>Todas las personas tienen derecho a recibir una atención digna, respetuosa y sin discriminación.</em></p>
<ul>
<li>Recibir una atención digna y respetuosa.</li>
<li>Recibir atención sin discriminación.</li>
<li>Acceder a los servicios de salud con calidad y oportunidad.</li>
<li>Recibir información clara y comprensible.</li>
<li>Recibir atención con respeto por su identidad cultural.</li>
<li>Participar en los asuntos relacionados con su salud.</li>
<li>Recibir orientación sobre las rutas y servicios disponibles.</li>
<li>Recibir una atención que reconozca sus particularidades culturales.</li>
</ul>
<h3>No discriminación</h3>
<p><em>La E.S.E. Hospital San José del Guaviare rechaza cualquier forma de discriminación relacionada con la pertenencia étnica o cultural.</em></p>
<ul>
<li><strong>Respeto</strong></li>
<li><strong>Dignidad</strong></li>
<li><strong>Equidad</strong></li>
<li><strong>Diversidad</strong></li>
<li><strong>Inclusión</strong></li>
<li><strong>Interculturalidad</strong></li>
</ul>
<h3>Participa y construyamos una atención intercultural</h3>
<p><em>La participación de las comunidades es fundamental para mejorar los servicios de salud.</em></p>
<p>Las autoridades tradicionales, líderes comunitarios y miembros de las comunidades étnicas pueden aportar sus conocimientos, necesidades y propuestas para fortalecer la atención institucional.</p>
<ul>
<li><strong>Tu participación es importante:</strong> Contribuye a construir servicios de salud más pertinentes, accesibles y cercanos a las comunidades.</li>
</ul>
<h3>Documentos y normatividad</h3>
<p><em>Información institucional relacionada con el enfoque diferencial y la atención de grupos étnicos.</em></p>
<ul>
<li><strong>Normatividad:</strong> Consulte la normatividad relacionada con grupos étnicos y atención diferencial.</li>
<li><strong>Lineamientos:</strong> Lineamientos y orientaciones para la atención diferencial e intercultural.</li>
<li><strong>Protocolos y rutas:</strong> Protocolos y rutas institucionales relacionadas con la atención diferencial.</li>
<li><strong>Planes y programas:</strong> Planes y programas institucionales relacionados con las comunidades étnicas.</li>
</ul>
<h3>Informes y evidencias</h3>
<p><em>Consulte las acciones desarrolladas por la institución.</em></p>
<ul>
<li><strong>Diagnóstico y caracterización:</strong> Información relacionada con las necesidades de salud de las comunidades étnicas.</li>
<li><strong>Asistencias técnicas:</strong> Registros de acompañamiento y orientación relacionados con el enfoque diferencial.</li>
<li><strong>Capacitaciones:</strong> Evidencias de procesos de formación del talento humano.</li>
<li><strong>Jornadas de salud:</strong> Informes y evidencias de las actividades extramurales desarrolladas con las comunidades.</li>
<li><strong>Participación comunitaria:</strong> Actas, registros y evidencias de espacios de diálogo y participación.</li>
<li><strong>Seguimiento:</strong> Informes de seguimiento a las acciones desarrolladas para fortalecer la atención diferencial.</li>
</ul>
<h3>Información y orientación</h3>
<p><em>Para información, orientación o solicitudes relacionadas con la atención a comunidades étnicas, la ciudadanía puede utilizar los canales institucionales de atención y participación dispuestos por la E.S.E.</em></p>
<p><a href="mailto:gbenlinea@esehospitalguaviare.gov.co">gbenlinea@esehospitalguaviare.gov.co</a></p>', 'articulo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-01 12:00:00', 0, 'esehospitalguaviare.gov.co (Grupos étnicos, enfoque diferencial y Gobierno Digital)'
  FROM cms_paginas p WHERE p.slug = 'grupos-etnicos' AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'grupos-etnicos');

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, icono, orden, visible_en_menu, estado)
SELECT a.menu_id, a.id, 'Atención con enfoque diferencial', 'atencion-con-enfoque-diferencial', 'La E.S.E. Hospital San José del Guaviare reconoce la diversidad de las personas y las diferentes condiciones sociales, físicas, culturales y territoriales que pueden influir en el acceso a los servicios de salud.', 'esquema', 'govco:universal-access', 1, 1, 'publicada'
  FROM cms_paginas a WHERE a.slug = 'otros-grupos-de-interes' AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'atencion-con-enfoque-diferencial');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención con enfoque diferencial', 'atencion-con-enfoque-diferencial', 'La E.S.E. Hospital San José del Guaviare reconoce la diversidad de las personas y las diferentes condiciones sociales, físicas, culturales y territoriales que pueden influir en el acceso a los servicios de salud.', '<p>Por esta razón, se promueven acciones orientadas a facilitar el acceso a la información, la atención humanizada, la orientación y la eliminación de barreras para las personas que requieren medidas de atención diferencial.</p>
<h3>Poblaciones de atención diferencial</h3>
<p><em>Seleccione el grupo de interés para consultar información relacionada.</em></p>
<ul>
<li><strong>Personas en situación de discapacidad:</strong> Información y orientaciones para facilitar el acceso a los servicios, la comunicación y la atención institucional.</li>
<li><strong>Personas adultas mayores:</strong> Orientación sobre servicios, atención humanizada, promoción de la salud y acompañamiento institucional.</li>
<li><strong>Personas víctimas del conflicto armado:</strong> Información y orientación para facilitar el acceso a los servicios de salud y a los mecanismos institucionales de atención.</li>
</ul>
<h3>Personas en situación de discapacidad</h3>
<ul>
<li><strong>Acceso y atención:</strong> La E.S.E. promueve condiciones de atención que contribuyan a disminuir las barreras de acceso a los servicios de salud y a la información institucional. Se busca fortalecer la accesibilidad física, comunicacional y tecnológica, de acuerdo con las capacidades institucionales y las necesidades de las personas usuarias.</li>
<li><strong>Orientaciones:</strong> Atención con trato digno y respetuoso; orientación para acceder a los servicios; identificación de barreras de acceso; fortalecimiento progresivo de la accesibilidad.</li>
</ul>
<h3>Personas adultas mayores</h3>
<ul>
<li><strong>Atención humanizada:</strong> La atención a las personas adultas mayores debe considerar sus necesidades particulares, condiciones de movilidad, comunicación y acceso a los servicios. La institución promueve acciones orientadas al trato digno, la orientación clara y el acompañamiento durante el acceso a los servicios institucionales.</li>
<li><strong>Orientaciones:</strong> Información clara y comprensible; orientación sobre servicios disponibles; trato digno y respetuoso; identificación de necesidades de apoyo.</li>
</ul>
<h3>Personas víctimas del conflicto armado</h3>
<ul>
<li><strong>Orientación institucional:</strong> La E.S.E. reconoce las condiciones particulares de las personas que han sido afectadas por situaciones relacionadas con el conflicto armado y promueve una atención respetuosa, humanizada y libre de discriminación. La información disponible busca facilitar el acceso a los servicios de salud y orientar a la ciudadanía hacia los canales institucionales correspondientes.</li>
<li><strong>Acciones de atención:</strong> Orientación para el acceso a los servicios; atención con enfoque diferencial; trato digno y libre de discriminación; orientación hacia los canales institucionales.</li>
</ul>
<h3>Principios de atención</h3>
<p><em>Principios que orientan la relación con los usuarios.</em></p>
<ul>
<li><strong>Trato digno:</strong> Atención respetuosa, humanizada y orientada a las necesidades de cada persona.</li>
<li><strong>Accesibilidad:</strong> Promoción de condiciones que faciliten el acceso a la información y a los servicios.</li>
<li><strong>Equidad:</strong> Reconocimiento de las diferencias y necesidades particulares de los usuarios.</li>
<li><strong>No discriminación:</strong> Atención basada en el respeto por la dignidad y los derechos de las personas.</li>
</ul>
<h3>Información en lengua étnica</h3>
<p><em>Consulte contenidos institucionales adaptados para facilitar el acceso a la información de las comunidades étnicas del territorio.</em></p>
<p><a href="/transparencia/informacion-especifica-para-grupos-de-interes/otros-grupos-de-interes/grupos-etnicos">Consultar información para grupos étnicos</a></p>
<h3>Canales de orientación</h3>
<p><em>Utilice los canales institucionales para solicitar orientación o información.</em></p>
<ul>
<li><a href="/pqrsf">PQRSFD</a>: Peticiones, quejas, reclamos, sugerencias y felicitaciones.</li>
<li><a href="/transparencia/informacion-de-la-entidad/directorio-institucional">Correos institucionales</a>: Directorio de dependencias, teléfonos y correos de la E.S.E.</li>
<li><a href="/atencion-y-servicios-a-la-ciudadania/canales-de-atencion">Canales de atención al ciudadano</a>: Canales para solicitar orientación, citas e información.</li>
</ul>
<h3>Una atención cercana, incluyente y humanizada</h3>
<p><em>Trabajamos para fortalecer el acceso a la información y a los servicios institucionales, reconociendo las particularidades y necesidades de las personas y comunidades del territorio.</em></p>', 'articulo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-01 12:00:00', 0, 'esehospitalguaviare.gov.co (Grupos étnicos, enfoque diferencial y Gobierno Digital)'
  FROM cms_paginas p WHERE p.slug = 'atencion-con-enfoque-diferencial' AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'atencion-con-enfoque-diferencial');

INSERT INTO cms_paginas (menu_id, parent_id, titulo, slug, descripcion, plantilla, icono, orden, visible_en_menu, estado)
SELECT a.menu_id, a.id, 'Gobierno Digital', 'gobierno-digital', 'La E.S.E. Hospital San José del Guaviare desarrolla y promueve iniciativas de transformación digital orientadas a fortalecer los procesos institucionales, facilitar el acceso a la información, optimizar la gestión administrativa y mejorar la experiencia de los usuarios.', 'esquema', 'govco:laptop-code', 11, 1, 'publicada'
  FROM cms_paginas a WHERE a.slug = 'nuestro-hospital' AND NOT EXISTS (SELECT 1 FROM cms_paginas x WHERE x.slug = 'gobierno-digital');
INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gobierno Digital', 'gobierno-digital', 'La E.S.E. Hospital San José del Guaviare desarrolla y promueve iniciativas de transformación digital orientadas a fortalecer los procesos institucionales, facilitar el acceso a la información, optimizar la gestión administrativa y mejorar la experiencia de los usuarios.', '<p>En este espacio se presentan los principales proyectos, aplicativos, plataformas y soluciones tecnológicas desarrolladas o implementadas por la institución en el marco de Gobierno Digital e innovación tecnológica.</p>
<h3>Innovación tecnológica</h3>
<p><em>Soluciones orientadas a transformar y optimizar los procesos institucionales.</em></p>
<ul>
<li><strong>Automatización de procesos:</strong> Implementación de soluciones digitales para reducir actividades manuales, optimizar tiempos y mejorar la trazabilidad de los procesos institucionales.</li>
<li><strong>Digitalización:</strong> Transformación de procesos y documentos físicos mediante herramientas digitales que facilitan la consulta, gestión y conservación de la información.</li>
<li><strong>Gestión de información:</strong> Desarrollo de herramientas para organizar, consultar y analizar información institucional para apoyar la toma de decisiones.</li>
<li><strong>Servicios al ciudadano:</strong> Soluciones digitales destinadas a facilitar el acceso de usuarios y ciudadanos a servicios, información y trámites institucionales.</li>
</ul>
<h3>Desarrollos tecnológicos</h3>
<p><em>Consulte los proyectos y soluciones digitales desarrollados o implementados por la institución.</em></p>
<ul>
<li><strong>Sistema de Solicitudes Contractuales:</strong> Plataforma para la recepción, gestión, seguimiento y respuesta de solicitudes relacionadas con procesos contractuales de la institución.</li>
<li><strong>Inventario Web de Información Pública:</strong> Sistema orientado a organizar, administrar y publicar la información institucional asociada al inventario de transparencia y acceso a la información pública.</li>
<li><strong>Consulta de resultados de laboratorio:</strong> Solución digital orientada a facilitar la consulta de resultados de laboratorio clínico mediante herramientas tecnológicas.</li>
<li><strong>Digitalización y gestión documental:</strong> Iniciativas de transformación digital orientadas a fortalecer la gestión, organización, consulta y conservación de documentos institucionales.</li>
<li><strong>Servicios digitales institucionales:</strong> Desarrollo e implementación de servicios digitales para facilitar el acceso a información, trámites y servicios ofrecidos por la E.S.E.</li>
<li><strong>Gestión y consulta de información:</strong> Herramientas digitales para facilitar la administración, consulta y disponibilidad de información institucional para usuarios y funcionarios.</li>
</ul>
<p>Acceda a: <a href="/solicitudes-contractuales">Solicitudes contractuales</a> · <a href="http://177.93.49.210:9000/resultados/#nbb">Consulta de resultados de laboratorio</a> · <a href="/transparencia/datos-abiertos/instrumentos-de-gestion-de-la-informacion/esquema-de-publicacion-de-la-informacion">Esquema de publicación de la información</a></p>
<h3>Transformación digital para una mejor gestión</h3>
<p><em>Las iniciativas de Gobierno Digital de la E.S.E. Hospital San José del Guaviare buscan fortalecer la relación entre tecnología, gestión institucional y servicio a la ciudadanía, promoviendo procesos más eficientes, transparentes, accesibles y orientados a las necesidades del territorio.</em></p>
<ul>
<li><strong>Transformación de procesos</strong></li>
<li><strong>Uso estratégico de la información</strong></li>
<li><strong>Servicios digitales</strong></li>
<li><strong>Seguridad de la información</strong></li>
<li><strong>Innovación tecnológica</strong></li>
<li><strong>Participación ciudadana</strong></li>
</ul>
<h3>Otros proyectos e iniciativas</h3>
<p><em>Espacio para incorporar nuevos desarrollos tecnológicos institucionales.</em></p>
<ul>
<li><strong>Portal web institucional:</strong> Sitio web y servicios digitales de la E.S.E.</li>
<li><strong>Aplicaciones y herramientas digitales:</strong> Aplicativos desarrollados para apoyar procesos institucionales.</li>
<li><strong>Sistemas de información:</strong> Herramientas para gestión y análisis de información.</li>
<li><strong>Innovación con las comunidades:</strong> Iniciativas tecnológicas orientadas al territorio y sus comunidades.</li>
</ul>
<h3>¿Tiene una iniciativa de innovación tecnológica?</h3>
<p><em>El área de Gobierno Digital y la Oficina de Planeación promueven iniciativas orientadas al fortalecimiento tecnológico y la transformación digital de la institución.</em></p>
<p><a href="mailto:gbenlinea@esehospitalguaviare.gov.co">gbenlinea@esehospitalguaviare.gov.co</a></p>', 'articulo', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-11-01 12:00:00', 0, 'esehospitalguaviare.gov.co (Grupos étnicos, enfoque diferencial y Gobierno Digital)'
  FROM cms_paginas p WHERE p.slug = 'gobierno-digital' AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'gobierno-digital');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, migrado_de)
SELECT 'INFORME_PLAN_DE_ACCION_III_TRIMESTRE_2026.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCION_III_TRIMESTRE_2026.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Evaluación Plan de Acción por áreas III trimestre 2026', 'esehospitalguaviare.gov.co (Grupos étnicos, enfoque diferencial y Gobierno Digital)' FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCION_III_TRIMESTRE_2026.docx');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCION_III_TRIMESTRE_2026.docx'), (SELECT COUNT(*) FROM cms_entrada_multimedia em WHERE em.entrada_id = e.id)
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2026';

UPDATE cms_multimedia SET url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA%20(3).pdf' WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf';
-- El esquema de publicación enlaza la categoría Gobierno Digital a la página nueva
UPDATE cms_entradas SET contenido = REPLACE(contenido, '<a href="/transparencia/datos-abiertos">Gobierno Digital</a>', '<a href="/nuestro-hospital/gobierno-digital">Gobierno Digital</a>')
 WHERE slug = 'esquema-de-publicacion';
