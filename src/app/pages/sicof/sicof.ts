import { Component, ElementRef, computed, inject, signal, viewChild } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { toSignal } from '@angular/core/rxjs-interop';
import { ReporteSicof, SicofService, mensajeError } from '../../shared/services/solicitudes/solicitudes.service';

/** Mismos tipos de evento del formulario del portal anterior */
export const TIPOS_EVENTO_SICOF = [
  'Cibercrimen', 'Cohecho', 'Colusión', 'Concusión', 'Conducta irregular', 'Conflicto de interés', 'Corrupción',
  'Estafa', 'Favoritismo', 'Fraude', 'Hurto', 'Opacidad', 'Peculado', 'Piratería', 'Prevaricato por acción',
  'Prevaricato por omisión', 'Soborno', 'Tráfico de influencias', 'Vandalismo', 'Omisión de reporte a la UIAF',
];
const EXT = ['pdf', 'jpg', 'jpeg', 'png', 'webp'];
const MAX_ARCHIVOS = 5;
const MAX_MB = 10;

type Error = { id: string; texto: string };

/**
 * Canal anticorrupción – SICOF (Subsistema del Riesgo de Corrupción, Opacidad y Fraude).
 * Formulario por pasos, como en el portal anterior. Los reportes llegan por correo
 * al Oficial de Cumplimiento (oficialdecumplimiento@esehospitalguaviare.gov.co).
 */
@Component({
  selector: 'app-sicof',
  imports: [ReactiveFormsModule, DatePipe, RouterLink],
  templateUrl: './sicof.html',
  styleUrls: ['../../shared/styles/formulario-govco.css', './sicof.css'],
})
export class Sicof {
  private fb = inject(FormBuilder);
  readonly svc = inject(SicofService);

  readonly tipos = TIPOS_EVENTO_SICOF;
  readonly maxArchivos = MAX_ARCHIVOS;
  readonly maxMb = MAX_MB;
  readonly hoy = new Date().toISOString().slice(0, 10);
  readonly correoOficial = 'oficialdecumplimiento@esehospitalguaviare.gov.co';

  readonly pasos = ['Los hechos', 'Detalles', 'Tipo y evidencias', 'Envío'];
  readonly paso = signal(0);

  readonly form = this.fb.nonNullable.group({
    descripcion: ['', [Validators.required, Validators.minLength(20), Validators.maxLength(6000)]],
    comoSeDioCuenta: ['', [Validators.required, Validators.maxLength(2000)]],
    tiempo: ['', [Validators.required, Validators.maxLength(200)]],
    fechaConocimiento: ['', Validators.required],
    involucrados: ['', Validators.maxLength(1000)],
    area: ['', [Validators.required, Validators.maxLength(300)]],
    tipoEvento: ['', Validators.required],
    correo: ['', [Validators.email, Validators.maxLength(150)]],
    declaracion: [false, Validators.requiredTrue],
    sitioWeb: [''],
  });
  private readonly valores = toSignal(this.form.valueChanges, { initialValue: this.form.getRawValue() });
  readonly caracteres = computed(() => (this.valores().descripcion ?? '').length);

  readonly archivos = signal<File[]>([]);
  readonly errorArchivos = signal('');

  /** Pasos en los que ya se intentó avanzar (se muestran sus errores) */
  private readonly intentados = signal<Set<number>>(new Set());
  readonly errores = computed<Error[]>(() => {
    this.valores();
    this.archivos();
    const p = this.paso();
    return this.intentados().has(p) ? this.validar(p) : [];
  });

  readonly enviando = signal(false);
  readonly errorEnvio = signal('');
  readonly reporte = signal<ReporteSicof | null>(null);

  private readonly resumen = viewChild<ElementRef<HTMLElement>>('resumen');
  private readonly titulo = viewChild<ElementRef<HTMLElement>>('tituloPaso');
  private readonly constancia = viewChild<ElementRef<HTMLElement>>('constancia');

