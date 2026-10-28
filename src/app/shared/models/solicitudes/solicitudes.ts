/* =====================================================================
   Modelos de PQRSFD y solicitudes contractuales (mismos campos que la API)
===================================================================== */

export type TipoPqrsfd = 'peticion' | 'queja' | 'reclamo' | 'sugerencia' | 'felicitacion' | 'denuncia' | 'informacion' | 'consulta';
export type EstadoPqrsfd = 'radicada' | 'en_tramite' | 'respondida' | 'cerrada' | 'trasladada';
export type CanalPqrsfd = 'web' | 'correo' | 'telefono' | 'presencial' | 'buzon';

/** Plazos de respuesta en días hábiles (Ley 1755 de 2015, art. 14) */
export const TIPOS_PQRSFD: { valor: TipoPqrsfd; nombre: string; plazo: number; ayuda: string; permiteAnonimo: boolean }[] = [
  { valor: 'peticion', nombre: 'Petición', plazo: 15, ayuda: 'Solicitud respetuosa de una actuación o servicio.', permiteAnonimo: false },
  { valor: 'queja', nombre: 'Queja', plazo: 15, ayuda: 'Inconformidad con la atención o la conducta de un servidor.', permiteAnonimo: true },
  { valor: 'reclamo', nombre: 'Reclamo', plazo: 15, ayuda: 'Inconformidad por un servicio no prestado o prestado de forma deficiente.', permiteAnonimo: true },
  { valor: 'sugerencia', nombre: 'Sugerencia', plazo: 15, ayuda: 'Propuesta para mejorar un servicio o proceso.', permiteAnonimo: true },
  { valor: 'felicitacion', nombre: 'Felicitación', plazo: 15, ayuda: 'Reconocimiento a un servicio o a un servidor.', permiteAnonimo: true },
  { valor: 'denuncia', nombre: 'Denuncia', plazo: 15, ayuda: 'Puesta en conocimiento de una posible conducta irregular o de corrupción.', permiteAnonimo: true },
  { valor: 'informacion', nombre: 'Solicitud de información o documentos', plazo: 10, ayuda: 'Copias, certificados o acceso a información pública.', permiteAnonimo: false },
  { valor: 'consulta', nombre: 'Consulta', plazo: 30, ayuda: 'Concepto sobre materias a cargo de la entidad.', permiteAnonimo: false },
];
export const nombreTipoPqrsfd = (t: string) => TIPOS_PQRSFD.find((x) => x.valor === t)?.nombre ?? t;

export const ESTADOS_PQRSFD: { valor: EstadoPqrsfd; nombre: string; abierta: boolean }[] = [
  { valor: 'radicada', nombre: 'Radicada', abierta: true },
  { valor: 'en_tramite', nombre: 'En trámite', abierta: true },
  { valor: 'respondida', nombre: 'Respondida', abierta: false },
  { valor: 'cerrada', nombre: 'Cerrada', abierta: false },
  { valor: 'trasladada', nombre: 'Trasladada por competencia', abierta: false },
];
export const nombreEstadoPqrsfd = (e: string) => ESTADOS_PQRSFD.find((x) => x.valor === e)?.nombre ?? e;

export const CANALES_PQRSFD: { valor: CanalPqrsfd; nombre: string }[] = [
  { valor: 'web', nombre: 'Portal web' },
  { valor: 'correo', nombre: 'Correo electrónico' },
  { valor: 'telefono', nombre: 'Teléfono' },
  { valor: 'presencial', nombre: 'Ventanilla / presencial' },
  { valor: 'buzon', nombre: 'Buzón de sugerencias' },
];
export const nombreCanal = (c: string) => CANALES_PQRSFD.find((x) => x.valor === c)?.nombre ?? c;

export const TIPOS_DOCUMENTO = [
  { valor: 'CC', nombre: 'Cédula de ciudadanía' },
  { valor: 'CE', nombre: 'Cédula de extranjería' },
  { valor: 'TI', nombre: 'Tarjeta de identidad' },
  { valor: 'RC', nombre: 'Registro civil' },
  { valor: 'PA', nombre: 'Pasaporte' },
  { valor: 'PPT', nombre: 'Permiso por protección temporal' },
  { valor: 'NIT', nombre: 'NIT' },
  { valor: 'OTRO', nombre: 'Otro' },
];

export interface ArchivoSolicitud {
  id: number;
  origen: 'ciudadano' | 'respuesta';
  nombre: string;
  mime?: string;
  tamano: number;
  creadoEn?: string;
}

export interface MovimientoHistorial {
  id: number;
  usuario: string;
  accion: string;
  detalle: string;
  fecha: string;
}

