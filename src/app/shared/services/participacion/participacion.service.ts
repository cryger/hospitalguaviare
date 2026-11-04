import { HttpClient } from '@angular/common/http';
import { Injectable, computed, inject, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { CMS_CONFIG } from '../cms/cms-config';
import { mensajeError } from '../solicitudes/solicitudes.service';
import {
  AporteAdmin,
  AporteEstado,
  AporteRadicado,
  ConsultaAdmin,
  ConsultaConAportes,
  ConsultaDetalle,
  ConsultaResumen,
} from '../../models/participacion/participacion';

export { mensajeError };

/**
 * Consultas ciudadanas en línea. La parte pública (ver consultas y enviar
 * aportes) y la gestión en el dashboard usan la API. Los aportes guardan
 * datos personales, por eso no funcionan en modo local (demo sin API).
 */
@Injectable({ providedIn: 'root' })
export class ParticipacionService {
  private http = inject(HttpClient);
  private config = inject(CMS_CONFIG);

  readonly disponible = this.config.modo === 'api';
  private get url(): string {
    return `${this.config.apiUrl}/participacion`;
  }

  /* ===== Público ===== */

  consultasPublicas(): Promise<ConsultaResumen[]> {
    return firstValueFrom(this.http.get<ConsultaResumen[]>(`${this.url}/consultas`));
  }

  consultaPublica(slug: string): Promise<ConsultaDetalle> {
    return firstValueFrom(this.http.get<ConsultaDetalle>(`${this.url}/consultas/${encodeURIComponent(slug)}`));
  }

  enviarAporte(consultaId: number, datos: Record<string, unknown>): Promise<AporteRadicado> {
    return firstValueFrom(this.http.post<AporteRadicado>(`${this.url}/consultas/${consultaId}/aportes`, datos));
  }

  estadoAporte(datos: Record<string, string>): Promise<AporteEstado> {
    return firstValueFrom(this.http.post<AporteEstado>(`${this.url}/aportes/consulta`, datos));
  }

  /* ===== Dashboard ===== */

  private readonly _consultas = signal<ConsultaAdmin[]>([]);
  readonly consultas = this._consultas.asReadonly();
  readonly cargando = signal(false);
  readonly error = signal('');
  readonly cargada = signal(false);
  readonly total = computed(() => this._consultas().length);

  async cargar(forzar = false): Promise<void> {
    if (!this.disponible || (this.cargada() && !forzar) || this.cargando()) return;
    this.cargando.set(true);
    this.error.set('');
    try {
      this._consultas.set(await firstValueFrom(this.http.get<ConsultaAdmin[]>(`${this.url}/admin/consultas`)));
      this.cargada.set(true);
    } catch (e) {
      this.error.set(mensajeError(e, 'No se pudieron cargar las consultas.'));
    } finally {
      this.cargando.set(false);
    }
  }

  detalle(id: number): Promise<ConsultaConAportes> {
    return firstValueFrom(this.http.get<ConsultaConAportes>(`${this.url}/admin/consultas/${id}`));
  }

  async crear(datos: Record<string, unknown>): Promise<ConsultaAdmin> {
    const c = await firstValueFrom(this.http.post<ConsultaAdmin>(`${this.url}/admin/consultas`, datos));
    await this.cargar(true);
    return c;
  }

  async actualizarConsulta(id: number, cambios: Record<string, unknown>): Promise<ConsultaConAportes> {
    const c = await firstValueFrom(this.http.put<ConsultaConAportes>(`${this.url}/admin/consultas/${id}`, cambios));
    await this.cargar(true);
    return c;
  }

  actualizarAporte(id: number, cambios: Record<string, unknown>): Promise<AporteAdmin> {
    return firstValueFrom(this.http.put<AporteAdmin>(`${this.url}/admin/aportes/${id}`, cambios));
  }
}
