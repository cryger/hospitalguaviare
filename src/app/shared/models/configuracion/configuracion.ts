/* =====================================================================
   Configuración del portal (Admin › Configuración)
   - entidad: datos del pie de página (Res. 1519 de 2020, Anexo 2)
   - sesion : parámetros del panel administrativo
===================================================================== */

export type RedSocial = 'facebook' | 'instagram' | 'x' | 'youtube' | 'tiktok' | 'linkedin';

export interface TelefonoEntidad {
  etiqueta: string;
  numero: string;
}

export interface RedEntidad {
  red: RedSocial;
  usuario: string;
  url: string;
}

export interface DatosEntidad {
  nombre: string;
  lema: string;
  direccion: string;
  /** Municipio y departamento */
  ciudad: string;
  codigoPostal: string;
  horario: string[];
  telefonos: TelefonoEntidad[];
  /** Línea anticorrupción / denuncias (vacía = no se muestra) */
  lineaAnticorrupcion: string;
  correoInstitucional: string;
  correoJudicial: string;
  redes: RedEntidad[];
}

export interface ConfigSesion {
  minutosInactividad: number;
}

export const REDES_SOCIALES: { valor: RedSocial; etiqueta: string }[] = [
  { valor: 'facebook', etiqueta: 'Facebook' },
  { valor: 'instagram', etiqueta: 'Instagram' },
  { valor: 'x', etiqueta: 'X (Twitter)' },
  { valor: 'youtube', etiqueta: 'YouTube' },
  { valor: 'tiktok', etiqueta: 'TikTok' },
  { valor: 'linkedin', etiqueta: 'LinkedIn' },
];

/** Valores iniciales (los mismos de api/migraciones/009-configuracion.sql) */
export const ENTIDAD_PREDETERMINADA: DatosEntidad = {
  nombre: 'E.S.E. HOSPITAL SAN JOSÉ DEL GUAVIARE',
  lema: 'Empresa Social del Estado · Guaviare, Colombia',
  direccion: 'Calle 12 con Carrera 20, Barrio La Esperanza',
  ciudad: 'San José del Guaviare – Guaviare, Colombia',
  codigoPostal: '950001',
  horario: [
    'Lunes a viernes: 7:00 a.m. – 12:00 m. y 2:00 p.m. – 6:00 p.m.',
    'Sábados: 8:00 a.m. – 1:00 p.m.',
    'Urgencias: 24 horas, todos los días',
  ],
  telefonos: [
    { etiqueta: 'Conmutador', numero: '(608) 584 0531' },
    { etiqueta: 'Celular', numero: '318 568 9597' },
    { etiqueta: 'Urgencias y ambulancia (24 h)', numero: '316 744 0324' },
  ],
  lineaAnticorrupcion: '',
  correoInstitucional: 'contactenos@esehospitalguaviare.gov.co',
  correoJudicial: 'representacionjudcial@esehospitalguaviare.gov.co',
  redes: [
    { red: 'facebook', usuario: 'hospitalsanjosedelguaviare', url: 'https://www.facebook.com/hospitalsanjosedelguaviare' },
    { red: 'instagram', usuario: '@ese_hsjg', url: 'https://www.instagram.com/ese_hsjg/' },
    { red: 'x', usuario: '@ESE_HSJG', url: 'https://x.com/ESE_HSJG' },
    { red: 'youtube', usuario: 'E.S.E. Hospital San José del Guaviare', url: 'https://www.youtube.com/@esehospitalsanjosedelguavi7955' },
  ],
};

export const SESION_PREDETERMINADA: ConfigSesion = { minutosInactividad: 15 };

/** "(608) 584 0531" → "+576085840531" para enlaces tel: */
export function telefonoEnlace(numero: string): string {
  const d = (numero || '').replace(/\D/g, '');
  if (!d) return '';
  if (d.startsWith('57') && d.length === 12) return '+' + d;
  if (d.length === 10) return '+57' + d;
  return d.startsWith('0') ? d : '+' + d;
}
