/**
 * Crea (o actualiza la clave de) un usuario administrador del CMS.
 * Uso:  npm run crear-admin -- <usuario> "<Nombre completo>" <clave>
 */
require('dotenv').config();
const bcrypt = require('bcryptjs');
const mysql = require('mysql2/promise');

(async () => {
  const [usuario, nombre, clave] = process.argv.slice(2);
  if (!usuario || !nombre || !clave) {
    console.error('Uso: npm run crear-admin -- <usuario> "<Nombre completo>" <clave>');
    process.exit(1);
  }
  if (clave.length < 10) {
    console.error('La clave debe tener al menos 10 caracteres.');
    process.exit(1);
  }
  const cx = await mysql.createConnection({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT || 3306),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });
  const hash = await bcrypt.hash(clave, 12);
  await cx.query(
    `INSERT INTO cms_usuarios (usuario, nombre, password_hash, rol) VALUES (?, ?, ?, 'admin')
     ON DUPLICATE KEY UPDATE nombre = VALUES(nombre), password_hash = VALUES(password_hash), activo = 1`,
    [usuario, nombre, hash],
  );
  console.log(`✔ Usuario "${usuario}" listo.`);
  await cx.end();
})().catch((e) => {
  console.error('Error:', e.message);
  process.exit(1);
});
