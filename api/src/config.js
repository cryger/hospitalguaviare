const path = require('path');

function requerida(nombre) {
  const v = process.env[nombre];
  if (!v) throw new Error(`Falta la variable de entorno ${nombre} (revise el archivo .env)`);
  return v;
}

const config = {
  db: {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT || 3306),
    user: requerida('DB_USER'),
    password: process.env.DB_PASSWORD || '',
    database: requerida('DB_NAME'),
  },
  jwtSecret: requerida('JWT_SECRET'),
  jwtExpira: process.env.JWT_EXPIRA || '8h',
  corsOrigins: (process.env.CORS_ORIGINS || '').split(',').map((s) => s.trim()).filter(Boolean),
  publicUrl: (process.env.PUBLIC_URL || '').replace(/\/+$/, ''),
  uploadDir: path.resolve(process.env.UPLOAD_DIR || './uploads'),
  maxArchivoMb: Number(process.env.MAX_ARCHIVO_MB || 20),
};

if (config.jwtSecret.length < 32) {
  throw new Error('JWT_SECRET debe tener al menos 32 caracteres');
}

module.exports = { config };
