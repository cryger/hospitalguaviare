-- =====================================================================
--  050 · Trabaja con Nosotros: convocatorias del portal actual que faltaban
--  (esehospitalguaviare.gov.co/trabaja-con-nosotros). Se cargan como
--  CERRADAS (históricas). Idempotente por título + fecha. No borra nada.
--  Las imágenes y PDF apuntan al servidor institucional (igual que la
--  migración 003); pueden localizarse después como hizo la 004.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

-- 1) Bacteriólogo (Laboratorio Clínico)
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Bacteriólogo (Laboratorio Clínico)', 'Prestación de servicios', 2, '$4.000.000', 'Turnos rotativos (192 horas al mes)',
       'Laboratorio Clínico. ESE Hospital San José del Guaviare.',
       'La ESE Hospital San José del Guaviare se complace en extender la invitación a participar de la convocatoria de las dos (02) vacantes disponibles para el área de Laboratorio Clínico. Para su postulación, tenga en cuenta las condiciones del contrato.',
       '["Profesional en Bacteriología.", "Consulte los requisitos completos en el documento de la convocatoria."]',
       'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/7.png',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/REQUISITOS%20PROFESIONAL%20EN%20BACTERIOLOG%C3%8DA.pdf',
       '2025-01-07 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Bacteriólogo (Laboratorio Clínico)' AND fecha_publicacion = '2025-01-07 12:00:00');

-- 2) Provisión transitoria por encargo – Presupuesto (Técnico Administrativo)
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Provisión transitoria por encargo – Presupuesto (Técnico Administrativo)', 'Vinculación en planta de personal (encargo)', 1, '$4.179.600', 'De oficina',
       'Presupuesto. ESE Hospital San José del Guaviare.',
       'El área de Talento Humano invita a los servidores públicos inscritos en carrera administrativa, con nombramiento en propiedad adscritos a la planta global de la E.S.E. Hospital San José del Guaviare, que consideren que cumplen con los requisitos exigidos en los artículos 24 y 25 de la Ley 909 de 2004, el Decreto 1083 de 2015 y la Ley 1960 de 2019, a participar del proceso de provisión transitoria de un empleo de carrera a través de encargo.',
       '["Servidor público inscrito en carrera administrativa, con nombramiento en propiedad en la planta global de la E.S.E.", "Cumplir los requisitos de los artículos 24 y 25 de la Ley 909 de 2004, el Decreto 1083 de 2015 y la Ley 1960 de 2019.", "Consulte el comunicado y las funciones del cargo en el documento adjunto."]',
       'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/1111.png',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/COMUNICADO%20INTERNO%2004%20TECNICO%20ADMINISTRATIVO%20Y%20FUNCIONES%20DEL%20CARGO.pdf',
       '2023-10-04 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Provisión transitoria por encargo – Presupuesto (Técnico Administrativo)' AND fecha_publicacion = '2023-10-04 12:00:00');

-- 3) Promotor/a de la salud (líder comunitario)
INSERT INTO cms_vacantes (titulo, tipo_contrato, vacantes, salario, horario, ubicacion, descripcion, requisitos, imagen_url, documento_url, fecha_publicacion, estado, migrado_de)
SELECT 'Promotor/a de la salud (líder comunitario)', 'Prestación de servicios', 1, '$2.226.590 mensual', 'Prestación de servicios',
       'ESE Hospital San José del Guaviare. Departamento del Guaviare.',
       'La ESE Hospital San José del Guaviare, dentro de la implementación de la ESTRATEGIA DE REHABILITACIÓN PSICOSOCIAL COMUNITARIA PARA LA CONVIVENCIA Y NO REPETICIÓN asignada a esta institución por el Ministerio de Salud y Protección Social mediante la Resolución 1275 de 2024, extiende invitación a participar de la convocatoria para la contratación de un promotor/a de la salud (líder/esa comunitario/a).',
       '["Líder o lideresa comunitario/a.", "Consulte los requisitos completos en el documento de la convocatoria."]',
       'https://esehospitalguaviare.gov.co/resourses/imgTrabajos/2%20(2).png',
       'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Promotora%20de%20Salud_12312123.pdf',
       '2024-10-02 12:00:00', 'cerrada', 'esehospitalguaviare.gov.co/trabaja-con-nosotros'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_vacantes WHERE titulo = 'Promotor/a de la salud (líder comunitario)' AND fecha_publicacion = '2024-10-02 12:00:00');
