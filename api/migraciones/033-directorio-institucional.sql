-- =====================================================================
-- 033 · Mecanismos de contacto del portal anterior (Res. 1519)
--  - Nueva plantilla de página "directorio": líneas principales destacadas y
--    directorio de dependencias con buscador y filtro por área
--  - 1.4 Directorio institucional: correos institucionales, directorio telefónico
--    y correo de notificaciones judiciales
--  - 1.8 Servicio al público: normas, protocolos de atención y formularios
-- 115 entradas y 9 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

ALTER TABLE cms_paginas MODIFY plantilla ENUM('contenido','listado','documentos','galeria','enlace','calendario','historia','servicios','organigrama','sedes','plataforma','directorio') NOT NULL DEFAULT 'contenido';
UPDATE cms_paginas SET plantilla = 'directorio' WHERE slug = 'directorio-institucional' AND plantilla = 'contenido';

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'POLITICA DE SERVICIO AL CIUDADANO (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf', 'documento', 'application/pdf', 'Política de servicio al ciudadano', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Resolucion derechos y deberes.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf', 'documento', 'application/pdf', 'Resolución de derechos y deberes de los usuarios', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'DERECHOS Y DEBERES JIW..docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/DERECHOS%20Y%20DEBERES%20JIW..docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Derechos y deberes en lengua Jiw', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/DERECHOS%20Y%20DEBERES%20JIW..docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'REGLAMENTO INTERNO PQRSF ESE HOSPTAL SAN JOSE DEL GUAVIARE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REGLAMENTO%20INTERNO%20PQRSF%20ESE%20HOSPTAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf', 'documento', 'application/pdf', 'Reglamento interno de PQRSF', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REGLAMENTO%20INTERNO%20PQRSF%20ESE%20HOSPTAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'CARTA DE TRATO DIGNO REVISADA POR CALIDAD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf', 'documento', 'application/pdf', 'Carta de trato digno', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'gestion de informacion y atencion al usuario.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf', 'documento', 'application/pdf', 'Procedimiento de gestión de información y atención al usuario', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '08 PROGRAMA DE HUMANIZACIÓN EN LA ATENCIÓN EN SALUD COMPLETO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/08%20PROGRAMA%20DE%20HUMANIZACI%C3%93N%20EN%20LA%20ATENCI%C3%93N%20EN%20SALUD%20COMPLETO.pdf', 'documento', 'application/pdf', 'Programa de humanización en la atención en salud', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/08%20PROGRAMA%20DE%20HUMANIZACI%C3%93N%20EN%20LA%20ATENCI%C3%93N%20EN%20SALUD%20COMPLETO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'E-ET-FO-01 FORMATO DE SOLICITUD DE COPIA DE HISTORIA CLINICA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf', 'documento', 'application/pdf', 'Formato de solicitud de copia de historia clínica (PDF)', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'E-ET-FO-01 FORMATO DE SOLICITUD DE COPIA DE HISTORIA CLINICA.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Formato de solicitud de copia de historia clínica (Excel editable)', NULL, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Conmutador', 'conmutador', NULL, '<ul><li>Teléfono: (608) 584 0531</li></ul>', 'articulo', 'Líneas principales', 'govco:phone-alt', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'conmutador');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Urgencias y ambulancias', 'urgencias-y-ambulancias', NULL, '<ul><li>Celular: 316 744 0324</li></ul><p>Todos los días, las 24 horas.</p>', 'articulo', 'Líneas principales', 'govco:ambulance', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'urgencias-y-ambulancias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Citas de consulta externa', 'citas-de-consulta-externa', NULL, '<ul><li>WhatsApp: 310 203 3803</li></ul>', 'articulo', 'Líneas principales', 'govco:calendar-check', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'citas-de-consulta-externa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Atención al usuario – SIAU', 'atencion-al-usuario-siau', NULL, '<ul><li>Celular: 318 568 9597</li><li>Correo: SIAU@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Líneas principales', 'govco:headset', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'atencion-al-usuario-siau');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Peticiones, quejas y reclamos (PQRSFD)', 'peticiones-quejas-y-reclamos-pqrsfd', NULL, '<ul><li>Correo: contactenos@esehospitalguaviare.gov.co</li></ul><p>Correo de uso exclusivo para PQRSFD; también puede radicar en línea en el formulario de PQRSFD del portal.</p>', 'articulo', 'Líneas principales', 'govco:envelope', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'peticiones-quejas-y-reclamos-pqrsfd');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Notificaciones judiciales', 'notificaciones-judiciales', NULL, '<ul><li>Correo: representacionjudcial@esehospitalguaviare.gov.co</li></ul><p>De uso único y exclusivo para las notificaciones judiciales de los procesos en que la entidad es demandante o demandada (artículos 197, 198 y 199 de la Ley 1437 de 2011). Si envía documentos a este correo, evite enviar también el documento físico.</p>', 'articulo', 'Líneas principales', 'govco:gavel', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'notificaciones-judiciales');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Activos Fijos', 'activos-fijos', NULL, '<ul><li>Correo: activosfijos@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 70, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'activos-fijos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Administración', 'administracion', NULL, '<ul><li>Correo: admin@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 80, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'administracion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Admisiones', 'admisiones', NULL, '<ul><li>Correo: admisiones@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 90, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'admisiones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Admisiones Hospitalizados', 'admisiones-hospitalizados', NULL, '<ul><li>Correo: admisioneshospitalizados@esehospitalguaviare.gov.co</li><li>Celular facturación de hospitalizados: 318 551 3489</li><li>Teléfono facturación de hospitalizados: (608) 584 9155</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 100, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'admisiones-hospitalizados');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Admisiones Urgencia', 'admisiones-urgencia', NULL, '<ul><li>Correo: admisionesurgencias@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 110, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'admisiones-urgencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Almacén y Suministros', 'almacen-y-suministros', NULL, '<ul><li>Correo: almacensuministros@esehospitalguaviare.gov.co</li><li>Teléfono: (608) 584 1243</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 120, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'almacen-y-suministros');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo a Planeación', 'apoyo-a-planeacion', NULL, '<ul><li>Correo: apoyo_planeacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Planeación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 130, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-a-planeacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo Contratación', 'apoyo-contratacion', NULL, '<ul><li>Correo: apoyocontratacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 140, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-contratacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo Facturación', 'apoyo-facturacion', NULL, '<ul><li>Correo: apoyofacturacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 150, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-facturacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo Subgerencia', 'apoyo-subgerencia', NULL, '<ul><li>Correo: apoyosubgerencia@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 160, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-subgerencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo Subgerencia de Servicios de Salud', 'apoyo-subgerencia-de-servicios-de-salud', NULL, '<ul><li>Correo: apoyosubgess@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 170, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-subgerencia-de-servicios-de-salud');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Apoyo Talento Humano', 'apoyo-talento-humano', NULL, '<ul><li>Correo: apoyo_th@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 180, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'apoyo-talento-humano');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Archivo', 'archivo', NULL, '<ul><li>Correo: archivo@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Gestión documental', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 190, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'archivo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Aseguramiento', 'aseguramiento', NULL, '<ul><li>Correo: aseguramientoh@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 200, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'aseguramiento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditoría Concurrente', 'auditoria-concurrente', NULL, '<ul><li>Correo: audiconcu@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 210, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'auditoria-concurrente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditoría de Cuentas Médicas', 'auditoria-de-cuentas-medicas', NULL, '<ul><li>Correo: acumed@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 220, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'auditoria-de-cuentas-medicas');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Bienestar', 'bienestar', NULL, '<ul><li>Correo: bienestarth@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 230, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'bienestar');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Calidad', 'calidad', NULL, '<ul><li>Correo: calidad@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Calidad', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 240, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'calidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cartera', 'cartera', NULL, '<ul><li>Correo: cartera@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 250, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cartera');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Cirugía', 'cirugia', NULL, '<ul><li>Correo: cirugia@esehospitalguaviare.gov.co</li><li>Celular: 321 350 1032</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 260, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'cirugia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta Externa', 'consulta-externa', NULL, '<ul><li>Correo: cexterna@esehospitalguaviare.gov.co</li><li>Celular: 318 550 2184</li><li>Celular: 318 552 8387</li><li>Teléfono: (608) 584 9581</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 270, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'consulta-externa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contabilidad', 'contabilidad', NULL, '<ul><li>Correo: contabilidad@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 280, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contabilidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contratación Talento Humano', 'contratacion-talento-humano', NULL, '<ul><li>Correo: contratacion_th@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 290, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contratacion-talento-humano');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control Interno de Gestión', 'control-interno-de-gestion', NULL, '<ul><li>Correo: controlinterno@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 300, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-interno-de-gestion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control Interno Disciplinario', 'control-interno-disciplinario', NULL, '<ul><li>Correo: cid@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 310, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-interno-disciplinario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control Laboratorio', 'control-laboratorio', NULL, '<ul><li>Correo: controlab@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 320, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'control-laboratorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contáctenos', 'contactenos', NULL, '<ul><li>Correo: contactenos@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 330, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contactenos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación Cartera y Facturación', 'coordinacion-cartera-y-facturacion', NULL, '<ul><li>Correo: fca@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 340, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-cartera-y-facturacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación de Enfermería', 'coordinacion-de-enfermeria', NULL, '<ul><li>Correo: coordinacionenfermeria@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 350, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-de-enfermeria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación de Laboratorio', 'coordinacion-de-laboratorio', NULL, '<ul><li>Correo: coordinacionlab@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 360, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-de-laboratorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación del Programa Priorización de Cáncer', 'coordinacion-del-programa-priorizacion-de-cancer', NULL, '<ul><li>Correo: coordppms@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 370, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-del-programa-priorizacion-de-cancer');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación Médica', 'coordinacion-medica', NULL, '<ul><li>Correo: coordmedica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 380, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-medica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación Referencia', 'coordinacion-referencia', NULL, '<ul><li>Correo: Cordinacionreferencia@esehospitalguaviare.gov.co</li><li>Teléfono: (608) 584 9885</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 390, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-referencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Coordinación servicio UMI (Unidad de Medicina Interna)', 'coordinacion-servicio-umi-unidad-de-medicina-interna', NULL, '<ul><li>Correo: coordinacion_umi@esehospitalguaviare.gov.co</li><li>Celular: 318 552 7833</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 400, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'coordinacion-servicio-umi-unidad-de-medicina-interna');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'COPASST', 'copasst', NULL, '<ul><li>Correo: copasst@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 410, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'copasst');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Copia Cartera', 'copia-cartera', NULL, '<ul><li>Correo: cpcarte@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 420, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'copia-cartera');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Correspondencia Trabajo Social', 'correspondencia-trabajo-social', NULL, '<ul><li>Correo: correspondenciats@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 430, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'correspondencia-trabajo-social');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Costos', 'costos', NULL, '<ul><li>Correo: costos@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 440, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'costos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Donación de Órganos y Tejidos', 'donacion-de-organos-y-tejidos', NULL, '<ul><li>Correo: donacionorganostejidos@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 450, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'donacion-de-organos-y-tejidos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Enfermera de Calidad', 'enfermera-de-calidad', NULL, '<ul><li>Correo: enfermera_calidad@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Calidad', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 460, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'enfermera-de-calidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Epidemiología', 'epidemiologia', NULL, '<ul><li>Correo: epidemiologia@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 470, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'epidemiologia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Equipos Básicos de Salud con Especialidades', 'equipos-basicos-de-salud-con-especialidades', NULL, '<ul><li>Correo: ebs-especialidades@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 480, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'equipos-basicos-de-salud-con-especialidades');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Estadística', 'estadistica', NULL, '<ul><li>Correo: estadistica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Planeación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 490, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'estadistica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Facturación', 'facturacion', NULL, '<ul><li>Correo: facturacion@esehospitalguaviare.gov.co</li><li>Celular: 318 390 2644</li><li>Celular: 318 401 0416</li><li>Celular: 318 449 1317</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 500, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'facturacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Facturación Electrónica', 'facturacion-electronica', NULL, '<ul><li>Correo: facturacionelectronica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 510, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'facturacion-electronica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gerencia', 'gerencia', NULL, '<ul><li>Correo: gerenciageneral@esehospitalguaviare.gov.co</li><li>Celular: 317 439 5339</li><li>Teléfono: (608) 584 0531</li><li>Teléfono: (608) 584 0045</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 520, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'gerencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión Ambiental', 'gestion-ambiental', NULL, '<ul><li>Correo: gestionambiental@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 530, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'gestion-ambiental');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gestión Biomédica', 'gestion-biomedica', NULL, '<ul><li>Correo: gestionbiomedica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 540, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'gestion-biomedica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Gobierno Digital', 'gobierno-digital', NULL, '<ul><li>Correo: gbenlinea@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Gobierno digital', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 550, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'gobierno-digital');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes Legales', 'informes-legales', NULL, '<ul><li>Correo: informeslegales@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Jurídica', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 560, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'informes-legales');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Junta de Profesionales', 'junta-de-profesionales', NULL, '<ul><li>Correo: juntadeprofesionales@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 570, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'junta-de-profesionales');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Junta Directiva', 'junta-directiva', NULL, '<ul><li>Correo: juntadirectiva@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 580, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'junta-directiva');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Jurídica', 'juridica', NULL, '<ul><li>Correo: juridica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Jurídica', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 590, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'juridica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Laboratorio', 'laboratorio', NULL, '<ul><li>Correo: laboratorio@esehospitalguaviare.gov.co</li><li>Celular: 318 551 3262</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 600, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'laboratorio');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Mantenimiento', 'mantenimiento', NULL, '<ul><li>Correo: mantenimiento@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 610, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'mantenimiento');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Mercadeo', 'mercadeo', NULL, '<ul><li>Correo: mercadeo@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 620, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'mercadeo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Médico Auditoría Concurrente', 'medico-auditoria-concurrente', NULL, '<ul><li>Correo: medicoaudiconcu@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 630, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'medico-auditoria-concurrente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Médico de Calidad', 'medico-de-calidad', NULL, '<ul><li>Correo: medico_calidad@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Calidad', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 640, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'medico-de-calidad');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Notificaciones electrónicas', 'notificaciones-electronicas', NULL, '<ul><li>Correo: notificacioneselectronicas2@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Jurídica', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 650, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'notificaciones-electronicas');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Notificaciones electrónicas (buzón anterior)', 'notificaciones-electronicas-buzon-anterior', NULL, '<ul><li>Correo: notificacioneselectronicas@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Jurídica', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 660, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'notificaciones-electronicas-buzon-anterior');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Nutrición', 'nutricion', NULL, '<ul><li>Correo: nutricion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 670, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'nutricion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Nómina', 'nomina', NULL, '<ul><li>Correo: nomina@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 680, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'nomina');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Pagos en Línea', 'pagos-en-linea', NULL, '<ul><li>Correo: rcglosas@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 690, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pagos-en-linea');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Patologías', 'patologias', NULL, '<ul><li>Correo: patologias@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 700, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'patologias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planeación', 'planeacion', NULL, '<ul><li>Correo: planeacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Planeación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 710, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'planeacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'PQRS', 'pqrs', NULL, '<ul><li>Correo: pqrs@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 720, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'pqrs');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Prensa y Comunicaciones', 'prensa-y-comunicaciones', NULL, '<ul><li>Correo: prensa@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Comunicaciones', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 730, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'prensa-y-comunicaciones');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Presupuesto', 'presupuesto', NULL, '<ul><li>Correo: presupuesto@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 740, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'presupuesto');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Psicología', 'psicologia', NULL, '<ul><li>Correo: psicologia@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 750, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'psicologia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Psicología – Talento humano', 'psicologia-talento-humano', NULL, '<ul><li>Correo: psicologath@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 760, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'psicologia-talento-humano');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Radicación Cartera', 'radicacion-cartera', NULL, '<ul><li>Correo: radicacioncarteraesehsjg@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 770, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'radicacion-cartera');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Radio Protección', 'radio-proteccion', NULL, '<ul><li>Correo: radioproteccion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 780, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'radio-proteccion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rayos X', 'rayos-x', NULL, '<ul><li>Correo: rayosx@esehospitalguaviare.gov.co</li><li>Celular: 318 550 2085</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 790, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rayos-x');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recepción de Citas', 'recepcion-de-citas', NULL, '<ul><li>Correo: recepciondecitas@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 800, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recepcion-de-citas');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Recepción Gerencia', 'recepcion-gerencia', NULL, '<ul><li>Correo: gerencia@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 810, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'recepcion-gerencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Referencia y Contrarreferencia', 'referencia-y-contrarreferencia', NULL, '<ul><li>Correo: referencia_contrareferencia@esehospitalguaviare.gov.co</li><li>Celular referencia y facturación: 318 216 3274</li><li>Celular referencia y facturación: 318 217 4137</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 820, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'referencia-y-contrarreferencia');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Regente Farmacéutico', 'regente-farmaceutico', NULL, '<ul><li>Correo: regente@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 830, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'regente-farmaceutico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Rehabilitación Psicosocial', 'rehabilitacion-psicosocial', NULL, '<ul><li>Correo: rehabilitacionpsico@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 840, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'rehabilitacion-psicosocial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Remodelación', 'remodelacion', NULL, '<ul><li>Correo: rac@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 850, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'remodelacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reporte SOAT', 'reporte-soat', NULL, '<ul><li>Correo: reportesoat@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 860, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reporte-soat');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reportes Externos', 'reportes-externos', NULL, '<ul><li>Correo: reportesexternos@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 870, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reportes-externos');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Representación Judicial', 'representacion-judicial', NULL, '<ul><li>Correo: representacionjudcial@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Jurídica', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 880, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'representacion-judicial');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Revisoría Fiscal', 'revisoria-fiscal', NULL, '<ul><li>Correo: r.fiscal@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 890, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'revisoria-fiscal');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguridad del Paciente', 'seguridad-del-paciente', NULL, '<ul><li>Correo: seguridadpte@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Calidad', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 900, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'seguridad-del-paciente');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicio de Alimentación', 'servicio-de-alimentacion', NULL, '<ul><li>Correo: alimentacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 910, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servicio-de-alimentacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicio Farmacéutico', 'servicio-farmaceutico', NULL, '<ul><li>Correo: quimicafarmaceutica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 920, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servicio-farmaceutico');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Servicios Generales', 'servicios-generales', NULL, '<ul><li>Correo: serviciosgenerales@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Administrativa', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 930, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'servicios-generales');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sistema de Gestión de Seguridad y Salud en el Trabajo', 'sistema-de-gestion-de-seguridad-y-salud-en-el-trabajo', NULL, '<ul><li>Correo: SG-SST@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 940, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sistema-de-gestion-de-seguridad-y-salud-en-el-trabajo');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sistema de Información y Atención al Usuario', 'sistema-de-informacion-y-atencion-al-usuario', NULL, '<ul><li>Correo: SIAU@esehospitalguaviare.gov.co</li><li>Celular: 318 568 9597</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 950, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sistema-de-informacion-y-atencion-al-usuario');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Sistemas', 'sistemas', NULL, '<ul><li>Correo: sistemas@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Tecnología', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 960, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'sistemas');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Solicitud Copia Historia Clínica', 'solicitud-copia-historia-clinica', NULL, '<ul><li>Correo: historiaclinica@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 970, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'solicitud-copia-historia-clinica');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Soportes Contratación', 'soportes-contratacion', NULL, '<ul><li>Correo: soportescontratacion@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Contratación', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 980, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'soportes-contratacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Subgerencia Administrativa', 'subgerencia-administrativa', NULL, '<ul><li>Correo: subadmin@esehospitalguaviare.gov.co</li><li>Celular: 318 456 0724</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 990, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'subgerencia-administrativa');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Subgerencia de Servicios de Salud', 'subgerencia-de-servicios-de-salud', NULL, '<ul><li>Correo: subgess@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Directiva', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1000, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'subgerencia-de-servicios-de-salud');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Talento Humano', 'talento-humano', NULL, '<ul><li>Correo: th@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1010, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'talento-humano');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Tesorería', 'tesoreria', NULL, '<ul><li>Correo: tesoreria@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Financiera', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1020, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'tesoreria');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Trabajo Social', 'trabajo-social', NULL, '<ul><li>Correo: tbsocial@esehospitalguaviare.gov.co</li><li>Celular: 321 346 3293</li><li>Teléfono: (608) 584 0168</li><li>Teléfono: (608) 584 0533</li></ul>', 'articulo', 'Atención al ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1030, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'trabajo-social');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Técnico Talento Humano', 'tecnico-talento-humano', NULL, '<ul><li>Correo: Tecnicoth@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1040, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'tecnico-talento-humano');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Unidad de Cuidados Intermedios (UCIM)', 'unidad-de-cuidados-intermedios-ucim', NULL, '<ul><li>Correo: ucim@esehospitalguaviare.gov.co</li></ul>', 'articulo', 'Asistencial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1050, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'unidad-de-cuidados-intermedios-ucim');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Urgencias y hospitalización', 'urgencias-y-hospitalizacion', NULL, '<ul><li>Teléfono: (608) 584 0532</li></ul>', 'articulo', 'Asistencial', 'govco:hospital-symbol', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1060, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'urgencias-y-hospitalizacion');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Ambulancias', 'ambulancias', NULL, '<ul><li>Celular: 316 744 0324</li></ul>', 'articulo', 'Asistencial', 'govco:ambulance', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 1070, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'directorio-institucional'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ambulancias');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Política de servicio al ciudadano', 'politica-de-servicio-al-ciudadano', 'Lineamientos para atender a la ciudadanía con calidad, oportunidad y trato digno.', NULL, 'documento', 'Normas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-03-01 12:00:00', 10, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'politica-de-servicio-al-ciudadano');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/POLITICA%20DE%20SERVICIO%20AL%20CIUDADANO%20(1).pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'politica-de-servicio-al-ciudadano' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derechos y deberes de los usuarios', 'derechos-y-deberes-de-los-usuarios', 'Resolución que adopta los derechos y deberes de los usuarios del hospital.', NULL, 'documento', 'Normas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-06-13 12:00:00', 20, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derechos-y-deberes-de-los-usuarios');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Resolucion%20derechos%20y%20deberes.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'derechos-y-deberes-de-los-usuarios' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Derechos y deberes en lengua Jiw', 'derechos-y-deberes-en-lengua-jiw', 'Derechos y deberes de los usuarios traducidos a la lengua del pueblo Jiw.', NULL, 'documento', 'Normas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-09-13 12:00:00', 30, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'derechos-y-deberes-en-lengua-jiw');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/DERECHOS%20Y%20DEBERES%20JIW..docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'derechos-y-deberes-en-lengua-jiw' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Reglamento interno de PQRSF', 'reglamento-interno-de-pqrsf', 'Reglamento para la gestión de peticiones, quejas, reclamos, sugerencias y felicitaciones.', NULL, 'documento', 'Normas', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-07-18 12:00:00', 40, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'reglamento-interno-de-pqrsf');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REGLAMENTO%20INTERNO%20PQRSF%20ESE%20HOSPTAL%20SAN%20JOSE%20DEL%20GUAVIARE.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'reglamento-interno-de-pqrsf' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Carta de trato digno al usuario', 'carta-de-trato-digno-al-usuario', 'Derechos de los usuarios y medios dispuestos para garantizarlos.', NULL, 'documento', 'Protocolos de atención', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-18 12:00:00', 50, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'carta-de-trato-digno-al-usuario');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/CARTA%20DE%20TRATO%20DIGNO%20REVISADA%20POR%20CALIDAD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'carta-de-trato-digno-al-usuario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procedimiento de gestión de información y atención al usuario', 'procedimiento-de-gestion-de-informacion-y-atencion-al-usuario', 'Cómo se reciben, orientan y atienden las solicitudes de los usuarios (SIAU).', NULL, 'documento', 'Protocolos de atención', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-05-04 12:00:00', 60, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procedimiento-de-gestion-de-informacion-y-atencion-al-usuario');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/gestion%20de%20informacion%20y%20atencion%20al%20usuario.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'procedimiento-de-gestion-de-informacion-y-atencion-al-usuario' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Programa de humanización en la atención en salud', 'programa-de-humanizacion-en-la-atencion-en-salud', 'Acciones para una atención cálida, respetuosa y centrada en la persona.', NULL, 'documento', 'Protocolos de atención', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-01-23 12:00:00', 70, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'programa-de-humanizacion-en-la-atencion-en-salud');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/08%20PROGRAMA%20DE%20HUMANIZACI%C3%93N%20EN%20LA%20ATENCI%C3%93N%20EN%20SALUD%20COMPLETO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'programa-de-humanizacion-en-la-atencion-en-salud' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Formato de solicitud de copia de historia clínica', 'formato-de-solicitud-de-copia-de-historia-clinica', 'Diligéncielo y envíelo a historiaclinica@esehospitalguaviare.gov.co.', NULL, 'documento', 'Formularios', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-10-13 12:00:00', 80, 'esehospitalguaviare.gov.co (Mecanismos de contacto)'
  FROM cms_paginas p WHERE p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'formato-de-solicitud-de-copia-de-historia-clinica');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'formato-de-solicitud-de-copia-de-historia-clinica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/E-ET-FO-01%20FORMATO%20DE%20SOLICITUD%20DE%20COPIA%20DE%20HISTORIA%20CLINICA.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion'
 WHERE e.slug = 'formato-de-solicitud-de-copia-de-historia-clinica' AND e.migrado_de = 'esehospitalguaviare.gov.co (Mecanismos de contacto)';
