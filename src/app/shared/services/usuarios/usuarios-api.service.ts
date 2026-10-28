import { HttpClient } from '@angular/common/http';
import { Injectable, inject, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { CMS_CONFIG } from '../cms/cms-config';
import { Modulo, Rol } from '../../models/permisos/permisos';

export interface UsuarioDashboard {
  id: number;
  nombre: string;
  correo: string;
  area: string;
  usuario: string;
  rol: Rol;
  modulos: Modulo[];
  activo: boolean;
  ultimoAcceso: string | null;
  creadoEn: string | null;
}

export interface DatosUsuario {
  nombre: string;
  correo: string;
  area: string;
  usuario: string;
  rol: Rol;
  modulos: Modulo[];
  activo: boolean;
  /** Obligatoria al crear; al editar, vacía = no cambia */
  clave?: string;
}

/** Usuarios del dashboard (API, solo administradores) */
@Injectable({ providedIn: 'root' })
export class UsuariosApiService {
  private http = inject(HttpClient);
  private config = inject(CMS_CONFIG);
  private get url() {
    return `${this.config.apiUrl}/usuarios`;
  }

  readonly disponible = this.config.modo === 'api';
  private readonly _usuarios = signal<UsuarioDashboard[]>([]);
  readonly usuarios = this._usuarios.asReadonly();
  readonly cargando = signal(false);

  async cargar(): Promise<void> {
    if (!this.disponible) return;
    this.cargando.set(true);
    try {
      this._usuarios.set(await firstValueFrom(this.http.get<UsuarioDashboard[]>(this.url)));
    } finally {
      this.cargando.set(false);
    }
  }

  async crear(datos: DatosUsuario): Promise<UsuarioDashboard> {
    const u = await firstValueFrom(this.http.post<UsuarioDashboard>(this.url, datos));
    this._usuarios.update((l) => [...l, u]);
    return u;
  }

  async actualizar(id: number, datos: DatosUsuario): Promise<UsuarioDashboard> {
    const u = await firstValueFrom(this.http.put<UsuarioDashboard>(`${this.url}/${id}`, datos));
    this._usuarios.update((l) => l.map((x) => (x.id === id ? u : x)));
    return u;
  }

  async eliminar(id: number): Promise<void> {
    await firstValueFrom(this.http.delete(`${this.url}/${id}`));
    this._usuarios.update((l) => l.filter((x) => x.id !== id));
  }
}
