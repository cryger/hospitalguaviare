/**
 * Migraciones de datos del CMS.
 * Al iniciar la API ejecuta, UNA sola vez, cada archivo .sql de /migraciones
 * que aún no se haya aplicado (queda registrado en la tabla cms_migraciones).
 * Los scripts no borran información: solo agregan o reorganizan.
 */
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');
const { config } = require('./config');

const CARPETA = path.join(__dirname, '..', 'migraciones');

async function aplicarMigraciones() {
  if (!fs.existsSync(CARPETA)) return;
  const cx = await mysql.createConnection({ ...config.db, multipleStatements: true, charset: 'utf8mb4' });
  try {
    await cx.query("SET time_zone = '+00:00'");
    await cx.query(`CREATE TABLE IF NOT EXISTS cms_migraciones (
      nombre VARCHAR(150) PRIMARY KEY,
      aplicada_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4`);

    const [filas] = await cx.query('SELECT nombre FROM cms_migraciones');
    const aplicadas = new Set(filas.map((f) => f.nombre));
    const pendientes = fs
      .readdirSync(CARPETA)
      .filter((f) => f.endsWith('.sql') && !aplicadas.has(f))
      .sort();

    for (const archivo of pendientes) {
      const sql = fs.readFileSync(path.join(CARPETA, archivo), 'utf8');
      await cx.query(sql);
      await cx.query('INSERT INTO cms_migraciones (nombre) VALUES (?)', [archivo]);
      console.log(`✔ Migración aplicada: ${archivo}`);
    }
  } finally {
    await cx.end();
  }
}

module.exports = { aplicarMigraciones };
