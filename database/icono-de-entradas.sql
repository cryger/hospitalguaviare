-- =====================================================================
-- 025 · Ícono de las entradas (servicios del portafolio)
-- Guarda un ícono nativo GOV.CO ("govco:<nombre>") elegido en el dashboard.
-- =====================================================================
SET NAMES utf8mb4;

SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_entradas' AND COLUMN_NAME = 'icono');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_entradas ADD COLUMN icono VARCHAR(60) NULL COMMENT ''Ícono GOV.CO: govco:<nombre>'' AFTER categoria',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;