  private validar(p: number): Error[] {
    const c = this.form.controls;
    const e: Error[] = [];
    if (p === 0) {
      if (c.descripcion.invalid) e.push({ id: 'descripcion', texto: 'Describa el acto indebido (mínimo 20 caracteres).' });
      if (c.comoSeDioCuenta.invalid) e.push({ id: 'comoSeDioCuenta', texto: 'Cuente cómo se dio cuenta de la situación.' });
      if (c.tiempo.invalid) e.push({ id: 'tiempo', texto: 'Indique hace cuánto tiempo se viene presentando.' });
    }
    if (p === 1) {
      const f = c.fechaConocimiento.value;
      if (!f) e.push({ id: 'fechaConocimiento', texto: 'Indique la fecha en que se dio cuenta de la conducta.' });
      else if (f > this.hoy) e.push({ id: 'fechaConocimiento', texto: 'La fecha no puede ser posterior a hoy.' });
      if (c.area.invalid) e.push({ id: 'area', texto: 'Indique el área o proceso donde ocurrió.' });
    }
    if (p === 2) {
      if (c.tipoEvento.invalid) e.push({ id: 'tipoEvento', texto: 'Seleccione el tipo de evento.' });
      if (this.errorArchivos()) e.push({ id: 'evidencias', texto: this.errorArchivos() });
    }
    if (p === 3) {
      if (c.correo.invalid) e.push({ id: 'correo', texto: 'Escriba un correo válido o déjelo vacío para reportar de forma anónima.' });
      if (c.declaracion.invalid) e.push({ id: 'declaracion', texto: 'Debe declarar que la información es veraz.' });
    }
    return e;
  }

  error(campo: string): string {
    return this.errores().find((x) => x.id === campo)?.texto ?? '';
  }

  irACampo(ev: Event, id: string): void {
    ev.preventDefault();
    const el = document.getElementById(id);
    (el?.matches('input, select, textarea') ? el : el?.querySelector<HTMLElement>('input, select, textarea, button'))?.focus();
  }

  siguiente(): void {
    const p = this.paso();
    this.intentados.update((s) => new Set(s).add(p));
    if (this.validar(p).length) {
      setTimeout(() => this.resumen()?.nativeElement.focus());
      return;
    }
    if (p < this.pasos.length - 1) this.irAPaso(p + 1);
    else this.enviar();
  }

  anterior(): void {
    if (this.paso() > 0) this.irAPaso(this.paso() - 1);
  }

  /** Solo se puede saltar a pasos ya completados */
  irAPaso(p: number): void {
    this.paso.set(p);
    setTimeout(() => this.titulo()?.nativeElement.focus());
  }

  pasoCompleto(p: number): boolean {
    return p < this.paso();
  }

  /* ===== Evidencias ===== */
  agregarArchivos(input: HTMLInputElement): void {
    const nuevos = Array.from(input.files ?? []);
    input.value = '';
    this.errorArchivos.set('');
    const malos = nuevos.filter((f) => !EXT.includes((f.name.split('.').pop() ?? '').toLowerCase()));
    if (malos.length) {
      this.errorArchivos.set(`Formato no permitido: ${malos.map((f) => f.name).join(', ')}. Use PDF, JPG, JPEG, PNG o WEBP.`);
      return;
    }
    const pesados = nuevos.filter((f) => f.size > MAX_MB * 1024 * 1024);
    if (pesados.length) {
      this.errorArchivos.set(`Cada archivo puede pesar máximo ${MAX_MB} MB (${pesados.map((f) => f.name).join(', ')}).`);
      return;
    }
    const lista = [...this.archivos(), ...nuevos];
    if (lista.length > MAX_ARCHIVOS) {
      this.errorArchivos.set(`Puede adjuntar máximo ${MAX_ARCHIVOS} archivos.`);
      return;
    }
    this.archivos.set(lista);
  }

  quitarArchivo(i: number): void {
    this.archivos.update((l) => l.filter((_, k) => k !== i));
    this.errorArchivos.set('');
  }

  tamano(b: number): string {
    return b >= 1048576 ? (b / 1048576).toFixed(1).replace('.', ',') + ' MB' : Math.max(1, Math.round(b / 1024)) + ' KB';
  }

  /* ===== Envío ===== */
  private async enviar(): Promise<void> {
    if (!this.svc.disponible) return;
    this.errorEnvio.set('');
    this.enviando.set(true);
    const v = this.form.getRawValue();
    const datos = new FormData();
    (Object.keys(v) as (keyof typeof v)[]).forEach((k) => datos.append(k, String(v[k] ?? '')));
    this.archivos().forEach((f) => datos.append('archivos', f, f.name));
    try {
      this.reporte.set(await this.svc.reportar(datos));
      setTimeout(() => this.constancia()?.nativeElement.focus());
    } catch (e) {
      this.errorEnvio.set(mensajeError(e, 'No se pudo enviar el reporte. Intente de nuevo.'));
    } finally {
      this.enviando.set(false);
    }
  }

  nuevo(): void {
    this.form.reset();
    this.archivos.set([]);
    this.intentados.set(new Set());
    this.reporte.set(null);
    this.paso.set(0);
  }

  imprimir(): void {
    window.print();
  }
}
