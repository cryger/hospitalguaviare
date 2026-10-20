export interface CategoriaTransparencia {
  id: number;
  nombre: string;
  parentId?: number | null;
  activo: boolean;
}

export interface TransparenciaPublicaciones {
  id: number;
  categoriaId: number;
  titulo: string;
  descripcion: string;
  ruta?: string;
  activo: boolean;
}
