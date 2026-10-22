import { Component, OnInit, VERSION, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { CmsAuthService, PerfilCms } from '../../../shared/services/cms/cms-auth.service';
import {
  ConfiguracionService,
  EstadoSistema,
  mensajeError,
} from '../../../shared/services/configuracion/configuracion.service';
import { IdleService } from '../../../shared/services/idle-service/idle-service';
import {
  DatosEntidad,
  ENTIDAD_PREDETERMINADA,
  REDES_SOCIALES,
  RedSocial,
} from '../../../shared/models/configuracion/configuracion';

type Pestana = 'entidad' | 'cuenta' | 'sesion' | 'sistema';
interface Aviso {
  tipo: 'ok' | 'error';
  texto: string;
}

const clonar = <T>(v: T): T => JSON.parse(JSON.stringify(v));

@Component({
  selector: 'app-configuracion',
  imports: [FormsModule, DatePipe],
  templateUrl: './configuracion.html',
  styleUrl: './configuracion.css',
})
export class Configuracion implements OnInit {
  private readonly auth = inject(CmsAuthService);
  private readonly idle = inject(IdleService);
  private readonly router = inject(Router);
  readonly config = inject(ConfiguracionService);

  readonly pestanas: { id: Pestana; titulo: string; icono: string }[] = [
    { id: 'entidad', titulo: 'Datos de la entidad', icono: '🏥' },
    { id: 'cuenta', titulo: 'Mi cuenta', icono: '👤' },
    { id: 'sesion', titulo: 'Sesión y seguridad', icono: '🔒' },
    { id: 'sistema', titulo: 'Estado del sistema', icono: '🖥️' },
  ];
  readonly pestana = signal<Pestana>('entidad');
  /** true cuando ya se cargó la configuración (también fuerza el repintado en modo zoneless) */
  readonly listo = signal(false);
  readonly redes = REDES_SOCIALES;
  readonly usaApi = this.config.usaApi;
  readonly esAdmin = !this.usaApi || this.auth.usuario?.rol === 'admin';

  /* ===== Datos de la entidad ===== */
  borrador: DatosEntidad = clonar(ENTIDAD_PREDETERMINADA);
  private original = JSON.stringify(this.borrador);
  readonly guardandoEntidad = signal(false);
  readonly avisoEntidad = signal<Aviso | null>(null);

  /* ===== Mi cuenta ===== */
  readonly perfil = signal<PerfilCms | null>(null);
  readonly errorPerfil = signal('');
  clave = { actual: '', nueva: '', confirmar: '' };
  readonly verClaves = signal(false);
  readonly guardandoClave = signal(false);
  readonly avisoClave = signal<Aviso | null>(null);

  /* ===== Sesión ===== */
  readonly opcionesMinutos = [5, 10, 15, 20, 30, 45, 60, 90, 120];
  minutos = 15;
  readonly guardandoSesion = signal(false);
  readonly avisoSesion = signal<Aviso | null>(null);

  /* ===== Sistema ===== */
  readonly estado = signal<EstadoSistema | null>(null);
  readonly ping = signal<{ ok: boolean; ms: number } | null>(null);
  readonly errorEstado = signal('');
  readonly cargandoEstado = signal(false);
  readonly versionAngular = VERSION.full;
  readonly usuarioNombre = computed(() => this.perfil()?.nombre ?? this.auth.usuario?.nombre ?? localStorage.getItem('username') ?? '');

  async ngOnInit(): Promise<void> {
    await this.config.cargar(true);
    this.reiniciarEntidad();
    this.minutos = this.config.sesion().minutosInactividad;
    this.listo.set(true);
    if (this.usaApi) this.cargarPerfil();
  }

  cambiarPestana(p: Pestana): void {
    this.pestana.set(p);
    if (p === 'sistema' && !this.estado() && !this.cargandoEstado()) this.cargarEstado();
  }

  /* =========================================================
     DATOS DE LA ENTIDAD
  ========================================================= */
  get hayCambios(): boolean {
    return JSON.stringify(this.borrador) !== this.original;
  }

  reiniciarEntidad(): void {
    this.borrador = clonar(this.config.entidad());
    this.original = JSON.stringify(this.borrador);
    this.avisoEntidad.set(null);
  }

  agregarHorario(): void {
    this.borrador.horario.push('');
  }
  quitarHorario(i: number): void {
    this.borrador.horario.splice(i, 1);
  }
  agregarTelefono(): void {
    this.borrador.telefonos.push({ etiqueta: '', numero: '' });
  }
  quitarTelefono(i: number): void {
    this.borrador.telefonos.splice(i, 1);
  }
  agregarRed(): void {
    const usada = new Set(this.borrador.redes.map((r) => r.red));
    const libre = this.redes.find((r) => !usada.has(r.valor))?.valor ?? 'facebook';
    this.borrador.redes.push({ red: libre as RedSocial, usuario: '', url: 'https://' });
  }
  quitarRed(i: number): void {
    this.borrador.redes.splice(i, 1);
  }
  mover<T>(lista: T[], i: number, paso: -1 | 1): void {
    const j = i + paso;
    if (j < 0 || j >= lista.length) return;
    [lista[i], lista[j]] = [lista[j], lista[i]];
  }

  /** Requisitos del pie de página para el ITA (Res. 1519 de 2020, Anexo 2) */
  requisitosIta(): { texto: string; ok: boolean }[] {
    const e = this.borrador;
    const correo = (c: string) => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(c || '');
    return [
      { texto: 'Nombre de la entidad', ok: !!e.nombre.trim() },
      { texto: 'Dirección con municipio y departamento', ok: !!e.direccion.trim() && !!e.ciudad.trim() },
      { texto: 'Código postal', ok: !!e.codigoPostal.trim() },
      { texto: 'Horario y días de atención', ok: e.horario.some((h) => h.trim()) },
      { texto: 'Teléfono conmutador', ok: e.telefonos.some((t) => t.numero.trim()) },
      { texto: 'Línea anticorrupción / denuncias', ok: !!e.lineaAnticorrupcion.trim() },
      { texto: 'Correo institucional', ok: correo(e.correoInstitucional) },
      { texto: 'Correo de notificaciones judiciales', ok: correo(e.correoJudicial) },
      { texto: 'Redes sociales', ok: e.redes.some((r) => /^https:\/\/.+\..+/.test(r.url)) },
    ];
  }

  cumplidos(): number {
    return this.requisitosIta().filter((r) => r.ok).length;
  }

  private validarEntidad(): string | null {
    const e = this.borrador;
    if (!e.nombre.trim()) return 'Escriba el nombre de la entidad.';
    if (!e.direccion.trim() || !e.ciudad.trim()) return 'Complete la dirección, el municipio y el departamento.';
    if (!e.codigoPostal.trim()) return 'Escriba el código postal.';
    const correo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!correo.test(e.correoInstitucional.trim())) return 'El correo institucional no es válido.';
    if (!correo.test(e.correoJudicial.trim())) return 'El correo de notificaciones judiciales no es válido.';
    const red = e.redes.find((r) => r.url.trim() && r.url.trim() !== 'https://' && !/^https:\/\/.+\..+/.test(r.url.trim()));
    if (red) return 'Los enlaces de redes sociales deben empezar por https:// (ej. https://www.facebook.com/…).';
    return null;
  }

  async guardarEntidad(): Promise<void> {
    const error = this.validarEntidad();
    if (error) {
      this.avisoEntidad.set({ tipo: 'error', texto: error });
      return;
    }
    const e = this.borrador;
    const limpio: DatosEntidad = {
      ...e,
      nombre: e.nombre.trim(),
      lema: e.lema.trim(),
      direccion: e.direccion.trim(),
      ciudad: e.ciudad.trim(),
      codigoPostal: e.codigoPostal.trim(),
      horario: e.horario.map((h) => h.trim()).filter(Boolean),
      telefonos: e.telefonos
        .map((t) => ({ etiqueta: t.etiqueta.trim(), numero: t.numero.trim() }))
        .filter((t) => t.numero),
      lineaAnticorrupcion: e.lineaAnticorrupcion.trim(),
      correoInstitucional: e.correoInstitucional.trim(),
      correoJudicial: e.correoJudicial.trim(),
      redes: e.redes
        .map((r) => ({ red: r.red, usuario: r.usuario.trim(), url: r.url.trim() }))
        .filter((r) => r.url && r.url !== 'https://'),
    };
    this.guardandoEntidad.set(true);
    this.avisoEntidad.set(null);
    try {
      await this.config.guardarEntidad(limpio);
      this.reiniciarEntidad();
      this.avisoEntidad.set({ tipo: 'ok', texto: 'Datos guardados. El pie de página del portal ya muestra la nueva información.' });
    } catch (err) {
      this.avisoEntidad.set({ tipo: 'error', texto: mensajeError(err) });
    } finally {
      this.guardandoEntidad.set(false);
    }
  }

  /* =========================================================
     MI CUENTA
  ========================================================= */
  async cargarPerfil(): Promise<void> {
    this.errorPerfil.set('');
    try {
      this.perfil.set(await this.auth.perfil());
    } catch (e) {
      this.errorPerfil.set(mensajeError(e));
    }
  }

  requisitosClave(): { texto: string; ok: boolean }[] {
    const n = this.clave.nueva;
    return [
      { texto: 'Mínimo 8 caracteres', ok: n.length >= 8 },
      { texto: 'Incluye letras', ok: /[A-Za-z]/.test(n) },
      { texto: 'Incluye números', ok: /\d/.test(n) },
      { texto: 'Las dos contraseñas coinciden', ok: !!n && n === this.clave.confirmar },
      { texto: 'Es diferente a la actual', ok: !!n && n !== this.clave.actual },
    ];
  }

  get claveValida(): boolean {
    return !!this.clave.actual && this.requisitosClave().every((r) => r.ok);
  }

  async cambiarClave(): Promise<void> {
    if (!this.claveValida) return;
    this.guardandoClave.set(true);
    this.avisoClave.set(null);
    try {
      await this.auth.cambiarClave(this.clave.actual, this.clave.nueva);
      this.clave = { actual: '', nueva: '', confirmar: '' };
      this.avisoClave.set({ tipo: 'ok', texto: 'Contraseña actualizada. Úsela la próxima vez que inicie sesión.' });
    } catch (e) {
      this.avisoClave.set({ tipo: 'error', texto: mensajeError(e) });
    } finally {
      this.guardandoClave.set(false);
    }
  }

  /* =========================================================
     SESIÓN Y SEGURIDAD
  ========================================================= */
  async guardarSesion(): Promise<void> {
    this.guardandoSesion.set(true);
    this.avisoSesion.set(null);
    try {
      await this.config.guardarSesion({ minutosInactividad: Number(this.minutos) });
      this.idle.resetTimer();
      this.avisoSesion.set({ tipo: 'ok', texto: `Listo. La sesión se cerrará tras ${this.minutos} minutos sin actividad.` });
    } catch (e) {
      this.avisoSesion.set({ tipo: 'error', texto: mensajeError(e) });
    } finally {
      this.guardandoSesion.set(false);
    }
  }

  cerrarSesion(): void {
    this.idle.stopWatching();
    this.auth.logout();
    localStorage.removeItem('sidebar-collapsed');
    this.router.navigate(['/login']);
  }

  /* =========================================================
     ESTADO DEL SISTEMA
  ========================================================= */
  async cargarEstado(): Promise<void> {
    this.cargandoEstado.set(true);
    this.errorEstado.set('');
    try {
      if (this.usaApi) {
        this.ping.set(await this.config.probarApi());
        this.estado.set(await this.config.estadoSistema());
      }
    } catch (e) {
      this.errorEstado.set(mensajeError(e));
    } finally {
      this.cargandoEstado.set(false);
    }
  }

  tiempoActiva(desde: string): string {
    const min = Math.floor((Date.now() - new Date(desde).getTime()) / 60000);
    if (min < 60) return `${min} min`;
    const h = Math.floor(min / 60);
    if (h < 48) return `${h} h ${min % 60} min`;
    return `${Math.floor(h / 24)} días`;
  }
}
