import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { AbstractControl, FormBuilder, ReactiveFormsModule, ValidationErrors, Validators } from '@angular/forms';
import { SliderService } from '../../../shared/services/slider/slider.service';
import { Banner, EstadoBanner, LIMITE_DESCRIPCION, LIMITE_TITULO, MEDIDA_RECOMENDADA, bannerVigente } from '../../../shared/models/slider/banner';
import { CmsMultimedia } from '../../../shared/models/cms/cms.models';
import { MediaPicker } from '../cms/shared/media-picker';
import { SliderHomeComponent } from '../../../componentes/slider-home/slider-home';
import { aIsoBogota, partesBogota } from '../../../shared/models/eventos/evento';

/** El botón necesita un enlace; las fechas deben estar en orden */
function coherencia(g: AbstractControl): ValidationErrors | null {
  const v = g.value;
  if (v.textoBoton?.trim() && !v.enlaceUrl?.trim()) return { regla: 'Para mostrar un botón escriba también el enlace.' };
  if (v.fechaInicio && v.fechaFin && v.fechaFin < v.fechaInicio) return { regla: 'La fecha final no puede ser anterior a la inicial.' };
  return null;
}

@Component({
  selector: 'app-slider-admin',
  imports: [ReactiveFormsModule, MediaPicker, SliderHomeComponent],
  templateUrl: './slider-admin.html',
  styleUrls: ['../cms/cms-admin.css', './slider-admin.css'],
})
export class SliderAdmin implements OnInit {
  readonly svc = inject(SliderService);
  private fb = inject(FormBuilder);

  readonly limiteTitulo = LIMITE_TITULO;
  readonly limiteDescripcion = LIMITE_DESCRIPCION;
  readonly medida = MEDIDA_RECOMENDADA;

  readonly modal = signal(false);
  readonly editando = signal<Banner | null>(null);
  readonly guardando = signal(false);
  readonly selector = signal<'imagenUrl' | 'imagenMovilUrl' | null>(null);
  readonly aviso = signal<{ tipo: 'ok' | 'error'; texto: string } | null>(null);
  readonly moviendo = signal(false);

  readonly enElAire = computed(() => this.svc.banners().filter((b) => bannerVigente(b)).length);

  readonly form = this.fb.nonNullable.group(
    {
      imagenUrl: ['', Validators.required],
      imagenMovilUrl: [''],
      alt: ['', [Validators.required, Validators.maxLength(300)]],
      titulo: ['', Validators.maxLength(120)],
      descripcion: ['', Validators.maxLength(250)],
      enlaceUrl: ['', Validators.pattern(/^((\/\S*)|(https?:\/\/\S+))?$/i)],
      textoBoton: ['', Validators.maxLength(60)],
      nuevaPestana: [false],
      estado: ['publicado' as EstadoBanner],
      fechaInicio: [''],
      fechaFin: [''],
    },
    { validators: coherencia },
  );

  ngOnInit(): void {
    this.svc.cargar(true);
  }

  /** Estado legible de cada diapositiva */
  situacion(b: Banner): { texto: string; clase: string } {
    if (b.estado === 'borrador') return { texto: 'Oculta', clase: 'badge-borrador' };
    const ahora = Date.now();
    if (b.fechaInicio && new Date(b.fechaInicio).getTime() > ahora) return { texto: `Programada desde ${this.fecha(b.fechaInicio)}`, clase: 'badge-info' };
    if (b.fechaFin && new Date(b.fechaFin).getTime() < ahora) return { texto: `Vencida el ${this.fecha(b.fechaFin)}`, clase: 'badge-archivada' };
    return { texto: b.fechaFin ? `Publicada hasta ${this.fecha(b.fechaFin)}` : 'Publicada', clase: 'badge-publicada' };
  }

  fecha(iso: string): string {
    const f = partesBogota(iso).fecha;
    return `${f.slice(8)}/${f.slice(5, 7)}/${f.slice(0, 4)}`;
  }

  nueva(): void {
    this.editando.set(null);
    this.form.reset({ imagenUrl: '', imagenMovilUrl: '', alt: '', titulo: '', descripcion: '', enlaceUrl: '', textoBoton: '', nuevaPestana: false, estado: 'publicado', fechaInicio: '', fechaFin: '' });
    this.modal.set(true);
  }

