import { Injectable } from '@angular/core';
import { Usuario } from '../../models/usuarios/usuarios-module';

@Injectable({
  providedIn: 'root',
})
export class UsuariosService {

  private storageKey = 'usuarios-data';
  private usuarios: Usuario[] = [];

  constructor(){
    const saved = localStorage.getItem(this.storageKey);
    this.usuarios = saved ? JSON.parse(saved): [
      {
        id: 1,
        nombre : 'Administrador',
        usuario: 'admin',
        password: 'admin123',
        rol: 'admin',
        activo : true
      }
    ];
    this.save();
  }

  private save():void{
    localStorage.setItem(this.storageKey, JSON.stringify(this.usuarios));

  }

  getAll():Usuario[]{
    return [...this.usuarios];

  }

  crear(data: Omit<Usuario, 'id'>): void {
    this.usuarios.push({
      id: Date.now(),
      ...data
    });
    this.save();
  }

  actualizar(id: number, data: Partial<Usuario>): void {
    const u = this.usuarios.find(x => x.id === id);
    if (!u) return;
    Object.assign(u, data);
    this.save();
  }

  eliminar(id: number): void {
    this.usuarios = this.usuarios.filter(u => u.id !== id);
    this.save();
  }

}
