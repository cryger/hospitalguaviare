import { Component, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';
import { DatosUsuario, UsuarioDashboard, UsuariosApiService } from '../../../shared/services/usuarios/usuarios-api.service';
import { PermisosService } from '../../../shared/services/permisos/permisos.service';
import { mensajeError } from '../../../shared/services/solicitudes/solicitudes.service';
import { MODULOS, MODULOS_ASIGNABLES, Modulo, ROLES, Rol, nombreRol } from '../../../shared/models/permisos/permisos';

type Aviso = { tipo: 'ok' | 'error'; texto: string } | null;

const VACIO: DatosUsuario = { nombre: '', correo: '', area: '', usuario: '', rol: 'pqrsfd', modulos: [], activo: true, clave: '' };

@Component({
  selector: 'app-usuarios',
  imports: [FormsModule, DatePipe, BuscadorGovco],
  templateUrl: './usuarios.html',
  styleUrls: ['../cms/cms-admin.css', './usuarios.css'],
})
export class Usuarios {
  readonly svc = inject(UsuariosApiService);
  readonly permisos = inject(PermisosService);

  readonly roles = ROLES;
  readonly asignables = MODULOS_ASIGNABLES;
  readonly nombreRol = nombreRol;

  readonly aviso = signal<Aviso>(null);
  readonly busqueda = signal('');
  readonly filtroRol = signal<'' | Rol>('');
  readonly filtroEstado = signal<'' | 'activo' | 'inactivo'>('');

  readonly lista = computed(() => {
    const t = terminosDe(this.busqueda());
    return this.svc
      .usuarios()
      .filter((u) => !this.filtroRol() || u.rol === this.filtroRol())
      .filter((u) => !this.filtroEstado() || (this.filtroEstado() === 'activo') === u.activo)
      .filter((u) => coincide([u.nombre, u.usuario, u.correo, u.area].join(' '), t))
      .sort((a, b) => Number(b.activo) - Number(a.activo) || a.nombre.localeCompare(b.nombre, 'es'));
  });
  readonly hayFiltros = computed(() => !!(this.busqueda() || this.filtroRol() || this.filtroEstado()));

  readonly kpis = computed(() => {
    const u = this.svc.usuarios();
    const activos = u.filter((x) => x.activo);
    const contar = (r: Rol) => activos.filter((x) => x.rol === r).length;
    return { activos: activos.length, inactivos: u.length - activos.length, admins: contar('admin'), pqrsfd: contar('pqrsfd'), contratacion: contar('contratacion') };
  });

  /* ===== Modal ===== */
  readonly modal = signal(false);
  readonly editando = signal<UsuarioDashboard | null>(null);
  readonly guardando = signal(false);
  readonly errorForm = signal('');
  readonly verClave = signal(false);
  form: DatosUsuario = { ...VACIO };
  readonly rolForm = signal<Rol>('pqrsfd');
  readonly modulosForm = signal<Set<Modulo>>(new Set());

  /** Módulos que verá el usuario con el rol elegido */
  readonly modulosVista = computed<Set<Modulo>>(() => {
    const def = ROLES.find((r) => r.valor === this.rolForm());
    return def?.modulos ? new Set(def.modulos) : this.modulosForm();
  });

  /* ===== Confirmación ===== */
  readonly confirmar = signal<UsuarioDashboard | null>(null);

  constructor() {
    this.svc.cargar().catch((e) => this.aviso.set({ tipo: 'error', texto: mensajeError(e, 'No se pudieron cargar los usuarios.') }));
  }

  esYo(u: UsuarioDashboard): boolean {
    return u.id === this.permisos.usuario()?.id;
  }

  nombresModulos(u: UsuarioDashboard): string[] {
    if (u.rol === 'admin') return ['Todo el dashboard'];
    return MODULOS.filter((m) => u.modulos.includes(m.clave)).map((m) => m.nombre);
  }

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroRol.set('');
    this.filtroEstado.set('');
  }

  nuevo(): void {
    this.form = { ...VACIO, clave: generarClave() };
    this.rolForm.set(this.form.rol);
    this.modulosForm.set(new Set());
    this.editando.set(null);
    this.abrir();
  }

  editar(u: UsuarioDashboard): void {
    this.form = { nombre: u.nombre, correo: u.correo, area: u.area, usuario: u.usuario, rol: u.rol, modulos: [...u.modulos], activo: u.activo, clave: '' };
    this.rolForm.set(u.rol);
    this.modulosForm.set(new Set(u.rol === 'personalizado' ? u.modulos : []));
    this.editando.set(u);
    this.abrir();
  }

  private abrir(): void {
    this.errorForm.set('');
    this.verClave.set(!this.editando());
    this.modal.set(true);
    setTimeout(() => document.getElementById('u-nombre')?.focus());
  }

  cerrar(): void {
    this.modal.set(false);
  }

  cambiarRol(r: Rol): void {
    this.form.rol = r;
    this.rolForm.set(r);
  }

  alternarModulo(m: Modulo, marcado: boolean): void {
    const s = new Set(this.modulosForm());
    if (marcado) s.add(m);
    else s.delete(m);
    this.modulosForm.set(s);
  }

  nuevaClave(): void {
    this.form.clave = generarClave();
    this.verClave.set(true);
  }

  async guardar(): Promise<void> {
    this.errorForm.set('');
    const f = this.form;
    if (!f.nombre.trim() || !f.usuario.trim()) return this.errorForm.set('Escriba el nombre y el usuario.');
    if (!this.editando() && !f.clave) return this.errorForm.set('Escriba una contraseña inicial.');
    if (f.rol === 'personalizado' && !this.modulosForm().size) return this.errorForm.set('Marque al menos un módulo para el rol personalizado.');

    const datos: DatosUsuario = { ...f, usuario: f.usuario.trim().toLowerCase(), modulos: [...this.modulosForm()] };
    this.guardando.set(true);
    try {
      const e = this.editando();
      if (e) await this.svc.actualizar(e.id, datos);
      else await this.svc.crear(datos);
      this.modal.set(false);
      this.aviso.set({
        tipo: 'ok',
        texto: e
          ? `Se actualizó el usuario ${datos.nombre}.${datos.clave ? ' La nueva contraseña ya está activa.' : ''}`
          : `Se creó el usuario ${datos.usuario} con rol ${nombreRol(datos.rol)}. Entréguele la contraseña de forma segura y pídale cambiarla en «Mi cuenta» al ingresar.`,
      });
    } catch (err) {
      this.errorForm.set(mensajeError(err));
    } finally {
      this.guardando.set(false);
    }
  }

  async alternarActivo(u: UsuarioDashboard): Promise<void> {
    try {
      await this.svc.actualizar(u.id, { ...u, activo: !u.activo, clave: '' });
      this.aviso.set({ tipo: 'ok', texto: `${u.nombre} quedó ${u.activo ? 'desactivado: ya no puede iniciar sesión' : 'activo'}.` });
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e) });
    }
  }

  async eliminar(): Promise<void> {
    const u = this.confirmar();
    if (!u) return;
    try {
      await this.svc.eliminar(u.id);
      this.aviso.set({ tipo: 'ok', texto: `Se eliminó el usuario ${u.usuario}.` });
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e) });
    } finally {
      this.confirmar.set(null);
    }
  }
}

/** Contraseña aleatoria de 12 caracteres con letras y números */
function generarClave(): string {
  const abc = 'ABCDEFGHJKMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789';
  const n = new Uint32Array(12);
  crypto.getRandomValues(n);
  let c = [...n].map((x) => abc[x % abc.length]).join('');
  if (!/\d/.test(c)) c = c.slice(0, 11) + '7';
  if (!/[A-Za-z]/.test(c)) c = 'a' + c.slice(1);
  return c;
}
