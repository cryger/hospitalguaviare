const mysql = require('mysql2/promise');
const { config } = require('./config');

const pool = mysql.createPool({
  ...config.db,
  waitForConnections: true,
  connectionLimit: 8,
  charset: 'utf8mb4',
  timezone: 'Z', // fechas en UTC; el navegador las muestra en hora local
});

// Toda la sesión SQL en UTC (CURRENT_TIMESTAMP, NOW()) para que coincida con timezone: 'Z'
pool.pool.on('connection', (cx) => {
  cx.query("SET time_zone = '+00:00'");
});

/** Ejecuta fn dentro de una transacción */
async function transaccion(fn) {
  const cx = await pool.getConnection();
  try {
    await cx.beginTransaction();
    const r = await fn(cx);
    await cx.commit();
    return r;
  } catch (e) {
    await cx.rollback();
    throw e;
  } finally {
    cx.release();
  }
}

module.exports = { pool, transaccion };
