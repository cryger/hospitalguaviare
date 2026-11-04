import { Component, ElementRef, computed, effect, inject, signal, viewChild } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { ParticipacionService, mensajeError } from '../../shared/services/participacion/participacion.service';
import {
  AportePublico,
  AporteEstado,
  AporteRadicado,
  ConsultaDetalle,
  ConsultaResumen,
  POSTURAS,
  TIPOS_DOCUMENTO_APORTE,
  diasParaCierre,
  nombreEstadoAporte,
  nombrePostura,
} from '../../shared/models/participacion/participacion';

type ErrorCampo = { id: string; texto: string };
const DOC = /^[0-9A-Za-z.\s-]{4,20}$/;

/**
 * Consultas ciudadanas en línea. Sin :slug muestra el listado y la consulta
 * de estado; con :slug muestra el detalle con el formulario de aporte y los
 * resultados. Participación ciudadana (Ley 1757 de 2015, gobierno abierto).
 */
@Component({
  selector: 'app-participacion',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './participacion.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './participacion.css'],
})
export class Participacion {
  private fb = inject(FormBuilder);
  private router = inject(Router);
  readonly svc = inject(ParticipacionService);

  readonly posturas = POSTURAS;
  readonly documentos = TIPOS_DOCUMENTO_APORTE;
  readonly nombrePostura = nombrePostura;
  readonly nombreEstadoAporte = nombreEstadoAporte;
  readonly dias = diasParaCierre;

  private readonly ruta = toSignal(inject(ActivatedRoute).paramMap);
  readonly slug = computed(() => this.ruta()?.get('slug') ?? '');

  /* ===== Listado ===== */
  readonly consultas = signal<ConsultaResumen[]>([]);
  readonly cargandoLista = signal(false);
  readonly errorLista = signal('');
  readonly abiertas = computed(() => this.consultas().filter((c) => c.abierta));
  readonly cerradas = computed(() => this.consultas().filter((c) => !c.abierta));
  readonly pestana = signal<'consultas' | 'estado'>('consultas');

  /* ===== Detalle ===== */
  readonly consulta = signal<ConsultaDetalle | null>(null);
  readonly cargandoDetalle = signal(false);
  readonly errorDetalle = signal('');
  readonly aportesPublicos = computed<AportePublico[]>(() => {
    const a = this.consulta()?.aportes;
    return Array.isArray(a) ? a : [];
  });

  constructor() {
    // Datos para «Consultar mi aporte» pasados por el state de navegación (no van en la URL)
    const st = this.router.getCurrentNavigation()?.extras.state as { estado?: { numeroDocumento: string; radicado: string } } | undefined;
    if (st?.estado) {
      this.pestana.set('estado');
      this.estado.setValue(st.estado);
      queueMicrotask(() => this.consultarEstado());
    }
    // Reacciona al cambio de ruta (lista ↔ detalle) sin recargar el componente
    effect(() => {
      const s = this.slug();
      if (s) this.cargarDetalle(s);
      else this.cargarLista();
    });
  }

  private async cargarLista(): Promise<void> {
    this.consulta.set(null);
    if (!this.svc.disponible) return;
    this.cargandoLista.set(true);
    this.errorLista.set('');
    try {
      this.consultas.set(await this.svc.consultasPublicas());
    } catch (e) {
      this.errorLista.set(mensajeError(e, 'No se pudieron cargar las consultas.'));
    } finally {
      this.cargandoLista.set(false);
    }
  }

  private async cargarDetalle(slug: string): Promise<void> {
    this.radicacion.set(null);
    if (!this.svc.disponible) return;
    this.cargandoDetalle.set(true);
    this.errorDetalle.set('');
    this.consulta.set(null);
    try {
      this.consulta.set(await this.svc.consultaPublica(slug));
    } catch (e) {
      this.errorDetalle.set(mensajeError(e, 'No se pudo abrir la consulta.'));
    } finally {
      this.cargandoDetalle.set(false);
    }
  }

