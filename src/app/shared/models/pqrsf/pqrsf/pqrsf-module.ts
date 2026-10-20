export type TipoPQRSF = 'Petición' | 'Queja' | 'Reclamo' | 'Sugerencia' | 'Felicitación';

export type EstadoPQRSF = 'Recibida' | 'En proceso' | 'Respondida' | 'Cerrada';

export interface PQRSF {
  id: number;
  tipo: TipoPQRSF;
  nombre: string;
  correo: string;
  telefono?: string;
  asunto: string;
  mensaje: string;
  fechaCreacion: Date;

  // Admin
  archivos?: string[]; // rutas base64 o urls
  respuesta?: string;
  fechaRespuesta?: Date;
  estado: EstadoPQRSF;
}
