export interface Cotizacion {
  id: number;
  titulo: string;
  descripcion: string;
  fechaPublicacion: Date;
  archivoNombre: string;
  archivoTipo: string;   // pdf, docx, xlsx, etc
  archivoUrl: string;    // local hoy / API mañana
  estado: 'publicada' | 'borrador';
}
