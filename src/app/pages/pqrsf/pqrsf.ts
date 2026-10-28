import { Component, ElementRef, computed, inject, signal, viewChild } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { ActivatedRoute, RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { PqrsfdService, mensajeError } from '../../shared/services/solicitudes/solicitudes.service';
import {
  ConsultaPublica,
  EXTENSIONES_PERMITIDAS,
  MAX_ARCHIVOS,
  MAX_MB,
  Radicacion,
  TIPOS_DOCUMENTO,
  TIPOS_PQRSFD,
  nombreEstadoPqrsfd,
  tamanoLegible,
  validarArchivos,
} from '../../shared/models/solicitudes/solicitudes';

/** Grupos poblacionales (enfoque diferencial, opcional) */
const GRUPOS = [
  'Ninguno', 'Persona con discapacidad', 'Persona mayor', 'Niña, niño o adolescente', 'Mujer gestante', 'Víctima del conflicto armado',
  'Comunidad indígena', 'Comunidad afrodescendiente', 'Población migrante', 'Población LGBTIQ+', 'Población rural',
];

@Component({
  selector: 'app-pqrsf',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './pqrsf.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './pqrsf.css'],
})
export class PqrsfComponent {
  private fb = inject(FormBuilder);
  readonly svc = inject(PqrsfdService);

  readonly tipos = TIPOS_PQRSFD;
  readonly documentos = TIPOS_DOCUMENTO;
  readonly grupos = GRUPOS;
  readonly extensiones = EXTENSIONES_PERMITIDAS;
  readonly maxArchivos = MAX_ARCHIVOS;
  readonly maxMb = MAX_MB;
  readonly tamano = tamanoLegible;
  readonly nombreEstado = nombreEstadoPqrsfd;

  private readonly query = toSignal(inject(ActivatedRoute).queryParamMap);
  readonly pestana = signal<'radicar' | 'consultar'>(this.query()?.has('consultar') ? 'consultar' : 'radicar');

  /* ===================== Radicar ===================== */
  readonly form = this.fb.nonNullable.group({
    tipo: ['', Validators.required],
    anonimo: [false],
    tipoPersona: ['natural'],
    tipoDocumento: ['CC'],
    numeroDocumento: [''],
    nombre: [''],
    correo: ['', Validators.email],
    telefono: ['', Validators.pattern(/^[0-9+()\s-]{7,30}$/)],
    direccion: [''],
    municipio: ['San José del Guaviare'],
    grupoPoblacional: ['Ninguno'],
    medioRespuesta: ['correo'],
    asunto: ['', [Validators.required, Validators.maxLength(200)]],
    mensaje: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(8000)]],
    aceptaDatos: [false, Validators.requiredTrue],
    sitioWeb: [''], // campo trampa anti-robots (oculto)
  });

  private readonly valores = toSignal(this.form.valueChanges, { initialValue: this.form.getRawValue() });
  readonly tipoElegido = computed(() => TIPOS_PQRSFD.find((t) => t.valor === this.valores().tipo));
  readonly anonimo = computed(() => !!this.valores().anonimo && !!this.tipoElegido()?.permiteAnonimo);
  readonly caracteres = computed(() => (this.valores().mensaje ?? '').length);

  readonly archivos = signal<File[]>([]);
  readonly errorArchivos = signal('');
  readonly intentado = signal(false);
  /** Después del primer intento, los errores se actualizan mientras la persona corrige */
  readonly errores = computed<{ id: string; texto: string }[]>(() => {
    this.valores();
    return this.intentado() ? this.validar() : [];
  });
  readonly enviando = signal(false);
  readonly errorEnvio = signal('');
  readonly radicacion = signal<Radicacion | null>(null);

  private readonly resumenErrores = viewChild<ElementRef<HTMLElement>>('resumenErrores');
  private readonly constancia = viewChild<ElementRef<HTMLElement>>('constancia');

  elegirTipo(valor: string): void {
    this.form.controls.tipo.setValue(valor);
    if (!TIPOS_PQRSFD.find((t) => t.valor === valor)?.permiteAnonimo) this.form.controls.anonimo.setValue(false);
  }

  agregarArchivos(ev: Event): void {
    const input = ev.target as HTMLInputElement;
    const nuevos = [...this.archivos(), ...(input.files ?? [])];
    input.value = '';
    const error = validarArchivos(nuevos);
    this.errorArchivos.set(error);
    if (!error) this.archivos.set(nuevos);
  }

  quitarArchivo(i: number): void {
    this.archivos.set(this.archivos().filter((_, j) => j !== i));
    this.errorArchivos.set('');
  }

  /** Error de un campo (solo después del primer intento de envío) */
  error(campo: string): string {
    if (!this.intentado()) return '';
    return this.errores().find((e) => e.id === campo)?.texto ?? '';
  }

  private validar(): { id: string; texto: string }[] {
    const v = this.form.getRawValue();
    const e: { id: string; texto: string }[] = [];
    if (!v.tipo) e.push({ id: 'tipo', texto: 'Seleccione el tipo de solicitud.' });
    if (!this.anonimo()) {
      if (!v.numeroDocumento.trim()) e.push({ id: 'numeroDocumento', texto: 'Escriba su número de documento.' });
      else if (!/^[0-9A-Za-z.\s-]{4,20}$/.test(v.numeroDocumento.trim())) e.push({ id: 'numeroDocumento', texto: 'El número de documento solo admite números y letras.' });
      if (!v.nombre.trim()) e.push({ id: 'nombre', texto: 'Escriba su nombre completo o la razón social.' });
      if (v.medioRespuesta === 'correo' && !v.correo.trim()) e.push({ id: 'correo', texto: 'Escriba su correo electrónico para enviarle la respuesta.' });
      if (v.medioRespuesta === 'fisica' && !v.direccion.trim()) e.push({ id: 'direccion', texto: 'Escriba la dirección donde quiere recibir la respuesta.' });
    }
    if (this.form.controls.correo.invalid) e.push({ id: 'correo', texto: 'El correo electrónico no es válido. Ejemplo: nombre@correo.com' });
    if (this.form.controls.telefono.invalid) e.push({ id: 'telefono', texto: 'El teléfono debe tener al menos 7 números.' });
    if (!v.asunto.trim()) e.push({ id: 'asunto', texto: 'Escriba el asunto de su solicitud.' });
    if (v.mensaje.trim().length < 10) e.push({ id: 'mensaje', texto: 'Describa su solicitud (mínimo 10 caracteres).' });
    if (!v.aceptaDatos) e.push({ id: 'aceptaDatos', texto: 'Debe autorizar el tratamiento de sus datos personales.' });
    return e;
  }

  /** Lleva el foco al campo con error desde el resumen */
  irACampo(ev: Event, id: string): void {
    ev.preventDefault();
    const el = document.getElementById(id);
    const foco = el?.matches('input, select, textarea') ? el : el?.querySelector<HTMLElement>('input, select, textarea');
    foco?.focus();
    el?.scrollIntoView({ block: 'center' });
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
    const fd = new FormData();
    const anon = this.anonimo();
    Object.entries(v).forEach(([k, val]) => {
      if (anon && ['tipoDocumento', 'numeroDocumento', 'nombre'].includes(k)) return;
      if (k === 'grupoPoblacional' && val === 'Ninguno') return;
      fd.append(k, String(k === 'anonimo' ? anon : val));
    });
    this.archivos().forEach((f) => fd.append('archivos', f, f.name));

    this.enviando.set(true);
    try {
      const r = await this.svc.radicar(fd);
      this.radicacion.set(r);
      this.form.reset();
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
    this.form.reset();
  }

  imprimir(): void {
    window.print();
  }

  irAConsulta(r?: Radicacion): void {
    this.pestana.set('consultar');
    if (r) {
      this.consulta.setValue({ radicado: r.radicado, codigo: r.codigo ?? '' });
      this.consultar();
    }
  }

  /* ===================== Consultar ===================== */
  readonly consulta = this.fb.nonNullable.group({
    radicado: ['', Validators.required],
    codigo: ['', Validators.required],
  });
  readonly consultando = signal(false);
  readonly errorConsulta = signal('');
  readonly resultado = signal<ConsultaPublica | null>(null);

  async consultar(): Promise<void> {
    const v = this.consulta.getRawValue();
    this.errorConsulta.set('');
    if (!v.radicado.trim() || !v.codigo.trim()) {
      this.errorConsulta.set('Escriba el número de radicado y el código de consulta.');
      return;
    }
    this.consultando.set(true);
    this.resultado.set(null);
    try {
      this.resultado.set(await this.svc.consultar({ radicado: v.radicado.trim(), codigo: v.codigo.trim() }));
    } catch (e) {
      this.errorConsulta.set(mensajeError(e));
    } finally {
      this.consultando.set(false);
    }
  }

  async descargar(a: { id: number; nombre: string }): Promise<void> {
    const v = this.consulta.getRawValue();
    try {
      await this.svc.descargarPublico({ radicado: v.radicado.trim(), codigo: v.codigo.trim(), id: a.id }, a.nombre);
    } catch (e) {
      this.errorConsulta.set(mensajeError(e, 'No se pudo descargar el archivo.'));
    }
  }

  /** Paso de la línea de tiempo pública */
  paso(estado: string): number {
    return { radicada: 1, en_tramite: 2, trasladada: 2, respondida: 3, cerrada: 3 }[estado] ?? 1;
  }
}
