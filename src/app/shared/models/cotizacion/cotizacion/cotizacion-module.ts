export type EstadoCotizacion = 'publicada' | 'borrador' | 'cerrada';

/** Invitación a cotizar (tabla cms_cotizaciones) */
export interface Cotizacion {
  id: number;
  titulo: string;
  descripcion: string;
  dependencia?: string;
  documentoUrl?: string;     // PDF de la invitación
  documentoNombre?: string;
  fechaPublicacion: string | Date;
  fechaCierre?: string | null; // fecha límite para recibir cotizaciones
  estado: EstadoCotizacion;
  migradoDe?: string;
}
