import { Component, inject, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CotizacionesService } from '../../../../shared/services/cotizaciones/cotizaciones';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { Cotizacion, EstadoCotizacion } from '../../../../shared/models/cotizacion/cotizacion/cotizacion-module';

@Component({
  selector: 'app-cotizaciones-propuestas-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './cotizaciones-propuestas-admin.html',
  styleUrls: ['./cotizaciones-propuestas-admin.css'],
})
export class CotizacionesPropuestasAdminComponent implements OnInit {
  readonly service = inject(CotizacionesService);
  private cms = inject(CmsService);
  private fb = inject(FormBuilder);

  form!: FormGroup;
  readonly modalOpen = signal(false);
  readonly editando = signal<Cotizacion | null>(null);
  readonly guardando = signal(false);
  readonly subiendo = signal(false);
  readonly mensaje = signal<string | null>(null);
  readonly filtro = signal<'todas' | EstadoCotizacion>('todas');

  ngOnInit(): void {
    this.form = this.fb.group({
      titulo: ['', Validators.required],
      descripcion: ['', Validators.required],
      dependencia: ['Subgerencia Administrativa y Financiera'],
      documentoUrl: [''],
      documentoNombre: [''],
      fechaPublicacion: [''],
      fechaCierre: [''],
      estado: ['publicada'],
    });
    this.service.cargar(true);
  }

  filtradas(): Cotizacion[] {
    const f = this.filtro();
    return this.service.cotizaciones().filter((c) => f === 'todas' || c.estado === f);
  }

  contar(estado: EstadoCotizacion): number {
    return this.service.cotizaciones().filter((c) => c.estado === estado).length;
  }

  abrirCrear(): void {
    this.editando.set(null);
    this.form.reset({
      dependencia: 'Subgerencia Administrativa y Financiera',
      fechaPublicacion: this.aFechaInput(new Date().toISOString()),
      estado: 'publicada',
    });
    this.modalOpen.set(true);
  }

  editar(c: Cotizacion): void {
    this.editando.set(c);
    this.form.reset({
      ...c,
      fechaPublicacion: this.aFechaInput(c.fechaPublicacion),
      fechaCierre: this.aFechaInput(c.fechaCierre),
    });
    this.modalOpen.set(true);
  }

  async subir(ev: Event): Promise<void> {
    const input = ev.target as HTMLInputElement;
    const archivo = input.files?.[0];
    input.value = '';
    if (!archivo) return;
    this.subiendo.set(true);
    const [m] = await this.cms.subirArchivos([archivo]);
    this.subiendo.set(false);
    if (m) this.form.patchValue({ documentoUrl: m.url, documentoNombre: archivo.name });
    else this.mensaje.set(this.cms.error() || 'No se pudo subir el archivo.');
  }

  async guardar(): Promise<void> {
    if (this.form.invalid || this.guardando()) {
      this.form.markAllAsTouched();
      return;
    }
    const v = this.form.value;
    const data: Partial<Cotizacion> = {
      ...v,
      fechaPublicacion: v.fechaPublicacion ? new Date(v.fechaPublicacion + 'T12:00:00').toISOString() : new Date().toISOString(),
      fechaCierre: v.fechaCierre ? new Date(v.fechaCierre + 'T23:59:00').toISOString() : null,
    };
    this.guardando.set(true);
    try {
      const actual = this.editando();
      if (actual) await this.service.actualizar(actual.id, data);
      else await this.service.crear(data);
      this.modalOpen.set(false);
      this.mensaje.set(actual ? 'Invitación actualizada.' : 'Invitación creada.');
    } catch {
      this.mensaje.set('No se pudo guardar la invitación. Intente de nuevo.');
    } finally {
      this.guardando.set(false);
    }
  }

  async cambiarEstado(c: Cotizacion, estado: EstadoCotizacion): Promise<void> {
    await this.service.actualizar(c.id, { estado });
  }

  async eliminar(c: Cotizacion): Promise<void> {
    if (!confirm(`¿Eliminar la invitación "${c.titulo}"?`)) return;
    await this.service.eliminar(c.id);
  }

  private aFechaInput(f?: string | Date | null): string {
    if (!f) return '';
    const d = new Date(f);
    return isNaN(d.getTime()) ? '' : d.toISOString().slice(0, 10);
  }
}
