-- =====================================================================
-- 009 · Configuración del portal
-- Guarda en la base de datos los datos de la entidad que se muestran en
-- el pie de página y los parámetros de sesión del panel administrativo.
-- No borra nada: si la configuración ya existe, se respeta.
-- =====================================================================
SET NAMES utf8mb4;
SET time_zone = '+00:00';

CREATE TABLE IF NOT EXISTS cms_configuracion (
  clave           VARCHAR(60)  NOT NULL PRIMARY KEY,
  valor           LONGTEXT     NOT NULL COMMENT 'JSON',
  actualizado_por VARCHAR(150) NULL,
  actualizado_en  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO cms_configuracion (clave, valor)
SELECT 'entidad', '{"nombre":"E.S.E. HOSPITAL SAN JOSÉ DEL GUAVIARE","lema":"Empresa Social del Estado · Guaviare, Colombia","direccion":"Calle 12 con Carrera 20, Barrio La Esperanza","ciudad":"San José del Guaviare – Guaviare, Colombia","codigoPostal":"950001","horario":["Lunes a viernes: 7:00 a.m. – 12:00 m. y 2:00 p.m. – 6:00 p.m.","Sábados: 8:00 a.m. – 1:00 p.m.","Urgencias: 24 horas, todos los días"],"telefonos":[{"etiqueta":"Conmutador","numero":"(608) 584 0531"},{"etiqueta":"Celular","numero":"318 568 9597"},{"etiqueta":"Urgencias y ambulancia (24 h)","numero":"316 744 0324"}],"lineaAnticorrupcion":"","correoInstitucional":"contactenos@esehospitalguaviare.gov.co","correoJudicial":"representacionjudcial@esehospitalguaviare.gov.co","redes":[{"red":"facebook","usuario":"hospitalsanjosedelguaviare","url":"https://www.facebook.com/hospitalsanjosedelguaviare"},{"red":"instagram","usuario":"@ese_hsjg","url":"https://www.instagram.com/ese_hsjg/"},{"red":"x","usuario":"@ESE_HSJG","url":"https://x.com/ESE_HSJG"},{"red":"youtube","usuario":"E.S.E. Hospital San José del Guaviare","url":"https://www.youtube.com/@esehospitalsanjosedelguavi7955"}]}'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_configuracion WHERE clave = 'entidad');

INSERT INTO cms_configuracion (clave, valor)
SELECT 'sesion', '{"minutosInactividad":15}'
  FROM DUAL WHERE NOT EXISTS (SELECT 1 FROM cms_configuracion WHERE clave = 'sesion');