  /* ===== Formulario de aporte ===== */
  readonly form = this.fb.nonNullable.group({
    tipoPersona: ['natural', Validators.required],
    tipoDocumento: ['CC', Validators.required],
    numeroDocumento: ['', [Validators.required, Validators.pattern(DOC)]],
    nombre: ['', [Validators.required, Validators.maxLength(150)]],
    organizacion: ['', Validators.maxLength(150)],
    correo: ['', Validators.email],
    telefono: ['', Validators.pattern(/^[0-9+()\s-]{7,30}$/)],
    postura: [''],
    aporte: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(6000)]],
    publicar: [false],
    aceptaDatos: [false, Validators.requiredTrue],
    sitioWeb: [''],
  });
  private readonly valores = toSignal(this.form.valueChanges, { initialValue: this.form.getRawValue() });
  readonly esJuridica = computed(() => this.valores().tipoPersona === 'juridica');
  readonly caracteres = computed(() => (this.valores().aporte ?? '').length);

  readonly intentado = signal(false);
  readonly errores = computed<ErrorCampo[]>(() => {
    this.valores();
    return this.intentado() ? this.validar() : [];
  });
  readonly enviando = signal(false);
  readonly errorEnvio = signal('');
  readonly radicacion = signal<AporteRadicado | null>(null);
  private documentoRadicado = '';

  private readonly resumenErrores = viewChild<ElementRef<HTMLElement>>('resumenErrores');
  private readonly constancia = viewChild<ElementRef<HTMLElement>>('constancia');

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
    const e: ErrorCampo[] = [];
    if (c.numeroDocumento.invalid) e.push({ id: 'numeroDocumento', texto: 'Escriba su número de documento (mínimo 4 caracteres).' });
    if (c.nombre.invalid) e.push({ id: 'nombre', texto: this.esJuridica() ? 'Escriba la razón social.' : 'Escriba su nombre completo.' });
    if (c.correo.invalid) e.push({ id: 'correo', texto: 'El correo no es válido. Ejemplo: nombre@correo.com' });
    if (c.telefono.invalid) e.push({ id: 'telefono', texto: 'El teléfono no es válido (mínimo 7 números).' });
    if (c.aporte.invalid) e.push({ id: 'aporte', texto: 'Escriba su aporte (mínimo 10 caracteres).' });
    if (c.aceptaDatos.invalid) e.push({ id: 'aceptaDatos', texto: 'Debe autorizar el tratamiento de sus datos personales.' });
    return e;
  }

  async enviar(): Promise<void> {
    const consulta = this.consulta();
    if (!consulta) return;
    this.intentado.set(true);
    this.errorEnvio.set('');
    if (this.validar().length) {
      setTimeout(() => this.resumenErrores()?.nativeElement.focus());
      return;
    }
    const v = this.form.getRawValue();
    const numero = v.numeroDocumento.replace(/[.\s]/g, '');
    this.enviando.set(true);
    try {
      const r = await this.svc.enviarAporte(consulta.id, { ...v, numeroDocumento: numero });
      this.documentoRadicado = numero;
      this.radicacion.set(r);
      this.form.reset({ tipoPersona: 'natural', tipoDocumento: 'CC', postura: '', publicar: false });
      this.intentado.set(false);
      setTimeout(() => this.constancia()?.nativeElement.focus());
    } catch (e) {
      this.errorEnvio.set(mensajeError(e, 'No se pudo enviar su aporte. Intente de nuevo.'));
    } finally {
      this.enviando.set(false);
    }
  }

  irAEstado(r?: AporteRadicado): void {
    // Pasa el documento y el radicado por el state (no por la URL) para la pestaña de estado
    const estado = r ? { numeroDocumento: this.documentoRadicado, radicado: r.radicado } : undefined;
    this.router.navigate(['/participacion'], { state: estado ? { estado } : undefined });
  }

  /* ===== Consulta de estado ===== */
  readonly estado = this.fb.nonNullable.group({ numeroDocumento: [''], radicado: [''] });
  readonly consultandoEstado = signal(false);
  readonly errorEstado = signal('');
  readonly resultadoEstado = signal<AporteEstado | null>(null);

  async consultarEstado(): Promise<void> {
    const v = this.estado.getRawValue();
    const d = { numeroDocumento: v.numeroDocumento.replace(/[.\s]/g, ''), radicado: v.radicado.trim().toUpperCase() };
    this.errorEstado.set('');
    if (!d.numeroDocumento || !d.radicado) {
      this.errorEstado.set('Escriba su número de documento y el radicado.');
      return;
    }
    this.consultandoEstado.set(true);
    this.resultadoEstado.set(null);
    try {
      this.resultadoEstado.set(await this.svc.estadoAporte(d));
    } catch (e) {
      this.errorEstado.set(mensajeError(e));
    } finally {
      this.consultandoEstado.set(false);
    }
  }

  paso(estado: string): number {
    return { recibido: 1, en_analisis: 2, incorporado: 3, no_incorporado: 3 }[estado] ?? 1;
  }
}
