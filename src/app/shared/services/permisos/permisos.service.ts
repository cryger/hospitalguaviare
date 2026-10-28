import { Injectable, computed, inject, signal } from '@angular/core';
import { CmsAuthService, UsuarioCms } from '../cms/cms-auth.service';
import { MODULOS, Modulo, TODOS_LOS_MODULOS, nombreRol } from '../../models/permisos/permisos';

/**
 * Permisos del usuario que inició sesión.
 * - Modo API: los módulos vienen de la API (rol del usuario) y se refrescan al abrir el dashboard.
 * - Modo local (demo sin API): el usuario de prueba es administrador.
 */
@Injectable({ providedIn: 'root' })
export class PermisosService {
  private auth = inject(CmsAuthService);

  private readonly _usuario = signal<UsuarioCms | null>(this.leer());

  readonly usuario = this._usuario.asReadonly();
  readonly modulos = computed(() => new Set<Modulo>(this._usuario()?.modulos ?? []));
  readonly esAdmin = computed(() => this._usuario()?.rol === 'admin');
  readonly nombreRol = computed(() => nombreRol(this._usuario()?.rol ?? ''));

  /** Enlaces del menú lateral que este usuario puede ver, agrupados */
  readonly menu = computed(() => {
    const grupos: { grupo: string; enlaces: (typeof MODULOS)[number]['enlaces'] }[] = [];
    for (const m of MODULOS) {
      if (!this.modulos().has(m.clave)) continue;
      let g = grupos.find((x) => x.grupo === m.grupo);
      if (!g) grupos.push((g = { grupo: m.grupo, enlaces: [] }));
      g.enlaces.push(...m.enlaces);
    }
    // Quien no administra la configuración igual puede cambiar su contraseña
    if (this._usuario() && !this.modulos().has('configuracion')) {
      grupos.push({ grupo: 'Mi cuenta', enlaces: [{ ruta: '/admin/mi-cuenta', texto: 'Mi cuenta', icono: '🔑' }] });
    }
    return grupos;
  });

  private leer(): UsuarioCms | null {
    if (!this.auth.usaApi) {
      let nombre = 'Administrador';
      try {
        nombre = localStorage.getItem('username') || nombre;
      } catch {
        /* sin almacenamiento */
      }
      return { id: 0, nombre, usuario: 'admin', rol: 'admin', modulos: [...TODOS_LOS_MODULOS] };
    }
    const u = this.auth.usuario;
    if (!u) return null;
    // Sesiones iniciadas antes de los permisos por módulo: se asumen los del rol
    if (!Array.isArray(u.modulos)) u.modulos = u.rol === 'admin' ? [...TODOS_LOS_MODULOS] : [];
    return u;
  }

  /** Vuelve a leer la sesión guardada (después de iniciar o cerrar sesión) */
  recargar(): void {
    this._usuario.set(this.leer());
  }

  /** Pide a la API el rol y los módulos actuales (si el administrador los cambió) */
  async refrescar(): Promise<void> {
    if (!this.auth.usaApi || !this.auth.sesionValida()) return;
    try {
      await this.auth.perfil();
      this.recargar();
    } catch {
      /* sin conexión: se conservan los permisos guardados */
    }
  }

  puede(modulo: Modulo): boolean {
    return this.modulos().has(modulo);
  }

  /** Primera página del dashboard que el usuario puede abrir */
  rutaInicio(): string {
    for (const m of MODULOS) if (this.puede(m.clave)) return m.enlaces[0].ruta;
    return '/login';
  }
}
