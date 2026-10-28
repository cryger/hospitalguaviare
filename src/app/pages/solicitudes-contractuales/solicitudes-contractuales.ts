import { Component, ElementRef, computed, inject, signal, viewChild } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { ContratacionService, mensajeError } from '../../shared/services/solicitudes/solicitudes.service';
import {
  ConsultaPublica,
  PLAZO_CONTRACTUAL,
  PRIMERA_VIGENCIA,
  Radicacion,
  nombreEstadoContractual,
  tamanoLegible,
} from '../../shared/models/solicitudes/solicitudes';

/** Reemplaza la plataforma /seguimiento-solicitudes del portal anterior */
@Component({
  selector: 'app-solicitudes-contractuales',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './solicitudes-contractuales.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './solicitudes-contractuales.css'],
})
export class SolicitudesContractuales {
  private fb = inject(FormBuilder);
  readonly svc = inject(ContratacionService);

  readonly plazo = PLAZO_CONTRACTUAL;
  readonly tamano = tamanoLegible;
  readonly nombreEstado = nombreEstadoContractual;
  readonly vigencias = Array.from({ length: new Date().getFullYear() - PRIMERA_VIGENCIA + 1 }, (_, i) => new Date().getFullYear() - i);

  private readonly query = toSignal(inject(ActivatedRoute).queryParamMap);
  readonly pestana = signal<'radicar' | 'consultar'>(this.query()?.has('consultar') ? 'consultar' : 'radicar');

  readonly form = this.fb.nonNullable.group({
    cedula: ['', [Validators.required, Validators.pattern(/^[0-9.\s]{5,15}$/)]],
    nombre: ['', [Validators.required, Validators.maxLength(150)]],
    correo: ['', [Validators.required, Validators.email]],
    telefono: ['', [Validators.required, Validators.pattern(/^[0-9+()\s-]{7,30}$/)]],
    tipoEntrega: ['correo', Validators.required],
    descripcion: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(4000)]],
    aceptaDatos: [false, Validators.requiredTrue],
    sitioWeb: [''],
  });
  readonly elegidas = signal<number[]>([]);
  private readonly valores = toSignal(this.form.valueChanges, { initialValue: this.form.getRawValue() });
  readonly caracteres = computed(() => (this.valores().descripcion ?? '').length);

  readonly intentado = signal(false);
  /** Después del primer intento, los errores se actualizan mientras la persona corrige */
  readonly errores = computed<{ id: string; texto: string }[]>(() => {
    this.valores();
    this.elegidas();
    return this.intentado() ? this.validar() : [];
  });
  readonly enviando = signal(false);
  readonly errorEnvio = signal('');
  readonly radicacion = signal<Radicacion | null>(null);
  private cedulaRadicada = '';

  private readonly resumenErrores = viewChild<ElementRef<HTMLElement>>('resumenErrores');
  private readonly constancia = viewChild<ElementRef<HTMLElement>>('constancia');

  alternarVigencia(a: number, marcado: boolean): void {
    const s = new Set(this.elegidas());
    if (marcado) s.add(a);
    else s.delete(a);
    this.elegidas.set([...s].sort());
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

  private validar(): { id: string; texto: string }[] {
    const c = this.form.controls;
    const e: { id: string; texto: string }[] = [];
    if (c.cedula.invalid) e.push({ id: 'cedula', texto: 'Escriba su número de cédula (solo números).' });
    if (c.nombre.invalid) e.push({ id: 'nombre', texto: 'Escriba su nombre completo.' });
    if (c.correo.invalid) e.push({ id: 'correo', texto: 'Escriba un correo electrónico válido. Ejemplo: nombre@correo.com' });
    if (c.telefono.invalid) e.push({ id: 'telefono', texto: 'Escriba un teléfono de contacto (mínimo 7 números).' });
    if (!this.elegidas().length) e.push({ id: 'vigencias', texto: 'Seleccione al menos una vigencia (año del contrato).' });
    if (c.descripcion.invalid) e.push({ id: 'descripcion', texto: 'Describa la certificación que necesita (mínimo 10 caracteres).' });
    if (c.aceptaDatos.invalid) e.push({ id: 'aceptaDatos', texto: 'Debe autorizar el tratamiento de sus datos personales.' });
    return e;
  }

  async enviar(): Promise<void> {
    this.intentado.set(true);
    this.errorEnvio.set('');
    const errores = this.validar();
    if (errores.length) {
      setTimeout(() => this.resumenErrores()?.nativeElement.focus());
      return;
    }
    const v = this.form.getRawValue();
    this.enviando.set(true);
    try {
      const cedula = v.cedula.replace(/[.\s]/g, '');
      const r = await this.svc.radicar({ ...v, cedula, vigencias: this.elegidas() });
      this.cedulaRadicada = cedula;
      this.radicacion.set(r);
      this.form.reset();
      this.elegidas.set([]);
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
      this.consulta.setValue({ cedula: this.cedulaRadicada, radicado: r.radicado });
      this.consultar();
    }
  }

  /* ===== Consulta ===== */
  readonly consulta = this.fb.nonNullable.group({ cedula: [''], radicado: [''] });
  readonly consultando = signal(false);
  readonly errorConsulta = signal('');
  readonly resultado = signal<ConsultaPublica | null>(null);

  private datosConsulta() {
    const v = this.consulta.getRawValue();
    return { cedula: v.cedula.replace(/[.\s]/g, ''), radicado: v.radicado.trim() };
  }

  async consultar(): Promise<void> {
    const d = this.datosConsulta();
    this.errorConsulta.set('');
    if (!d.cedula || !d.radicado) {
      this.errorConsulta.set('Escriba su cédula y el número de radicado.');
      return;
    }
    this.consultando.set(true);
    this.resultado.set(null);
    try {
      this.resultado.set(await this.svc.consultar(d));
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
