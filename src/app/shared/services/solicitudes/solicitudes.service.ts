import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Injectable, computed, inject, signal } from '@angular/core';
import { firstValueFrom } from 'rxjs';
import { CMS_CONFIG } from '../cms/cms-config';
import {
  ConsultaPublica,
  Pqrsfd,
  PqrsfdDetalle,
  Radicacion,
  Responsable,
  SolicitudContractual,
  SolicitudContractualDetalle,
} from '../../models/solicitudes/solicitudes';

/** Mensaje legible de un error de la API */
export function mensajeError(e: unknown, porDefecto = 'No se pudo completar la operación. Intente de nuevo.'): string {
  const err = e as HttpErrorResponse;
  if (err?.status === 0) return 'No hay conexión con el servidor. Revise su conexión a internet e intente de nuevo.';
  const m = err?.error?.mensaje;
  return typeof m === 'string' && m ? m : porDefecto;
}

/**
 * Base común de PQRSFD y solicitudes contractuales: radicación y consulta
 * pública + gestión en el dashboard. Requiere la API (no funciona en modo local,
 * porque los datos personales no deben quedar guardados en el navegador).
 */
abstract class ServicioSolicitudes<L extends { id: number }, D extends L> {
  protected http = inject(HttpClient);
  private config = inject(CMS_CONFIG);
  protected abstract readonly recurso: 'pqrsfd' | 'contratacion';

  /** false en modo local (demo sin API) */
  readonly disponible = this.config.modo === 'api';
  protected get url(): string {
    return `${this.config.apiUrl}/${this.recurso}`;
  }

  private readonly _lista = signal<L[]>([]);
  readonly lista = this._lista.asReadonly();
  readonly cargando = signal(false);
  readonly error = signal('');
  readonly cargada = signal(false);
  readonly total = computed(() => this._lista().length);

  /* ===== Dashboard ===== */

  async cargar(forzar = false): Promise<void> {
    if (!this.disponible || (this.cargada() && !forzar) || this.cargando()) return;
    this.cargando.set(true);
    this.error.set('');
    try {
      this._lista.set(await firstValueFrom(this.http.get<L[]>(this.url)));
      this.cargada.set(true);
    } catch (e) {
      this.error.set(mensajeError(e, 'No se pudieron cargar las solicitudes.'));
    } finally {
      this.cargando.set(false);
    }
  }

  detalle(id: number): Promise<D> {
    return firstValueFrom(this.http.get<D>(`${this.url}/${id}`));
  }

  /** Reemplaza un registro de la lista con su versión actualizada */
  protected refrescarEnLista(d: D): void {
    this._lista.update((l) => l.map((x) => (x.id === d.id ? ({ ...x, ...d } as L) : x)));
  }

  async actualizar(id: number, cambios: Record<string, unknown>): Promise<D> {
    const d = await firstValueFrom(this.http.put<D>(`${this.url}/${id}`, cambios));
    this.refrescarEnLista(d);
    return d;
  }

  async responder(id: number, datos: FormData): Promise<D> {
    const d = await firstValueFrom(this.http.post<D>(`${this.url}/${id}/respuesta`, datos));
    this.refrescarEnLista(d);
    return d;
  }

  /** Radica una solicitud recibida por otro canal (ventanilla, correo…) */
  async registrar(datos: FormData | Record<string, unknown>): Promise<Radicacion> {
    const r = await firstValueFrom(this.http.post<Radicacion>(`${this.url}/registrar`, datos));
    await this.cargar(true);
    return r;
  }

  async descargar(id: number, adjunto: number, nombre: string): Promise<void> {
    const blob = await firstValueFrom(this.http.get(`${this.url}/${id}/adjuntos/${adjunto}`, { responseType: 'blob' }));
    guardarBlob(blob, nombre);
  }

  responsables(): Promise<Responsable[]> {
    return firstValueFrom(this.http.get<Responsable[]>(`${this.config.apiUrl}/usuarios/opciones`, { params: { modulo: this.recurso } }));
  }

  /* ===== Portal (público) ===== */

  radicar(datos: FormData | Record<string, unknown>): Promise<Radicacion> {
    return firstValueFrom(this.http.post<Radicacion>(this.url, datos));
  }

  consultar(datos: Record<string, string>): Promise<ConsultaPublica> {
    return firstValueFrom(this.http.post<ConsultaPublica>(`${this.url}/consulta`, datos));
  }

  async descargarPublico(datos: Record<string, string | number>, nombre: string): Promise<void> {
    const blob = await firstValueFrom(this.http.post(`${this.url}/consulta/archivo`, datos, { responseType: 'blob' }));
    guardarBlob(blob, nombre);
  }
}

function guardarBlob(blob: Blob, nombre: string): void {
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = nombre;
  document.body.appendChild(a);
  a.click();
  a.remove();
  setTimeout(() => URL.revokeObjectURL(url), 2000);
}

@Injectable({ providedIn: 'root' })
export class PqrsfdService extends ServicioSolicitudes<Pqrsfd, PqrsfdDetalle> {
  protected readonly recurso = 'pqrsfd' as const;
}

@Injectable({ providedIn: 'root' })
export class ContratacionService extends ServicioSolicitudes<SolicitudContractual, SolicitudContractualDetalle> {
  protected readonly recurso = 'contratacion' as const;
}

/** Respuesta del canal anticorrupción al enviar un reporte */
export interface ReporteSicof {
  radicado: string;
  /** false si el correo al Oficial de Cumplimiento quedó pendiente (se reintenta en el servidor) */
  correoEnviado: boolean;
  fecha: string;
}

/**
 * Canal anticorrupción – SICOF: el reporte se guarda en la API y se envía
 * por correo al Oficial de Cumplimiento. Requiere la API (modo 'api').
 */
@Injectable({ providedIn: 'root' })
export class SicofService {
  private http = inject(HttpClient);
  private config = inject(CMS_CONFIG);
  readonly disponible = this.config.modo === 'api';

  reportar(datos: FormData): Promise<ReporteSicof> {
    return firstValueFrom(this.http.post<ReporteSicof>(`${this.config.apiUrl}/sicof`, datos));
  }
}
