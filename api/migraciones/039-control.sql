-- =====================================================================
-- 039 · Control del portal anterior (Res. 1519)
--  - 1.13 Entes y autoridades que lo vigilan (plantilla "directorio")
--  - 4.7 Auditorías de órganos de control, evaluación de la gestión y del plan de acción
--  - 4.8 Informes de la Oficina de Control Interno y planes de mejoramiento
--  - 4.9 Defensa judicial · 4.10 Informes de PQRSF
-- 142 entradas y 267 archivos. No duplica lo que ya exista (por slug y URL).
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'directorio' WHERE slug = 'entes-y-autoridades-que-lo-vigilan' AND plantilla = 'contenido';
UPDATE cms_paginas SET descripcion = 'Informes de gestión, auditorías de los órganos de control, evaluación de la gestión y del plan de acción, y acuerdos de gestión.' WHERE slug = 'informes-de-gestion-evaluacion-y-auditoria' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes y seguimientos de la Oficina de Control Interno: sistema de control interno, austeridad, riesgos, plan anticorrupción, planes de mejoramiento y auditoría.' WHERE slug = 'informes-de-la-oficina-de-control-interno' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Seguimiento al Comité de Conciliación y Defensa Judicial, procesos judiciales y sistema eKOGUI.' WHERE slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Informes semestrales y trimestrales de peticiones, quejas, reclamos, sugerencias y felicitaciones (PQRSF).' WHERE slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Entes de control que vigilan a la E.S.E., su tipo de control, datos de contacto y mecanismos de supervisión.' WHERE slug = 'entes-y-autoridades-que-lo-vigilan' AND (descripcion IS NULL OR descripcion = '');

INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO_PLANES_DECRETO612DE2018_II_SEM_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO_PLANES_DECRETO612DE2018_II_SEM_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe segundo seguimiento Planes Decreto 612 de 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO_PLANES_DECRETO612DE2018_II_SEM_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO PLANES DEC.612 I SEMESTRE 2025 (Reparado).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20PLANES%20DEC.612%20I%20SEMESTRE%202025%20(Reparado).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe primer seguimiento Planes Decreto 612 de 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20PLANES%20DEC.612%20I%20SEMESTRE%202025%20(Reparado).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME SEGUIMIENTO Y EVALUACION PLANES DECRETO 612 DE 2018 VIGENCIA 2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20SEGUIMIENTO%20Y%20EVALUACION%20PLANES%20DECRETO%20612%20DE%202018%20VIGENCIA%202024.doc', 'documento', 'application/msword', 'Informe Seguimiento y Evaluación Planes Decreto 612 de 2018 Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20SEGUIMIENTO%20Y%20EVALUACION%20PLANES%20DECRETO%20612%20DE%202018%20VIGENCIA%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PLANES DTO 612 DE 2018 r..doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PLANES%20DTO%20612%20DE%202018%20r..doc', 'documento', 'application/msword', 'Informe Cumplimiento Planes Institucionales Decreto 612 de 2018 vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PLANES%20DTO%20612%20DE%202018%20r..doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe_Derechos_de_Autor_Vigencia_2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Derechos_de_Autor_Vigencia_2025.pdf', 'documento', 'application/pdf', 'Informe de Derecho de Autor Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Derechos_de_Autor_Vigencia_2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_DERECHOS_DE_AUTOR_.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DERECHOS_DE_AUTOR_.pdf', 'documento', 'application/pdf', 'Informe Derechos de Autor 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DERECHOS_DE_AUTOR_.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DERECHOS DE AUTOR 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DERECHOS%20DE%20AUTOR%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'INFORME DERECHOS DE AUTOR 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DERECHOS%20DE%20AUTOR%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Final Auditoría Financiera y de Gestión Contraloría Departamental Vigencia 2023 E.S.E HSJG Vigencia 2023 PVCFT 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditor%C3%ADa%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202023%20E.S.E%20HSJG%20Vigencia%202023%20PVCFT%202024.pdf', 'documento', 'application/pdf', 'Informe Final Auditoría Financiera y de Gestión Contraloría Departamental Vigencia 2023 E.S.E HSJG Vigencia 2023 PVCFT 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditor%C3%ADa%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202023%20E.S.E%20HSJG%20Vigencia%202023%20PVCFT%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Final Calificación y Revisión de la Cuenta de la E.S.E HSJG Nivel 2 Contraloría Departamental Vigencia 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202022.pdf', 'documento', 'application/pdf', 'Informe Final Calificación y Revisión de la Cuenta de la E.S.E HSJG Nivel 2 Contraloría Departamental Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Final Calificación y Revisión de la Cuenta de la E.S.E HSJG Nivel 2 Contraloría Departamental Vigencia 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202021.pdf', 'documento', 'application/pdf', 'Informe Final Calificación y Revisión de la Cuenta de la E.S.E HSJG Nivel 2 Contraloría Departamental Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Visita Superintendencia Nacional de Salud 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Visita%20Superintendencia%20Nacional%20de%20Salud%202021.pdf', 'documento', 'application/pdf', 'Informe de Visita Superintendencia Nacional de Salud 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Visita%20Superintendencia%20Nacional%20de%20Salud%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Final Auditoria Financiera y de Gestión Contraloría Departamental Vigencia 2020 PVCFT 2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditoria%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202020%20PVCFT%202021.pdf', 'documento', 'application/pdf', 'Informe Final Auditoria Financiera y de Gestión Contraloría Departamental Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditoria%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202020%20PVCFT%202021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1.-INFORME-FINAL-HOSPITAL-VIG-2020-PVCFT-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1.-INFORME-FINAL-HOSPITAL-VIG-2020-PVCFT-2021.pdf', 'documento', 'application/pdf', 'Informe Definitivo Auditoría Regular Contraloría Departamental Vigencia 2019 HOSPITAL SJG PGAT 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1.-INFORME-FINAL-HOSPITAL-VIG-2020-PVCFT-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Superintendencia Nacional de Salud', 'https://www.supersalud.gov.co/Paginas/Busqueda.aspx', 'otro', NULL, 'Superintendencia Nacional de Salud', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.supersalud.gov.co/Paginas/Busqueda.aspx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Contraloría Departamental del Guaviare', 'https://www.contraloriaguaviare.gov.co/?s=hospital&asp_active=1&p_asid=1&p_asp_data=1&filters_initial=1&filters_changed=0&qtranslate_lang=0&current_page_id=2', 'otro', NULL, 'Contraloría Departamental del Guaviare', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://www.contraloriaguaviare.gov.co/?s=hospital&asp_active=1&p_asid=1&p_asp_data=1&filters_initial=1&filters_changed=0&qtranslate_lang=0&current_page_id=2');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de Caja Facturación 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Facturaci%C3%B3n%202022.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Facturación 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Facturaci%C3%B3n%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de Caja Menor Sub. Adm 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Sub.%20Adm%202022.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Administrativo y financiera 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Sub.%20Adm%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de Caja Menor Almacén 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Almac%C3%A9n%202022.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Almacen y Suministros 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Almac%C3%A9n%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-de-Caja-Facturacion-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Facturacion-2021.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Facturación 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Facturacion-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-de-Caja-Menor-Sub.-Adm-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Sub.-Adm-2021.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Administrativo y financiera 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Sub.-Adm-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-de-Caja-Menor-Almacen-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Almacen-2021.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Almacen y Suministros 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Almacen-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-Facturacion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Facturacion.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Facturación 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Facturacion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-Subgerencia.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Subgerencia.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Administrativo y financiera 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Subgerencia.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo-Almacen.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Almacen.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Almacen y Suministros 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Almacen.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de caja - Facturación.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Facturaci%C3%B3n.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Facturación 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Facturaci%C3%B3n.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de caja - Subgerencia Administrativa.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Subgerencia%20Administrativa.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Administrativo y financiera 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Subgerencia%20Administrativa.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo de caja - Almacén y Suministros.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Almac%C3%A9n%20y%20Suministros.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Almacen y Suministros 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Almac%C3%A9n%20y%20Suministros.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueos caja área facturacion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueos%20caja%20%C3%A1rea%20facturacion.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Facturación 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueos%20caja%20%C3%A1rea%20facturacion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Arqueo Caja Menor Subgerencia Adtiva y financiera.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20Caja%20Menor%20Subgerencia%20Adtiva%20y%20financiera.pdf', 'documento', 'application/pdf', 'Arqueo de Caja Administrativo y financiera 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20Caja%20Menor%20Subgerencia%20Adtiva%20y%20financiera.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '01-INFORME-SOCIALIZACION-CODIGO-DE-INTEGRIDAD.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01-INFORME-SOCIALIZACION-CODIGO-DE-INTEGRIDAD.pdf', 'documento', 'application/pdf', 'Informe Código de Integridad 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01-INFORME-SOCIALIZACION-CODIGO-DE-INTEGRIDAD.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AUD GESTION TALENTO HUMANO III VIG 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTION%20TALENTO%20HUMANO%20III%20VIG%202017.pdf', 'documento', 'application/pdf', 'Gestión de Talento Humano Octubre 2017', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTION%20TALENTO%20HUMANO%20III%20VIG%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AUD GESTIÓN TALENTO HUMANO II  VIG 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20II%20%20VIG%202017.pdf', 'documento', 'application/pdf', 'Gestión de Talento Humano Julio 2017', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20II%20%20VIG%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'AUD GESTIÓN TALENTO HUMANO I  VIG 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20I%20%20VIG%202017.pdf', 'documento', 'application/pdf', 'Gestión de Talento Humano Abril 2017', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20I%20%20VIG%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_DE_POLÍTICAS_INSTITUCIONALES_II_SEMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'INFORME DE POLÍTICAS INSTITUCIONALES II SEMESTRE 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_DE_POLÍTICAS_INSTITUCIONALES_I_SEMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_I_SEMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'INFORME DE POLÍTICAS INSTITUCIONALES I SEMESTRE 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_I_SEMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_DE_AVANCES_Y_CUMPLIMIENTO_POLÍTICAS_INSTITUCIONALES_II_SEMESTRE_2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DE_AVANCES_Y_CUMPLIMIENTO_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2024.pdf', 'documento', 'application/pdf', 'Informe de cumplimiento de la implementación de las políticas institucionales adoptadas del MIPG II semestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DE_AVANCES_Y_CUMPLIMIENTO_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE AVANCES Y CUMPLIMIENTO POLÍTICAS INSTITUCIONALES.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AVANCES%20Y%20CUMPLIMIENTO%20POL%C3%8DTICAS%20INSTITUCIONALES.pdf', 'documento', 'application/pdf', 'Informe de cumplimiento de la implementación de las políticas institucionales adoptadas del MIPG I semestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AVANCES%20Y%20CUMPLIMIENTO%20POL%C3%8DTICAS%20INSTITUCIONALES.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION_MAPA_RIESGOS_SICOF_I_CUATRIMESTRE_2026.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_RIESGOS_SICOF_I_CUATRIMESTRE_2026.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF I Cuatrimestre 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_RIESGOS_SICOF_I_CUATRIMESTRE_2026.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION_MAPA_DE_RIESGOS_SICOF_III_CUATRIMESTRE_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_III_CUATRIMESTRE_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF III Cuatrimestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_III_CUATRIMESTRE_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION_MAPA_DE_RIESGOS_SICOF_II_CUATRIMESTRE_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_II_CUATRIMESTRE_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF II Cuatrimestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_II_CUATRIMESTRE_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACIÓN MAPA RIESGOS SICOF I CUATRIMESTRE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACI%C3%93N%20MAPA%20RIESGOS%20SICOF%20I%20CUATRIMESTRE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF I Cuatrimestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACI%C3%93N%20MAPA%20RIESGOS%20SICOF%20I%20CUATRIMESTRE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION MAPA RIESGOS SICOF III CUATRIMESTRE 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20MAPA%20RIESGOS%20SICOF%20III%20CUATRIMESTRE%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF III Cuatrimestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20MAPA%20RIESGOS%20SICOF%20III%20CUATRIMESTRE%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluación Mapa de Riesgos SICOF II Cuatrimestre  2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluaci%C3%B3n%20Mapa%20de%20Riesgos%20SICOF%20II%20Cuatrimestre%20%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Mapa de Riesgos SICOF II Cuatrimestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluaci%C3%B3n%20Mapa%20de%20Riesgos%20SICOF%20II%20Cuatrimestre%20%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 Matriz_Riesgo_20220511_Corrupción (1) DES PAGINA -ok.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n%20(1)%20DES%20PAGINA%20-ok.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n%20(1)%20DES%20PAGINA%20-ok.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO-MAPA-DE-RIESGOS CORRUPCION  III CUATRIMESTRE-2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS%20CORRUPCION%20%20III%20CUATRIMESTRE-2022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento III Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS%20CORRUPCION%20%20III%20CUATRIMESTRE-2022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II  Evaluacion Riesgos de Corrupción 2022.xlsm', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20%20Evaluacion%20Riesgos%20de%20Corrupci%C3%B3n%202022.xlsm', 'documento', 'application/vnd.ms-excel.sheet.macroEnabled.12', 'Seguimiento II Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20%20Evaluacion%20Riesgos%20de%20Corrupci%C3%B3n%202022.xlsm');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Seguimiento I Cuatrimestre Mapa de Riesgos Corrupci├│n e Institucional 2022.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Seguimiento%20I%20Cuatrimestre%20Mapa%20de%20Riesgos%20Corrupci%E2%94%9C%E2%94%82n%20e%20Institucional%202022.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Seguimiento%20I%20Cuatrimestre%20Mapa%20de%20Riesgos%20Corrupci%E2%94%9C%E2%94%82n%20e%20Institucional%202022.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-III-CUATRIMESTRE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-III-CUATRIMESTRE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento III Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-III-CUATRIMESTRE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-II-CUATRIMESTRE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-II-CUATRIMESTRE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento II Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-II-CUATRIMESTRE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUCION-MAPA-DE-RIESGOS-I-TRIMESTRE-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUCION-MAPA-DE-RIESGOS-I-TRIMESTRE-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUCION-MAPA-DE-RIESGOS-I-TRIMESTRE-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACIOM-MAPA-DE-RIESGOS-CORRUPCION-III (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACIOM-MAPA-DE-RIESGOS-CORRUPCION-III%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento III Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACIOM-MAPA-DE-RIESGOS-CORRUPCION-III%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II-EVALUACION-MAPA-RIESGOS-CORRUPCION-3.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-MAPA-RIESGOS-CORRUPCION-3.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento II Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-MAPA-RIESGOS-CORRUPCION-3.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I-EVALUACION-MAPA-RIESGOS-CORRUPCION-1.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I-EVALUACION-MAPA-RIESGOS-CORRUPCION-1.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I-EVALUACION-MAPA-RIESGOS-CORRUPCION-1.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1-1.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1-1.doc', 'documento', 'application/msword', 'Seguimiento III Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1-1.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '2do Seguimiento mapa de riesgos de corrupción.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2do%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento II Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2do%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1er Seguimiento mapa de riesgos de corrupción.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1er%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1er%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III MAPA DE RIESGOS DE CORRUPCIÓN E  INSTITUCIONAL.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/III%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls', 'documento', 'application/vnd.ms-excel', 'Seguimiento III Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/III%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II MAPA DE RIESGOS DE CORRUPCIÓN E  INSTITUCIONAL.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls', 'documento', 'application/vnd.ms-excel', 'Seguimiento II Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I MAPA DE RIESGOS DE CORRUPCIÓN E  INSTITUCIONAL.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls', 'documento', 'application/vnd.ms-excel', 'Seguimiento I Cuatrimestre al Mapa de Riesgos de Corrupción e Institucional 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2026.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2026.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_IV_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_IV_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_IV_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_III_TRIMESTRE_2025 (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_III_TRIMESTRE_2025%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_III_TRIMESTRE_2025%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO IV TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IV%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IV%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO III TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20III%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20III%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO IITRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IITRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IITRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO I TRIMESTRE 2024 (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20I%20TRIMESTRE%202024%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20I%20TRIMESTRE%202024%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. IV TRIMESTRE 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. III TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. II TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20II%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20II%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. I TRIMESTRE 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20I%20TRIMESTRE%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20I%20TRIMESTRE%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. IV TRIMESTRE 2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Austeridad en el Gasto Público III trimestre Vigencia  2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Austeridad%20en%20el%20Gasto%20P%C3%BAblico%20III%20trimestre%20Vigencia%20%202022.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Austeridad%20en%20el%20Gasto%20P%C3%BAblico%20III%20trimestre%20Vigencia%20%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF-AUSTERIDAD-EN-EL-GASTO.-II-TRIMESTRE-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-EN-EL-GASTO.-II-TRIMESTRE-2022.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-EN-EL-GASTO.-II-TRIMESTRE-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-Austeridad-en-el-Gasto-I-trimestre-2022-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-I-trimestre-2022-1.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-I-trimestre-2022-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Inf.-Austeridad-en-el-Gasto.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-AUSTERIDAD-III-TRIM-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-AUSTERIDAD-III-TRIM-2021.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-AUSTERIDAD-III-TRIM-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF-AUSTERIDAD-DEL-GASTO-PUBLICO-II-TRIMESTRE-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-DEL-GASTO-PUBLICO-II-TRIMESTRE-2021.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-DEL-GASTO-PUBLICO-II-TRIMESTRE-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Inf.-Austeridad-en-el-Gasto (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto%20(1).pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-Austeridad-en-el-Gasto-Publico-IV-trimestre-vigencia-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-Publico-IV-trimestre-vigencia-2020.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-Publico-IV-trimestre-vigencia-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Austeridad-en-el-Gasto-III-trim.-vig-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Austeridad-en-el-Gasto-III-trim.-vig-2020.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Austeridad-en-el-Gasto-III-trim.-vig-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Inf.-Austeridad-en-el-Gasto-II-trim-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto-II-trim-2020.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto-II-trim-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-Austeridad-en-el-Gasto-Público-I-trimestre-vigencia-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-P%C3%BAblico-I-trimestre-vigencia-2020.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-P%C3%BAblico-I-trimestre-vigencia-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. IV TRIMESTRE 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202019.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD EN EL GASTO. III TRIMESTRE 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202019.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME AUSTERIDAD EN EL GASTO II TRIM.  2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20EN%20EL%20GASTO%20II%20TRIM.%20%202019.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20EN%20EL%20GASTO%20II%20TRIM.%20%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE AUSTERIDAD EN EL GASTO 1ER TRIMES 2019 (1).pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%20EN%20EL%20GASTO%201ER%20TRIMES%202019%20(1).pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%20EN%20EL%20GASTO%201ER%20TRIMES%202019%20(1).pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE AUSTERIDAD 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%202018.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público IV trimestre vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME AUSTERIDAD DEL GASTO III TRIMESTRE 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20DEL%20GASTO%20III%20TRIMESTRE%202018.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público III trimestre vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20DEL%20GASTO%20III%20TRIMESTRE%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF AUSTERIDAD G. II TRIM VIG 2018 ok.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20G.%20II%20TRIM%20VIG%202018%20ok.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público II trimestre vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20G.%20II%20TRIM%20VIG%202018%20ok.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE AUSTERIDAD1 046.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD1%20046.pdf', 'documento', 'application/pdf', 'Informe Austeridad en el Gasto Público I trimestre vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD1%20046.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE VIG. 2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Control Interno Contable Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO_INFORME_CONTROL_INTERNO_CONTABLE_VIG._2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO_INFORME_CONTROL_INTERNO_CONTABLE_VIG._2024.pdf', 'documento', 'application/pdf', 'Seguimiento al Informe de Control Interno Contable Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO_INFORME_CONTROL_INTERNO_CONTABLE_VIG._2024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE VIG. 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202024.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE VIG. 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Control Interno Contable vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE VIG. 2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Control Interno Contable vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION-CONTOL-INTERNO-CONTABLE-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION-CONTOL-INTERNO-CONTABLE-2021.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION-CONTOL-INTERNO-CONTABLE-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-EVALUACION-CONTROL-INTERNO-CONTABLE_1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-EVALUACION-CONTROL-INTERNO-CONTABLE_1.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-EVALUACION-CONTROL-INTERNO-CONTABLE_1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%202019.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME C.I CONTABLE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20C.I%20CONTABLE.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20C.I%20CONTABLE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME CONTROL INTERNO CONTABLE VIG 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG%202016.pdf', 'documento', 'application/pdf', 'Informe de Control Interno Contable vigencia 2016', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME FINAL AUDITORIA INTERNA FACTURACION Y CARTERA VIGENCIA 2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20FINAL%20AUDITORIA%20INTERNA%20FACTURACION%20Y%20CARTERA%20VIGENCIA%202025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Gestión de Control Interno Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20FINAL%20AUDITORIA%20INTERNA%20FACTURACION%20Y%20CARTERA%20VIGENCIA%202025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTION CONTROL INTERNO 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTION%20CONTROL%20INTERNO%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Gestión de Control Interno Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTION%20CONTROL%20INTERNO%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-DE-GESTION-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-DE-GESTION-1.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-DE-GESTION-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-DE-GESTION-CONTROL-INTERNO-2020.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME-DE-GESTION-CONTROL-INTERNO-2020.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de Gestión de Control Interno Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME-DE-GESTION-CONTROL-INTERNO-2020.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de gestión  Oficina de Contro Interno de Gestión 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20gesti%C3%B3n%20%20Oficina%20de%20Contro%20Interno%20de%20Gesti%C3%B3n%202019.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20gesti%C3%B3n%20%20Oficina%20de%20Contro%20Interno%20de%20Gesti%C3%B3n%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Gestión Control Interno Vigencia 2015.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Control%20Interno%20Vigencia%202015.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2015', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Control%20Interno%20Vigencia%202015.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTIÓN OFICINA DE CONTROL INTERNO VIGENCIA 2013.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20OFICINA%20DE%20CONTROL%20INTERNO%20VIGENCIA%202013.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2013', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20OFICINA%20DE%20CONTROL%20INTERNO%20VIGENCIA%202013.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME DE GESTIÓN DE CONTROL INTERNO VIGENCIA 2012.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20DE%20CONTROL%20INTERNO%20VIGENCIA%202012.pdf', 'documento', 'application/pdf', 'Informe de Gestión de Control Interno Vigencia 2012', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20DE%20CONTROL%20INTERNO%20VIGENCIA%202012.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PQRSF_I_SEMESTRE_2026 CIG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_I_SEMESTRE_2026%20CIG.pdf', 'documento', 'application/pdf', 'Informe de PQRSF I semestre Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_I_SEMESTRE_2026%20CIG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PQRSF_II_SEMESTRE_2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_II_SEMESTRE_2025.pdf', 'documento', 'application/pdf', 'Informe de PQRSF II semestre Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_II_SEMESTRE_2025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRSF ENE - JUN 2025 CIG.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE%20-%20JUN%202025%20CIG.doc', 'documento', 'application/msword', 'Informe de PQRSF I semestre Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE%20-%20JUN%202025%20CIG.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3.INFORME TRIMESTRAL DE PQRSF 3ER TRIMESTRE JULIO-SEPTIEMBRE 2025.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%203ER%20TRIMESTRE%20JULIO-SEPTIEMBRE%202025.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Tercer Trimestre de 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%203ER%20TRIMESTRE%20JULIO-SEPTIEMBRE%202025.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3.INFORME TRIMESTRAL DE PQRSF 2DO TRIMESTRE ABRIL-JUNIO 2025..pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%202DO%20TRIMESTRE%20ABRIL-JUNIO%202025..pdf', 'documento', 'application/pdf', 'Informe de PQRSF Segundo Trimestre de 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%202DO%20TRIMESTRE%20ABRIL-JUNIO%202025..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '3.INFORME TRIMESTRAL DE PQRSF 1ER TRIMESTRE ENERO-MARZO 2025..pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%201ER%20TRIMESTRE%20ENERO-MARZO%202025..pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Trimestre de 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%201ER%20TRIMESTRE%20ENERO-MARZO%202025..pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRSF JUL-DIC 2024 CIG.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202024%20CIG.doc', 'documento', 'application/msword', 'Informe de PQRSF Segundo Semestre de 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202024%20CIG.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRSF ENE-JUN 2024 CIG.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE-JUN%202024%20CIG.doc', 'documento', 'application/msword', 'Informe de PQRSF Primer Semestre de 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE-JUN%202024%20CIG.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRSF JUL-DIC 2023 CIG.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202023%20CIG.doc', 'documento', 'application/msword', 'Informe de PQRSF Segundo Semestre de 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202023%20CIG.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe PQRSF.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20PQRSF.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Semestre de 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20PQRSF.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRSF JUL-DIC 2022 CIG.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202022%20CIG.doc', 'documento', 'application/msword', 'Informe de PQRSF Segundo Semestre de 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202022%20CIG.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-PQRSF.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Semestre de 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-PQRSF-JUL-NOV-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-JUL-NOV-2021.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Segundo Semestre de 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-JUL-NOV-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-PQRSF-I-SEMESTRE-2021-CIG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2021-CIG.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Semestre de 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2021-CIG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-PQRSF-II-semestre-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-II-semestre-2020.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Segundo Semestre de 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-II-semestre-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-PQRSF-I-SEMESTRE-2020-CIG.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2020-CIG.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Semestre de 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2020-CIG.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRS II SEMESTRE 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20II%20SEMESTRE%202019.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Segundo Semestre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20II%20SEMESTRE%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME PQRS I SEMESTRE 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20I%20SEMESTRE%202019.pdf', 'documento', 'application/pdf', 'Informe de PQRSF Primer Semestre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20I%20SEMESTRE%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO SIGEP II 2025.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202025.doc', 'documento', 'application/msword', 'Informe seguimiento SIGEP II Vig. 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202025.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO SIGEP II 2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202024.doc', 'documento', 'application/msword', 'Informe seguimiento SIGEP II Vig. 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO SIGEP 2023.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%202023.doc', 'documento', 'application/msword', 'Informe Sigep II 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%202023.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Seguimiento Sigep II 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Sigep%20II%202022.pdf', 'documento', 'application/pdf', 'Informe Sigep II 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Sigep%20II%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-SIGEP-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-SIGEP-2021.pdf', 'documento', 'application/pdf', 'Informe SIGEP 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-SIGEP-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-VERIFICACION-SIGEP-1.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-VERIFICACION-SIGEP-1.pdf', 'documento', 'application/pdf', 'Informe SIGEP 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-VERIFICACION-SIGEP-1.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA II TRIMESTRE 2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.doc', 'documento', 'application/msword', 'Evaluación Plan de Acción Por Áreas II trimestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA I TRIMESTRE 2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.doc', 'documento', 'application/msword', 'Evaluación Plan de Acción Por Áreas I trimestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA IV TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Evaluación Plan de Acción Por Áreas IV trimestre 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA I TRIMESTRE 2023.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.doc', 'documento', 'application/msword', 'Evaluación Plan de Acción Por Áreas I trimestre 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluación por Áreas I Semestre 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20por%20%C3%81reas%20I%20Semestre%202019.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción por Áreas Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20por%20%C3%81reas%20I%20Semestre%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'GOBIERNO EN LINEA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GOBIERNO%20EN%20LINEA.pdf', 'documento', 'application/pdf', 'Evaluación de Gestión Gobierno en Línea enero a junio de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GOBIERNO%20EN%20LINEA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE GESTION 2018 EVALUADO.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20EVALUADO.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación del Plan de Gestión 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20EVALUADO.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION SISTEMA DE CONTROL INTERNO II SEMESTRE 2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20II%20SEMESTRE%202025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Sistema de Control Interno II semestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20II%20SEMESTRE%202025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluacion_SCI_I_semestre_2025.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluacion_SCI_I_semestre_2025.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Sistema de Control Interno I semestre vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluacion_SCI_I_semestre_2025.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION SCI 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SCI%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación Sistema de Control Interno II semestre vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SCI%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I EVALUACION SCI 2024.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20EVALUACION%20SCI%202024.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” I semestre Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20EVALUACION%20SCI%202024.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION II SCI 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20II%20SCI%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” II semestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20II%20SCI%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME EVALUACION SISTEMA DE CONTROL INTERNO I SEMESTRE 2023.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME%20EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20I%20SEMESTRE%202023.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” I semestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME%20EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20I%20SEMESTRE%202023.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-sci-2semestre 2022 ultimo.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre%202022%20ultimo.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” II semestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre%202022%20ultimo.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I_EVALUACION_SISTEMA_DE_CONTROL_INTERNO (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I_EVALUACION_SISTEMA_DE_CONTROL_INTERNO%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” I semestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I_EVALUACION_SISTEMA_DE_CONTROL_INTERNO%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-sci-2semestre-2021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre-2021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” II semestre Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre-2021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe-sci-1semestre-2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-1semestre-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” I semestre Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-1semestre-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Formato-informe-sci-parametrizadoo-ultimo.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Formato-informe-sci-parametrizadoo-ultimo.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” II semestre Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Formato-informe-sci-parametrizadoo-ultimo.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-DEL-SCI-I-SEMESTRE-2020-HSJG-copia.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME-DEL-SCI-I-SEMESTRE-2020-HSJG-copia.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Informe de Evaluación del Sistema de Control Interno “SCI” I semestre Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME-DEL-SCI-I-SEMESTRE-2020-HSJG-copia.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_DE_AVANCES_POLÍTICAS_INSTITUCIONALES_II_SEMESTRE_2023.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_AVANCES_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2023.doc', 'documento', 'application/msword', 'Seguimiento Políticas Institucionales II semestre 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_AVANCES_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2023.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'MIPG - POLITICAS Y DIMENCIONES -2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MIPG%20-%20POLITICAS%20Y%20DIMENCIONES%20-2021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento a las Estrategias y Efectividad de las Políticas Institucionales', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MIPG%20-%20POLITICAS%20Y%20DIMENCIONES%20-2021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PLAN_DE_ACCIÓN_II_TRIMESTRE_2026 (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2026%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Evaluación Plan de Acción Por Áreas II trimestre 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2026%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe_Evaluación_Plan_de_acción_I_trimestres_2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Evaluaci%C3%B3n_Plan_de_acci%C3%B3n_I_trimestres_2026.pdf', 'documento', 'application/pdf', 'Informe Evaluación Plan de Acción I trimestre 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Evaluaci%C3%B3n_Plan_de_acci%C3%B3n_I_trimestres_2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PLAN_DE_ACCIÓN_IV_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_IV_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Evaluación Plan de Acción IV trimestre Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_IV_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PLAN_DE_ACCIÓN_III_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_III_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Evaluación Plan de Acción III trimestre Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_III_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_PLAN_DE_ACCIÓN_II_TRIMESTRE_2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Evaluación Plan de Acción II trimestre Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_GERENCIA_I_TRIMESTRE_2025..docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_GERENCIA_I_TRIMESTRE_2025..docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe Evaluación Plan de Acción I trimestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_GERENCIA_I_TRIMESTRE_2025..docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA IV TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción IV trimestre Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA III TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción III trimestre Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA II TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción II trimestre Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA I TRIMESTRE 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción I trimestre Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA IV TRIMESTRE 2023._.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023._.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción IV trimestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023._.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA III TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción III trimestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA II TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción II trimestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA I TRIMESTRE 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción I trimestre Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA IV TRIMESTRE 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202022.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción IV trimestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'GERENCIA III TRIMESTRE 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GERENCIA%20III%20TRIMESTRE%202022.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción III trimestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GERENCIA%20III%20TRIMESTRE%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME GERENCIA II TRIMESTRE 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202022.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción II trimestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Inf. Gerencia I Trimestre 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.%20Gerencia%20I%20Trimestre%202022.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción I trimestre Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.%20Gerencia%20I%20Trimestre%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Matriz-de-evaluacion-1.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz-de-evaluacion-1.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Evaluación del Plan de Acción Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz-de-evaluacion-1.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN DE ACCIÓN 2019.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCI%C3%93N%202019.xls', 'documento', 'application/vnd.ms-excel', 'Evaluación del Plan de Acción Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCI%C3%93N%202019.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME EVALUCIÓN POR ÁREAS.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20EVALUCI%C3%93N%20POR%20%C3%81REAS.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción Vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20EVALUCI%C3%93N%20POR%20%C3%81REAS.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACIÓN PLAN DE ACCIÓN AREAS OBJECIÓN I SEMESTRE VIG 2017.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACI%C3%93N%20PLAN%20DE%20ACCI%C3%93N%20AREAS%20OBJECI%C3%93N%20I%20SEMESTRE%20VIG%202017.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción Vigencia 2017', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACI%C3%93N%20PLAN%20DE%20ACCI%C3%93N%20AREAS%20OBJECI%C3%93N%20I%20SEMESTRE%20VIG%202017.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION PLAN DE ACCION INSTITUCIONAL VIG 2016.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20PLAN%20DE%20ACCION%20INSTITUCIONAL%20VIG%202016.pdf', 'documento', 'application/pdf', 'Evaluación del Plan de Acción Vigencia 2016', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20PLAN%20DE%20ACCION%20INSTITUCIONAL%20VIG%202016.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SUSCRIPCIÓN_PLAN_DE_MEJORAMIENTO_JURIDICA_2026.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SUSCRIPCI%C3%93N_PLAN_DE_MEJORAMIENTO_JURIDICA_2026.pdf', 'documento', 'application/pdf', 'Plan de mejoramiento Jurídica', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SUSCRIPCI%C3%93N_PLAN_DE_MEJORAMIENTO_JURIDICA_2026.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_Mejoramiento_Talento_Humano.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_Mejoramiento_Talento_Humano.pdf', 'documento', 'application/pdf', 'Plan de mejoramiento Talento Humano', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_Mejoramiento_Talento_Humano.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_mejoramiento_Gestión_Ambiental.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Gesti%C3%B3n_Ambiental.pdf', 'documento', 'application/pdf', 'Plan de mejoramiento Gestión Ambiental', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Gesti%C3%B3n_Ambiental.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_mejoramiento_Contraloria_III_Avance.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_III_Avance.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento de la Auditoría Financiera y de Gestión Vigencia 2023 - Contraloría Departamental del Guaviare. Avance III', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_III_Avance.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_mejoramiento_Contraloria_II_Avance.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_II_Avance.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento de la Auditoría Financiera y de Gestión Vigencia 2023 - Contraloría Departamental del Guaviare. Avance II', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_II_Avance.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_mejoramiento_Contraloria_I_Avance.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_I_Avance.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento de la Auditoría Financiera y de Gestión Vigencia 2023 - Contraloría Departamental del Guaviare. Avance I', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_I_Avance.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PDM GOBIERNO EN LINEA 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20GOBIERNO%20EN%20LINEA%202024.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento 2024 Planeación - Gobierno en Línea', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20GOBIERNO%20EN%20LINEA%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_de_mejoramiento_Contraloria_Suscripción.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_Suscripci%C3%B3n.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento de la Auditoría Financiera y de Gestión Vigencia 2023 - Contraloría Departamental del Guaviare - Suscripción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_Suscripci%C3%B3n.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PDM MANTENIMIENTO 2024.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20MANTENIMIENTO%202024.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento 2024 Área de Mantenimiento', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20MANTENIMIENTO%202024.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PDM TALENTO HUMANO 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20TALENTO%20HUMANO%202023.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Talento Humano 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20TALENTO%20HUMANO%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Contraloría 2023.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Mejoramiento%20Contralor%C3%ADa%202023.xls', 'documento', 'application/vnd.ms-excel', 'Plan de Mejoramiento Contraloría 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Mejoramiento%20Contralor%C3%ADa%202023.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Juridica 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Juridica%202023.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Jurídica 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Juridica%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Gestión Ambiental 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Gesti%C3%B3n%20Ambiental%202023.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Gestión Ambiental 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Gesti%C3%B3n%20Ambiental%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Supersalud 2021-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Supersalud%202021-2022.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Supersalud 2021-2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Supersalud%202021-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Servicio Economato 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Servicio%20Economato%202022.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Servicio Economato 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Servicio%20Economato%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento Secretaria de Salud 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Secretaria%20de%20Salud%202022.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Secretaría de Salud 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Secretaria%20de%20Salud%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan de Mejoramiento  Gestión Documental 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20%20Gesti%C3%B3n%20Documental%202022.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Gestión Documental 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20%20Gesti%C3%B3n%20Documental%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Mejoramiento-Material-de-Osteosintesis-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Material-de-Osteosintesis-2021.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Material de Osteosíntesis 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Material-de-Osteosintesis-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Mejoramiento-Gestion-Ambiental-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Gestion-Ambiental-2021.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Gestión Ambiental 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Gestion-Ambiental-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Mejoramiento-Contraloria-Dptal-2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Contraloria-Dptal-2021.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Contraloría Departamental 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Contraloria-Dptal-2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'suscripcion-plan-de-mejoramiento-CDG-vig.-2020.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/suscripcion-plan-de-mejoramiento-CDG-vig.-2020.xls', 'documento', 'application/vnd.ms-excel', 'Plan de Mejoramiento Auditoría Vigencia 2020 Contraloría Departamental', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/suscripcion-plan-de-mejoramiento-CDG-vig.-2020.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan-de-Mejoramiento-Juridica-2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Juridica-2020.pdf', 'documento', 'application/pdf', 'Plan de Mejoramiento Jurídica 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Juridica-2020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN_ANUAL_DE_AUDITORIAS_INTERNAS_2026.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN_ANUAL_DE_AUDITORIAS_INTERNAS_2026.xls', 'documento', 'application/vnd.ms-excel', 'Plan anual de auditorías internas Vigencia 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN_ANUAL_DE_AUDITORIAS_INTERNAS_2026.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN Y PROGRAMA DE AUDITORIA VIGENCIA 2025.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20Y%20PROGRAMA%20DE%20AUDITORIA%20VIGENCIA%202025.xls', 'documento', 'application/vnd.ms-excel', 'Plan y Programa de Auditoría Vigencia 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20Y%20PROGRAMA%20DE%20AUDITORIA%20VIGENCIA%202025.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan_Anual_de_auditorias_2024 OCIG.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan_Anual_de_auditorias_2024%20OCIG.xls', 'documento', 'application/vnd.ms-excel', 'Plan y Programa de Auditoría Vigencia 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan_Anual_de_auditorias_2024%20OCIG.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan Anual de auditorias 2023.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20auditorias%202023.xls', 'documento', 'application/vnd.ms-excel', 'Plan y Programa de Auditoría Vigencia 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20auditorias%202023.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Plan Anual de Auditorias Vigencia 2022.xls', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Auditorias%20Vigencia%202022.xls', 'documento', 'application/vnd.ms-excel', 'Plan y Programa de Auditoría Vigencia 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Auditorias%20Vigencia%202022.xls');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN ANUAL DE AUDITORIAS VIGENCIA 2021.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20AUDITORIAS%20VIGENCIA%202021.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Plan y Programa de Auditoría Vigencia 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20AUDITORIAS%20VIGENCIA%202021.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN ANUAL DE AUDITORIA C.I.G. 2020.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20ANUAL%20DE%20AUDITORIA%20C.I.G.%202020.pdf', 'documento', 'application/pdf', 'Plan y Programa de Auditoría Vigencia 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20ANUAL%20DE%20AUDITORIA%20C.I.G.%202020.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PROGRAMA DE AUDITORIA CONSOLIDADO PARA 2019 (2) (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROGRAMA%20DE%20AUDITORIA%20CONSOLIDADO%20PARA%202019%20(2)%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Programa de Auditoría Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROGRAMA%20DE%20AUDITORIA%20CONSOLIDADO%20PARA%202019%20(2)%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PLAN ANUAL DE AUDITORIA OFICINA CONTROL INTERNO 2019.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN%20ANUAL%20DE%20AUDITORIA%20OFICINA%20CONTROL%20INTERNO%202019.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Plan Anual de Auditoría Vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN%20ANUAL%20DE%20AUDITORIA%20OFICINA%20CONTROL%20INTERNO%202019.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III SEGUIMIENTO PLAN ANTICORRUPCIO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCIO.pdf', 'documento', 'application/pdf', 'Tercer seguimiento Plan Anticorrupción y Atención al Ciudadano 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCIO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II SEGUIMIENTO PLAN ANTICORRUPCION.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc', 'documento', 'application/msword', 'Seguimiento II cuatrimestre 2024 riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I SEGUIMIENTO PLAN ANTICORRUPCION.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc', 'documento', 'application/msword', 'Seguimiento I cuatrimestre 2024 riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 Matriz_Riesgo_20220511_Corrup (III cuatri) - copia.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrup%20(III%20cuatri)%20-%20copia.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento III cuatrimestre 2023 matriz de riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrup%20(III%20cuatri)%20-%20copia.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II SEGUIMIENTO PLAN ANTICORRUPCION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf', 'documento', 'application/pdf', 'Seguimiento II cuatrimestre 2023 riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT '1 Matriz_Riesgo_20220511_Corrupción.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento II cuatrimestre 2023 matriz de riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO I CUATRIMESTRE 2023 RIESGOS DE CORRUPCIÓN.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20I%20CUATRIMESTRE%202023%20RIESGOS%20DE%20CORRUPCI%C3%93N.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento I cuatrimestre 2023 riesgos de corrupción', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20I%20CUATRIMESTRE%202023%20RIESGOS%20DE%20CORRUPCI%C3%93N.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Matriz_Riesgo_2022_II Sem _Gestión - copia.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz_Riesgo_2022_II%20Sem%20_Gesti%C3%B3n%20-%20copia.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Seguimiento segundo cuatrimestre de 2022 (matriz)', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz_Riesgo_2022_II%20Sem%20_Gesti%C3%B3n%20-%20copia.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II SEGUIMIENTO PAYAC vig. 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PAYAC%20vig.%202022.pdf', 'documento', 'application/pdf', 'Seguimiento segundo cuatrimestre de 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PAYAC%20vig.%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I SEGUIMIENTO PLAN ANTICORRUPCION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf', 'documento', 'application/pdf', 'Seguimiento primer cuatrimestre de 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION_PLAN_ANTICORRUPCION_III_TRIM_2021.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_PLAN_ANTICORRUPCION_III_TRIM_2021.pdf', 'documento', 'application/pdf', 'Seguimiento tercer cuatrimestre de 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_PLAN_ANTICORRUPCION_III_TRIM_2021.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II-SEGUIMIENTO-PLAN-ANTICORRUPCION-2.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION-2.pdf', 'documento', 'application/pdf', 'Seguimiento segundo cuatrimestre de 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION-2.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRIMER-SEGUIMIENTO-PLAN-ANTICORRUPCION-2021.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PRIMER-SEGUIMIENTO-PLAN-ANTICORRUPCION-2021.doc', 'documento', 'application/msword', 'Seguimiento primer cuatrimestre de 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PRIMER-SEGUIMIENTO-PLAN-ANTICORRUPCION-2021.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1.doc', 'documento', 'application/msword', 'Seguimiento tercer cuatrimestre de 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II-SEGUIMIENTO-PLAN-ANTICORRUPCION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION.pdf', 'documento', 'application/pdf', 'Seguimiento segundo cuatrimestre de 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I-SEGUIMIENTO-PLAN-ANTICORRUPCION.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I-SEGUIMIENTO-PLAN-ANTICORRUPCION.doc', 'documento', 'application/msword', 'Seguimiento primer cuatrimestre de 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I-SEGUIMIENTO-PLAN-ANTICORRUPCION.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III SEGUIMIENTO PLAN ANTICORRUPCION 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf', 'documento', 'application/pdf', 'Seguimiento tercer cuatrimestre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II SEGUIMIENTO PLAN ANTICORRUPCION MAYO-AGOSTO 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO-AGOSTO%202019.pdf', 'documento', 'application/pdf', 'Seguimiento segundo cuatrimestre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO-AGOSTO%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I SEGUIMIENTO PLAN ANTICORRUPCION 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf', 'documento', 'application/pdf', 'Seguimiento primer cuatrimestre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'III SEGUIMIENTO PLAN ANTICORRUPCION SEPTIEMBRE - DICIEMBRE 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20SEPTIEMBRE%20-%20DICIEMBRE%202018.pdf', 'documento', 'application/pdf', 'Seguimiento tercer cuatrimestre de 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20SEPTIEMBRE%20-%20DICIEMBRE%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II SEGUIMIENTO PLAN ANTICORRUPCION MAYO - AGOSTO 2018.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO%20-%20AGOSTO%202018.pdf', 'documento', 'application/pdf', 'Seguimiento segundo cuatrimestre de 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO%20-%20AGOSTO%202018.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I SEGUIMIENTO PLAN ANTICORRUPCION FEBRERO-ABRIL 2018 .pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20FEBRERO-ABRIL%202018%20.pdf', 'documento', 'application/pdf', 'Seguimiento primer cuatrimestre de 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20FEBRERO-ABRIL%202018%20.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluacion_I_Semestre_2026_Riesgo_SARO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion_I_Semestre_2026_Riesgo_SARO.pdf', 'documento', 'application/pdf', 'Evaluación I semestre 2026 riesgo SARO', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion_I_Semestre_2026_Riesgo_SARO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION_II_SEMESTRE_2025_MAPA_DE_RIESGOS_SARO.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_II_SEMESTRE_2025_MAPA_DE_RIESGOS_SARO.pdf', 'documento', 'application/pdf', 'Evaluación II semestre 2025 mapa de riesgos SARO', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_II_SEMESTRE_2025_MAPA_DE_RIESGOS_SARO.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluación I Semestre 2025 Riesgo SARO.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Evaluaci%C3%B3n%20I%20Semestre%202025%20Riesgo%20SARO.doc', 'documento', 'application/msword', 'Evaluación I semestre 2025 mapa de riesgos SARO', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Evaluaci%C3%B3n%20I%20Semestre%202025%20Riesgo%20SARO.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVALUACION  II SEMESTRE 2024 RIESGOS SARO.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/EVALUACION%20%20II%20SEMESTRE%202024%20RIESGOS%20SARO.doc', 'documento', 'application/msword', 'Evaluación II semestre riesgos SARO (gestión) 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/EVALUACION%20%20II%20SEMESTRE%202024%20RIESGOS%20SARO.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Eva Riesgos SARO I Sem. 2024.doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Eva%20Riesgos%20SARO%20I%20Sem.%202024.doc', 'documento', 'application/msword', 'Evaluación I semestre riesgos SARO (gestión) 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Eva%20Riesgos%20SARO%20I%20Sem.%202024.doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME RIESGOS DE GESTIÓN II SEM 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20RIESGOS%20DE%20GESTI%C3%93N%20II%20SEM%202023.pdf', 'documento', 'application/pdf', 'II evaluación de riesgos de gestión 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20RIESGOS%20DE%20GESTI%C3%93N%20II%20SEM%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'EVA. RIESGOS GESTIÓN 1 SEM 2023.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVA.%20RIESGOS%20GESTI%C3%93N%201%20SEM%202023.pdf', 'documento', 'application/pdf', 'I evaluación de riesgos de gestión 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVA.%20RIESGOS%20GESTI%C3%93N%201%20SEM%202023.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluación Riesgos de Gestión II Sem. 2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20Riesgos%20de%20Gesti%C3%B3n%20II%20Sem.%202022.pdf', 'documento', 'application/pdf', 'II evaluación de riesgos de gestión 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20Riesgos%20de%20Gesti%C3%B3n%20II%20Sem.%202022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'I-EVALUACION-RIESGOS-GESTION-2022.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I-EVALUACION-RIESGOS-GESTION-2022.pdf', 'documento', 'application/pdf', 'I evaluación de riesgos de gestión 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I-EVALUACION-RIESGOS-GESTION-2022.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Evaluacion-el-semestre-Riesgos-de-Gestion.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion-el-semestre-Riesgos-de-Gestion.pdf', 'documento', 'application/pdf', 'II evaluación de riesgos de gestión 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion-el-semestre-Riesgos-de-Gestion.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRIMER-SEGUIMIENTO-RIESGOS-DE-GESTION.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-RIESGOS-DE-GESTION.pdf', 'documento', 'application/pdf', 'I evaluación de riesgos de gestión 2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-RIESGOS-DE-GESTION.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'II-EVALUACION-DE-RIESGOS-DE-GESTION-2020.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-DE-RIESGOS-DE-GESTION-2020.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'II evaluación de riesgos de gestión 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-DE-RIESGOS-DE-GESTION-2020.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG COMITÉ CONCILIACIÓN I SEM 2026 OK.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202026%20OK.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación I semestre 2026', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202026%20OK.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME_SEGUIMIENTO_COMITÉ_CONCILIACIÓN_II_SEM_2025_.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_SEGUIMIENTO_COMIT%C3%89_CONCILIACI%C3%93N_II_SEM_2025_.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación II semestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_SEGUIMIENTO_COMIT%C3%89_CONCILIACI%C3%93N_II_SEM_2025_.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG COMITÉ CONCILIACIÓN I SEM 2025.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202025.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación I semestre 2025', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202025.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG COMITÉ CONCILIACIÓN II SEM 2024.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20II%20SEM%202024.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación II semestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20II%20SEM%202024.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG CCDJ I SEM 2024 OK (1).docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20CCDJ%20I%20SEM%202024%20OK%20(1).docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación I semestre 2024', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20CCDJ%20I%20SEM%202024%20OK%20(1).docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG COMITE CONCILIACION II SEMESTRE 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20II%20SEMESTRE%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación II semestre 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20II%20SEMESTRE%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INF SEG COMITE CONCILIACION I SEMESTRE 2023.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20I%20SEMESTRE%202023.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación I semestre 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20I%20SEMESTRE%202023.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Seguimiento Comité Conciliaciones II Sem 2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaciones%20II%20Sem%202022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación II semestre 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaciones%20II%20Sem%202022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Seguimiento Comité Conciliaciónes I Sem 2022.docx', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaci%C3%B3nes%20I%20Sem%202022.docx', 'documento', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'Informe de seguimiento al Comité de Conciliación I semestre 2022', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaci%C3%B3nes%20I%20Sem%202022.docx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Seguimiento Comité de Conciliación vigencia 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Comit%C3%A9%20de%20Conciliaci%C3%B3n%20vigencia%202019.pdf', 'documento', 'application/pdf', 'Informe de seguimiento al Comité de Conciliación y Defensa Judicial vigencia 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Comit%C3%A9%20de%20Conciliaci%C3%B3n%20vigencia%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME COMITÉ DE CONCILIACIÓN.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20COMIT%C3%89%20DE%20CONCILIACI%C3%93N.pdf', 'documento', 'application/pdf', 'Informe de seguimiento al Comité de Conciliación y Defensa Judicial vigencia 2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20COMIT%C3%89%20DE%20CONCILIACI%C3%93N.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUIMIENTO ESTRATEGIA GD (1).doc', 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20ESTRATEGIA%20GD%20(1).doc', 'documento', 'application/msword', 'Informe final de seguimiento a la estrategia de Gobierno Digital 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20ESTRATEGIA%20GD%20(1).doc');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME TIC.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20TIC.pdf', 'documento', 'application/pdf', 'Informe de segundo seguimiento a la estrategia de Gobierno Digital 2023', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20TIC.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'SEGUNDO-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUNDO-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf', 'documento', 'application/pdf', 'Informe de segundo seguimiento a la estrategia de Gobierno Digital 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUNDO-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'PRIMER-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf', 'documento', 'application/pdf', 'Informe de primer seguimiento a la estrategia de Gobierno Digital 2020', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Gobierno Digital.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gobierno%20Digital.pdf', 'documento', 'application/pdf', 'Informe de seguimiento a la estrategia de Gobierno Digital enero a diciembre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gobierno%20Digital.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe Seguimiento Gobierno Digital Julio a Diciembre 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Gobierno%20Digital%20Julio%20a%20Diciembre%202019.pdf', 'documento', 'application/pdf', 'Informe de seguimiento a la estrategia de Gobierno Digital julio a diciembre de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Gobierno%20Digital%20Julio%20a%20Diciembre%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Informe de Seguimiento Gobierno Digital Enero - Julio 2019.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Seguimiento%20Gobierno%20Digital%20Enero%20-%20Julio%202019.pdf', 'documento', 'application/pdf', 'Informe de seguimiento a la estrategia de Gobierno Digital enero a julio de 2019', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Seguimiento%20Gobierno%20Digital%20Enero%20-%20Julio%202019.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Base-de-datos-2021 (1).xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Base-de-datos-2021%20(1).xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Procesos judiciales vigencias 2020-2021', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Base-de-datos-2021%20(1).xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Procesos Judiciales 2002 - 2018.xlsx', 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procesos%20Judiciales%202002%20-%202018.xlsx', 'documento', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'Procesos judiciales vigencias 2002-2018', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procesos%20Judiciales%202002%20-%202018.xlsx');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'INFORME-PROCESOS-JUDICALES-17-MAYO-2016-HOSPITAL-SAN-JOSE-DEL-GUAVIARE.pdf', 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PROCESOS-JUDICALES-17-MAYO-2016-HOSPITAL-SAN-JOSE-DEL-GUAVIARE.pdf', 'documento', 'application/pdf', 'Informe de procesos judiciales (mayo de 2016)', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PROCESOS-JUDICALES-17-MAYO-2016-HOSPITAL-SAN-JOSE-DEL-GUAVIARE.pdf');
INSERT INTO cms_multimedia (nombre, url, tipo, mime, titulo, alt, migrado_de)
SELECT 'Sistema eKOGUI de la Agencia Nacional de Defensa Jurídica del Estado', 'https://ekogui.defensajuridica.gov.co', 'otro', NULL, 'Sistema eKOGUI de la Agencia Nacional de Defensa Jurídica del Estado', NULL, 'esehospitalguaviare.gov.co (Control)'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_multimedia WHERE url = 'https://ekogui.defensajuridica.gov.co');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a los planes del Decreto 612 de 2018 2026', 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2026', 'Seguimiento a los planes del Decreto 612 de 2018 – vigencia 2026.', NULL, 'documento', 'Seguimiento a los planes del Decreto 612 de 2018', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-03-30 12:00:00', 10, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO_PLANES_DECRETO612DE2018_II_SEM_2025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a los planes del Decreto 612 de 2018 2025', 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2025', 'Seguimiento a los planes del Decreto 612 de 2018 – vigencia 2025.', NULL, 'documento', 'Seguimiento a los planes del Decreto 612 de 2018', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-08-26 12:00:00', 20, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20PLANES%20DEC.612%20I%20SEMESTRE%202025%20(Reparado).docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a los planes del Decreto 612 de 2018 2024', 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2024', 'Seguimiento a los planes del Decreto 612 de 2018 – vigencia 2024.', NULL, 'documento', 'Seguimiento a los planes del Decreto 612 de 2018', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20SEGUIMIENTO%20Y%20EVALUACION%20PLANES%20DECRETO%20612%20DE%202018%20VIGENCIA%202024.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a los planes del Decreto 612 de 2018 2023', 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2023', 'Seguimiento a los planes del Decreto 612 de 2018 – vigencia 2023.', NULL, 'documento', 'Seguimiento a los planes del Decreto 612 de 2018', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PLANES%20DTO%20612%20DE%202018%20r..doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-los-planes-del-decreto-612-de-2018-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de derechos de autor 2026', 'ctl-informes-de-derechos-de-autor-2026', 'Informes de derechos de autor – vigencia 2026.', NULL, 'documento', 'Informes de derechos de autor', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-03-18 12:00:00', 50, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-derechos-de-autor-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Derechos_de_Autor_Vigencia_2025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-derechos-de-autor-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de derechos de autor 2025', 'ctl-informes-de-derechos-de-autor-2025', 'Informes de derechos de autor – vigencia 2025.', NULL, 'documento', 'Informes de derechos de autor', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-03-18 12:00:00', 60, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-derechos-de-autor-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DERECHOS_DE_AUTOR_.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-derechos-de-autor-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de derechos de autor 2024', 'ctl-informes-de-derechos-de-autor-2024', 'Informes de derechos de autor – vigencia 2024.', NULL, 'documento', 'Informes de derechos de autor', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-03-15 12:00:00', 70, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-derechos-de-autor-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DERECHOS%20DE%20AUTOR%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-derechos-de-autor-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de los órganos de control 2024', 'ctl-auditorias-de-los-organos-de-control-2024', 'Auditorías de los órganos de control – vigencia 2024.', NULL, 'documento', 'Auditorías de los órganos de control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 10, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-los-organos-de-control-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditor%C3%ADa%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202023%20E.S.E%20HSJG%20Vigencia%202023%20PVCFT%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de los órganos de control 2022', 'ctl-auditorias-de-los-organos-de-control-2022', 'Auditorías de los órganos de control – vigencia 2022.', NULL, 'documento', 'Auditorías de los órganos de control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 20, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-los-organos-de-control-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de los órganos de control 2021', 'ctl-auditorias-de-los-organos-de-control-2021', 'Auditorías de los órganos de control – vigencia 2021.', NULL, 'documento', 'Auditorías de los órganos de control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-los-organos-de-control-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Calificaci%C3%B3n%20y%20Revisi%C3%B3n%20de%20la%20Cuenta%20de%20la%20E.S.E%20HSJG%20Nivel%202%20Contralor%C3%ADa%20Departamental%20Vigencia%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Visita%20Superintendencia%20Nacional%20de%20Salud%202021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de los órganos de control 2020', 'ctl-auditorias-de-los-organos-de-control-2020', 'Auditorías de los órganos de control – vigencia 2020.', NULL, 'documento', 'Auditorías de los órganos de control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-los-organos-de-control-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Final%20Auditoria%20Financiera%20y%20de%20Gesti%C3%B3n%20Contralor%C3%ADa%20Departamental%20Vigencia%202020%20PVCFT%202021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/1.-INFORME-FINAL-HOSPITAL-VIG-2020-PVCFT-2021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-auditorias-de-los-organos-de-control-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Consulta de informes en los órganos de control', 'ctl-consulta-de-informes-en-los-organos-de-control', 'Consulta de informes en los órganos de control.', NULL, 'documento', 'Consulta de informes en los órganos de control', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-consulta-de-informes-en-los-organos-de-control');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.supersalud.gov.co/Paginas/Busqueda.aspx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-consulta-de-informes-en-los-organos-de-control' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://www.contraloriaguaviare.gov.co/?s=hospital&asp_active=1&p_asid=1&p_asp_data=1&filters_initial=1&filters_changed=0&qtranslate_lang=0&current_page_id=2'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-consulta-de-informes-en-los-organos-de-control' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Arqueos de caja 2022', 'ctl-arqueos-de-caja-2022', 'Arqueos de caja – vigencia 2022.', NULL, 'documento', 'Arqueos de caja', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 80, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-arqueos-de-caja-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Facturaci%C3%B3n%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Sub.%20Adm%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20Caja%20Menor%20Almac%C3%A9n%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Arqueos de caja 2021', 'ctl-arqueos-de-caja-2021', 'Arqueos de caja – vigencia 2021.', NULL, 'documento', 'Arqueos de caja', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 90, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-arqueos-de-caja-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Facturacion-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Sub.-Adm-2021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-de-Caja-Menor-Almacen-2021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Arqueos de caja 2020', 'ctl-arqueos-de-caja-2020', 'Arqueos de caja – vigencia 2020.', NULL, 'documento', 'Arqueos de caja', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 100, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-arqueos-de-caja-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Facturacion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Subgerencia.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo-Almacen.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Arqueos de caja 2019', 'ctl-arqueos-de-caja-2019', 'Arqueos de caja – vigencia 2019.', NULL, 'documento', 'Arqueos de caja', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 110, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-arqueos-de-caja-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Facturaci%C3%B3n.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Subgerencia%20Administrativa.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20de%20caja%20-%20Almac%C3%A9n%20y%20Suministros.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Arqueos de caja 2018', 'ctl-arqueos-de-caja-2018', 'Arqueos de caja – vigencia 2018.', NULL, 'documento', 'Arqueos de caja', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 120, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-arqueos-de-caja-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueos%20caja%20%C3%A1rea%20facturacion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Arqueo%20Caja%20Menor%20Subgerencia%20Adtiva%20y%20financiera.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-arqueos-de-caja-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de talento humano 2021', 'ctl-auditorias-de-talento-humano-2021', 'Auditorías de talento humano – vigencia 2021.', NULL, 'documento', 'Auditorías de talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 130, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-talento-humano-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/01-INFORME-SOCIALIZACION-CODIGO-DE-INTEGRIDAD.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-auditorias-de-talento-humano-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Auditorías de talento humano 2017', 'ctl-auditorias-de-talento-humano-2017', 'Auditorías de talento humano – vigencia 2017.', NULL, 'documento', 'Auditorías de talento humano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-12-31 12:00:00', 140, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-auditorias-de-talento-humano-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTION%20TALENTO%20HUMANO%20III%20VIG%202017.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-auditorias-de-talento-humano-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20II%20%20VIG%202017.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-auditorias-de-talento-humano-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/AUD%20GESTI%C3%93N%20TALENTO%20HUMANO%20I%20%20VIG%202017.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-auditorias-de-talento-humano-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a las políticas institucionales (MIPG) 2025', 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2025', 'Seguimiento a las políticas institucionales (MIPG) – vigencia 2025.', NULL, 'documento', 'Seguimiento a las políticas institucionales (MIPG)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 150, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_POL%C3%8DTICAS_INSTITUCIONALES_I_SEMESTRE_2025.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a las políticas institucionales (MIPG) 2024', 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2024', 'Seguimiento a las políticas institucionales (MIPG) – vigencia 2024.', NULL, 'documento', 'Seguimiento a las políticas institucionales (MIPG)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 160, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_DE_AVANCES_Y_CUMPLIMIENTO_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AVANCES%20Y%20CUMPLIMIENTO%20POL%C3%8DTICAS%20INSTITUCIONALES.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2026', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2026', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2026.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-06-15 12:00:00', 170, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_RIESGOS_SICOF_I_CUATRIMESTRE_2026.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2025', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2025', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2025.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 180, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_III_CUATRIMESTRE_2025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION_MAPA_DE_RIESGOS_SICOF_II_CUATRIMESTRE_2025.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACI%C3%93N%20MAPA%20RIESGOS%20SICOF%20I%20CUATRIMESTRE%202025.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2024', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2024', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2024.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 190, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20MAPA%20RIESGOS%20SICOF%20III%20CUATRIMESTRE%202024.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluaci%C3%B3n%20Mapa%20de%20Riesgos%20SICOF%20II%20Cuatrimestre%20%202024.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACI%C3%93N%20MAPA%20RIESGOS%20SICOF%20I%20CUATRIMESTRE%202025.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2023', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2023', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2023.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-15 12:00:00', 200, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n%20(1)%20DES%20PAGINA%20-ok.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2022', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2022', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2022.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 210, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS%20CORRUPCION%20%20III%20CUATRIMESTRE-2022.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20%20Evaluacion%20Riesgos%20de%20Corrupci%C3%B3n%202022.xlsm'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Seguimiento%20I%20Cuatrimestre%20Mapa%20de%20Riesgos%20Corrupci%E2%94%9C%E2%94%82n%20e%20Institucional%202022.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2021', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2021', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2021.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 220, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-III-CUATRIMESTRE-2021.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO-MAPA-DE-RIESGOS-CORRUPCION-II-CUATRIMESTRE-2021.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUCION-MAPA-DE-RIESGOS-I-TRIMESTRE-2021.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2020', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2020', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2020.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 230, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACIOM-MAPA-DE-RIESGOS-CORRUPCION-III%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-MAPA-RIESGOS-CORRUPCION-3.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I-EVALUACION-MAPA-RIESGOS-CORRUPCION-1.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2019', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2019', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2019.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 240, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1-1.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/2do%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1er%20Seguimiento%20mapa%20de%20riesgos%20de%20corrupci%C3%B3n.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al mapa de riesgos de corrupción (SICOF) 2018', 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2018', 'Seguimiento al mapa de riesgos de corrupción (SICOF) – vigencia 2018.', NULL, 'documento', 'Seguimiento al mapa de riesgos de corrupción (SICOF)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 250, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/III%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20MAPA%20DE%20RIESGOS%20DE%20CORRUPCI%C3%93N%20E%20%20INSTITUCIONAL.xls'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-mapa-de-riesgos-de-corrupcion-sicof-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2026', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2026', 'Austeridad y eficiencia en el gasto público – vigencia 2026.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-28 12:00:00', 260, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2026.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2025', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025', 'Austeridad y eficiencia en el gasto público – vigencia 2025.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 270, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_IV_TRIMESTRE_2025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_III_TRIMESTRE_2025%20(1).docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_II_TRIMESTRE_2025.docx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF_AUSTERIDAD_EN_EL_GASTO_I_TRIMESTRE_2025.docx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2024', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024', 'Austeridad y eficiencia en el gasto público – vigencia 2024.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 280, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IV%20TRIMESTRE%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20III%20TRIMESTRE%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20IITRIMESTRE%202024.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO%20I%20TRIMESTRE%202024%20(1).docx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2023', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023', 'Austeridad y eficiencia en el gasto público – vigencia 2023.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 290, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20II%20TRIMESTRE%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20I%20TRIMESTRE%202023.docx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2022', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022', 'Austeridad y eficiencia en el gasto público – vigencia 2022.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 300, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202022.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Austeridad%20en%20el%20Gasto%20P%C3%BAblico%20III%20trimestre%20Vigencia%20%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-EN-EL-GASTO.-II-TRIMESTRE-2022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-I-trimestre-2022-1.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2021', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021', 'Austeridad y eficiencia en el gasto público – vigencia 2021.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 310, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-AUSTERIDAD-III-TRIM-2021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF-AUSTERIDAD-DEL-GASTO-PUBLICO-II-TRIMESTRE-2021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto%20(1).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2020', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020', 'Austeridad y eficiencia en el gasto público – vigencia 2020.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 320, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-Publico-IV-trimestre-vigencia-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Austeridad-en-el-Gasto-III-trim.-vig-2020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.-Austeridad-en-el-Gasto-II-trim-2020.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-Austeridad-en-el-Gasto-P%C3%BAblico-I-trimestre-vigencia-2020.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2019', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019', 'Austeridad y eficiencia en el gasto público – vigencia 2019.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 330, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20IV%20TRIMESTRE%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20EN%20EL%20GASTO.%20III%20TRIMESTRE%202019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20EN%20EL%20GASTO%20II%20TRIM.%20%202019.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%20EN%20EL%20GASTO%201ER%20TRIMES%202019%20(1).pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Austeridad y eficiencia en el gasto público 2018', 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018', 'Austeridad y eficiencia en el gasto público – vigencia 2018.', NULL, 'documento', 'Austeridad y eficiencia en el gasto público', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 340, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD%202018.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20AUSTERIDAD%20DEL%20GASTO%20III%20TRIMESTRE%202018.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INF%20AUSTERIDAD%20G.%20II%20TRIM%20VIG%202018%20ok.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20AUSTERIDAD1%20046.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-austeridad-y-eficiencia-en-el-gasto-publico-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2025', 'ctl-control-interno-contable-2025', 'Control interno contable – vigencia 2025.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 350, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2024', 'ctl-control-interno-contable-2024', 'Control interno contable – vigencia 2024.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 360, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUIMIENTO_INFORME_CONTROL_INTERNO_CONTABLE_VIG._2024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2023', 'ctl-control-interno-contable-2023', 'Control interno contable – vigencia 2023.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 370, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2022', 'ctl-control-interno-contable-2022', 'Control interno contable – vigencia 2022.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 380, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG.%202022.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2021', 'ctl-control-interno-contable-2021', 'Control interno contable – vigencia 2021.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 390, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION-CONTOL-INTERNO-CONTABLE-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2020', 'ctl-control-interno-contable-2020', 'Control interno contable – vigencia 2020.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 400, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-EVALUACION-CONTROL-INTERNO-CONTABLE_1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2019', 'ctl-control-interno-contable-2019', 'Control interno contable – vigencia 2019.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 410, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2018', 'ctl-control-interno-contable-2018', 'Control interno contable – vigencia 2018.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 420, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20C.I%20CONTABLE.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Control interno contable 2016', 'ctl-control-interno-contable-2016', 'Control interno contable – vigencia 2016.', NULL, 'documento', 'Control interno contable', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-12-31 12:00:00', 430, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-control-interno-contable-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20CONTROL%20INTERNO%20CONTABLE%20VIG%202016.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-control-interno-contable-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2025', 'ctl-informes-de-gestion-de-control-interno-2025', 'Informes de gestión de control interno – vigencia 2025.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-19 12:00:00', 440, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20FINAL%20AUDITORIA%20INTERNA%20FACTURACION%20Y%20CARTERA%20VIGENCIA%202025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2023', 'ctl-informes-de-gestion-de-control-interno-2023', 'Informes de gestión de control interno – vigencia 2023.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 450, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20DE%20GESTION%20CONTROL%20INTERNO%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2022', 'ctl-informes-de-gestion-de-control-interno-2022', 'Informes de gestión de control interno – vigencia 2022.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 460, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-DE-GESTION-1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2021', 'ctl-informes-de-gestion-de-control-interno-2021', 'Informes de gestión de control interno – vigencia 2021.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 470, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-DE-GESTION-1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2020', 'ctl-informes-de-gestion-de-control-interno-2020', 'Informes de gestión de control interno – vigencia 2020.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 480, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME-DE-GESTION-CONTROL-INTERNO-2020.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2019', 'ctl-informes-de-gestion-de-control-interno-2019', 'Informes de gestión de control interno – vigencia 2019.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 490, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20gesti%C3%B3n%20%20Oficina%20de%20Contro%20Interno%20de%20Gesti%C3%B3n%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2018', 'ctl-informes-de-gestion-de-control-interno-2018', 'Informes de gestión de control interno – vigencia 2018.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 500, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTION.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2015', 'ctl-informes-de-gestion-de-control-interno-2015', 'Informes de gestión de control interno – vigencia 2015.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2015-12-31 12:00:00', 510, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2015');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Gesti%C3%B3n%20Control%20Interno%20Vigencia%202015.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2015' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2013', 'ctl-informes-de-gestion-de-control-interno-2013', 'Informes de gestión de control interno – vigencia 2013.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2013-12-31 12:00:00', 520, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2013');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20OFICINA%20DE%20CONTROL%20INTERNO%20VIGENCIA%202013.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2013' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de gestión de control interno 2012', 'ctl-informes-de-gestion-de-control-interno-2012', 'Informes de gestión de control interno – vigencia 2012.', NULL, 'documento', 'Informes de gestión de control interno', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2012-12-31 12:00:00', 530, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-gestion-de-control-interno-2012');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20DE%20GESTI%C3%93N%20DE%20CONTROL%20INTERNO%20VIGENCIA%202012.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-informes-de-gestion-de-control-interno-2012' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2026', 'ctl-informes-de-pqrsf-2026', 'Informes de PQRSF – vigencia 2026.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-24 12:00:00', 10, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_I_SEMESTRE_2026%20CIG.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2025', 'ctl-informes-de-pqrsf-2025', 'Informes de PQRSF – vigencia 2025.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 20, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME_PQRSF_II_SEMESTRE_2025.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE%20-%20JUN%202025%20CIG.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%203ER%20TRIMESTRE%20JULIO-SEPTIEMBRE%202025.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%202DO%20TRIMESTRE%20ABRIL-JUNIO%202025..pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/3.INFORME%20TRIMESTRAL%20DE%20PQRSF%201ER%20TRIMESTRE%20ENERO-MARZO%202025..pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2024', 'ctl-informes-de-pqrsf-2024', 'Informes de PQRSF – vigencia 2024.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202024%20CIG.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20ENE-JUN%202024%20CIG.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2023', 'ctl-informes-de-pqrsf-2023', 'Informes de PQRSF – vigencia 2023.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202023%20CIG.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20PQRSF.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2022', 'ctl-informes-de-pqrsf-2022', 'Informes de PQRSF – vigencia 2022.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 50, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20PQRSF%20JUL-DIC%202022%20CIG.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2021', 'ctl-informes-de-pqrsf-2021', 'Informes de PQRSF – vigencia 2021.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 60, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-JUL-NOV-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2021-CIG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2020', 'ctl-informes-de-pqrsf-2020', 'Informes de PQRSF – vigencia 2020.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 70, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe-PQRSF-II-semestre-2020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PQRSF-I-SEMESTRE-2020-CIG.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Informes de PQRSF 2019', 'ctl-informes-de-pqrsf-2019', 'Informes de PQRSF – vigencia 2019.', NULL, 'documento', 'Informes de PQRSF', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 80, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-informes-de-pqrsf-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20II%20SEMESTRE%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20PQRS%20I%20SEMESTRE%202019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-trimestrales-sobre-acceso-a-informacion-quejas-y-reclamos'
 WHERE e.slug = 'ctl-informes-de-pqrsf-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2025', 'ctl-seguimiento-al-sigep-2025', 'Seguimiento al SIGEP – vigencia 2025.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-11-13 12:00:00', 540, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202025.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2024', 'ctl-seguimiento-al-sigep-2024', 'Seguimiento al SIGEP – vigencia 2024.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-08-23 12:00:00', 550, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%20II%202024.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2023', 'ctl-seguimiento-al-sigep-2023', 'Seguimiento al SIGEP – vigencia 2023.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 560, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20SIGEP%202023.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2022', 'ctl-seguimiento-al-sigep-2022', 'Seguimiento al SIGEP – vigencia 2022.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 570, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Sigep%20II%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2021', 'ctl-seguimiento-al-sigep-2021', 'Seguimiento al SIGEP – vigencia 2021.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 580, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-SIGEP-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al SIGEP 2020', 'ctl-seguimiento-al-sigep-2020', 'Seguimiento al SIGEP – vigencia 2020.', NULL, 'documento', 'Seguimiento al SIGEP', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 590, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-sigep-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-VERIFICACION-SIGEP-1.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-sigep-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación de la gestión 2024', 'ctl-evaluacion-de-la-gestion-2024', 'Evaluación de la gestión – vigencia 2024.', NULL, 'documento', 'Evaluación de la gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-08-05 12:00:00', 60, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-de-la-gestion-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación de la gestión 2023', 'ctl-evaluacion-de-la-gestion-2023', 'Evaluación de la gestión – vigencia 2023.', NULL, 'documento', 'Evaluación de la gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 70, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-de-la-gestion-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación de la gestión 2019', 'ctl-evaluacion-de-la-gestion-2019', 'Evaluación de la gestión – vigencia 2019.', NULL, 'documento', 'Evaluación de la gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 80, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-de-la-gestion-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20por%20%C3%81reas%20I%20Semestre%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GOBIERNO%20EN%20LINEA.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación de la gestión 2018', 'ctl-evaluacion-de-la-gestion-2018', 'Evaluación de la gestión – vigencia 2018.', NULL, 'documento', 'Evaluación de la gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 90, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-de-la-gestion-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20GESTION%202018%20EVALUADO.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GOBIERNO%20EN%20LINEA.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-de-la-gestion-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2026', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2026', 'Evaluación del sistema de control interno (SCI) – vigencia 2026.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-01-14 12:00:00', 600, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20II%20SEMESTRE%202025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2025', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2025', 'Evaluación del sistema de control interno (SCI) – vigencia 2025.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-07-14 12:00:00', 610, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Evaluacion_SCI_I_semestre_2025.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2024', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2024', 'Evaluación del sistema de control interno (SCI) – vigencia 2024.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 620, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20SCI%202024.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I%20EVALUACION%20SCI%202024.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2023', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2023', 'Evaluación del sistema de control interno (SCI) – vigencia 2023.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 630, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/EVALUACION%20II%20SCI%202023.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME%20EVALUACION%20SISTEMA%20DE%20CONTROL%20INTERNO%20I%20SEMESTRE%202023.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2022', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2022', 'Evaluación del sistema de control interno (SCI) – vigencia 2022.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 640, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre%202022%20ultimo.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/I_EVALUACION_SISTEMA_DE_CONTROL_INTERNO%20(1).xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2021', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2021', 'Evaluación del sistema de control interno (SCI) – vigencia 2021.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 650, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-2semestre-2021%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Informe-sci-1semestre-2021.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del sistema de control interno (SCI) 2020', 'ctl-evaluacion-del-sistema-de-control-interno-sci-2020', 'Evaluación del sistema de control interno (SCI) – vigencia 2020.', NULL, 'documento', 'Evaluación del sistema de control interno (SCI)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 660, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Formato-informe-sci-parametrizadoo-ultimo.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/INFORME-DEL-SCI-I-SEMESTRE-2020-HSJG-copia.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-evaluacion-del-sistema-de-control-interno-sci-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a las políticas institucionales (MIPG) 2023', 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2023', 'Seguimiento a las políticas institucionales (MIPG) – vigencia 2023.', NULL, 'documento', 'Seguimiento a las políticas institucionales (MIPG)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-14 12:00:00', 670, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_DE_AVANCES_POL%C3%8DTICAS_INSTITUCIONALES_II_SEMESTRE_2023.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a las políticas institucionales (MIPG) 2021', 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2021', 'Seguimiento a las políticas institucionales (MIPG) – vigencia 2021.', NULL, 'documento', 'Seguimiento a las políticas institucionales (MIPG)', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 680, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/MIPG%20-%20POLITICAS%20Y%20DIMENCIONES%20-2021.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-las-politicas-institucionales-mipg-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2026', 'ctl-evaluacion-del-plan-de-accion-2026', 'Evaluación del plan de acción – vigencia 2026.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-07-31 12:00:00', 100, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2026%20(1).docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe_Evaluaci%C3%B3n_Plan_de_acci%C3%B3n_I_trimestres_2026.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2025', 'ctl-evaluacion-del-plan-de-accion-2025', 'Evaluación del plan de acción – vigencia 2025.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 110, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_IV_TRIMESTRE_2025.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_III_TRIMESTRE_2025.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_PLAN_DE_ACCI%C3%93N_II_TRIMESTRE_2025.docx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_GERENCIA_I_TRIMESTRE_2025..docx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2024', 'ctl-evaluacion-del-plan-de-accion-2024', 'Evaluación del plan de acción – vigencia 2024.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 120, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202024.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202024.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202024.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2023', 'ctl-evaluacion-del-plan-de-accion-2023', 'Evaluación del plan de acción – vigencia 2023.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 130, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202023._.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20III%20TRIMESTRE%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20I%20TRIMESTRE%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2022', 'ctl-evaluacion-del-plan-de-accion-2022', 'Evaluación del plan de acción – vigencia 2022.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 140, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20IV%20TRIMESTRE%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/GERENCIA%20III%20TRIMESTRE%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20GERENCIA%20II%20TRIMESTRE%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Inf.%20Gerencia%20I%20Trimestre%202022.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2020', 'ctl-evaluacion-del-plan-de-accion-2020', 'Evaluación del plan de acción – vigencia 2020.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 150, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz-de-evaluacion-1.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2019', 'ctl-evaluacion-del-plan-de-accion-2019', 'Evaluación del plan de acción – vigencia 2019.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 160, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20DE%20ACCI%C3%93N%202019.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2018', 'ctl-evaluacion-del-plan-de-accion-2018', 'Evaluación del plan de acción – vigencia 2018.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 170, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20EVALUCI%C3%93N%20POR%20%C3%81REAS.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2017', 'ctl-evaluacion-del-plan-de-accion-2017', 'Evaluación del plan de acción – vigencia 2017.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2017-12-31 12:00:00', 180, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2017');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACI%C3%93N%20PLAN%20DE%20ACCI%C3%93N%20AREAS%20OBJECI%C3%93N%20I%20SEMESTRE%20VIG%202017.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2017' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Evaluación del plan de acción 2016', 'ctl-evaluacion-del-plan-de-accion-2016', 'Evaluación del plan de acción – vigencia 2016.', NULL, 'documento', 'Evaluación del plan de acción', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2016-12-31 12:00:00', 190, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-evaluacion-del-plan-de-accion-2016');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION%20PLAN%20DE%20ACCION%20INSTITUCIONAL%20VIG%202016.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-gestion-evaluacion-y-auditoria'
 WHERE e.slug = 'ctl-evaluacion-del-plan-de-accion-2016' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2025', 'ctl-planes-de-mejoramiento-2025', 'Planes de mejoramiento – vigencia 2025.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 690, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SUSCRIPCI%C3%93N_PLAN_DE_MEJORAMIENTO_JURIDICA_2026.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_Mejoramiento_Talento_Humano.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Gesti%C3%B3n_Ambiental.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_III_Avance.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_II_Avance.pdf'), 4
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2024', 'ctl-planes-de-mejoramiento-2024', 'Planes de mejoramiento – vigencia 2024.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-30 12:00:00', 700, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_I_Avance.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20GOBIERNO%20EN%20LINEA%202024.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan_de_mejoramiento_Contraloria_Suscripci%C3%B3n.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20MANTENIMIENTO%202024.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2023', 'ctl-planes-de-mejoramiento-2023', 'Planes de mejoramiento – vigencia 2023.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-20 12:00:00', 710, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PDM%20TALENTO%20HUMANO%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20de%20Mejoramiento%20Contralor%C3%ADa%202023.xls'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Juridica%202023.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Gesti%C3%B3n%20Ambiental%202023.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2022', 'ctl-planes-de-mejoramiento-2022', 'Planes de mejoramiento – vigencia 2022.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-30 12:00:00', 720, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Supersalud%202021-2022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Servicio%20Economato%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20Secretaria%20de%20Salud%202022.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan%20de%20Mejoramiento%20%20Gesti%C3%B3n%20Documental%202022.pdf'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2021', 'ctl-planes-de-mejoramiento-2021', 'Planes de mejoramiento – vigencia 2021.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 730, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Material-de-Osteosintesis-2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Gestion-Ambiental-2021.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Contraloria-Dptal-2021.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de mejoramiento 2020', 'ctl-planes-de-mejoramiento-2020', 'Planes de mejoramiento – vigencia 2020.', NULL, 'documento', 'Planes de mejoramiento', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 740, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-mejoramiento-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/suscripcion-plan-de-mejoramiento-CDG-vig.-2020.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Plan-de-Mejoramiento-Juridica-2020.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-mejoramiento-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2026', 'ctl-planes-de-auditoria-2026', 'Planes de auditoría – vigencia 2026.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-02-18 12:00:00', 750, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN_ANUAL_DE_AUDITORIAS_INTERNAS_2026.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2025', 'ctl-planes-de-auditoria-2025', 'Planes de auditoría – vigencia 2025.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-02-18 12:00:00', 760, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20Y%20PROGRAMA%20DE%20AUDITORIA%20VIGENCIA%202025.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2024', 'ctl-planes-de-auditoria-2024', 'Planes de auditoría – vigencia 2024.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-03-18 12:00:00', 770, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan_Anual_de_auditorias_2024%20OCIG.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2023', 'ctl-planes-de-auditoria-2023', 'Planes de auditoría – vigencia 2023.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-05-25 12:00:00', 780, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20auditorias%202023.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2022', 'ctl-planes-de-auditoria-2022', 'Planes de auditoría – vigencia 2022.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 790, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Plan%20Anual%20de%20Auditorias%20Vigencia%202022.xls'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2021', 'ctl-planes-de-auditoria-2021', 'Planes de auditoría – vigencia 2021.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 800, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PLAN%20ANUAL%20DE%20AUDITORIAS%20VIGENCIA%202021.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2020', 'ctl-planes-de-auditoria-2020', 'Planes de auditoría – vigencia 2020.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 810, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PLAN%20ANUAL%20DE%20AUDITORIA%20C.I.G.%202020.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Planes de auditoría 2019', 'ctl-planes-de-auditoria-2019', 'Planes de auditoría – vigencia 2019.', NULL, 'documento', 'Planes de auditoría', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 820, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-planes-de-auditoria-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/PROGRAMA%20DE%20AUDITORIA%20CONSOLIDADO%20PARA%202019%20(2)%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PLAN%20ANUAL%20DE%20AUDITORIA%20OFICINA%20CONTROL%20INTERNO%202019.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-planes-de-auditoria-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2024', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2024', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2024.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 830, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCIO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.doc'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2023', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2023.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 840, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrup%20(III%20cuatri)%20-%20copia.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/1%20Matriz_Riesgo_20220511_Corrupci%C3%B3n.xlsx'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/SEGUIMIENTO%20I%20CUATRIMESTRE%202023%20RIESGOS%20DE%20CORRUPCI%C3%93N.xlsx'), 3
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2022', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2022', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2022.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 850, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Matriz_Riesgo_2022_II%20Sem%20_Gesti%C3%B3n%20-%20copia.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PAYAC%20vig.%202022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2021', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2021', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2021.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 860, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_PLAN_ANTICORRUPCION_III_TRIM_2021.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION-2.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/PRIMER-SEGUIMIENTO-PLAN-ANTICORRUPCION-2021.doc'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2020', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2020', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2020.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 870, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/III-SEGUIMIENTO-PLAN-ANTICORRUPCION-1.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II-SEGUIMIENTO-PLAN-ANTICORRUPCION.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/I-SEGUIMIENTO-PLAN-ANTICORRUPCION.doc'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2019', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2019', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2019.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 880, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO-AGOSTO%202019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%202019.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano 2018', 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2018', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano – vigencia 2018.', NULL, 'documento', 'Seguimiento al Plan Anticorrupción y de Atención al Ciudadano', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 890, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/III%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20SEPTIEMBRE%20-%20DICIEMBRE%202018.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/II%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20MAYO%20-%20AGOSTO%202018.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I%20SEGUIMIENTO%20PLAN%20ANTICORRUPCION%20FEBRERO-ABRIL%202018%20.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-al-plan-anticorrupcion-y-de-atencion-al-ciudadano-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2026', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2026', 'Seguimiento a riesgos SARO y de gestión – vigencia 2026.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-08-17 12:00:00', 900, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion_I_Semestre_2026_Riesgo_SARO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2025', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2025', 'Seguimiento a riesgos SARO y de gestión – vigencia 2025.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-09-23 12:00:00', 910, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVALUACION_II_SEMESTRE_2025_MAPA_DE_RIESGOS_SARO.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Evaluaci%C3%B3n%20I%20Semestre%202025%20Riesgo%20SARO.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2024', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2024', 'Seguimiento a riesgos SARO y de gestión – vigencia 2024.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 920, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/EVALUACION%20%20II%20SEMESTRE%202024%20RIESGOS%20SARO.doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Eva%20Riesgos%20SARO%20I%20Sem.%202024.doc'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2023', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2023', 'Seguimiento a riesgos SARO y de gestión – vigencia 2023.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 930, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20RIESGOS%20DE%20GESTI%C3%93N%20II%20SEM%202023.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/EVA.%20RIESGOS%20GESTI%C3%93N%201%20SEM%202023.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2022', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2022', 'Seguimiento a riesgos SARO y de gestión – vigencia 2022.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 940, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluaci%C3%B3n%20Riesgos%20de%20Gesti%C3%B3n%20II%20Sem.%202022.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/I-EVALUACION-RIESGOS-GESTION-2022.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2021', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2021', 'Seguimiento a riesgos SARO y de gestión – vigencia 2021.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2021-12-31 12:00:00', 950, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2021');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Evaluacion-el-semestre-Riesgos-de-Gestion.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-RIESGOS-DE-GESTION.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2021' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a riesgos SARO y de gestión 2020', 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2020', 'Seguimiento a riesgos SARO y de gestión – vigencia 2020.', NULL, 'documento', 'Seguimiento a riesgos SARO y de gestión', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 960, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/II-EVALUACION-DE-RIESGOS-DE-GESTION-2020.xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-riesgos-saro-y-de-gestion-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2026', 'ctl-comite-de-conciliacion-y-defensa-judicial-2026', 'Comité de Conciliación y Defensa Judicial – vigencia 2026.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2026-01-13 12:00:00', 10, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2026');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202026%20OK.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2026' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2025', 'ctl-comite-de-conciliacion-y-defensa-judicial-2025', 'Comité de Conciliación y Defensa Judicial – vigencia 2025.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2025-12-31 12:00:00', 20, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2025');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INFORME_SEGUIMIENTO_COMIT%C3%89_CONCILIACI%C3%93N_II_SEM_2025_.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20I%20SEM%202025.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2025' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2024', 'ctl-comite-de-conciliacion-y-defensa-judicial-2024', 'Comité de Conciliación y Defensa Judicial – vigencia 2024.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2024-12-31 12:00:00', 30, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2024');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMIT%C3%89%20CONCILIACI%C3%93N%20II%20SEM%202024.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20CCDJ%20I%20SEM%202024%20OK%20(1).docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2024' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2023', 'ctl-comite-de-conciliacion-y-defensa-judicial-2023', 'Comité de Conciliación y Defensa Judicial – vigencia 2023.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 40, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20II%20SEMESTRE%202023.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/INF%20SEG%20COMITE%20CONCILIACION%20I%20SEMESTRE%202023.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2022', 'ctl-comite-de-conciliacion-y-defensa-judicial-2022', 'Comité de Conciliación y Defensa Judicial – vigencia 2022.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-12-31 12:00:00', 50, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2022');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaciones%20II%20Sem%202022.docx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/Seguimiento%20Comit%C3%A9%20Conciliaci%C3%B3nes%20I%20Sem%202022.docx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2022' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2019', 'ctl-comite-de-conciliacion-y-defensa-judicial-2019', 'Comité de Conciliación y Defensa Judicial – vigencia 2019.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 60, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Comit%C3%A9%20de%20Conciliaci%C3%B3n%20vigencia%202019.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Comité de Conciliación y Defensa Judicial 2018', 'ctl-comite-de-conciliacion-y-defensa-judicial-2018', 'Comité de Conciliación y Defensa Judicial – vigencia 2018.', NULL, 'documento', 'Comité de Conciliación y Defensa Judicial', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2018-12-31 12:00:00', 70, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2018');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20COMIT%C3%89%20DE%20CONCILIACI%C3%93N.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-comite-de-conciliacion-y-defensa-judicial-2018' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a la estrategia de Gobierno Digital 2023', 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2023', 'Seguimiento a la estrategia de Gobierno Digital – vigencia 2023.', NULL, 'documento', 'Seguimiento a la estrategia de Gobierno Digital', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2023-12-31 12:00:00', 970, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2023');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/word/SEGUIMIENTO%20ESTRATEGIA%20GD%20(1).doc'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME%20TIC.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2023' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a la estrategia de Gobierno Digital 2020', 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2020', 'Seguimiento a la estrategia de Gobierno Digital – vigencia 2020.', NULL, 'documento', 'Seguimiento a la estrategia de Gobierno Digital', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2020-12-31 12:00:00', 980, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2020');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/SEGUNDO-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/PRIMER-SEGUIMIENTO-GOBIERNO-EN-LINEA.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2020' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Seguimiento a la estrategia de Gobierno Digital 2019', 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2019', 'Seguimiento a la estrategia de Gobierno Digital – vigencia 2019.', NULL, 'documento', 'Seguimiento a la estrategia de Gobierno Digital', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2019-12-31 12:00:00', 990, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informes-de-la-oficina-de-control-interno'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2019');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Gobierno%20Digital.pdf'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20Seguimiento%20Gobierno%20Digital%20Julio%20a%20Diciembre%202019.pdf'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/Informe%20de%20Seguimiento%20Gobierno%20Digital%20Enero%20-%20Julio%202019.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informes-de-la-oficina-de-control-interno'
 WHERE e.slug = 'ctl-seguimiento-a-la-estrategia-de-gobierno-digital-2019' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procesos judiciales', 'ctl-procesos-judiciales', 'Procesos judiciales.', NULL, 'documento', 'Procesos judiciales', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', '2022-08-03 12:00:00', 80, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-procesos-judiciales');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Base-de-datos-2021%20(1).xlsx'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-procesos-judiciales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/excel/Procesos%20Judiciales%202002%20-%202018.xlsx'), 1
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-procesos-judiciales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://esehospitalguaviare.gov.co/resourses/archivos/pdf/INFORME-PROCESOS-JUDICALES-17-MAYO-2016-HOSPITAL-SAN-JOSE-DEL-GUAVIARE.pdf'), 2
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-procesos-judiciales' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Defensa jurídica del Estado', 'ctl-defensa-juridica-del-estado', 'Defensa jurídica del Estado.', NULL, 'documento', 'Defensa jurídica del Estado', NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 90, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'ctl-defensa-juridica-del-estado');
INSERT IGNORE INTO cms_entrada_multimedia (entrada_id, multimedia_id, orden)
SELECT e.id, (SELECT MIN(m.id) FROM cms_multimedia m WHERE m.url = 'https://ekogui.defensajuridica.gov.co'), 0
  FROM cms_entradas e JOIN cms_paginas p ON p.id = e.pagina_id AND p.slug = 'informe-sobre-defensa-publica-y-prevencion-del-dano-antijuridico'
 WHERE e.slug = 'ctl-defensa-juridica-del-estado' AND e.migrado_de = 'esehospitalguaviare.gov.co (Control)';

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Contraloría Departamental del Guaviare', 'contraloria-departamental-del-guaviare', NULL, '<ul><li>Dirección: Calle 12 N° 22 - 83, barrio La Esperanza, San José del Guaviare</li><li>Teléfono: (608) 584 0987</li><li>Correo: control@contraloriaguaviare.gov.co</li><li>Sitio web: https://www.contraloriaguaviare.gov.co</li><li>Mecanismo de supervisión: Auditorías programadas, visitas de verificación, requerimientos documentales y análisis financiero</li></ul>', 'articulo', 'Control fiscal', 'govco:balance-scale', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 10, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'contraloria-departamental-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Procuraduría Regional del Guaviare', 'procuraduria-regional-del-guaviare', NULL, '<ul><li>Dirección: Carrera 5 # 15-80, Bogotá D.C.</li><li>Teléfono: (608) 584 0575</li><li>Teléfono: (608) 584 0129</li><li>Correo: regional.guaviare@procuraduria.gov.co</li><li>Sitio web: https://www.procuraduria.gov.co</li><li>Mecanismo de supervisión: Recepción y trámite de quejas ciudadanas, investigaciones disciplinarias y seguimiento a sanciones</li></ul>', 'articulo', 'Control disciplinario', 'govco:gavel', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 20, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'procuraduria-regional-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Personería Municipal de San José del Guaviare', 'personeria-municipal-de-san-jose-del-guaviare', NULL, '<ul><li>Dirección: Carrera 23 con transversal 21, oficina 06, Casa de Justicia, barrio La Esperanza, San José del Guaviare</li><li>Teléfono: 318 470 1320</li><li>Correo: personeriamunicipal@sanjosedelguaviare-guaviare.gov.co</li><li>Sitio web: https://www.sanjosedelguaviare-guaviare.gov.co/publicaciones/49/personeria-municipal/</li><li>Mecanismo de supervisión: Atención directa a la comunidad, visitas de inspección, seguimiento a peticiones y procesos disciplinarios</li></ul>', 'articulo', 'Control disciplinario y social', 'govco:users', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 30, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'personeria-municipal-de-san-jose-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Secretaría de Salud Departamental del Guaviare', 'secretaria-de-salud-departamental-del-guaviare', NULL, '<ul><li>Dirección: Calle 7 N° 23 - 51, barrio 20 de Julio, San José del Guaviare</li><li>Teléfono: 312 369 0544</li><li>Correo: salud@guaviare.gov.co</li><li>Sitio web: https://www.secresaludguaviare.gov.co/</li><li>Mecanismo de supervisión: Visitas de inspección, vigilancia y control (IVC), requerimientos de mejora, análisis de indicadores de calidad y verificación de habilitación de servicios</li></ul>', 'articulo', 'Control regulatorio y sanitario', 'govco:hospital', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 40, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'secretaria-de-salud-departamental-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Secretaría de Salud Municipal de San José del Guaviare', 'secretaria-de-salud-municipal-de-san-jose-del-guaviare', NULL, '<ul><li>Dirección: Calle 8 # 23-89, barrio El Centro, San José del Guaviare</li><li>Teléfono: 311 507 6047</li><li>Correo: salud@sanjosedelguaviare-guaviare.gov.co</li><li>Sitio web: https://www.sanjosedelguaviare-guaviare.gov.co</li><li>Mecanismo de supervisión: Visitas de inspección, toma de muestras, seguimiento a condiciones sanitarias y verificación de licencias</li></ul>', 'articulo', 'Control regulatorio y sanitario', 'govco:clipboard-check', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 50, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'secretaria-de-salud-municipal-de-san-jose-del-guaviare');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Superintendencia Nacional de Salud', 'superintendencia-nacional-de-salud', NULL, '<ul><li>Dirección: Carrera 68A N° 24B - 10, Torre 3, pisos 4, 9 y 10, Edificio Plaza Claro, Bogotá D.C.</li><li>Teléfono: +57 601 722 4000</li><li>Correo: correointernosns@supersalud.gov.co</li><li>Sitio web: https://www.supersalud.gov.co</li><li>Mecanismo de supervisión: Solicitud de información, auditorías técnicas, seguimiento a quejas y reclamos, y medidas preventivas y sancionatorias</li></ul>', 'articulo', 'Control regulatorio y técnico', 'govco:shield-alt', 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 60, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'superintendencia-nacional-de-salud');

INSERT INTO cms_entradas (pagina_id, titulo, slug, resumen, contenido, tipo, categoria, icono, estado, destacada, autor, fecha_publicacion, orden, migrado_de)
SELECT p.id, 'Entes y autoridades que vigilan a la E.S.E.', 'entes-de-control-introduccion', NULL, '<p>La E.S.E. Hospital San José del Guaviare está sujeta al control fiscal, disciplinario, social y sanitario de las siguientes entidades. Los informes que estas han elaborado sobre el hospital se publican en 4.7 Informes de gestión, evaluación y auditoría.</p>', 'articulo', NULL, NULL, 'publicada', 0, 'E.S.E. Hospital San José del Guaviare', NULL, 0, 'esehospitalguaviare.gov.co (Control)'
  FROM cms_paginas p WHERE p.slug = 'entes-y-autoridades-que-lo-vigilan'
   AND NOT EXISTS (SELECT 1 FROM cms_entradas x WHERE x.pagina_id = p.id AND x.slug = 'entes-de-control-introduccion');
