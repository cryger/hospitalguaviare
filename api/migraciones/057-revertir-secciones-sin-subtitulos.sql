-- =====================================================================
-- 057 · Revierte a «contenido» 3 páginas que no tienen subtítulos
--  En la plantilla «secciones», los enlaces que están en los párrafos de
--  introducción (antes del primer subtítulo) se muestran como texto plano,
--  lo que desactivaba vínculos como el de Genially en «Divulgación de
--  resultados». Estas páginas vuelven a «contenido». Idempotente.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

UPDATE cms_paginas SET plantilla = 'contenido'
 WHERE plantilla = 'secciones' AND slug IN (
   'divulgacion-de-resultados',
   'colaboracion-e-innovacion-abierta',
   'informacion-especifica-para-grupos-de-interes'
 );
