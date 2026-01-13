export interface CategoriaServicio {
  id: number;
  nombre: string;
  parentId?: number | null;
  activo: boolean;
}

export interface Servicio {
  id: number;
  categoriaId: number;
  titulo: string;
  descripcion: string;
  ruta?: string;
  activo: boolean;
}
