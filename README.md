# Portal web — E.S.E. Hospital San José del Guaviare

Nuevo portal institucional de la **E.S.E. Hospital San José del Guaviare** (San José del Guaviare, Colombia), con un **panel administrativo (CMS)** para que el equipo del hospital publique y actualice el contenido sin tocar código.

El sitio sigue los lineamientos de **GOV.CO** y la estructura de la **Resolución 1519 de 2020 (MinTIC)**, que exige la Ley 1712 de 2014 de transparencia y acceso a la información pública y que evalúa el **ITA** de la Procuraduría.

| | |
|---|---|
| **Frontend** | Angular 21 (standalone, *zoneless*, signals) |
| **Backend** | API REST en Node.js + Express |
| **Base de datos** | MySQL / MariaDB |
| **Despliegue** | Frontend en Vercel · API y base de datos en cPanel (Node.js App) |

---

## Contenido

- [Funcionalidades](#funcionalidades)
- [Arquitectura](#arquitectura)
- [Estructura del repositorio](#estructura-del-repositorio)
- [Puesta en marcha local](#puesta-en-marcha-local)
- [Modo local y modo API](#modo-local-y-modo-api)
- [Base de datos y migraciones](#base-de-datos-y-migraciones)
- [API](#api)
- [Despliegue](#despliegue)
- [Contenido migrado del portal anterior](#contenido-migrado-del-portal-anterior)
- [Accesibilidad y cumplimiento](#accesibilidad-y-cumplimiento)
- [Convenciones](#convenciones)

---

## Funcionalidades

### Sitio público

- **Menú principal administrable**, con submenús. Se abre un solo submenú a la vez y en tabletas y teléfonos se usa el menú hamburguesa.
  - **Nuestro Hospital:** misión y visión, reseña histórica, portafolio de servicios, sedes y horarios.
  - **Transparencia y acceso a la información pública:** los numerales 1 a 9 de la Res. 1519.
  - **Atención y servicios a la ciudadanía:** trámites, canales de atención, PQRSD y Carpeta Ciudadana Digital.
  - **Participa:** las 6 secciones definidas por el DAFP.
  - **Información de interés:** invitaciones a cotizar y Trabaja con nosotros.
- **Páginas generadas por el CMS** con cinco plantillas: contenido, listado o blog, documentos, galería y enlace.
- **Noticias** en el inicio y en `/noticias`, con galería de imágenes, videos de YouTube y documentos.
- **Trámites** en tarjetas desplegables.
- **Trabaja con nosotros**: convocatorias abiertas y anteriores, con su imagen y su PDF.
- **Invitaciones a cotizar** con su documento y fecha de cierre.
- **PQRSD**: formulario de peticiones, quejas, reclamos, sugerencias y denuncias.
- **Pie de página GOV.CO** con los datos de la entidad, que se editan desde el panel.
- **Páginas del pie:** políticas de privacidad, términos y condiciones, accesibilidad y mapa del sitio. El mapa del sitio se genera solo a partir de los menús.
- **Barra de accesibilidad:** contraste, tamaño de letra, lectura de pantalla y Centro de Relevo.

### Panel administrativo (`/admin`)

| Módulo | Qué permite |
|---|---|
| **Dashboard** | Indicadores de PQRSF, noticias, cumplimiento de Transparencia, vacantes y contenido; alertas y actividad reciente |
| **Menús y estructura** | Ordenar el árbol de páginas del menú principal y del pie de página (↑ ↓ para el orden, → ← para el nivel) |
| **Páginas** | Crear y editar páginas, su plantilla, su estado (publicada, borrador u oculta) y su ubicación en el menú |
| **Entradas** | Noticias, artículos, documentos, eventos, trámites y enlaces, con editor de contenido y archivos adjuntos |
| **Multimedia** | Biblioteca de imágenes, videos, PDF y otros archivos |
| **PQRSF** | Bandeja de solicitudes con semáforo de plazos |
| **Invitaciones a cotizar** | Publicar, cerrar y adjuntar el PDF de cada invitación |
| **Trabaja con nosotros** | Vacantes con imagen, requisitos, PDF y estado (abierta, borrador o cerrada) |
| **Usuarios** | Gestión de usuarios del panel |
| **Configuración** | Datos de la entidad del pie de página (con un medidor de cumplimiento ITA), mi cuenta y cambio de contraseña, minutos de inactividad antes de cerrar la sesión y estado del sistema (API, base de datos y migraciones) |

---

## Arquitectura

```
┌──────────────────────────┐        HTTPS / JSON        ┌───────────────────────────┐
│  Angular 21 (Vercel)     │ ─────────────────────────▶ │  API Node.js + Express    │
│  · Sitio público         │   JWT en /admin            │  (cPanel › Node.js App)   │
│  · Panel /admin          │ ◀───────────────────────── │  · /api/cms/*             │
└──────────────────────────┘                            │  · /api/auth/*            │
                                                        │  · /api/configuracion     │
                                                        │  · /api/uploads/*         │
                                                        └─────────────┬─────────────┘
                                                                      │ mysql2
                                                        ┌─────────────▼─────────────┐
                                                        │  MySQL / MariaDB          │
                                                        │  cms_* (contenido)        │
                                                        └───────────────────────────┘
```

El modelo de contenido funciona como un CMS tipo WordPress:

```
Menú  →  Páginas (árbol)  →  Entradas  →  Multimedia
```

- **`CmsDataSource`** es una capa de acceso a datos con dos implementaciones:
  - **`CmsHttpDataSource`** consume la API.
  - **`CmsLocalDataSource`** guarda la información en el navegador.

  La implementación se elige con `environment.cms.modo`.
- **Lectura pública:** la API solo entrega lo publicado. Con sesión iniciada se ve todo, incluidos los borradores.
- **Rutas de páginas y entradas:** las resuelve un *UrlMatcher* comodín (`rutaCmsComodin`), así que crear una página en el panel la publica de inmediato en su ruta, por ejemplo `/transparencia/normativa/leyes`.

---

## Estructura del repositorio

```
hospitalguaviare/
├── src/
│   ├── app/
│   │   ├── componentes/        # Cabecera, navbar, footer, accesibilidad, dashboard (sidebar/topbar)…
│   │   ├── layout/             # public-layout (sitio) y dashboard-layout (panel)
│   │   ├── pages/
│   │   │   ├── admin/          # Módulos del panel (cms, configuración, pqrsf, vacantes, cotizaciones…)
│   │   │   ├── cms-publico/    # Render público de páginas y entradas del CMS
│   │   │   ├── noticias/       # Noticias del inicio
│   │   │   ├── mapa-del-sitio/ # Mapa del sitio automático
│   │   │   └── …               # informacion-interes, trabaja-nosotros, cotizaciones, pqrsf, login
│   │   ├── shared/
│   │   │   ├── models/         # Interfaces (cms, configuración, vacantes, cotizaciones…)
│   │   │   └── services/       # CmsService, data sources, auth, configuración, inactividad…
│   │   └── app.routes.ts
│   └── environments/           # environment.ts (prod) y environment.development.ts
├── public/
│   └── assets/                 # Imágenes (vacantes, noticias) y semillas para el modo local
├── api/                        # API Node.js + Express (ver api/README.md)
│   ├── app.js                  # Punto de entrada (cPanel: Application startup file)
│   ├── src/                    # auth, cms, configuración, mapeo de tablas, errores, db
│   ├── migraciones/            # Scripts SQL que se aplican solos al iniciar la API
│   └── scripts/                # crear-admin, copiar-archivos-migrados
├── database/                   # Esquema inicial y copias de los scripts para phpMyAdmin
├── vercel.json                 # Despliegue del frontend
└── proxy.conf.json             # Proxy opcional para ng serve
```

---

## Puesta en marcha local

### Requisitos

- **Node.js 20** o superior (la API funciona desde la versión 18).
- **MySQL 8 o MariaDB 10.6+**. Solo se necesita para el modo API.
- **Angular CLI 21**, opcional, porque también se puede usar `npx ng`.

### 1. Frontend

```bash
npm install
npm start            # http://localhost:4200
```

### 2. API y base de datos (opcional)

```bash
# Crear la base de datos e importar el esquema inicial
mysql -u root -p -e "CREATE DATABASE hsjg_portal CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci"
mysql -u root -p hsjg_portal < database/cms-schema.sql

cd api
npm install
cp .env.example .env     # ajustar DB_*, JWT_SECRET y CORS_ORIGINS=http://localhost:4200
npm run crear-admin -- admin "Administrador" "UnaClaveSegura2026"
npm run dev              # http://localhost:3000/api/salud
```

Al iniciar, la API aplica sola las migraciones pendientes (ver [Base de datos y migraciones](#base-de-datos-y-migraciones)).

### 3. Compilar

```bash
npm run build        # dist/hospitalguaviare/browser
```

---

## Modo local y modo API

El modo se configura en `src/environments/`:

| Archivo | Uso | Modo |
|---|---|---|
| `environment.development.ts` | `ng serve` | `api` → `http://localhost:3000/api` |
| `environment.ts` | `ng build` / Vercel | `local` mientras `API_URL` tenga el valor de ejemplo; `api` cuando se ponga la URL real |

- **Modo local:**
  - Funciona sin backend: la estructura, los trámites, las vacantes, las cotizaciones, las páginas del pie y las noticias se cargan desde semillas incluidas en el proyecto.
  - Los cambios se guardan **solo en ese navegador**, así que sirve para demos y pruebas.
- **Modo API:**
  - Todo se guarda en MySQL.
  - Los archivos se suben al servidor de la API (`uploads/`).
  - El panel exige iniciar sesión, con JWT y cierre por inactividad.

Para pasar el sitio publicado a modo API, edite `src/environments/environment.ts`:

```ts
const API_URL = 'https://api.esehospitalguaviare.gov.co/api';
```

---

## Base de datos y migraciones

- `database/cms-schema.sql` crea las tablas `cms_*` y la estructura inicial del portal.
- `api/migraciones/*.sql` contiene los cambios posteriores. Al iniciar, la API **aplica una sola vez** cada archivo pendiente y lo registra en `cms_migraciones`.
- Ninguna migración borra información: solo agrega o reorganiza, y se puede ejecutar varias veces sin duplicar nada.

| Migración | Contenido |
|---|---|
| `001-estructura-1519` | Árbol de páginas según la Res. 1519 de 2020 y el menú Participa (DAFP) |
| `002-tramites` | Trámites del portal anterior |
| `003-vacantes`, `004-imagenes-vacantes` | Tabla de vacantes y convocatorias anteriores con sus imágenes |
| `005-informacion-de-interes` | Tabla de invitaciones a cotizar y la sección Información de interés |
| `006`, `007`, `011-orden-menu-principal` | Orden del menú principal |
| `008-pie-de-pagina` | Políticas, términos, accesibilidad y mapa del sitio |
| `009-configuracion` | Tabla `cms_configuracion` (datos de la entidad y sesión) |
| `010-noticias` | 145 noticias del portal anterior con su multimedia |

En la carpeta `database/` hay una copia de cada script para aplicarlo a mano desde phpMyAdmin si se necesita.

**Tablas principales:**
- Contenido del CMS: `cms_menus`, `cms_paginas`, `cms_entradas`, `cms_multimedia`, `cms_entrada_multimedia`.
- Módulos: `cms_vacantes`, `cms_cotizaciones`.
- Configuración y usuarios: `cms_configuracion`, `cms_usuarios`.
- Control de migraciones: `cms_migraciones`.

---

## API

Resumen de rutas, todas con el prefijo `/api`. El detalle está en [`api/README.md`](api/README.md).

| Método | Ruta | Acceso |
|---|---|---|
| GET | `/salud` | Público |
| POST | `/auth/login` | Público (máx. 10 intentos cada 15 min) |
| GET | `/auth/yo` | Con sesión |
| PUT | `/auth/clave` | Con sesión (cambio de contraseña) |
| GET | `/cms/{menus,paginas,entradas,multimedia,vacantes,cotizaciones}` | Público = solo lo publicado · con sesión = todo |
| POST / PUT / DELETE | `/cms/:coleccion[/:id]` | Con sesión |
| PUT | `/cms/paginas/orden` | Con sesión |
| POST | `/cms/multimedia/upload` | Con sesión (multipart, campo `archivo`) |
| GET | `/configuracion` | Público (datos de la entidad y sesión) |
| PUT | `/configuracion/:clave` | Administradores (`entidad`, `sesion`) |
| GET | `/sistema/estado` | Con sesión |
| GET | `/uploads/...` | Archivos subidos |

**Scripts de la API** (se ejecutan dentro de `api/`):

| Comando | Para qué sirve |
|---|---|
| `npm run dev` | Desarrollo con recarga automática |
| `npm start` | Producción |
| `npm run crear-admin -- usuario "Nombre" "Clave"` | Crea un administrador o le cambia la clave |
| `npm run copiar-migrados [-- --prueba]` | Copia al nuevo hosting las imágenes y PDF que siguen en el portal anterior y actualiza sus URL |

---

## Despliegue

### Frontend: Vercel

- El proyecto ya trae `vercel.json` configurado (*framework* Angular, salida `dist/hospitalguaviare/browser` y *rewrites* para que funcionen las rutas de Angular).
- Cada `git push` a `main` vuelve a desplegar el sitio.

### API y base de datos: cPanel

La guía paso a paso está en [`api/README.md`](api/README.md):
1. Crear la base de datos y el usuario en **Bases de datos MySQL** e importar `database/cms-schema.sql`.
2. Subir la carpeta `api/` (sin `node_modules`) fuera de `public_html`.
3. Crear la aplicación en **Setup Node.js App**, con `app.js` como archivo de inicio y las variables del `.env`.
4. Ejecutar **Run NPM Install** y luego **Restart**. Al arrancar se aplican las migraciones.
5. Crear el usuario administrador con `npm run crear-admin`.
6. Poner `API_URL` en `src/environments/environment.ts` y hacer push.
7. Ejecutar `npm run copiar-migrados` para traer los archivos del portal anterior.

**Variables de entorno de la API** (`api/.env`):

| Variable | Descripción |
|---|---|
| `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` | Conexión a MySQL |
| `JWT_SECRET` | Cadena aleatoria larga (`node -e "console.log(require('crypto').randomBytes(48).toString('hex'))"`) |
| `JWT_EXPIRA` | Vigencia del token (por defecto `8h`) |
| `CORS_ORIGINS` | Dominios del frontend, separados por coma |
| `PUBLIC_URL` | URL pública de la API, por ejemplo `https://api.esehospitalguaviare.gov.co/api` |
| `UPLOAD_DIR`, `MAX_ARCHIVO_MB` | Carpeta y tamaño máximo de los archivos subidos |

> **Copias de seguridad:** respalde la base de datos **y** la carpeta `api/uploads/`.

---

## Contenido migrado del portal anterior

Parte del contenido de `esehospitalguaviare.gov.co` se migró y quedó editable en el panel:

- Trámites y otros procedimientos.
- Convocatorias de *Trabaja con nosotros*, con sus imágenes.
- Invitaciones a cotizar vigentes.
- 145 noticias y publicaciones (diciembre de 2022 a septiembre de 2026), con 297 imágenes, 6 videos y 26 PDF.
- Datos de contacto y redes sociales del pie de página.

Las imágenes y los PDF todavía se cargan desde el servidor anterior. **Antes de apagar ese sitio**, ejecute `npm run copiar-migrados` en la API ya publicada.

---

## Accesibilidad y cumplimiento

- **Res. 1519 de 2020, Anexo 1:** accesibilidad web según la NTC 5854 y las pautas WCAG 2.1 nivel AA.
  - Navegación completa con teclado y foco visible.
  - Texto alternativo en imágenes.
  - Contraste alto y tamaño de letra ajustable.
  - Diseño adaptable a computador, tableta y teléfono.
- **Res. 1519 de 2020, Anexo 2:**
  - Cabecera y pie de página GOV.CO.
  - Menú de Transparencia con los numerales 1 a 9.
  - Menú Atención y servicios a la ciudadanía y menú Participa.
  - Pie de página con todos los datos mínimos. El panel mide su cumplimiento en *Configuración › Datos de la entidad*.
- **Ley 1581 de 2012:** política de tratamiento de datos personales publicada en `/politicas-de-privacidad`.

---

## Convenciones

- **Angular:**
  - Componentes *standalone* y control de flujo nuevo (`@if`, `@for`).
  - **Signals** para todo estado que cambie de forma asíncrona, porque la app es *zoneless*.
- **Estilos:** CSS plano por componente. Para dar formato al HTML que llega del CMS se usa `::ng-deep`.
- **Textos y nombres** en español.
- **Cambios de datos** siempre como una nueva migración en `api/migraciones/NNN-descripcion.sql`, sin borrar información, y su copia en `database/`.
- **Formato:** Prettier, con `printWidth` de 100 y comillas simples.

---

© E.S.E. Hospital San José del Guaviare. Desarrollado por el área de Gobierno en Línea.
