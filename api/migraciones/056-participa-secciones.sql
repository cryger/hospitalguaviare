-- =====================================================================
-- 056 · Presentación «secciones» para páginas de participación y grupos
--  Cambia a la plantilla «secciones» (banner, secciones numeradas,
--  tarjetas con íconos, tablas estilizadas) páginas que estaban como
--  texto plano «contenido» y cuyo contenido ya tiene estructura adecuada.
--  Solo cambia la plantilla; no reescribe ni borra contenido. Idempotente.
--
--  Se excluyen a propósito las páginas con varias entradas de tabla
--  (control social, trámites, canales de atención, PAAC), porque en esta
--  plantilla solo se despliega la entrada principal.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'secciones'
 WHERE plantilla = 'contenido' AND slug IN (
   'estrategia-de-participacion-ciudadana',
   'planeacion-y-presupuesto-participativo',
   'consulta-ciudadana',
   'alianza-de-usuarios',
   'colaboracion-e-innovacion-abierta',
   'divulgacion-de-resultados',
   'informacion-especifica-para-grupos-de-interes',
   'informacion-para-ninas-ninos-y-adolescentes'
 );
