-- =====================================================================
-- 022 · Transparencia › 1. Información de la entidad: descripciones de las
--       secciones (se muestran en las tarjetas de "En esta sección").
-- Solo completa las páginas que aún no tienen descripción. No borra nada.
-- =====================================================================
SET NAMES utf8mb4;

UPDATE cms_paginas SET descripcion = 'Conozca quiénes somos, cómo estamos organizados, cómo contactarnos, quién nos vigila y cómo tomamos las decisiones que le afectan.' WHERE slug = 'informacion-de-la-entidad' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Organigrama y estructura administrativa de la E.S.E. Hospital San José del Guaviare.' WHERE slug = 'estructura-organica-organigrama' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Mapa de procesos y caracterizaciones de los procesos institucionales.' WHERE slug = 'mapas-y-cartas-descriptivas-de-los-procesos' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Dependencias, responsables, teléfonos y correos para comunicarse con el hospital.' WHERE slug = 'directorio-institucional' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Servidores públicos y contratistas de la entidad, con su cargo e información de contacto.' WHERE slug = 'directorio-de-servidores-publicos-empleados-o-contratistas' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Entidades del sector salud y del Estado con las que se relaciona la E.S.E.' WHERE slug = 'directorio-de-entidades' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Asociaciones de usuarios, agremiaciones y grupos de interés relacionados con el hospital.' WHERE slug = 'directorio-de-agremiaciones-asociaciones-y-otros-grupos-de-interes' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Normas, formularios y protocolos que orientan la atención a la ciudadanía.' WHERE slug = 'servicio-al-publico-normas-formularios-y-protocolos-de-atencion' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Procedimientos e instancias que intervienen en la toma de decisiones de cada área.' WHERE slug = 'procedimientos-que-se-siguen-para-tomar-decisiones-en-las-diferentes-areas' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Radique en línea peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias, y consulte su estado.' WHERE slug = 'mecanismo-pqrsd' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Decisiones institucionales que pueden afectar a la ciudadanía y sus fundamentos.' WHERE slug = 'informacion-sobre-decisiones-que-pueden-afectar-al-publico' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Organismos de control, vigilancia e inspección que supervisan la gestión de la E.S.E.' WHERE slug = 'entes-y-autoridades-que-lo-vigilan' AND (descripcion IS NULL OR descripcion = '');
UPDATE cms_paginas SET descripcion = 'Hojas de vida de aspirantes a cargos de libre nombramiento, publicadas para observaciones ciudadanas.' WHERE slug = 'publicacion-de-hojas-de-vida' AND (descripcion IS NULL OR descripcion = '');
