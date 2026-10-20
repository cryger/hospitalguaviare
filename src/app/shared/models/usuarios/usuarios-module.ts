export interface Usuario {
  id: number;
  nombre: string;
  usuario: string;
  password: string;
  rol: 'admin' | 'funcionario';
  activo: boolean;
}
