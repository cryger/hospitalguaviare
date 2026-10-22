import { inject, Injectable, signal } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { firstValueFrom } from 'rxjs';
import { CMS_CONFIG } from '../cms/cms-config';
import {
  ConfigSesion,
  DatosEntidad,
  ENTIDAD_PREDETERMINADA,
  SESION_PREDETERMINADA,
} from '../../models/configuracion/configuracion';

export interface EstadoSistema {
  api: { version: string; node: string; entorno: string; activaDesde: string; horaServidor: string };
  baseDatos: { ok: boolean; nombre: string; version: string; latenciaMs: number };
  migraciones: { aplicadas: { nombre: string; aplicada_en: string }[]; pendientes: string[] };
  conteos: { paginas: number; entradas: number; multimedia: number; usuarios: number };
}

export interface InfoActualizacion {
  por: string | null;
  en: string | null;
}

const CLAVE_LOCAL = 'cms-configuracion';

/**
 * Configuración del portal.
 * Modo API: se guarda en la tabla cms_configuracion.
 * Modo local: se guarda en el navegador (solo para pruebas).
 */
@Injectable({ providedIn: 'root' })
export class ConfiguracionService {
  private readonly http = inject(HttpClient);
  private readonly config = inject(CMS_CONFIG);

  readonly entidad = signal<DatosEntidad>(ENTIDAD_PREDETERMINADA);
  readonly sesion = signal<ConfigSesion>(SESION_PREDETERMINADA);
  readonly actualizacion = signal<Record<string, InfoActualizacion>>({});
  readonly cargada = signal(false);

  private pendiente: Promise<void> | null = null;

  get usaApi(): boolean {
    return this.config.modo === 'api';
  }

  get apiUrl(): string {
    return this.config.apiUrl;
  }

  /** Carga una sola vez (o de nuevo con forzar = true) */
  cargar(forzar = false): Promise<void> {
    if (this.pendiente && !forzar) return this.pendiente;
    this.pendiente = this.leer().finally(() => this.cargada.set(true));
    return this.pendiente;
  }

  async guardarEntidad(datos: DatosEntidad): Promise<void> {
    const guardado = await this.escribir<DatosEntidad>('entidad', datos);
    this.entidad.set({ ...ENTIDAD_PREDETERMINADA, ...guardado });
  }

  async guardarSesion(datos: ConfigSesion): Promise<void> {
    const guardado = await this.escribir<ConfigSesion>('sesion', datos);
    this.sesion.set({ ...SESION_PREDETERMINADA, ...guardado });
  }

  async estadoSistema(): Promise<EstadoSistema> {
    return firstValueFrom(this.http.get<EstadoSistema>(`${this.config.apiUrl}/sistema/estado`));
  }

  /** Verifica que la API responda (para el modo API) */
  async probarApi(): Promise<{ ok: boolean; ms: number }> {
    const t0 = performance.now();
    try {
      await firstValueFrom(this.http.get(`${this.config.apiUrl}/salud`));
      return { ok: true, ms: Math.round(performance.now() - t0) };
    } catch {
      return { ok: false, ms: Math.round(performance.now() - t0) };
    }
  }

  /* ===== Interno ===== */
  private async leer(): Promise<void> {
    try {
      const datos = this.usaApi
        ? await firstValueFrom(
            this.http.get<{ entidad?: DatosEntidad; sesion?: ConfigSesion; actualizacion?: Record<string, InfoActualizacion> }>(
              `${this.config.apiUrl}/configuracion`,
            ),
          )
        : this.leerLocal();
      if (datos.entidad) this.entidad.set({ ...ENTIDAD_PREDETERMINADA, ...datos.entidad });
      if (datos.sesion) this.sesion.set({ ...SESION_PREDETERMINADA, ...datos.sesion });
      if (datos.actualizacion) this.actualizacion.set(datos.actualizacion);
    } catch {
      /* Sin conexión o sin migración 009: se usan los valores predeterminados */
    }
  }

  private async escribir<T>(clave: 'entidad' | 'sesion', valor: T): Promise<T> {
    if (this.usaApi) {
      try {
        const r = await firstValueFrom(this.http.put<T>(`${this.config.apiUrl}/configuracion/${clave}`, valor));
        this.actualizacion.update((a) => ({ ...a, [clave]: { por: null, en: new Date().toISOString() } }));
        return r;
      } catch (e) {
        throw new Error(mensajeError(e));
      }
    }
    const local = this.leerLocal();
    const nuevo = { ...local, [clave]: valor, actualizacion: { ...local.actualizacion, [clave]: { por: 'Este navegador', en: new Date().toISOString() } } };
    try {
      localStorage.setItem(CLAVE_LOCAL, JSON.stringify(nuevo));
    } catch {
      throw new Error('No se pudo guardar en este navegador.');
    }
    this.actualizacion.set(nuevo.actualizacion);
    return valor;
  }

  private leerLocal(): { entidad?: DatosEntidad; sesion?: ConfigSesion; actualizacion?: Record<string, InfoActualizacion> } {
    try {
      return JSON.parse(localStorage.getItem(CLAVE_LOCAL) || '{}');
    } catch {
      return {};
    }
  }
}

export function mensajeError(e: unknown): string {
  if (e instanceof HttpErrorResponse) {
    if (e.status === 0) return 'No hay conexión con la API. Verifique que esté en funcionamiento.';
    return e.error?.mensaje || `Error ${e.status} al comunicarse con la API.`;
  }
  return e instanceof Error ? e.message : 'Ocurrió un error inesperado.';
}
