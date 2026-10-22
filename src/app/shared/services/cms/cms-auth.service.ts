import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { firstValueFrom } from 'rxjs';
import { CMS_CONFIG } from './cms-config';

export interface UsuarioCms {
  id: number;
  nombre: string;
  usuario: string;
  rol: 'admin' | 'editor';
}

export interface PerfilCms extends UsuarioCms {
  ultimoAcceso: string | null;
  creadoEn: string | null;
  sesionVence: string | null;
}

const CLAVE_TOKEN = 'cms-token';
const CLAVE_USUARIO = 'cms-usuario';

/** Sesión contra la API del CMS (JWT) */
@Injectable({ providedIn: 'root' })
export class CmsAuthService {
  private http = inject(HttpClient);
  private config = inject(CMS_CONFIG);

  get usaApi(): boolean {
    return this.config.modo === 'api';
  }

  get token(): string | null {
    try {
      return localStorage.getItem(CLAVE_TOKEN);
    } catch {
      return null;
    }
  }

  get usuario(): UsuarioCms | null {
    try {
      return JSON.parse(localStorage.getItem(CLAVE_USUARIO) || 'null');
    } catch {
      return null;
    }
  }

  /** true si hay token y no ha vencido */
  sesionValida(): boolean {
    const t = this.token;
    if (!t) return false;
    try {
      const payload = JSON.parse(atob(t.split('.')[1].replace(/-/g, '+').replace(/_/g, '/')));
      return !payload.exp || payload.exp * 1000 > Date.now();
    } catch {
      return false;
    }
  }

  async login(usuario: string, clave: string): Promise<UsuarioCms> {
    const r = await firstValueFrom(
      this.http.post<{ token: string; usuario: UsuarioCms }>(`${this.config.apiUrl}/auth/login`, { usuario, clave }),
    );
    localStorage.setItem(CLAVE_TOKEN, r.token);
    localStorage.setItem(CLAVE_USUARIO, JSON.stringify(r.usuario));
    // Compatibilidad con el guard y la topbar existentes
    localStorage.setItem('auth', 'true');
    localStorage.setItem('username', r.usuario.nombre);
    return r.usuario;
  }

  /** Datos del usuario que inició sesión (desde la base de datos) */
  async perfil(): Promise<PerfilCms> {
    const r = await firstValueFrom(this.http.get<{ usuario: PerfilCms }>(`${this.config.apiUrl}/auth/yo`));
    return r.usuario;
  }

  /** Cambia la contraseña del usuario actual */
  async cambiarClave(actual: string, nueva: string): Promise<void> {
    await firstValueFrom(this.http.put(`${this.config.apiUrl}/auth/clave`, { actual, nueva }));
  }

  logout(): void {
    [CLAVE_TOKEN, CLAVE_USUARIO, 'auth', 'username'].forEach((k) => localStorage.removeItem(k));
  }
}
