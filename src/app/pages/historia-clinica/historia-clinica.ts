import { Component, ElementRef, computed, inject, signal, viewChild } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { HistoriaClinicaService, mensajeError } from '../../shared/services/solicitudes/solicitudes.service';
import {
  ALCANCES_HISTORIA,
  CALIDADES_SOLICITANTE,
  CalidadSolicitante,
  ConsultaHistoria,
  DIAS_DESCARGA_HISTORIA,
  EXTENSIONES_SOPORTE,
  MAX_ARCHIVOS,
  MAX_MB,
  PLAZO_HISTORIA,
  Radicacion,
  SERVICIOS_HISTORIA,
  TIPOS_DOCUMENTO_PERSONA,
  nombreEstadoHistoria,
  tamanoLegible,
  validarSoportes,
} from '../../shared/models/solicitudes/solicitudes';

type ErrorCampo = { id: string; texto: string };
const DOC = /^[0-9A-Za-z.\s-]{4,20}$/;
const hoy = () => new Date(Date.now() - 5 * 3600 * 1000).toISOString().slice(0, 10);

/**
 * Solicitud en línea de copia de historia clínica (MIPG RT-05) y consulta del estado
 * con documento + radicado + código (RT-06). Reemplaza el envío del formato
 * E-ET-FO-01 por correo.
 */
@Component({
  selector: 'app-historia-clinica',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './historia-clinica.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './historia-clinica.css'],
})
export class HistoriaClinica {
  private fb = inject(FormBuilder);
  readonly svc = inject(HistoriaClinicaService);

  readonly plazo = PLAZO_HISTORIA;
  readonly diasDescarga = DIAS_DESCARGA_HISTORIA;
  readonly calidades = CALIDADES_SOLICITANTE;
  readonly alcances = ALCANCES_HISTORIA;
  readonly servicios = SERVICIOS_HISTORIA;
  readonly documentos = TIPOS_DOCUMENTO_PERSONA;
  readonly extensiones = EXTENSIONES_SOPORTE;
  readonly maxArchivos = MAX_ARCHIVOS;
  readonly maxMb = MAX_MB;
  readonly tamano = tamanoLegible;
  readonly nombreEstado = nombreEstadoHistoria;
  readonly hoy = hoy();

  private readonly query = toSignal(inject(ActivatedRoute).queryParamMap);
  readonly pestana = signal<'radicar' | 'consultar'>(this.query()?.has('consultar') ? 'consultar' : 'radicar');

  readonly form = this.fb.nonNullable.group({
    calidad: ['paciente' as CalidadSolicitante, Validators.required],
    tipoDocumento: ['CC', Validators.required],
    numeroDocumento: ['', [Validators.required, Validators.pattern(DOC)]],
    nombre: ['', [Validators.required, Validators.maxLength(150)]],
    correo: ['', [Validators.required, Validators.email]],
    telefono: ['', [Validators.required, Validators.pattern(/^[0-9+()\s-]{7,30}$/)]],
    direccion: ['', Validators.maxLength(200)],
    pacienteTipoDoc: ['CC'],
    pacienteDocumento: [''],
    pacienteNombre: [''],
    parentesco: [''],
    alcance: ['completa', Validators.required],
    fechaDesde: [''],
    fechaHasta: [''],
    observaciones: ['', Validators.maxLength(2000)],
    tipoEntrega: ['digital', Validators.required],
    aceptaDatos: [false, Validators.requiredTrue],
    declaraVeracidad: [false, Validators.requiredTrue],
    sitioWeb: [''],
  });
  private readonly valores = toSignal(this.form.valueChanges, { initialValue: this.form.getRawValue() });
  readonly calidad = computed(() => this.valores().calidad ?? 'paciente');
  readonly calidadElegida = computed(() => CALIDADES_SOLICITANTE.find((c) => c.valor === this.calidad())!);
  readonly valoresAlcance = computed(() => this.valores().alcance ?? 'completa');
  readonly esTercero = computed(() => this.calidad() !== 'paciente');
  readonly minSoportes = computed(() => (this.esTercero() ? 2 : 1));
  readonly caracteres = computed(() => (this.valores().observaciones ?? '').length);

  readonly elegidos = signal<string[]>([]);
  readonly archivos = signal<File[]>([]);
  readonly errorArchivos = signal('');

