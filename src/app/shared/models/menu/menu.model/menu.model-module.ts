export interface MenuItem {
  id: number;
  label: string;
  route: string;
  parentId?: number | null;
  orden: number;
  activo: boolean;
}
