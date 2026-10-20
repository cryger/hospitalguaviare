# API del CMS — Portal web E.S.E. Hospital San José del Guaviare

API REST en **Node.js + Express + MySQL** que alimenta el admin (`/admin/contenido`)
y la vista pública del portal Angular.

| Método | Ruta | Acceso |
|---|---|---|
| GET | `/api/salud` | público |
| POST | `/api/auth/login` | público (máx. 10 intentos / 15 min) |
| GET | `/api/cms/{menus,paginas,entradas,multimedia}` | público = solo lo publicado · con sesión = todo |
| POST / PUT / DELETE | `/api/cms/:coleccion[/:id]` | requiere sesión |
| PUT | `/api/cms/paginas/orden` | requiere sesión |
| POST | `/api/cms/multimedia/upload` | requiere sesión (multipart, campo `archivo`) |
| GET | `/api/uploads/...` | archivos subidos |

---

## Despliegue en cPanel

### 1. Base de datos
1. **cPanel › Bases de datos MySQL**: cree la base (ej. `usuario_hsjgportal`) y un usuario
   (ej. `usuario_hsjgapi`) con contraseña fuerte. Agregue el usuario a la base con **TODOS LOS PRIVILEGIOS**.
2. **phpMyAdmin**: seleccione la base › pestaña **Importar** › suba `database/cms-schema.sql`.

### 2. Subir la API
Suba el contenido de esta carpeta `api/` (sin `node_modules`) a una carpeta **fuera de `public_html`**,
por ejemplo `/home/USUARIO/hsjg-api`. Puede usar el Administrador de archivos (subir un .zip y extraer) o FTP.

### 3. Crear la aplicación Node.js
**cPanel › Setup Node.js App › Create Application**
- **Node.js version**: 20 (o la más alta disponible, mínimo 18)
- **Application mode**: Production
- **Application root**: `hsjg-api`
- **Application URL**: el subdominio, ej. `api.esehospitalguaviare.gov.co` (créelo antes en *Dominios*)
- **Application startup file**: `app.js`

En **Environment variables** agregue las de `.env.example` con sus valores reales
(o cree un archivo `.env` dentro de `hsjg-api`). Lo mínimo:

```
DB_HOST=localhost
DB_USER=usuario_hsjgapi
DB_PASSWORD=********
DB_NAME=usuario_hsjgportal
JWT_SECRET=<cadena aleatoria de 64+ caracteres>
CORS_ORIGINS=https://SU-SITIO.vercel.app,https://www.esehospitalguaviare.gov.co
PUBLIC_URL=https://api.esehospitalguaviare.gov.co/api
```

Para generar `JWT_SECRET`: `node -e "console.log(require('crypto').randomBytes(48).toString('hex'))"`

Guarde, pulse **Run NPM Install** y luego **Restart**.

### 4. Crear el usuario administrador
En la parte superior de la página de la app, cPanel muestra un comando
*"Enter to the virtual environment"*. Cópielo en **cPanel › Terminal** y luego:

```bash
npm run crear-admin -- henry "Henry Garcia" "UnaClaveLargaYSegura"
```
(El mismo comando sirve para cambiar la clave.)

### 5. Probar
Abra `https://api.esehospitalguaviare.gov.co/api/salud` → debe responder `{"ok":true,...}`.

### 6. Conectar el frontend
En `src/environments/environment.ts` ponga la URL real (mientras tenga el valor de ejemplo,
el sitio sigue en modo local y nada se rompe):
```ts
const API_URL = 'https://api.esehospitalguaviare.gov.co/api';
```
Haga commit y push: Vercel vuelve a desplegar.

---

## Notas
- **Tamaño de archivos**: `MAX_ARCHIVO_MB` (20 por defecto). Si el hosting corta antes, súbalo en
  *MultiPHP INI Editor* / pida al proveedor aumentar el límite de subida.
- **Copias de seguridad**: respalde la base de datos **y** la carpeta `uploads/`.
- **Desarrollo local**: `cp .env.example .env`, ajuste los datos y `npm run dev` (puerto 3000).
  En Angular cambie `modo` a `'api'` en `src/environments/environment.development.ts`.
