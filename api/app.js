/**
 * API del CMS — E.S.E. Hospital San José del Guaviare
 * Punto de entrada (cPanel › Setup Node.js App › Application startup file: app.js)
 */
require('dotenv').config();

const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const path = require('path');
const { config } = require('./src/config');
const { rutasAuth } = require('./src/auth');
const { rutasCms } = require('./src/cms');
const { manejarErrores } = require('./src/errores');
const { aplicarMigraciones } = require('./src/migraciones');

const app = express();
app.set('trust proxy', 1);
app.disable('x-powered-by');

app.use(
  helmet({
    // Las imágenes/documentos se muestran desde el dominio del sitio (Vercel)
    crossOriginResourcePolicy: { policy: 'cross-origin' },
  }),
);
app.use(
  cors({
    origin: (origen, cb) => {
      if (!origen || config.corsOrigins.includes(origen)) return cb(null, true);
      cb(new Error(`Origen no permitido por CORS: ${origen}`));
    },
  }),
);
app.use(express.json({ limit: '2mb' }));

const router = express.Router();
router.get('/salud', (_req, res) => res.json({ ok: true, hora: new Date().toISOString() }));
router.use('/auth', rutasAuth);
router.use('/cms', rutasCms);
router.use(
  '/uploads',
  express.static(path.resolve(config.uploadDir), { maxAge: '30d', fallthrough: false }),
);

// Funciona tanto si cPanel monta la app en /api como en la raíz del subdominio
app.use(['/api', '/'], router);
app.use(manejarErrores);

const puerto = process.env.PORT || 3000;

// Aplica las migraciones pendientes (estructura del portal) y luego inicia el servidor
aplicarMigraciones()
  .catch((e) => console.error('⚠ No se pudieron aplicar las migraciones:', e.message))
  .finally(() => app.listen(puerto, () => console.log(`API CMS escuchando en el puerto ${puerto}`)));

module.exports = app;
