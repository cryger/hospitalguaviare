import { Component, inject, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { TrabajaNosotrosService } from '../../../../shared/services/trabaja-nosotros/trabaja-nosotros-service';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { Vacante } from '../../../../shared/models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';

@Component({
  selector: 'app-trabaja-nosotros-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './trabaja-nosotros-admin.html',
  styleUrls: ['./trabaja-nosotros-admin.css']
})
export class TrabajaNosotrosAdminComponent implements OnInit {
  readonly service = inject(TrabajaNosotrosService);
  private cms = inject(CmsService);
  private fb = inject(FormBuilder);

  form!: FormGroup;
  readonly modalOpen = signal(false);
  readonly editando = signal<Vacante | null>(null);
  readonly guardando = signal(false);
  readonly subiendo = signal<'imagen' | 'documento' | null>(null);
  readonly mensaje = signal<string | null>(null);
  readonly filtro = signal<'todas' | 'publicada' | 'borrador' | 'cerrada'>('todas');

  ngOnInit(): void {
    this.form = this.fb.group({
      titulo: ['', Validators.required],
      tipoContrato: ['Prestación de servicios', Validators.required],
      vacantes: [1, [Validators.required, Validators.min(1)]],
      salario: [''],
      horario: [''],
      ubicacion: ['ESE Hospital San José del Guaviare. Departamento del Guaviare.'],
      descripcion: ['', Validators.required],
      requisitos: [''],
      imagenUrl: [''],
      documentoUrl: [''],
      fechaCierre: [''],
      estado: ['publicada'],
    });
    this.service.cargar(true);
  }

  vacantesFiltradas(): Vacante[] {
    const f = this.filtro();
    return this.service.vacantes().filter((v) => f === 'todas' || v.estado === f);
  }

  contar(estado: Vacante['estado']): number {
    return this.service.vacantes().filter((v) => v.estado === estado).length;
  }

  abrirCrear(): void {
    this.editando.set(null);
    this.form.reset({
      tipoContrato: 'Prestación de servicios',
      vacantes: 1,
      ubicacion: 'ESE Hospital San José del Guaviare. Departamento del Guaviare.',
      estado: 'publicada',
    });
    this.modalOpen.set(true);
  }

  editar(v: Vacante): void {
    this.editando.set(v);
    this.form.patchValue({
      ...v,
      requisitos: (v.requisitos || []).join('\n'),
      fechaCierre: v.fechaCierre ? String(v.fechaCierre).slice(0, 10) : '',
    });
    this.modalOpen.set(true);
  }

  async subir(ev: Event, campo: 'imagen' | 'documento'): Promise<void> {
    const input = ev.target as HTMLInputElement;
    const archivo = input.files?.[0];
    input.value = '';
    if (!archivo) return;
    this.subiendo.set(campo);
    const [m] = await this.cms.subirArchivos([archivo]);
    this.subiendo.set(null);
    if (m) this.form.patchValue(campo === 'imagen' ? { imagenUrl: m.url } : { documentoUrl: m.url });
    else this.mensaje.set(this.cms.error() || 'No se pudo subir el archivo.');
  }

  async guardar(): Promise<void> {
    if (this.form.invalid || this.guardando()) {
      this.form.markAllAsTouched();
      return;
    }
    const v = this.form.value;
    const data: Partial<Vacante> = {
      ...v,
      vacantes: Number(v.vacantes) || 1,
      requisitos: String(v.requisitos || '').split('\n').map((r: string) => r.trim()).filter(Boolean),
      fechaCierre: v.fechaCierre ? new Date(v.fechaCierre + 'T23:59:00').toISOString() : null,
    };
    this.guardando.set(true);
    try {
      const actual = this.editando();
      if (actual) await this.service.actualizar(actual.id, data);
      else await this.service.crear(data);
      this.modalOpen.set(false);
      this.mensaje.set(actual ? 'Vacante actualizada.' : 'Vacante creada.');
    } catch {
      this.mensaje.set('No se pudo guardar la vacante. Intente de nuevo.');
    } finally {
      this.guardando.set(false);
    }
  }

  async cambiarEstado(v: Vacante, estado: Vacante['estado']): Promise<void> {
    await this.service.actualizar(v.id, { estado });
  }

  async eliminar(v: Vacante): Promise<void> {
    if (!confirm(`¿Eliminar la vacante "${v.titulo}"?`)) return;
    await this.service.eliminar(v.id);
  }
}