  readonly intentado = signal(false);
  /** Después del primer intento, los errores se actualizan mientras la persona corrige */
  readonly errores = computed<ErrorCampo[]>(() => {
    this.valores();
    this.archivos();
    return this.intentado() ? this.validar() : [];
  });
  readonly enviando = signal(false);
  readonly errorEnvio = signal('');
  readonly radicacion = signal<Radicacion | null>(null);
  private documentoRadicado = '';

  private readonly resumenErrores = viewChild<ElementRef<HTMLElement>>('resumenErrores');
  private readonly constancia = viewChild<ElementRef<HTMLElement>>('constancia');

  alternarServicio(s: string, marcado: boolean): void {
    const v = new Set(this.elegidos());
    if (marcado) v.add(s);
    else v.delete(s);
    this.elegidos.set(SERVICIOS_HISTORIA.map((x) => x.valor).filter((x) => v.has(x)));
  }

  agregarArchivos(ev: Event): void {
    const input = ev.target as HTMLInputElement;
    const nuevos = [...this.archivos(), ...(input.files ?? [])];
    input.value = '';
    const error = validarSoportes(nuevos);
    this.errorArchivos.set(error);
    if (!error) this.archivos.set(nuevos);
  }

  quitarArchivo(i: number): void {
    this.archivos.set(this.archivos().filter((_, j) => j !== i));
    this.errorArchivos.set('');
  }

  error(campo: string): string {
    return this.intentado() ? (this.errores().find((e) => e.id === campo)?.texto ?? '') : '';
  }

  irACampo(ev: Event, id: string): void {
    ev.preventDefault();
    const el = document.getElementById(id);
    const foco = el?.matches('input, select, textarea') ? el : el?.querySelector<HTMLElement>('input, select, textarea');
    foco?.focus();
    el?.scrollIntoView({ block: 'center' });
  }

  private validar(): ErrorCampo[] {
    const c = this.form.controls;
    const v = this.form.getRawValue();
    const e: ErrorCampo[] = [];
    if (c.numeroDocumento.invalid) e.push({ id: 'numeroDocumento', texto: 'Escriba su número de documento (mínimo 4 caracteres).' });
    if (c.nombre.invalid) e.push({ id: 'nombre', texto: 'Escriba su nombre completo.' });
    if (c.correo.invalid) e.push({ id: 'correo', texto: 'Escriba un correo electrónico válido. Ejemplo: nombre@correo.com' });
    if (c.telefono.invalid) e.push({ id: 'telefono', texto: 'Escriba un teléfono de contacto (mínimo 7 números).' });
    if (this.esTercero()) {
      if (!DOC.test(v.pacienteDocumento.trim())) e.push({ id: 'pacienteDocumento', texto: 'Escriba el número de documento del paciente.' });
      if (!v.pacienteNombre.trim()) e.push({ id: 'pacienteNombre', texto: 'Escriba el nombre completo del paciente.' });
      if (!v.parentesco.trim()) e.push({ id: 'parentesco', texto: 'Indique su parentesco o relación con el paciente.' });
    }
    if (v.fechaDesde && v.fechaDesde > this.hoy) e.push({ id: 'fechaDesde', texto: 'La fecha inicial no puede ser posterior a hoy.' });
    if (v.fechaHasta && v.fechaHasta > this.hoy) e.push({ id: 'fechaHasta', texto: 'La fecha final no puede ser posterior a hoy.' });
    if (v.fechaDesde && v.fechaHasta && v.fechaDesde > v.fechaHasta) e.push({ id: 'fechaHasta', texto: 'La fecha final debe ser posterior a la inicial.' });
    if (v.alcance === 'otro' && !v.observaciones.trim()) e.push({ id: 'observaciones', texto: 'Indique en observaciones qué documentos necesita.' });
    if (this.archivos().length < this.minSoportes()) {
      e.push({
        id: 'archivos',
        texto: this.esTercero()
          ? 'Adjunte su documento de identidad y el soporte que lo faculta (mínimo 2 archivos).'
          : 'Adjunte la copia de su documento de identidad.',
      });
    }
    if (c.declaraVeracidad.invalid) e.push({ id: 'declaraVeracidad', texto: 'Declare que la información y los soportes son verídicos.' });
    if (c.aceptaDatos.invalid) e.push({ id: 'aceptaDatos', texto: 'Debe autorizar el tratamiento de sus datos personales.' });
    return e;
  }

