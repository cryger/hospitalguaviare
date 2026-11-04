import { Component, computed, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BuscadorGovco } from '../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../shared/utils/busqueda';
import { ParticipacionService, mensajeError } from '../../../shared/services/participacion/participacion.service';
import {
  AporteAdmin,
  ConsultaAdmin,
  ConsultaConAportes,
  ESTADOS_APORTE,
  ESTADOS_CONSULTA,
  POSTURAS,
  diasParaCierre,
  nombreEstadoAporte,
  nombreEstadoConsulta,
  nombrePostura,
} from '../../../shared/models/participacion/participacion';

type Aviso = { tipo: 'ok' | 'error'; texto: string } | null;

/** Gestión de consultas ciudadanas y sus aportes (módulo «participacion») */
@Component({
  selector: 'app-participacion-admin',
  imports: [FormsModule, DatePipe, BuscadorGovco],
  templateUrl: './participacion-admin.html',
  styleUrls: ['../cms/cms-admin.css', '../pqrsf-admin/pqrsf-admin.css', './participacion-admin.css'],
})
export class ParticipacionAdmin {
  readonly svc = inject(ParticipacionService);

  readonly estadosConsulta = ESTADOS_CONSULTA;
  readonly estadosAporte = ESTADOS_APORTE;
  readonly posturas = POSTURAS;
  readonly nombreEstadoConsulta = nombreEstadoConsulta;
  readonly nombreEstadoAporte = nombreEstadoAporte;
  readonly nombrePostura = nombrePostura;
  readonly dias = diasParaCierre;

  readonly aviso = signal<Aviso>(null);
  readonly busqueda = signal('');
  readonly filtroEstado = signal('');

  readonly lista = computed(() => {
    const t = terminosDe(this.busqueda());
    return this.svc
      .consultas()
      .filter((c) => !this.filtroEstado() || c.estado === this.filtroEstado())
      .filter((c) => coincide([c.titulo, c.categoria, c.resumen].join(' '), t));
  });
  readonly hayFiltros = computed(() => !!(this.busqueda() || this.filtroEstado()));

  readonly kpis = computed(() => {
    const c = this.svc.consultas();
    return {
      abiertas: c.filter((x) => x.abierta).length,
      pendientes: c.reduce((n, x) => n + x.nPendientes, 0),
      conResultados: c.filter((x) => x.estado === 'con_resultados').length,
      aportes: c.reduce((n, x) => n + x.nAportes, 0),
    };
  });

