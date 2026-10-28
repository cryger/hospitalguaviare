import { Component, DestroyRef, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';
import { semaforoDe } from '../../../shared/utils/dias-habiles';
import { PermisosService } from '../../../shared/services/permisos/permisos.service';
import { PqrsfdService, mensajeError } from '../../../shared/services/solicitudes/solicitudes.service';
import {
  CANALES_PQRSFD,
  ESTADOS_PQRSFD,
  EXTENSIONES_PERMITIDAS,
  Pqrsfd,
  PqrsfdDetalle,
  Responsable,
  TIPOS_DOCUMENTO,
  TIPOS_PQRSFD,
  nombreCanal,
  nombreEstadoPqrsfd,
  nombreTipoPqrsfd,
  tamanoLegible,
  validarArchivos,
} from '../../../shared/models/solicitudes/solicitudes';

type Aviso = { tipo: 'ok' | 'error'; texto: string } | null;
type FiltroPlazo = '' | 'vencidas' | 'por-vencer' | 'a-tiempo';

/** Dependencias sugeridas para asignar (se puede escribir otra) */
const DEPENDENCIAS = [
  'Atención al usuario (SIAU)',
  'Gerencia',
  'Subgerencia científica',
  'Subgerencia administrativa y financiera',
  'Talento humano',
  'Facturación',
  'Archivo clínico',
  'Urgencias',
  'Hospitalización',
  'Consulta externa',
  'Laboratorio clínico',
  'Farmacia',
  'Jurídica',
  'Control interno',
  'Calidad',
];

@Component({
  selector: 'app-pqrsf-admin',
  imports: [FormsModule, DatePipe, BuscadorGovco],
  templateUrl: './pqrsf-admin.html',
  styleUrls: ['../cms/cms-admin.css', './pqrsf-admin.css'],
})
export class PqrsfAdminComponent {
  readonly svc = inject(PqrsfdService);
  private permisos = inject(PermisosService);

  readonly tipos = TIPOS_PQRSFD;
  readonly estados = ESTADOS_PQRSFD;
  readonly canales = CANALES_PQRSFD.filter((c) => c.valor !== 'web');
  readonly documentos = TIPOS_DOCUMENTO;
  readonly dependencias = DEPENDENCIAS;
  readonly extensiones = EXTENSIONES_PERMITIDAS;
  readonly nombreTipo = nombreTipoPqrsfd;
  readonly nombreEstado = nombreEstadoPqrsfd;
  readonly nombreCanal = nombreCanal;
  readonly tamano = tamanoLegible;

  readonly aviso = signal<Aviso>(null);
  readonly ahora = signal(new Date());

  /* ===== Filtros ===== */
  readonly busqueda = signal('');
  readonly filtroTipo = signal('');
  readonly filtroEstado = signal<'' | 'abiertas' | string>('abiertas');
  readonly filtroPlazo = signal<FiltroPlazo>('');
  readonly soloMias = signal(false);
  readonly filtroAnio = signal('');

  readonly anios = computed(() =>
    [...new Set(this.svc.lista().map((p) => new Date(p.fechaRadicacion).getFullYear()))].sort((a, b) => b - a),
  );

  semaforo(p: Pqrsfd) {
    const abierta = ESTADOS_PQRSFD.find((e) => e.valor === p.estado)?.abierta ?? false;
    return semaforoDe(p.fechaVencimiento, abierta, this.ahora());
  }

  readonly lista = computed(() => {
    const t = terminosDe(this.busqueda());
    const yo = this.permisos.usuario()?.id;
    return this.svc
      .lista()
      .filter((p) => !this.filtroTipo() || p.tipo === this.filtroTipo())
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
      .filter((p) => !this.soloMias() || p.asignadoA === yo)
      .filter((p) => !this.filtroAnio() || String(new Date(p.fechaRadicacion).getFullYear()) === this.filtroAnio())
      .filter((p) => coincide([p.radicado, p.nombre, p.numeroDocumento, p.correo, p.asunto, p.area, p.asignadoNombre].join(' '), t))
      .sort((a, b) => {
        // Abiertas: primero las que vencen antes. Cerradas: las más recientes.
        const aa = this.semaforo(a).estado !== 'cerrada', ab = this.semaforo(b).estado !== 'cerrada';
        if (aa !== ab) return aa ? -1 : 1;
        return aa
          ? new Date(a.fechaVencimiento).getTime() - new Date(b.fechaVencimiento).getTime()
          : new Date(b.fechaRadicacion).getTime() - new Date(a.fechaRadicacion).getTime();
      });
  });
  readonly hayFiltros = computed(
    () => !!(this.busqueda() || this.filtroTipo() || this.filtroEstado() !== 'abiertas' || this.filtroPlazo() || this.soloMias() || this.filtroAnio()),
  );

  readonly kpis = computed(() => {
    const todas = this.svc.lista();
    const abiertas = todas.filter((p) => this.semaforo(p).estado !== 'cerrada');
    const vencidas = abiertas.filter((p) => this.semaforo(p).estado === 'vencida').length;
    const porVencer = abiertas.filter((p) => this.semaforo(p).estado === 'alerta').length;
    const respondidas = todas.filter((p) => p.fechaRespuesta);
    const aTiempo = respondidas.filter((p) => new Date(p.fechaRespuesta!).getTime() <= new Date(p.fechaVencimiento).getTime()).length;
    return {
      abiertas: abiertas.length,
      vencidas,
      porVencer,
      respondidas: respondidas.length,
      oportunidad: respondidas.length ? Math.round((aTiempo / respondidas.length) * 100) : null,
    };
  });

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroTipo.set('');
    this.filtroEstado.set('abiertas');
    this.filtroPlazo.set('');
    this.soloMias.set(false);
    this.filtroAnio.set('');
  }

  verKpi(plazo: FiltroPlazo, estado: string = 'abiertas'): void {
    this.limpiarFiltros();
    this.filtroEstado.set(estado);
    this.filtroPlazo.set(plazo);
  }

  /* ===== Detalle y gestión ===== */
  readonly detalle = signal<PqrsfdDetalle | null>(null);
  readonly cargandoDetalle = signal(false);
  readonly guardando = signal(false);
  readonly errorDetalle = signal('');
  readonly responsables = signal<Responsable[]>([]);
  gestion = { estado: '', area: '', asignadoA: '' as string | number, nota: '' };
  respuesta = { texto: '', cerrar: false };
  readonly archivosRespuesta = signal<File[]>([]);

  constructor() {
    this.svc.cargar(true);
    if (this.svc.disponible) this.svc.responsables().then((r) => this.responsables.set(r)).catch(() => {});
    // El semáforo se recalcula cada minuto
    const t = setInterval(() => this.ahora.set(new Date()), 60_000);
    inject(DestroyRef).onDestroy(() => clearInterval(t));
  }

  async abrir(p: Pqrsfd): Promise<void> {
    this.errorDetalle.set('');
    this.cargandoDetalle.set(true);
    this.archivosRespuesta.set([]);
    try {
      const d = await this.svc.detalle(p.id);
      this.mostrarDetalle(d);
      this.respuesta = { texto: d.respuesta || '', cerrar: false };
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e, 'No se pudo abrir la solicitud.') });
    } finally {
      this.cargandoDetalle.set(false);
    }
  }

  private mostrarDetalle(d: PqrsfdDetalle): void {
    this.detalle.set(d);
    this.gestion = { estado: d.estado, area: d.area, asignadoA: d.asignadoA ?? '', nota: '' };
  }

  archivosDe(d: PqrsfdDetalle, origen: 'ciudadano' | 'respuesta') {
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
        area: this.gestion.area,
        asignadoA: this.gestion.asignadoA === '' ? null : Number(this.gestion.asignadoA),
        nota: this.gestion.nota,
      });
      this.mostrarDetalle(r);
      this.aviso.set({ tipo: 'ok', texto: `Se guardó la gestión de ${r.radicado}.` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  elegirArchivos(ev: Event, destino: 'respuesta' | 'registro'): void {
    const input = ev.target as HTMLInputElement;
    const lista = [...(input.files ?? [])];
    const actual = destino === 'respuesta' ? this.archivosRespuesta() : this.archivosRegistro();
    const nuevos = [...actual, ...lista];
    const error = validarArchivos(nuevos);
    input.value = '';
    if (error) {
      if (destino === 'respuesta') this.errorDetalle.set(error);
      else this.errorRegistro.set(error);
      return;
    }
    if (destino === 'respuesta') this.archivosRespuesta.set(nuevos);
    else this.archivosRegistro.set(nuevos);
  }

  quitarArchivo(i: number, destino: 'respuesta' | 'registro'): void {
    const s = destino === 'respuesta' ? this.archivosRespuesta : this.archivosRegistro;
    s.set(s().filter((_, j) => j !== i));
  }

  async responder(): Promise<void> {
    const d = this.detalle();
    if (!d) return;
    if (this.respuesta.texto.trim().length < 10) {
      this.errorDetalle.set('Escriba la respuesta para el ciudadano.');
      return;
    }
    const fd = new FormData();
    fd.append('respuesta', this.respuesta.texto.trim());
    if (this.respuesta.cerrar) fd.append('cerrar', 'true');
    this.archivosRespuesta().forEach((f) => fd.append('archivos', f, f.name));
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      const r = await this.svc.responder(d.id, fd);
      this.mostrarDetalle(r);
      this.archivosRespuesta.set([]);
      this.aviso.set({ tipo: 'ok', texto: `Se registró la respuesta de ${r.radicado}. El ciudadano ya la puede consultar en el portal.` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  async descargar(d: PqrsfdDetalle, a: { id: number; nombre: string }): Promise<void> {
    try {
      await this.svc.descargar(d.id, a.id, a.nombre);
    } catch (e) {
      this.errorDetalle.set(mensajeError(e, 'No se pudo descargar el archivo.'));
    }
  }

  /** Enlace para enviar la respuesta desde el correo institucional */
  enlaceCorreo(d: PqrsfdDetalle): string {
    const asunto = `Respuesta a su ${nombreTipoPqrsfd(d.tipo).toLowerCase()} radicada con el número ${d.radicado}`;
    const cuerpo = `${d.nombre ? `Señor(a) ${d.nombre}:` : 'Cordial saludo:'}\n\n${d.respuesta || this.respuesta.texto}\n\n` +
      `Puede consultar el estado de su solicitud en el portal web (PQRSFD › Consultar) con el radicado ${d.radicado}.\n\n` +
      `Atentamente,\nE.S.E. Hospital San José del Guaviare`;
    return `mailto:${encodeURIComponent(d.correo)}?subject=${encodeURIComponent(asunto)}&body=${encodeURIComponent(cuerpo)}`;
  }

  /* ===== Registrar una PQRSFD recibida por otro canal ===== */
  readonly registroAbierto = signal(false);
  readonly errorRegistro = signal('');
  readonly archivosRegistro = signal<File[]>([]);
  registro = this.registroVacio();

  private registroVacio() {
    return {
      canal: 'presencial', tipo: 'peticion', anonimo: false, tipoDocumento: 'CC', numeroDocumento: '', nombre: '',
      correo: '', telefono: '', direccion: '', municipio: 'San José del Guaviare', medioRespuesta: 'correo', asunto: '', mensaje: '',
    };
  }

  permiteAnonimo(tipo: string): boolean {
    return TIPOS_PQRSFD.find((t) => t.valor === tipo)?.permiteAnonimo ?? false;
  }

  abrirRegistro(): void {
    this.registro = this.registroVacio();
    this.archivosRegistro.set([]);
    this.errorRegistro.set('');
    this.registroAbierto.set(true);
  }

  async registrar(): Promise<void> {
    const r = this.registro;
    if (r.anonimo && !this.permiteAnonimo(r.tipo)) r.anonimo = false;
    const fd = new FormData();
    Object.entries(r).forEach(([k, v]) => fd.append(k, String(v)));
    this.archivosRegistro().forEach((f) => fd.append('archivos', f, f.name));
    this.guardando.set(true);
    this.errorRegistro.set('');
    try {
      const res = await this.svc.registrar(fd);
      this.registroAbierto.set(false);
      this.aviso.set({
        tipo: 'ok',
        texto: `Quedó radicada con el número ${res.radicado} (código de consulta ${res.codigo}). Entregue estos datos al ciudadano.`,
      });
    } catch (e) {
      this.errorRegistro.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  /* ===== Exportar (informe de PQRSD, Ley 1712 de 2014) ===== */
  exportar(): void {
    const filas = this.lista();
    const cab = ['Radicado', 'Fecha de radicación', 'Tipo', 'Canal', 'Asunto', 'Peticionario', 'Documento', 'Dependencia', 'Responsable',
      'Estado', 'Vence', 'Fecha de respuesta', 'Respondida a tiempo'];
    const f = (d: string | null) => (d ? new Date(d).toLocaleString('es-CO', { timeZone: 'America/Bogota' }) : '');
    const datos = filas.map((p) => [
      p.radicado, f(p.fechaRadicacion), nombreTipoPqrsfd(p.tipo), nombreCanal(p.canal), p.asunto, p.anonimo ? 'Anónimo' : p.nombre,
      p.anonimo ? '' : `${p.tipoDocumento} ${p.numeroDocumento}`, p.area, p.asignadoNombre, nombreEstadoPqrsfd(p.estado),
      f(p.fechaVencimiento), f(p.fechaRespuesta),
      p.fechaRespuesta ? (new Date(p.fechaRespuesta) <= new Date(p.fechaVencimiento) ? 'Sí' : 'No') : '',
    ]);
    const csv = [cab, ...datos].map((r) => r.map((c) => `"${String(c ?? '').replace(/"/g, '""')}"`).join(';')).join('\r\n');
    const blob = new Blob(['﻿' + csv], { type: 'text/csv;charset=utf-8' });
    const a = document.createElement('a');
    a.href = URL.createObjectURL(blob);
    a.download = `pqrsfd-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 2000);
  }
}