  async enviar(): Promise<void> {
    this.intentado.set(true);
    this.errorEnvio.set('');
    if (this.validar().length) {
      setTimeout(() => this.resumenErrores()?.nativeElement.focus());
      return;
    }
    const v = this.form.getRawValue();
    const numero = v.numeroDocumento.replace(/[.\s]/g, '');
    const fd = new FormData();
    const datos: Record<string, string> = {
      calidad: v.calidad,
      tipoDocumento: v.tipoDocumento,
      numeroDocumento: numero,
      nombre: v.nombre.trim(),
      correo: v.correo.trim(),
      telefono: v.telefono.trim(),
      direccion: v.direccion.trim(),
      alcance: v.alcance,
      servicios: this.elegidos().join(','),
      fechaDesde: v.fechaDesde,
      fechaHasta: v.fechaHasta,
      observaciones: v.observaciones.trim(),
      tipoEntrega: v.tipoEntrega,
      aceptaDatos: String(v.aceptaDatos),
      declaraVeracidad: String(v.declaraVeracidad),
      sitioWeb: v.sitioWeb,
    };
    if (this.esTercero()) {
      Object.assign(datos, {
        pacienteTipoDoc: v.pacienteTipoDoc,
        pacienteDocumento: v.pacienteDocumento.replace(/[.\s]/g, ''),
        pacienteNombre: v.pacienteNombre.trim(),
        parentesco: v.parentesco.trim(),
      });
    }
    Object.entries(datos).forEach(([k, x]) => fd.append(k, x));
    this.archivos().forEach((f) => fd.append('archivos', f, f.name));

    this.enviando.set(true);
    try {
      const r = await this.svc.radicar(fd);
      this.documentoRadicado = numero;
      this.radicacion.set(r);
      this.form.reset();
      this.elegidos.set([]);
      this.archivos.set([]);
      this.intentado.set(false);
      setTimeout(() => this.constancia()?.nativeElement.focus());
    } catch (e) {
      this.errorEnvio.set(mensajeError(e, 'No se pudo radicar su solicitud. Intente de nuevo.'));
    } finally {
      this.enviando.set(false);
    }
  }

  nuevaSolicitud(): void {
    this.radicacion.set(null);
  }

  imprimir(): void {
    window.print();
  }

  irAConsulta(r?: Radicacion): void {
    this.pestana.set('consultar');
    if (r) {
      this.consulta.setValue({ numeroDocumento: this.documentoRadicado, radicado: r.radicado, codigo: r.codigo ?? '' });
      this.consultar();
    }
  }

  /* ===== Consulta ===== */
  readonly consulta = this.fb.nonNullable.group({ numeroDocumento: [''], radicado: [''], codigo: [''] });
  readonly consultando = signal(false);
  readonly errorConsulta = signal('');
  readonly resultado = signal<ConsultaHistoria | null>(null);

  private datosConsulta() {
    const v = this.consulta.getRawValue();
    return {
      numeroDocumento: v.numeroDocumento.replace(/[.\s]/g, ''),
      radicado: v.radicado.trim().toUpperCase(),
      codigo: v.codigo.replace(/\s/g, '').toUpperCase(),
    };
  }

  async consultar(): Promise<void> {
    const d = this.datosConsulta();
    this.errorConsulta.set('');
    if (!d.numeroDocumento || !d.radicado || !d.codigo) {
      this.errorConsulta.set('Escriba su número de documento, el radicado y el código de consulta.');
      return;
    }
    this.consultando.set(true);
    this.resultado.set(null);
    try {
      this.resultado.set((await this.svc.consultar(d)) as ConsultaHistoria);
    } catch (e) {
      this.errorConsulta.set(mensajeError(e));
    } finally {
      this.consultando.set(false);
    }
  }

  async descargar(a: { id: number; nombre: string }): Promise<void> {
    try {
      await this.svc.descargarPublico({ ...this.datosConsulta(), id: a.id }, a.nombre);
    } catch (e) {
      this.errorConsulta.set(mensajeError(e, 'No se pudo descargar el archivo.'));
    }
  }

  paso(estado: string): number {
    return { radicada: 1, en_tramite: 2, respondida: 3, rechazada: 3 }[estado] ?? 1;
  }
}