export interface Pqrsfd {
  id: number;
  radicado: string;
  tipo: TipoPqrsfd;
  anonimo: boolean;
  tipoPersona: 'natural' | 'juridica';
  tipoDocumento: string;
  numeroDocumento: string;
  nombre: string;
  correo: string;
  telefono: string;
  direccion: string;
  municipio: string;
  grupoPoblacional: string;
  medioRespuesta: 'correo' | 'fisica';
  canal: CanalPqrsfd;
  asunto: string;
  mensaje: string;
  estado: EstadoPqrsfd;
  area: string;
  asignadoA: number | null;
  asignadoNombre: string;
  plazoDias: number;
  fechaRadicacion: string;
  fechaVencimiento: string;
  respuesta: string;
  fechaRespuesta: string | null;
  respondidoPor: string;
  adjuntos: number;
  actualizadoEn?: string;
}

export interface PqrsfdDetalle extends Pqrsfd {
  codigoConsulta: string;
  archivos: ArchivoSolicitud[];
  historial: MovimientoHistorial[];
}

/** Lo que devuelve la API al radicar */
export interface Radicacion {
  id?: number;
  radicado: string;
  codigo?: string;
  tipoNombre?: string;
  plazoDias: number;
  fechaRadicacion: string;
  fechaVencimiento: string;
}

/** Consulta pública (sin datos personales) */
export interface ConsultaPublica {
  radicado: string;
  tipoNombre?: string;
  asunto?: string;
  estado: string;
  vigencias?: number[];
  tipoEntrega?: string;
  fechaRadicacion: string;
  fechaVencimiento: string;
  fechaRespuesta: string | null;
  respuesta: string;
  adjuntos: { id: number; nombre: string; tamano: number }[];
}

/* ===================== Solicitudes contractuales ===================== */

export type EstadoContractual = 'radicada' | 'en_tramite' | 'respondida' | 'rechazada';

export const ESTADOS_CONTRACTUAL: { valor: EstadoContractual; nombre: string; abierta: boolean }[] = [
  { valor: 'radicada', nombre: 'Radicada', abierta: true },
  { valor: 'en_tramite', nombre: 'En trámite', abierta: true },
  { valor: 'respondida', nombre: 'Respondida', abierta: false },
  { valor: 'rechazada', nombre: 'Rechazada', abierta: false },
];
export const nombreEstadoContractual = (e: string) => ESTADOS_CONTRACTUAL.find((x) => x.valor === e)?.nombre ?? e;

export const PLAZO_CONTRACTUAL = 10;
export const PRIMERA_VIGENCIA = 2015;

export interface SolicitudContractual {
  id: number;
  radicado: string;
  cedula: string;
  nombre: string;
  correo: string;
  telefono: string;
  tipoEntrega: 'fisica' | 'correo';
  vigencias: number[];
  descripcion: string;
  estado: EstadoContractual;
  asignadoA: number | null;
  asignadoNombre: string;
  plazoDias: number;
  fechaRadicacion: string;
  fechaVencimiento: string;
  respuesta: string;
  fechaRespuesta: string | null;
  respondidoPor: string;
  adjuntos: number;
  migradoDe: string;
  actualizadoEn?: string;
}

export interface SolicitudContractualDetalle extends SolicitudContractual {
  archivos: ArchivoSolicitud[];
  historial: MovimientoHistorial[];
}

export interface Responsable {
  id: number;
  nombre: string;
  area: string;
}

export const MAX_ARCHIVOS = 5;
export const MAX_MB = 10;
export const EXTENSIONES_PERMITIDAS = '.pdf,.jpg,.jpeg,.png,.doc,.docx,.xls,.xlsx,.odt,.ods';

/** Valida archivos antes de enviarlos (la API vuelve a validar) */
export function validarArchivos(archivos: File[]): string {
  if (archivos.length > MAX_ARCHIVOS) return `Puede adjuntar máximo ${MAX_ARCHIVOS} archivos.`;
  const permitidas = EXTENSIONES_PERMITIDAS.split(',');
  for (const f of archivos) {
    const ext = '.' + (f.name.split('.').pop() || '').toLowerCase();
    if (!permitidas.includes(ext)) return `El archivo "${f.name}" no es de un tipo permitido (PDF, JPG, PNG, Word o Excel).`;
    if (f.size > MAX_MB * 1024 * 1024) return `El archivo "${f.name}" supera ${MAX_MB} MB.`;
  }
  return '';
}

export function tamanoLegible(bytes: number): string {
  if (bytes < 1024) return `${bytes} B`;
  if (bytes < 1024 * 1024) return `${Math.round(bytes / 1024)} KB`;
  return `${(bytes / 1024 / 1024).toFixed(1)} MB`;
}
