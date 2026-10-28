-- =====================================================================
-- 017 · Usuarios del dashboard: roles y permisos por módulo
--   admin         → todo el dashboard
--   editor        → contenido del portal (páginas, noticias, slider, calendario…)
--   pqrsfd        → solo el módulo de PQRSFD
--   contratacion  → solo el módulo de solicitudes contractuales
--   personalizado → los módulos que marque el administrador (columna modulos)
-- No borra nada. Compatible con MySQL 5.7+/8 y MariaDB 10.3+.
-- =====================================================================
SET NAMES utf8mb4;

ALTER TABLE cms_usuarios
  MODIFY rol ENUM('admin','editor','pqrsfd','contratacion','personalizado') NOT NULL DEFAULT 'editor';

-- Columnas nuevas (solo si no existen)
SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_usuarios' AND COLUMN_NAME = 'modulos');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_usuarios ADD COLUMN modulos TEXT NULL COMMENT ''JSON: módulos del rol personalizado'' AFTER rol',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;

SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_usuarios' AND COLUMN_NAME = 'correo');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_usuarios ADD COLUMN correo VARCHAR(150) NULL AFTER nombre',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;

SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_usuarios' AND COLUMN_NAME = 'area');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_usuarios ADD COLUMN area VARCHAR(120) NULL COMMENT ''Dependencia u oficina'' AFTER correo',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;

SET @existe := (SELECT COUNT(*) FROM information_schema.COLUMNS
                 WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'cms_usuarios' AND COLUMN_NAME = 'actualizado_en');
SET @sql := IF(@existe = 0,
  'ALTER TABLE cms_usuarios ADD COLUMN actualizado_en DATETIME NULL ON UPDATE CURRENT_TIMESTAMP AFTER creado_en',
  'SELECT 1');
PREPARE st FROM @sql; EXECUTE st; DEALLOCATE PREPARE st;
