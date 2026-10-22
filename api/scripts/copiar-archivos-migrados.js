/**
 * Copia al nuevo hosting los archivos que todavía apuntan al portal anterior
 * (imágenes y PDF de noticias, vacantes, invitaciones a cotizar…).
 *
 *   npm run copiar-migrados            → copia y actualiza las URL
 *   npm run copiar-migrados -- --prueba → solo muestra qué haría
 *
 * - Descarga cada archivo de esehospitalguaviare.gov.co a UPLOAD_DIR/migrado/...
 * - Cambia la URL en cms_multimedia (y en vacantes/cotizaciones) por la nueva.
 * - Las URL dentro del texto de las entradas (enlaces a PDF) también se reemplazan.
 * - Se puede ejecutar varias veces: lo que ya se copió no se vuelve a descargar.
 * Requiere PUBLIC_URL en el .env (ej. https://api.esehospitalguaviare.gov.co).
 */
require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { pool } = require('../src/db');
const { config } = require('../src/config');

const ORIGEN = /^https?:\/\/(www\.)?esehospitalguaviare\.gov\.co\//i;
const PRUEBA = process.argv.includes('--prueba');

function rutaLocal(url) {
  const relativa = decodeURIComponent(new URL(url).pathname).replace(/^\/+/, '');
  const limpia = relativa
    .split('/')
    .map((p) => p.normalize('NFKD').replace(/[̀-ͯ]/g, '').replace(/[^\w.\-() ,]+/g, '_'))
    .join('/');
  return path.join('migrado', limpia);
}

async function descargar(url, destino) {
  if (fs.existsSync(destino) && fs.statSync(destino).size > 0) return 'existente';
  const r = await fetch(url);
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  const datos = Buffer.from(await r.arrayBuffer());
  await fs.promises.mkdir(path.dirname(destino), { recursive: true });
  await fs.promises.writeFile(destino, datos);
  return `${Math.round(datos.length / 1024)} KB`;
}

async function main() {
  if (!config.publicUrl) {
    console.error('⚠ Defina PUBLIC_URL en el archivo .env (dirección pública de la API).');
    process.exit(1);
  }
  const [filas] = await pool.query('SELECT id, url FROM cms_multimedia');
  const urls = new Set(filas.filter((f) => ORIGEN.test(f.url)).map((f) => f.url));
  for (const [tabla, columnas] of [['cms_vacantes', ['imagen_url', 'documento_url']], ['cms_cotizaciones', ['documento_url']]]) {
    for (const c of columnas) {
      const [r] = await pool.query(`SELECT ${c} AS url FROM ${tabla} WHERE ${c} LIKE '%esehospitalguaviare.gov.co/%'`).catch(() => [[]]);
      r.forEach((x) => urls.add(x.url));
    }
  }
  // PDF e imágenes enlazados dentro del texto de las entradas
  const [entradas] = await pool.query("SELECT contenido FROM cms_entradas WHERE contenido LIKE '%esehospitalguaviare.gov.co/resourses/%'");
  for (const e of entradas) {
    for (const m of e.contenido.matchAll(/href="(https?:\/\/(?:www\.)?esehospitalguaviare\.gov\.co\/resourses\/[^"]+\.(?:pdf|jpe?g|png|webp|docx?|xlsx?))"/gi)) {
      urls.add(m[1].replace(/&amp;/g, '&'));
    }
  }
  console.log(`${urls.size} archivo(s) del portal anterior${PRUEBA ? ' (modo prueba)' : ''}\n`);

  let ok = 0;
  let fallos = 0;
  for (const url of urls) {
    const relativa = rutaLocal(url);
    const nueva = `${config.publicUrl}/uploads/${relativa.split(path.sep).map(encodeURIComponent).join('/')}`;
    try {
      if (!PRUEBA) {
        const r = await descargar(url, path.join(config.uploadDir, relativa));
        await pool.query('UPDATE cms_multimedia SET url = ? WHERE url = ?', [nueva, url]);
        await pool.query('UPDATE cms_vacantes SET imagen_url = ? WHERE imagen_url = ?', [nueva, url]).catch(() => {});
        await pool.query('UPDATE cms_vacantes SET documento_url = ? WHERE documento_url = ?', [nueva, url]).catch(() => {});
        await pool.query('UPDATE cms_cotizaciones SET documento_url = ? WHERE documento_url = ?', [nueva, url]).catch(() => {});
        await pool.query('UPDATE cms_entradas SET contenido = REPLACE(contenido, ?, ?) WHERE contenido LIKE ?', [url, nueva, `%${url}%`]);
        console.log(`✔ ${relativa} (${r})`);
      } else {
        console.log(`· ${url}\n  → ${nueva}`);
      }
      ok++;
    } catch (e) {
      fallos++;
      console.log(`✖ ${url} — ${e.message}`);
    }
  }
  console.log(`\nListo: ${ok} copiado(s), ${fallos} con error.`);
  await pool.end();
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