  editar(b: Banner): void {
    this.editando.set(b);
    this.form.reset({
      imagenUrl: b.imagenUrl,
      imagenMovilUrl: b.imagenMovilUrl ?? '',
      alt: b.alt,
      titulo: b.titulo ?? '',
      descripcion: b.descripcion ?? '',
      enlaceUrl: b.enlaceUrl ?? '',
      textoBoton: b.textoBoton ?? '',
      nuevaPestana: b.nuevaPestana,
      estado: b.estado,
      fechaInicio: b.fechaInicio ? partesBogota(b.fechaInicio).fecha : '',
      fechaFin: b.fechaFin ? partesBogota(b.fechaFin).fecha : '',
    });
    this.modal.set(true);
  }

  cerrar(): void {
    if (!this.guardando()) this.modal.set(false);
  }

  elegirImagen(lista: CmsMultimedia[]): void {
    const campo = this.selector();
    const m = lista[0];
    if (campo && m) {
      this.form.controls[campo].setValue(m.url);
      if (campo === 'imagenUrl' && !this.form.controls.alt.value.trim() && m.alt) this.form.controls.alt.setValue(m.alt);
    }
    this.selector.set(null);
  }

  async guardar(): Promise<void> {
    if (this.form.invalid) {
      this.form.markAllAsTouched();
      return;
    }
    const v = this.form.getRawValue();
    const t = (s: string) => s.trim() || null;
    const datos: Partial<Banner> = {
      imagenUrl: v.imagenUrl.trim(),
      imagenMovilUrl: t(v.imagenMovilUrl),
      alt: v.alt.trim(),
      titulo: t(v.titulo),
      descripcion: t(v.descripcion),
      enlaceUrl: t(v.enlaceUrl),
      textoBoton: t(v.textoBoton),
      nuevaPestana: v.nuevaPestana,
      estado: v.estado,
      fechaInicio: v.fechaInicio ? aIsoBogota(v.fechaInicio, '00:00') : null,
      fechaFin: v.fechaFin ? aIsoBogota(v.fechaFin, '23:59') : null,
    };
    this.guardando.set(true);
    try {
      const actual = this.editando();
      if (actual) await this.svc.actualizar(actual.id, datos);
      else await this.svc.crear(datos);
      this.aviso.set({ tipo: 'ok', texto: actual ? 'Diapositiva actualizada.' : 'Diapositiva agregada al final del slider.' });
      this.modal.set(false);
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo guardar la diapositiva. Intente de nuevo.' });
    } finally {
      this.guardando.set(false);
    }
  }

  async mover(b: Banner, delta: -1 | 1): Promise<void> {
    this.moviendo.set(true);
    try {
      await this.svc.mover(b.id, delta);
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo cambiar el orden.' });
      await this.svc.cargar(true);
    } finally {
      this.moviendo.set(false);
    }
  }

  async alternar(b: Banner): Promise<void> {
    const estado: EstadoBanner = b.estado === 'publicado' ? 'borrador' : 'publicado';
    try {
      await this.svc.actualizar(b.id, { estado });
      this.aviso.set({ tipo: 'ok', texto: estado === 'publicado' ? 'Diapositiva publicada.' : 'Diapositiva oculta (no se muestra en el inicio).' });
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo cambiar el estado.' });
    }
  }

  async eliminar(b: Banner): Promise<void> {
    if (!confirm(`¿Eliminar la diapositiva «${b.titulo || b.alt}»?\nSi solo quiere retirarla por un tiempo, use «Ocultar».`)) return;
    try {
      await this.svc.eliminar(b.id);
      this.aviso.set({ tipo: 'ok', texto: 'Diapositiva eliminada.' });
    } catch {
      this.aviso.set({ tipo: 'error', texto: 'No se pudo eliminar la diapositiva.' });
    }
  }

  error(campo: string): boolean {
    const c = this.form.get(campo);
    return !!c && c.invalid && (c.touched || c.dirty);
  }

  largo(campo: 'titulo' | 'descripcion' | 'alt'): number {
    return this.form.controls[campo].value.length;
  }
}
