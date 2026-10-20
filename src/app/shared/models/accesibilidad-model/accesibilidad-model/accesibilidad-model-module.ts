export interface AccesibilidadItem {
  id: number;
  titulo: string;
  descripcion?: string;
  tipo: 'enlace' | 'accion';
  url?: string;
  accion?: string;
  icono?: string;
  activo: boolean;

  // estilos configurables
  css: {
    backgroundColor: string;
    color: string;
    borderRadius: string;
  };
}
