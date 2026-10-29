/** Módulos del dashboard (misma lista que api/src/permisos.js) */
export type Modulo =
  | 'resumen'
  | 'contenido'
  | 'slider'
  | 'eventos'
  | 'cotizaciones'
  | 'vacantes'
  | 'pqrsfd'
  | 'contratacion'
  | 'accesibilidad'
  | 'usuarios'
  | 'configuracion';

export type Rol = 'admin' | 'editor' | 'pqrsfd' | 'contratacion' | 'personalizado';

export interface EnlaceModulo {
  ruta: string;
  texto: string;
  icono: string;
  exacto?: boolean;
}

export interface DefinicionModulo {
  clave: Modulo;
  nombre: string;
  descripcion: string;
  grupo: string;
  enlaces: EnlaceModulo[];
  /** Solo el rol administrador */
  soloAdmin?: boolean;
}

/** Catálogo: define el menú lateral y las casillas del rol personalizado */
export const MODULOS: DefinicionModulo[] = [
  {
    clave: 'resumen', nombre: 'Inicio del dashboard', grupo: '', descripcion: 'Indicadores generales del portal.',
    enlaces: [{ ruta: '/admin', texto: 'Inicio', icono: '🏠', exacto: true }],
  },
  {
    clave: 'contenido', nombre: 'Contenido del portal', grupo: 'Contenido del portal',
    descripcion: 'Menús, páginas, entradas (noticias, documentos) y multimedia.',
    enlaces: [
      { ruta: '/admin/contenido/menus', texto: 'Menús y estructura', icono: '🧭' },
      { ruta: '/admin/contenido/paginas', texto: 'Páginas', icono: '📑' },
      { ruta: '/admin/contenido/entradas', texto: 'Entradas', icono: '📝' },
      { ruta: '/admin/contenido/multimedia', texto: 'Multimedia', icono: '🖼️' },
      { ruta: '/admin/contenido/servicios', texto: 'Portafolio de servicios', icono: '🩺' },
    ],
  },
  {
    clave: 'slider', nombre: 'Slider del inicio', grupo: 'Contenido del portal', descripcion: 'Diapositivas del carrusel.',
    enlaces: [{ ruta: '/admin/slider', texto: 'Slider del inicio', icono: '🎞️' }],
  },
  {
    clave: 'eventos', nombre: 'Calendario de eventos', grupo: 'Contenido del portal', descripcion: 'Eventos y actividades.',
    enlaces: [{ ruta: '/admin/eventos', texto: 'Calendario de eventos', icono: '📅' }],
  },
  {
    clave: 'pqrsfd', nombre: 'PQRSFD', grupo: 'Atención a la ciudadanía',
    descripcion: 'Peticiones, quejas, reclamos, sugerencias, felicitaciones y denuncias.',
    enlaces: [{ ruta: '/admin/pqrsf', texto: 'PQRSFD', icono: '📬' }],
  },
  {
    clave: 'contratacion', nombre: 'Solicitudes contractuales', grupo: 'Atención a la ciudadanía',
    descripcion: 'Certificaciones de contratos solicitadas por contratistas.',
    enlaces: [{ ruta: '/admin/solicitudes-contractuales', texto: 'Solicitudes contractuales', icono: '📄' }],
  },
  {
    clave: 'cotizaciones', nombre: 'Invitaciones a cotizar', grupo: 'Información de interés', descripcion: 'Procesos de cotización.',
    enlaces: [{ ruta: '/admin/cotizaciones', texto: 'Invitaciones a cotizar', icono: '💼' }],
  },
  {
    clave: 'vacantes', nombre: 'Trabaja con nosotros', grupo: 'Información de interés', descripcion: 'Convocatorias laborales.',
    enlaces: [{ ruta: '/admin/vacantes', texto: 'Trabaja con nosotros', icono: '🧑‍⚕️' }],
  },
  {
    clave: 'usuarios', nombre: 'Usuarios', grupo: 'Sistema', descripcion: 'Cuentas, roles y permisos.', soloAdmin: true,
    enlaces: [{ ruta: '/admin/usuarios', texto: 'Usuarios', icono: '👥' }],
  },
  {
    clave: 'configuracion', nombre: 'Configuración', grupo: 'Sistema', descripcion: 'Datos de la entidad y sesión.', soloAdmin: true,
    enlaces: [{ ruta: '/admin/configuracion', texto: 'Configuración', icono: '⚙️' }],
  },
  {
    clave: 'accesibilidad', nombre: 'Accesibilidad', grupo: 'Sistema', descripcion: 'Opciones de accesibilidad del portal.',
    enlaces: [{ ruta: '/admin/accesibilidad-admin', texto: 'Accesibilidad', icono: '♿' }],
  },
];

export const TODOS_LOS_MODULOS = MODULOS.map((m) => m.clave);

export const ROLES: { valor: Rol; nombre: string; descripcion: string; modulos: Modulo[] | null }[] = [
  { valor: 'admin', nombre: 'Administrador', descripcion: 'Todo el dashboard, incluidos usuarios y configuración.', modulos: TODOS_LOS_MODULOS },
  {
    valor: 'editor', nombre: 'Editor de contenido', descripcion: 'Contenido del portal, slider, calendario, cotizaciones y vacantes.',
    modulos: ['resumen', 'contenido', 'slider', 'eventos', 'cotizaciones', 'vacantes', 'accesibilidad'],
  },
  { valor: 'pqrsfd', nombre: 'PQRSFD', descripcion: 'Solo el módulo de PQRSFD.', modulos: ['pqrsfd'] },
  { valor: 'contratacion', nombre: 'Contratación', descripcion: 'Solo las solicitudes contractuales.', modulos: ['contratacion'] },
  { valor: 'personalizado', nombre: 'Personalizado', descripcion: 'Los módulos que usted marque.', modulos: null },
];

export const nombreRol = (r: string) => ROLES.find((x) => x.valor === r)?.nombre ?? r;

/** Módulos que se pueden marcar en el rol personalizado */
export const MODULOS_ASIGNABLES = MODULOS.filter((m) => !m.soloAdmin);
