import { Component, DestroyRef, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';
import { semaforoDe } from '../../../shared/utils/dias-habiles';
import { PermisosService } from '../../../shared/services/permisos/permisos.service';
import { HistoriaClinicaService, mensajeError } from '../../../shared/services/solicitudes/solicitudes.service';
import {
  ALCANCES_HISTORIA,
  CALIDADES_SOLICITANTE,
  ESTADOS_HISTORIA,
  EXTENSIONES_SOPORTE,
  PLAZO_HISTORIA,
  Responsable,
  SERVICIOS_HISTORIA,
  SolicitudHistoria,
  SolicitudHistoriaDetalle,
  TIPOS_DOCUMENTO_PERSONA,
  nombreAlcance,
  nombreCalidad,
  nombreEstadoHistoria,
  nombreServicio,
  tamanoLegible,
  validarSoportes,
} from '../../../shared/models/solicitudes/solicitudes';

type Aviso = { tipo: 'ok' | 'error'; texto: string } | null;
type FiltroPlazo = '' | 'vencidas' | 'por-vencer' | 'a-tiempo';

/** Gestión de las solicitudes de copia de historia clínica (módulo «historias») */
@Component({
  selector: 'app-historia-clinica-admin',
  imports: [FormsModule, DatePipe, BuscadorGovco],
  templateUrl: './historia-clinica-admin.html',
  styleUrls: ['../cms/cms-admin.css', '../pqrsf-admin/pqrsf-admin.css', './historia-clinica-admin.css'],
})
export class HistoriaClinicaAdmin {
  readonly svc = inject(HistoriaClinicaService);
  private permisos = inject(PermisosService);

  readonly estados = ESTADOS_HISTORIA;
  readonly calidades = CALIDADES_SOLICITANTE;
  readonly alcances = ALCANCES_HISTORIA;
  readonly servicios = SERVICIOS_HISTORIA;
  readonly documentos = TIPOS_DOCUMENTO_PERSONA;
  readonly plazo = PLAZO_HISTORIA;
  readonly extensiones = EXTENSIONES_SOPORTE;
  readonly nombreEstado = nombreEstadoHistoria;
  readonly nombreCalidad = nombreCalidad;
  readonly nombreAlcance = nombreAlcance;
  readonly nombreServicio = nombreServicio;
  readonly tamano = tamanoLegible;

  readonly aviso = signal<Aviso>(null);
  readonly ahora = signal(new Date());

  /* ===== Filtros ===== */
  readonly busqueda = signal('');
  readonly filtroEstado = signal<string>('abiertas');
  readonly filtroPlazo = signal<FiltroPlazo>('');
  readonly filtroEntrega = signal('');
  readonly soloMias = signal(false);

  semaforo(p: SolicitudHistoria) {
    const abierta = ESTADOS_HISTORIA.find((e) => e.valor === p.estado)?.abierta ?? false;
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
      .filter((p) => !this.filtroEntrega() || p.tipoEntrega === this.filtroEntrega())
      .filter((p) => !this.soloMias() || p.asignadoA === yo)
      .filter((p) =>
        coincide([p.radicado, p.nombre, p.numeroDocumento, p.correo, p.pacienteNombre, p.pacienteDocumento, p.asignadoNombre].join(' '), t),
      )
      .sort((a, b) => {
        const aa = this.semaforo(a).estado !== 'cerrada', ab = this.semaforo(b).estado !== 'cerrada';
        if (aa !== ab) return aa ? -1 : 1;
        return aa
          ? new Date(a.fechaVencimiento).getTime() - new Date(b.fechaVencimiento).getTime()
          : new Date(b.fechaRadicacion).getTime() - new Date(a.fechaRadicacion).getTime();
      });
  });
  readonly hayFiltros = computed(
    () => !!(this.busqueda() || this.filtroEstado() !== 'abiertas' || this.filtroPlazo() || this.filtroEntrega() || this.soloMias()),
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
    this.filtroEntrega.set('');
    this.soloMias.set(false);
  }

  verKpi(plazo: FiltroPlazo, estado = 'abiertas'): void {
    this.limpiarFiltros();
    this.filtroEstado.set(estado);
    this.filtroPlazo.set(plazo);
  }

  /** Paciente de la solicitud (el mismo solicitante si es el paciente) */
  paciente(p: SolicitudHistoria): string {
    return p.calidad === 'paciente' ? `${p.nombre} · ${p.tipoDocumento} ${p.numeroDocumento}` : `${p.pacienteNombre} · ${p.pacienteTipoDoc} ${p.pacienteDocumento}`;
  }

  /* ===== Detalle ===== */
  readonly detalle = signal<SolicitudHistoriaDetalle | null>(null);
  readonly cargandoDetalle = signal(false);
  readonly guardando = signal(false);
  readonly errorDetalle = signal('');
  readonly responsables = signal<Responsable[]>([]);
  gestion = { estado: '', asignadoA: '' as string | number, nota: '' };
  respuesta = { texto: '', rechazar: false, avisar: true };
  readonly archivosRespuesta = signal<File[]>([]);

  constructor() {
    this.svc.cargar(true);
    if (this.svc.disponible) this.svc.responsables().then((r) => this.responsables.set(r)).catch(() => {});
    const t = setInterval(() => this.ahora.set(new Date()), 60_000);
    inject(DestroyRef).onDestroy(() => clearInterval(t));
  }

  async abrir(p: SolicitudHistoria): Promise<void> {
    this.errorDetalle.set('');
    this.cargandoDetalle.set(true);
    this.archivosRespuesta.set([]);
    try {
      const d = await this.svc.detalle(p.id);
      this.mostrar(d);
      this.respuesta = { texto: d.respuesta || this.plantilla(d), rechazar: false, avisar: true };
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e, 'No se pudo abrir la solicitud.') });
    } finally {
      this.cargandoDetalle.set(false);
    }
  }

  /** Texto sugerido para la respuesta */
  private plantilla(d: SolicitudHistoriaDetalle): string {
    const entrega = d.tipoEntrega === 'fisica'
      ? 'La copia está disponible para reclamarla en la oficina de Archivo de historias clínicas, presentando su documento de identidad original.'
      : 'Adjuntamos la copia solicitada, que puede descargar en el portal web con su número de documento, el radicado y el código de consulta.';
    return `Cordial saludo, ${d.nombre}.\n\nEn atención a su solicitud radicada con el número ${d.radicado} (${nombreAlcance(d.alcance).toLowerCase()}). ${entrega}\n\n` +
      `Le recordamos que la historia clínica es un documento reservado; su uso es responsabilidad de quien la recibe.\n\n` +
      `Atentamente,\nArchivo de historias clínicas\nE.S.E. Hospital San José del Guaviare`;
  }

  private mostrar(d: SolicitudHistoriaDetalle): void {
    this.detalle.set(d);
    this.gestion = { estado: d.estado, asignadoA: d.asignadoA ?? '', nota: '' };
  }

  archivosDe(d: SolicitudHistoriaDetalle, origen: 'ciudadano' | 'respuesta') {
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
    const error = validarSoportes(nuevos);
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
    if (!this.respuesta.rechazar && d.tipoEntrega === 'digital' && !this.archivosRespuesta().length && !this.archivosDe(d, 'respuesta').length) {
      return this.errorDetalle.set('Adjunte la copia de la historia clínica (PDF) o marque la solicitud como «No procede».');
    }
    const fd = new FormData();
    fd.append('respuesta', this.respuesta.texto.trim());
    if (this.respuesta.rechazar) fd.append('rechazar', 'true');
    fd.append('avisar', String(this.respuesta.avisar));
    this.archivosRespuesta().forEach((f) => fd.append('archivos', f, f.name));
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      const r = await this.svc.responder(d.id, fd);
      this.mostrar(r);
      this.archivosRespuesta.set([]);
      this.aviso.set({
        tipo: 'ok',
        texto: `Se registró la respuesta de ${r.radicado}.${r.tipoEntrega === 'digital' && !this.respuesta.rechazar ? ' El solicitante ya puede descargar la copia en el portal.' : ''}`,
      });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  async descargar(d: SolicitudHistoriaDetalle, a: { id: number; nombre: string }): Promise<void> {
    try {
      await this.svc.descargar(d.id, a.id, a.nombre);
    } catch (e) {
      this.errorDetalle.set(mensajeError(e, 'No se pudo descargar el archivo.'));
    }
  }

  /* ===== Registrar una recibida en ventanilla o por correo ===== */
  readonly registroAbierto = signal(false);
  readonly errorRegistro = signal('');
  readonly radicadaInterna = signal<{ radicado: string; codigo: string } | null>(null);
  readonly soportesRegistro = signal<File[]>([]);
  registro = this.vacio();

  private vacio() {
    return {
      canal: 'presencial', calidad: 'paciente', tipoDocumento: 'CC', numeroDocumento: '', nombre: '', correo: '', telefono: '',
      pacienteTipoDoc: 'CC', pacienteDocumento: '', pacienteNombre: '', parentesco: '',
      alcance: 'completa', servicios: [] as string[], fechaDesde: '', fechaHasta: '', observaciones: '', tipoEntrega: 'fisica',
    };
  }

  abrirRegistro(): void {
    this.registro = this.vacio();
    this.soportesRegistro.set([]);
    this.errorRegistro.set('');
    this.radicadaInterna.set(null);
    this.registroAbierto.set(true);
  }

  alternarServicio(s: string, marcado: boolean): void {
    const v = new Set(this.registro.servicios);
    if (marcado) v.add(s);
    else v.delete(s);
    this.registro.servicios = SERVICIOS_HISTORIA.map((x) => x.valor).filter((x) => v.has(x));
  }

  elegirSoportes(ev: Event): void {
    const input = ev.target as HTMLInputElement;
    const nuevos = [...this.soportesRegistro(), ...(input.files ?? [])];
    input.value = '';
    const error = validarSoportes(nuevos);
    if (error) return this.errorRegistro.set(error);
    this.errorRegistro.set('');
    this.soportesRegistro.set(nuevos);
  }

  async registrar(): Promise<void> {
    this.guardando.set(true);
    this.errorRegistro.set('');
    const fd = new FormData();
    Object.entries(this.registro).forEach(([k, v]) => fd.append(k, Array.isArray(v) ? v.join(',') : String(v)));
    this.soportesRegistro().forEach((f) => fd.append('archivos', f, f.name));
    try {
      const r = await this.svc.registrar(fd);
      this.radicadaInterna.set({ radicado: r.radicado, codigo: r.codigo ?? '' });
    } catch (e) {
      this.errorRegistro.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  exportar(): void {
    const f = (d: string | null) => (d ? new Date(d).toLocaleString('es-CO', { timeZone: 'America/Bogota' }) : '');
    // Sin datos clínicos ni observaciones: solo lo necesario para el seguimiento de oportunidad
    const cab = ['Radicado', 'Fecha de radicación', 'Quién solicita', 'Documento solicitante', 'Solicitante', 'Documentos', 'Entrega', 'Canal', 'Estado', 'Responsable', 'Vence', 'Fecha de respuesta'];
    const datos = this.lista().map((p) => [
      p.radicado, f(p.fechaRadicacion), nombreCalidad(p.calidad), `${p.tipoDocumento} ${p.numeroDocumento}`, p.nombre, nombreAlcance(p.alcance),
      p.tipoEntrega === 'fisica' ? 'Física' : 'Digital', p.canal, nombreEstadoHistoria(p.estado), p.asignadoNombre, f(p.fechaVencimiento), f(p.fechaRespuesta),
    ]);
    const csv = [cab, ...datos].map((r) => r.map((c) => `"${String(c ?? '').replace(/"/g, '""')}"`).join(';')).join('\r\n');
    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob(['﻿' + csv], { type: 'text/csv;charset=utf-8' }));
    a.download = `copias-historia-clinica-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 2000);
  }
}
