-- =====================================================================
--  REINICIA LA ESTRUCTURA DEL CMS (Resolución 1519 de 2020)
--
--  ⚠️ BORRA todos los menús, páginas y entradas existentes.
--  Conserva: usuarios (cms_usuarios) y la biblioteca multimedia (cms_multimedia).
--  Úselo solo en la fase de pruebas / antes de cargar el contenido real.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM cms_entrada_multimedia;
DELETE FROM cms_entradas;
DELETE FROM cms_paginas;
DELETE FROM cms_menus;
ALTER TABLE cms_entradas AUTO_INCREMENT = 1;
ALTER TABLE cms_paginas  AUTO_INCREMENT = 1;
ALTER TABLE cms_menus    AUTO_INCREMENT = 1;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO cms_menus (id, nombre, ubicacion) VALUES
  (1, 'Menú principal', 'principal'),
  (2, 'Pie de página',  'pie');

INSERT INTO cms_paginas (id, menu_id, parent_id, titulo, slug, descripcion, plantilla, url_externa, orden, visible_en_menu, estado) VALUES
  (1, 1, NULL, 'Transparencia y acceso a la información pública', 'transparencia', 'Información pública de la E.S.E. Hospital San José del Guaviare, organizada según la Ley 1712 de 2014 y la Resolución 1519 de 2020 de MinTIC.', 'contenido', NULL, 0, 1, 'publicada'),
  (2, 1, 1, '1. Información de la entidad', 'informacion-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (3, 1, 2, '1.1 Misión, visión, funciones y deberes', 'mision-vision-funciones-y-deberes', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (4, 1, 2, '1.2 Estructura orgánica - Organigrama', 'estructura-organica-organigrama', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (5, 1, 2, '1.3 Mapas y cartas descriptivas de los procesos', 'mapas-y-cartas-descriptivas-de-los-procesos', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (6, 1, 2, '1.4 Directorio institucional', 'directorio-institucional', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (7, 1, 2, '1.5 Directorio de servidores públicos, empleados o contratistas', 'directorio-de-servidores-publicos-empleados-o-contratistas', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (8, 1, 2, '1.6 Directorio de entidades', 'directorio-de-entidades', NULL, 'contenido', NULL, 5, 1, 'publicada'),
  (9, 1, 2, '1.7 Directorio de agremiaciones, asociaciones y otros grupos de interés', 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes', NULL, 'contenido', NULL, 6, 1, 'publicada'),
  (10, 1, 2, '1.8 Servicio al público, normas, formularios y protocolos de atención', 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion', NULL, 'documentos', NULL, 7, 1, 'publicada'),
  (11, 1, 2, '1.9 Procedimientos que se siguen para tomar decisiones en las diferentes áreas', 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (12, 1, 2, '1.10 Mecanismo de presentación directa de solicitudes, quejas y reclamos', 'mecanismo-pqrsd', NULL, 'enlace', '/pqrsf', 9, 1, 'publicada'),
  (13, 1, 2, '1.11 Calendario de actividades y eventos', 'calendario-de-actividades-y-eventos', NULL, 'contenido', NULL, 10, 1, 'publicada'),
  (14, 1, 2, '1.12 Información sobre decisiones que pueden afectar al público', 'informacion-sobre-decisiones-que-pueden-afectar-al-publico', NULL, 'documentos', NULL, 11, 1, 'publicada'),
  (15, 1, 2, '1.13 Entes y autoridades que lo vigilan', 'entes-y-autoridades-que-lo-vigilan', NULL, 'contenido', NULL, 12, 1, 'publicada'),
  (16, 1, 2, '1.14 Publicación de hojas de vida', 'publicacion-de-hojas-de-vida', NULL, 'documentos', NULL, 13, 1, 'publicada'),
  (17, 1, 1, '2. Normativa', 'normativa', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (18, 1, 17, '2.1 Normativa de la entidad', 'normativa-de-la-entidad', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (19, 1, 18, '2.1.1 Leyes', 'leyes', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (20, 1, 18, '2.1.2 Decreto único reglamentario', 'decreto-unico-reglamentario', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (21, 1, 18, '2.1.3 Normativa aplicable', 'normativa-aplicable', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (22, 1, 18, '2.1.4 Vínculo al Diario o Gaceta Oficial', 'vinculo-al-diario-o-gaceta-oficial', NULL, 'enlace', 'http://www.imprenta.gov.co/diario-oficial', 3, 1, 'publicada'),
  (23, 1, 18, '2.1.5 Políticas, lineamientos y manuales', 'politicas-lineamientos-y-manuales', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (24, 1, 18, '2.1.6 Agenda regulatoria', 'agenda-regulatoria', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (25, 1, 17, '2.2 Búsqueda de normas', 'busqueda-de-normas', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (26, 1, 25, '2.2.1 Sistema Único de Información Normativa - SUIN', 'sistema-unico-de-informacion-normativa-suin', NULL, 'enlace', 'https://www.suin-juriscol.gov.co', 0, 1, 'publicada'),
  (27, 1, 25, '2.2.2 Sistema de búsqueda de normas propio de la entidad', 'sistema-de-busqueda-de-normas-propio-de-la-entidad', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (28, 1, 17, '2.3 Proyectos de normas para comentarios', 'proyectos-de-normas-para-comentarios', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (29, 1, 1, '3. Contratación', 'contratacion', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (30, 1, 29, '3.1 Plan Anual de Adquisiciones', 'plan-anual-de-adquisiciones', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (31, 1, 29, '3.2 Publicación de la información contractual', 'publicacion-de-la-informacion-contractual', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (32, 1, 29, '3.3 Publicación de la ejecución de los contratos', 'publicacion-de-la-ejecucion-de-los-contratos', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (33, 1, 29, '3.4 Manual de contratación, adquisición y/o compras', 'manual-de-contratacion-adquisicion-yo-compras', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (34, 1, 29, '3.5 Formatos o modelos de contratos o pliegos tipo', 'formatos-o-modelos-de-contratos-o-pliegos-tipo', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (35, 1, 1, '4. Planeación, presupuesto e informes', 'planeacion-presupuesto-e-informes', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (36, 1, 35, '4.1 Presupuesto general de ingresos, gastos e inversión', 'presupuesto-general-de-ingresos-gastos-e-inversion', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (37, 1, 35, '4.2 Ejecución presupuestal', 'ejecucion-presupuestal', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (38, 1, 35, '4.3 Plan de acción', 'plan-de-accion', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (39, 1, 35, '4.4 Proyectos de inversión', 'proyectos-de-inversion', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (40, 1, 35, '4.5 Informes de empalme', 'informes-de-empalme', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (41, 1, 35, '4.6 Información pública y/o relevante', 'informacion-publica-yo-relevante', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (42, 1, 35, '4.7 Informes de gestión, evaluación y auditoría', 'informes-de-gestion-evaluacion-y-auditoria', NULL, 'documentos', NULL, 6, 1, 'publicada'),
  (43, 1, 35, '4.8 Informes de la Oficina de Control Interno', 'informes-de-la-oficina-de-control-interno', NULL, 'documentos', NULL, 7, 1, 'publicada'),
  (44, 1, 35, '4.9 Informe sobre defensa pública y prevención del daño antijurídico', 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (45, 1, 35, '4.10 Informes trimestrales sobre acceso a información, quejas y reclamos', 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos', NULL, 'documentos', NULL, 9, 1, 'publicada'),
  (46, 1, 1, '5. Trámites', 'tramites-transparencia', NULL, 'enlace', '/atencion-y-servicios-a-la-ciudadania/tramites-y-otros-procedimientos', 4, 1, 'publicada'),
  (47, 1, 1, '6. Participa', 'participa-transparencia', NULL, 'enlace', '/participa', 5, 1, 'publicada'),
  (48, 1, 1, '7. Datos abiertos', 'datos-abiertos', NULL, 'contenido', NULL, 6, 1, 'publicada'),
  (49, 1, 48, '7.1 Instrumentos de gestión de la información', 'instrumentos-de-gestion-de-la-informacion', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (50, 1, 49, '7.1.1 Registro de activos de información', 'registro-de-activos-de-informacion', NULL, 'documentos', NULL, 0, 1, 'publicada'),
  (51, 1, 49, '7.1.2 Índice de información clasificada y reservada', 'indice-de-informacion-clasificada-y-reservada', NULL, 'documentos', NULL, 1, 1, 'publicada'),
  (52, 1, 49, '7.1.3 Esquema de publicación de la información', 'esquema-de-publicacion-de-la-informacion', NULL, 'documentos', NULL, 2, 1, 'publicada'),
  (53, 1, 49, '7.1.4 Programa de Gestión Documental', 'programa-de-gestion-documental', NULL, 'documentos', NULL, 3, 1, 'publicada'),
  (54, 1, 49, '7.1.5 Tablas de Retención Documental', 'tablas-de-retencion-documental', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (55, 1, 49, '7.1.6 Costos de reproducción de la información pública', 'costos-de-reproduccion-de-la-informacion-publica', NULL, 'documentos', NULL, 5, 1, 'publicada'),
  (56, 1, 48, '7.2 Sección de datos abiertos', 'seccion-de-datos-abiertos', NULL, 'enlace', 'https://www.datos.gov.co', 1, 1, 'publicada'),
  (57, 1, 1, '8. Información específica para grupos de interés', 'informacion-especifica-para-grupos-de-interes', NULL, 'contenido', NULL, 7, 1, 'publicada'),
  (58, 1, 57, '8.1 Información para niñas, niños y adolescentes', 'informacion-para-ninas-ninos-y-adolescentes', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (59, 1, 57, '8.2 Información para mujeres', 'informacion-para-mujeres', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (60, 1, 57, '8.3 Otros grupos de interés', 'otros-grupos-de-interes', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (61, 1, 1, '9. Obligación de reporte de información específica por parte de la entidad', 'reporte-de-informacion-especifica', NULL, 'documentos', NULL, 8, 1, 'publicada'),
  (62, 1, NULL, 'Atención y servicios a la ciudadanía', 'atencion-y-servicios-a-la-ciudadania', 'Trámites, canales de atención y mecanismos para presentar peticiones, quejas, reclamos, sugerencias y denuncias.', 'contenido', NULL, 1, 1, 'publicada'),
  (63, 1, 62, 'Trámites y otros procedimientos', 'tramites-y-otros-procedimientos', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (64, 1, 62, 'Canales de atención y pida una cita', 'canales-de-atencion', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (65, 1, 62, 'PQRSD - Peticiones, quejas, reclamos, sugerencias y denuncias', 'pqrsd', NULL, 'enlace', '/pqrsf', 2, 1, 'publicada'),
  (66, 1, NULL, 'Participa', 'participa', 'Espacios de participación ciudadana en la gestión de la E.S.E. Hospital San José del Guaviare (lineamientos del DAFP).', 'contenido', NULL, 2, 1, 'publicada'),
  (67, 1, 66, 'Participación para el diagnóstico de necesidades e identificación de problemas', 'participacion-para-el-diagnostico-de-necesidades-e-identificacion-de-problemas', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (68, 1, 66, 'Planeación y presupuesto participativo', 'planeacion-y-presupuesto-participativo', NULL, 'contenido', NULL, 1, 1, 'publicada'),
  (69, 1, 66, 'Consulta ciudadana', 'consulta-ciudadana', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (70, 1, 66, 'Colaboración e innovación abierta', 'colaboracion-e-innovacion-abierta', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (71, 1, 66, 'Rendición de cuentas', 'rendicion-de-cuentas', NULL, 'documentos', NULL, 4, 1, 'publicada'),
  (72, 1, 66, 'Control social', 'control-social', NULL, 'contenido', NULL, 5, 1, 'publicada'),
  (73, 1, NULL, 'Nuestro Hospital', 'nuestro-hospital', NULL, 'contenido', NULL, 3, 1, 'publicada'),
  (74, 1, 73, 'Reseña histórica', 'resena-historica', NULL, 'contenido', NULL, 0, 1, 'publicada'),
  (75, 1, 73, 'Portafolio de servicios', 'portafolio-de-servicios', NULL, 'listado', NULL, 1, 1, 'publicada'),
  (76, 1, 73, 'Sedes y horarios de atención', 'sedes-y-horarios', NULL, 'contenido', NULL, 2, 1, 'publicada'),
  (77, 1, NULL, 'Cotizaciones y Propuestas', 'cotizaciones-propuestas', NULL, 'enlace', '/cotizaciones-propuestas', 4, 1, 'publicada'),
  (78, 1, NULL, 'Trabaja con Nosotros', 'trabaja-nosotros', NULL, 'enlace', '/trabaja-nosotros', 5, 1, 'publicada'),
  (79, 1, NULL, 'Noticias', 'noticias', NULL, 'listado', NULL, 6, 0, 'publicada'),
  (80, 2, NULL, 'Políticas de privacidad y tratamiento de datos', 'politicas-de-privacidad', NULL, 'contenido', NULL, 0, 1, 'borrador'),
  (81, 2, NULL, 'Términos y condiciones', 'terminos-y-condiciones', NULL, 'contenido', NULL, 1, 1, 'borrador');
