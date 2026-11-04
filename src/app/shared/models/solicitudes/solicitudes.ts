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

/* ===================== Copia de historia clínica ===================== */

export type EstadoHistoria = 'radicada' | 'en_tramite' | 'respondida' | 'rechazada';
export type CalidadSolicitante = 'paciente' | 'representante' | 'autorizado' | 'familiar';
export type AlcanceHistoria = 'completa' | 'epicrisis' | 'resultados' | 'otro';

export const PLAZO_HISTORIA = 10;
export const DIAS_DESCARGA_HISTORIA = 30;
/** Soportes: solo PDF o imagen (la API valida lo mismo) */
export const EXTENSIONES_SOPORTE = '.pdf,.jpg,.jpeg,.png';

export const ESTADOS_HISTORIA: { valor: EstadoHistoria; nombre: string; abierta: boolean }[] = [
  { valor: 'radicada', nombre: 'Radicada', abierta: true },
  { valor: 'en_tramite', nombre: 'En trámite', abierta: true },
  { valor: 'respondida', nombre: 'Entregada', abierta: false },
  { valor: 'rechazada', nombre: 'No procede', abierta: false },
];
export const nombreEstadoHistoria = (e: string) => ESTADOS_HISTORIA.find((x) => x.valor === e)?.nombre ?? e;

/** Quién puede solicitarla (Res. 1995 de 1999, art. 14) y qué soportes debe adjuntar */
export const CALIDADES_SOLICITANTE: { valor: CalidadSolicitante; nombre: string; ayuda: string; soportes: string[] }[] = [
  {
    valor: 'paciente', nombre: 'Soy el paciente', ayuda: 'Usted es la persona atendida y es mayor de edad.',
    soportes: ['Copia de su documento de identidad por ambas caras.'],
  },
  {
    valor: 'representante', nombre: 'Soy el representante legal', ayuda: 'Madre, padre o representante de un menor de edad, o apoyo designado judicialmente.',
    soportes: ['Copia de su documento de identidad.', 'Copia del documento del paciente.', 'Registro civil de nacimiento del menor o documento que acredite la representación.'],
  },
  {
    valor: 'autorizado', nombre: 'Estoy autorizado por el paciente', ayuda: 'El paciente lo autorizó por escrito para recibir la copia.',
    soportes: ['Copia de su documento de identidad.', 'Copia del documento del paciente.', 'Autorización escrita y firmada por el paciente.'],
  },
  {
    valor: 'familiar', nombre: 'Soy familiar de un paciente fallecido', ayuda: 'Cónyuge, compañero(a) permanente, hijo(a), padre o madre del paciente.',
    soportes: ['Copia de su documento de identidad.', 'Certificado o registro civil de defunción.', 'Documento que pruebe el parentesco (registro civil de nacimiento o de matrimonio, declaración de unión marital).'],
  },
];
export const nombreCalidad = (c: string) => CALIDADES_SOLICITANTE.find((x) => x.valor === c)?.nombre ?? c;

export const ALCANCES_HISTORIA: { valor: AlcanceHistoria; nombre: string; ayuda: string }[] = [
  { valor: 'completa', nombre: 'Historia clínica completa', ayuda: 'Todos los registros de las atenciones del periodo indicado.' },
  { valor: 'epicrisis', nombre: 'Epicrisis o resumen de egreso', ayuda: 'Resumen de una hospitalización o de una atención de urgencias.' },
  { valor: 'resultados', nombre: 'Resultados de laboratorio o imágenes', ayuda: 'Reportes de exámenes, ecografías, rayos X u otros estudios.' },
  { valor: 'otro', nombre: 'Otros documentos', ayuda: 'Indique en observaciones cuáles necesita.' },
];
export const nombreAlcance = (a: string) => ALCANCES_HISTORIA.find((x) => x.valor === a)?.nombre ?? a;

export const SERVICIOS_HISTORIA: { valor: string; nombre: string }[] = [
  { valor: 'urgencias', nombre: 'Urgencias' },
  { valor: 'hospitalizacion', nombre: 'Hospitalización' },
  { valor: 'consulta_externa', nombre: 'Consulta externa' },
  { valor: 'cirugia', nombre: 'Cirugía' },
  { valor: 'materno_infantil', nombre: 'Materno infantil / partos' },
  { valor: 'uci', nombre: 'Cuidado intermedio o intensivo' },
  { valor: 'apoyo_diagnostico', nombre: 'Laboratorio e imágenes' },
];
export const nombreServicio = (s: string) => SERVICIOS_HISTORIA.find((x) => x.valor === s)?.nombre ?? s;

/** Documentos de identidad de personas naturales (sin NIT) */
export const TIPOS_DOCUMENTO_PERSONA = TIPOS_DOCUMENTO.filter((t) => t.valor !== 'NIT');

export interface SolicitudHistoria {
  id: number;
  radicado: string;
  calidad: CalidadSolicitante;
  tipoDocumento: string;
  numeroDocumento: string;
  nombre: string;
  correo: string;
  telefono: string;
  direccion: string;
  pacienteTipoDoc: string;
  pacienteDocumento: string;
  pacienteNombre: string;
  parentesco: string;
  alcance: AlcanceHistoria;
  servicios: string[];
  fechaDesde: string | null;
  fechaHasta: string | null;
  observaciones: string;
  tipoEntrega: 'digital' | 'fisica';
  canal: 'web' | 'correo' | 'presencial';
  estado: EstadoHistoria;
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

export interface SolicitudHistoriaDetalle extends SolicitudHistoria {
  codigoConsulta: string;
  archivos: ArchivoSolicitud[];
  historial: MovimientoHistorial[];
}

/** Consulta pública de una copia de historia clínica */
export interface ConsultaHistoria extends ConsultaPublica {
  alcance: AlcanceHistoria;
  alcanceNombre: string;
  descargaHasta: string | null;
  descargaVencida: boolean;
}

/** Valida soportes (PDF o imagen) antes de enviarlos */
export function validarSoportes(archivos: File[]): string {
  if (archivos.length > MAX_ARCHIVOS) return `Puede adjuntar máximo ${MAX_ARCHIVOS} archivos.`;
  const permitidas = EXTENSIONES_SOPORTE.split(',');
  for (const f of archivos) {
    const ext = '.' + (f.name.split('.').pop() || '').toLowerCase();
    if (!permitidas.includes(ext)) return `El archivo "${f.name}" debe ser PDF, JPG o PNG.`;
    if (f.size > MAX_MB * 1024 * 1024) return `El archivo "${f.name}" supera ${MAX_MB} MB.`;
  }
  return '';
}
