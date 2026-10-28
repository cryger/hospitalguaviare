import { Component, DestroyRef, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';
import { semaforoDe } from '../../../shared/utils/dias-habiles';
import { PermisosService } from '../../../shared/services/permisos/permisos.service';
import { ContratacionService, mensajeError } from '../../../shared/services/solicitudes/solicitudes.service';
import {
  ESTADOS_CONTRACTUAL,
  EXTENSIONES_PERMITIDAS,
  PLAZO_CONTRACTUAL,
  PRIMERA_VIGENCIA,
  Responsable,
  SolicitudContractual,
  SolicitudContractualDetalle,
  nombreEstadoContractual,
  tamanoLegible,
  validarArchivos,
} from '../../../shared/models/solicitudes/solicitudes';

type Aviso = { tipo: 'ok' | 'error'; texto: string } | null;
type FiltroPlazo = '' | 'vencidas' | 'por-vencer' | 'a-tiempo';

@Component({
  selector: 'app-contratacion-admin',
  imports: [FormsModule, DatePipe, BuscadorGovco],
  templateUrl: './contratacion-admin.html',
  styleUrls: ['../cms/cms-admin.css', '../pqrsf-admin/pqrsf-admin.css', './contratacion-admin.css'],
})
export class ContratacionAdmin {
  readonly svc = inject(ContratacionService);
  private permisos = inject(PermisosService);

  readonly estados = ESTADOS_CONTRACTUAL;
  readonly plazo = PLAZO_CONTRACTUAL;
  readonly extensiones = EXTENSIONES_PERMITIDAS;
  readonly nombreEstado = nombreEstadoContractual;
  readonly tamano = tamanoLegible;
  readonly vigenciasDisponibles = Array.from({ length: new Date().getFullYear() - PRIMERA_VIGENCIA + 1 }, (_, i) => new Date().getFullYear() - i);

  readonly aviso = signal<Aviso>(null);
  readonly ahora = signal(new Date());

  /* ===== Filtros ===== */
  readonly busqueda = signal('');
  readonly filtroEstado = signal<string>('abiertas');
  readonly filtroPlazo = signal<FiltroPlazo>('');
  readonly filtroVigencia = signal('');
  readonly soloMias = signal(false);

  semaforo(p: SolicitudContractual) {
    const abierta = ESTADOS_CONTRACTUAL.find((e) => e.valor === p.estado)?.abierta ?? false;
    return semaforoDe(p.fechaVencimiento, abierta, this.ahora());
  }

  readonly lista = computed(() => {
    const t = terminosDe(this.busqueda());
    const yo = this.permisos.usuario()?.id;
    return this.svc
      .lista()
      .filter((p) => {
        const e = this.filtroEstado();
        if (!e) return true;
        if (e === 'abiertas') return p.estado === 'radicada' || p.estado === 'en_tramite';
        return p.estado === e;
      })
      .filter((p) => {
        const f = this.filtroPlazo();
        if (!f) return true;
        const s = this.semaforo(p).estado;
        return f === 'vencidas' ? s === 'vencida' : f === 'por-vencer' ? s === 'alerta' : s === 'ok';
      })
      .filter((p) => !this.filtroVigencia() || p.vigencias.includes(Number(this.filtroVigencia())))
      .filter((p) => !this.soloMias() || p.asignadoA === yo)
      .filter((p) => coincide([p.radicado, p.nombre, p.cedula, p.correo, p.descripcion, p.asignadoNombre].join(' '), t))
      .sort((a, b) => {
        const aa = this.semaforo(a).estado !== 'cerrada', ab = this.semaforo(b).estado !== 'cerrada';
        if (aa !== ab) return aa ? -1 : 1;
        return aa
          ? new Date(a.fechaVencimiento).getTime() - new Date(b.fechaVencimiento).getTime()
          : new Date(b.fechaRadicacion).getTime() - new Date(a.fechaRadicacion).getTime();
      });
  });
  readonly hayFiltros = computed(
    () => !!(this.busqueda() || this.filtroEstado() !== 'abiertas' || this.filtroPlazo() || this.filtroVigencia() || this.soloMias()),
  );

  readonly kpis = computed(() => {
    const todas = this.svc.lista();
    const abiertas = todas.filter((p) => this.semaforo(p).estado !== 'cerrada');
    const respondidas = todas.filter((p) => p.fechaRespuesta);
    const aTiempo = respondidas.filter((p) => new Date(p.fechaRespuesta!).getTime() <= new Date(p.fechaVencimiento).getTime()).length;
    return {
      abiertas: abiertas.length,
      vencidas: abiertas.filter((p) => this.semaforo(p).estado === 'vencida').length,
      porVencer: abiertas.filter((p) => this.semaforo(p).estado === 'alerta').length,
      respondidas: respondidas.length,
      oportunidad: respondidas.length ? Math.round((aTiempo / respondidas.length) * 100) : null,
    };
  });

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroEstado.set('abiertas');
    this.filtroPlazo.set('');
    this.filtroVigencia.set('');
    this.soloMias.set(false);
  }

  verKpi(plazo: FiltroPlazo, estado = 'abiertas'): void {
    this.limpiarFiltros();
    this.filtroEstado.set(estado);
    this.filtroPlazo.set(plazo);
  }

  /* ===== Detalle ===== */
  readonly detalle = signal<SolicitudContractualDetalle | null>(null);
  readonly cargandoDetalle = signal(false);
  readonly guardando = signal(false);
  readonly errorDetalle = signal('');
  readonly responsables = signal<Responsable[]>([]);
  gestion = { estado: '', asignadoA: '' as string | number, nota: '' };
  respuesta = { texto: '', rechazar: false };
  readonly archivosRespuesta = signal<File[]>([]);

  constructor() {
    this.svc.cargar(true);
    if (this.svc.disponible) this.svc.responsables().then((r) => this.responsables.set(r)).catch(() => {});
    const t = setInterval(() => this.ahora.set(new Date()), 60_000);
    inject(DestroyRef).onDestroy(() => clearInterval(t));
  }

  async abrir(p: SolicitudContractual): Promise<void> {
    this.errorDetalle.set('');
    this.cargandoDetalle.set(true);
    this.archivosRespuesta.set([]);
    try {
      const d = await this.svc.detalle(p.id);
      this.mostrar(d);
      this.respuesta = { texto: d.respuesta || this.plantilla(d), rechazar: false };
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e, 'No se pudo abrir la solicitud.') });
    } finally {
      this.cargandoDetalle.set(false);
    }
  }

  /** Texto sugerido para la respuesta */
  private plantilla(d: SolicitudContractualDetalle): string {
    return `Cordial saludo, ${d.nombre}.\n\nEn atención a su solicitud radicada con el número ${d.radicado}, adjuntamos la certificación ` +
      `contractual correspondiente a ${d.vigencias.length > 1 ? 'las vigencias' : 'la vigencia'} ${d.vigencias.join(', ')}.\n\n` +
      `Atentamente,\nOficina de Contratación\nE.S.E. Hospital San José del Guaviare`;
  }

  private mostrar(d: SolicitudContractualDetalle): void {
    this.detalle.set(d);
    this.gestion = { estado: d.estado, asignadoA: d.asignadoA ?? '', nota: '' };
  }

  archivosDe(d: SolicitudContractualDetalle, origen: 'ciudadano' | 'respuesta') {
    return d.archivos.filter((a) => a.origen === origen);
  }

  cerrarDetalle(): void {
    this.detalle.set(null);
  }

  async guardarGestion(): Promise<void> {
    const d = this.detalle();
    if (!d) return;
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      const r = await this.svc.actualizar(d.id, {
        estado: this.gestion.estado,
        asignadoA: this.gestion.asignadoA === '' ? null : Number(this.gestion.asignadoA),
        nota: this.gestion.nota,
      });
      this.mostrar(r);
      this.aviso.set({ tipo: 'ok', texto: `Se guardó la gestión de ${r.radicado}.` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  elegirArchivos(ev: Event): void {
    const input = ev.target as HTMLInputElement;
    const nuevos = [...this.archivosRespuesta(), ...(input.files ?? [])];
    input.value = '';
    const error = validarArchivos(nuevos);
    if (error) return this.errorDetalle.set(error);
    this.archivosRespuesta.set(nuevos);
  }

  quitarArchivo(i: number): void {
    this.archivosRespuesta.set(this.archivosRespuesta().filter((_, j) => j !== i));
  }

  async responder(): Promise<void> {
    const d = this.detalle();
    if (!d) return;
    if (this.respuesta.texto.trim().length < 10) return this.errorDetalle.set('Escriba la respuesta para el solicitante.');
    if (!this.respuesta.rechazar && !this.archivosRespuesta().length && !this.archivosDe(d, 'respuesta').length) {
      return this.errorDetalle.set('Adjunte la certificación (PDF) o marque la solicitud como rechazada.');
    }
    const fd = new FormData();
    fd.append('respuesta', this.respuesta.texto.trim());
    if (this.respuesta.rechazar) fd.append('rechazar', 'true');
    this.archivosRespuesta().forEach((f) => fd.append('archivos', f, f.name));
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      const r = await this.svc.responder(d.id, fd);
      this.mostrar(r);
      this.archivosRespuesta.set([]);
      this.aviso.set({ tipo: 'ok', texto: `Se registró la respuesta de ${r.radicado}. El contratista ya puede descargarla en el portal.` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  async descargar(d: SolicitudContractualDetalle, a: { id: number; nombre: string }): Promise<void> {
    try {
      await this.svc.descargar(d.id, a.id, a.nombre);
    } catch (e) {
      this.errorDetalle.set(mensajeError(e, 'No se pudo descargar el archivo.'));
    }
  }

  enlaceCorreo(d: SolicitudContractualDetalle): string {
    const asunto = `Certificación contractual - radicado ${d.radicado}`;
    const cuerpo = `${d.respuesta || this.respuesta.texto}\n\nTambién puede descargarla en el portal web (Solicitudes contractuales › Consultar) con su cédula y el radicado ${d.radicado}.`;
    return `mailto:${encodeURIComponent(d.correo)}?subject=${encodeURIComponent(asunto)}&body=${encodeURIComponent(cuerpo)}`;
  }

  /* ===== Registrar una recibida en ventanilla o por correo ===== */
  readonly registroAbierto = signal(false);
  readonly errorRegistro = signal('');
  registro = this.vacio();

  private vacio() {
    return { cedula: '', nombre: '', correo: '', telefono: '', tipoEntrega: 'correo', vigencias: [] as number[], descripcion: '' };
  }

  abrirRegistro(): void {
    this.registro = this.vacio();
    this.errorRegistro.set('');
    this.registroAbierto.set(true);
  }

  alternarVigencia(a: number, marcado: boolean): void {
    const v = new Set(this.registro.vigencias);
    if (marcado) v.add(a);
    else v.delete(a);
    this.registro.vigencias = [...v].sort();
  }

  async registrar(): Promise<void> {
    this.guardando.set(true);
    this.errorRegistro.set('');
    try {
      const r = await this.svc.registrar({ ...this.registro });
      this.registroAbierto.set(false);
      this.aviso.set({ tipo: 'ok', texto: `Quedó radicada con el número ${r.radicado}. Entréguelo al solicitante para que consulte con su cédula.` });
    } catch (e) {
      this.errorRegistro.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  exportar(): void {
    const f = (d: string | null) => (d ? new Date(d).toLocaleString('es-CO', { timeZone: 'America/Bogota' }) : '');
    const cab = ['Radicado', 'Fecha de radicación', 'Cédula', 'Nombre', 'Correo', 'Teléfono', 'Entrega', 'Vigencias', 'Estado', 'Responsable', 'Vence', 'Fecha de respuesta'];
    const datos = this.lista().map((p) => [
      p.radicado, f(p.fechaRadicacion), p.cedula, p.nombre, p.correo, p.telefono, p.tipoEntrega === 'fisica' ? 'Física' : 'Correo',
      p.vigencias.join(' - '), nombreEstadoContractual(p.estado), p.asignadoNombre, f(p.fechaVencimiento), f(p.fechaRespuesta),
    ]);
    const csv = [cab, ...datos].map((r) => r.map((c) => `"${String(c ?? '').replace(/"/g, '""')}"`).join(';')).join('\r\n');
    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob(['﻿' + csv], { type: 'text/csv;charset=utf-8' }));
    a.download = `solicitudes-contractuales-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 2000);
  }
}
