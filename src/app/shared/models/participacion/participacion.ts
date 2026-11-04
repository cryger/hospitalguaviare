/* =====================================================================
   Consultas ciudadanas en línea (participación ciudadana)
   Mismos campos que la API (api/src/participacion.js)
===================================================================== */

export type EstadoConsulta = 'borrador' | 'abierta' | 'cerrada' | 'con_resultados' | 'archivada';
export type EstadoAporte = 'recibido' | 'en_analisis' | 'incorporado' | 'no_incorporado';
export type Postura = 'a_favor' | 'en_contra' | 'neutral' | 'propuesta';

export const ESTADOS_CONSULTA: { valor: EstadoConsulta; nombre: string }[] = [
  { valor: 'borrador', nombre: 'Borrador' },
  { valor: 'abierta', nombre: 'Abierta' },
  { valor: 'cerrada', nombre: 'Cerrada' },
  { valor: 'con_resultados', nombre: 'Con resultados' },
  { valor: 'archivada', nombre: 'Archivada' },
];
export const nombreEstadoConsulta = (e: string) => ESTADOS_CONSULTA.find((x) => x.valor === e)?.nombre ?? e;

export const ESTADOS_APORTE: { valor: EstadoAporte; nombre: string }[] = [
  { valor: 'recibido', nombre: 'Recibido' },
  { valor: 'en_analisis', nombre: 'En análisis' },
  { valor: 'incorporado', nombre: 'Incorporado' },
  { valor: 'no_incorporado', nombre: 'No incorporado' },
];
export const nombreEstadoAporte = (e: string) => ESTADOS_APORTE.find((x) => x.valor === e)?.nombre ?? e;

export const POSTURAS: { valor: Postura; nombre: string }[] = [
  { valor: 'a_favor', nombre: 'A favor' },
  { valor: 'en_contra', nombre: 'En contra' },
  { valor: 'neutral', nombre: 'Neutral / comentario' },
  { valor: 'propuesta', nombre: 'Propuesta de mejora' },
];
export const nombrePostura = (p: string) => POSTURAS.find((x) => x.valor === p)?.nombre ?? p;

export const TIPOS_DOCUMENTO_APORTE = [
  { valor: 'CC', nombre: 'Cédula de ciudadanía' },
  { valor: 'CE', nombre: 'Cédula de extranjería' },
  { valor: 'TI', nombre: 'Tarjeta de identidad' },
  { valor: 'PA', nombre: 'Pasaporte' },
  { valor: 'PPT', nombre: 'Permiso por protección temporal' },
  { valor: 'NIT', nombre: 'NIT' },
  { valor: 'OTRO', nombre: 'Otro' },
];

/** Resumen de una consulta (listado público) */
export interface ConsultaResumen {
  titulo: string;
  slug: string;
  resumen: string;
  categoria: string;
  fechaInicio: string;
  fechaFin: string;
  estado: EstadoConsulta;
  estadoNombre: string;
  abierta: boolean;
  tieneResultados: boolean;
  aportes: number;
}

/** Aporte público mostrado en el detalle de una consulta (sin datos personales) */
export interface AportePublico {
  postura: string;
  aporte: string;
  organizacion: string;
  estado: EstadoAporte;
  estadoNombre: string;
  respuesta: string;
  fecha: string;
}

/** Detalle público de una consulta */
export interface ConsultaDetalle extends Omit<ConsultaResumen, 'aportes'> {
  id: number;
  descripcion: string;
  documentoUrl: string;
  documentoNombre: string;
  resultado: string;
  fechaResultado: string | null;
  aportes: number | AportePublico[];
  aportesPublicos?: AportePublico[];
}

/** Lo que devuelve la API al enviar un aporte */
export interface AporteRadicado {
  id: number;
  radicado: string;
  consulta: string;
  fechaRadicacion: string;
}

/** Consulta pública del estado de un aporte */
export interface AporteEstado {
  radicado: string;
  consulta: string;
  consultaSlug: string;
  estado: EstadoAporte;
  estadoNombre: string;
  fechaRadicacion: string;
  respuesta: string;
}

/* ===== Dashboard ===== */

export interface ConsultaAdmin {
  id: number;
  titulo: string;
  slug: string;
  resumen: string;
  descripcion: string;
  categoria: string;
  documentoUrl: string;
  documentoNombre: string;
  fechaInicio: string;
  fechaFin: string;
  estado: EstadoConsulta;
  estadoNombre: string;
  abierta: boolean;
  resultado: string;
  fechaResultado: string | null;
  creadoPor: string;
  nAportes: number;
  nPendientes: number;
  creadoEn?: string;
  actualizadoEn?: string;
}

export interface AporteAdmin {
  id: number;
  radicado: string;
  tipoPersona: 'natural' | 'juridica';
  tipoDocumento: string;
  numeroDocumento: string;
  nombre: string;
  organizacion: string;
  correo: string;
  telefono: string;
  postura: string;
  aporte: string;
  publicar: boolean;
  estado: EstadoAporte;
  estadoNombre: string;
  respuesta: string;
  fechaRespuesta: string | null;
  respondidoPor: string;
  fechaRadicacion: string;
}

export interface ConsultaConAportes extends ConsultaAdmin {
  listaAportes: AporteAdmin[];
}

/** Días que faltan para el cierre (negativo si ya pasó) */
export function diasParaCierre(fechaFin: string): number {
  const ms = new Date(fechaFin).getTime() - Date.now();
  return Math.ceil(ms / 86_400_000);
}