  constructor() {
    this.svc.cargar(true);
  }

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroEstado.set('');
  }

  /* ===== Crear ===== */
  readonly crearAbierto = signal(false);
  readonly guardando = signal(false);
  readonly errorCrear = signal('');
  nueva = this.vacia();

  private vacia() {
    return { titulo: '', resumen: '', descripcion: '', categoria: '', documentoUrl: '', documentoNombre: '', fechaFin: '', estado: 'borrador' };
  }

  abrirCrear(): void {
    this.nueva = this.vacia();
    this.errorCrear.set('');
    this.crearAbierto.set(true);
  }

  async crear(): Promise<void> {
    if (!this.nueva.titulo.trim() || !this.nueva.resumen.trim() || !this.nueva.descripcion.trim() || !this.nueva.fechaFin) {
      this.errorCrear.set('Complete el título, el resumen, la descripción y la fecha de cierre.');
      return;
    }
    this.guardando.set(true);
    this.errorCrear.set('');
    try {
      const c = await this.svc.crear({ ...this.nueva });
      this.crearAbierto.set(false);
      this.aviso.set({ tipo: 'ok', texto: `Se creó la consulta «${c.titulo}»${c.estado === 'borrador' ? ' como borrador' : ''}.` });
      this.abrir(c);
    } catch (e) {
      this.errorCrear.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  /* ===== Detalle ===== */
  readonly detalle = signal<ConsultaConAportes | null>(null);
  readonly cargandoDetalle = signal(false);
  readonly errorDetalle = signal('');
  edicion = { estado: '', fechaFin: '', resultado: '', resumen: '', descripcion: '', categoria: '', documentoUrl: '', documentoNombre: '' };
  // Edición por aporte (id → borrador)
  aporteEdit: Record<number, { estado: string; respuesta: string; publicar: boolean }> = {};

  async abrir(c: ConsultaAdmin | ConsultaConAportes): Promise<void> {
    this.errorDetalle.set('');
    this.cargandoDetalle.set(true);
    try {
      const d = await this.svc.detalle(c.id);
      this.mostrar(d);
    } catch (e) {
      this.aviso.set({ tipo: 'error', texto: mensajeError(e, 'No se pudo abrir la consulta.') });
    } finally {
      this.cargandoDetalle.set(false);
    }
  }

  private mostrar(d: ConsultaConAportes): void {
    this.detalle.set(d);
    this.edicion = {
      estado: d.estado,
      fechaFin: this.paraInput(d.fechaFin),
      resultado: d.resultado,
      resumen: d.resumen,
      descripcion: d.descripcion,
      categoria: d.categoria,
      documentoUrl: d.documentoUrl,
      documentoNombre: d.documentoNombre,
    };
    this.aporteEdit = {};
    for (const a of d.listaAportes) this.aporteEdit[a.id] = { estado: a.estado, respuesta: a.respuesta, publicar: a.publicar };
  }

  /** ISO → valor de <input type="datetime-local"> en hora de Bogotá */
  private paraInput(iso: string): string {
    const d = new Date(new Date(iso).getTime() - 5 * 3600 * 1000);
    return d.toISOString().slice(0, 16);
  }

  cerrarDetalle(): void {
    this.detalle.set(null);
  }

  enlacePublico(d: ConsultaConAportes): string {
    return `/participacion/${d.slug}`;
  }

  aportesPendientes(d: ConsultaConAportes): number {
    return d.listaAportes.filter((a) => a.estado === 'recibido').length;
  }

  async guardarConsulta(): Promise<void> {
    const d = this.detalle();
    if (!d) return;
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      const r = await this.svc.actualizarConsulta(d.id, {
        estado: this.edicion.estado,
        fechaFin: this.edicion.fechaFin ? new Date(this.edicion.fechaFin).toISOString() : undefined,
        resultado: this.edicion.resultado,
        resumen: this.edicion.resumen,
        descripcion: this.edicion.descripcion,
        categoria: this.edicion.categoria,
        documentoUrl: this.edicion.documentoUrl,
        documentoNombre: this.edicion.documentoNombre,
      });
      this.mostrar(r);
      this.aviso.set({ tipo: 'ok', texto: `Se guardó la consulta «${r.titulo}».` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  async guardarAporte(a: AporteAdmin): Promise<void> {
    const d = this.detalle();
    const edit = this.aporteEdit[a.id];
    if (!d || !edit) return;
    this.guardando.set(true);
    this.errorDetalle.set('');
    try {
      await this.svc.actualizarAporte(a.id, { estado: edit.estado, respuesta: edit.respuesta, publicar: edit.publicar });
      const r = await this.svc.detalle(d.id);
      this.mostrar(r);
      this.aviso.set({ tipo: 'ok', texto: `Se guardó el aporte ${a.radicado}.` });
    } catch (e) {
      this.errorDetalle.set(mensajeError(e));
    } finally {
      this.guardando.set(false);
    }
  }

  exportar(d: ConsultaConAportes): void {
    const f = (x: string | null) => (x ? new Date(x).toLocaleString('es-CO', { timeZone: 'America/Bogota' }) : '');
    const cab = ['Radicado', 'Fecha', 'Tipo persona', 'Documento', 'Nombre', 'Organización', 'Postura', 'Aporte', 'Estado', 'Respuesta', 'Autoriza publicar'];
    const datos = d.listaAportes.map((a) => [
      a.radicado, f(a.fechaRadicacion), a.tipoPersona, `${a.tipoDocumento} ${a.numeroDocumento}`, a.nombre, a.organizacion,
      a.postura ? nombrePostura(a.postura) : '', a.aporte, nombreEstadoAporte(a.estado), a.respuesta, a.publicar ? 'Sí' : 'No',
    ]);
    const csv = [cab, ...datos].map((r) => r.map((c) => `"${String(c ?? '').replace(/"/g, '""')}"`).join(';')).join('\r\n');
    const a = document.createElement('a');
    a.href = URL.createObjectURL(new Blob(['﻿' + csv], { type: 'text/csv;charset=utf-8' }));
    a.download = `aportes-${d.slug}-${new Date().toISOString().slice(0, 10)}.csv`;
    a.click();
    setTimeout(() => URL.revokeObjectURL(a.href), 2000);
  }
}
