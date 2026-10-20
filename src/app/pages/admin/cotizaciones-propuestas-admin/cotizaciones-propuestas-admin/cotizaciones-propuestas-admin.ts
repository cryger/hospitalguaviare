import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { CotizacionesService } from '../../../../shared/services/cotizaciones/cotizaciones';
import { Cotizacion } from '../../../../shared/models/cotizacion/cotizacion/cotizacion-module';

type ModalModo = 'crear' | 'editar' | 'preview';

@Component({
  selector: 'app-cotizaciones-propuestas-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './cotizaciones-propuestas-admin.html',
  styleUrls: ['./cotizaciones-propuestas-admin.css']
})
export class CotizacionesPropuestasAdminComponent implements OnInit {

  /* =========================
     FORM
  ========================== */
  form!: FormGroup;
  archivoSeleccionado: File | null = null;

  /* =========================
     DATA
  ========================== */
  cotizaciones: Cotizacion[] = [];
  cotizacionSeleccionada: Cotizacion | null = null;

  /* =========================
     UI STATE
  ========================== */
  modalOpen = false;
  modalModo: ModalModo = 'crear';

  constructor(
    private fb: FormBuilder,
    private cotizacionesService: CotizacionesService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      titulo: ['', Validators.required],
      descripcion: ['', Validators.required],
      estado: ['publicada', Validators.required]
    });

    this.cargar();
  }

  /* =========================
     CRUD
  ========================== */

  cargar(): void {
    this.cotizaciones = this.cotizacionesService.getAll();
  }

  guardar(): void {
    if (this.form.invalid) return;

    // CREAR
    if (this.modalModo === 'crear') {
      if (!this.archivoSeleccionado) return;

      this.cotizacionesService.crear({
        ...this.form.value,
        archivoNombre: this.archivoSeleccionado.name,
        archivoTipo: this.archivoSeleccionado.type,
        archivoUrl: URL.createObjectURL(this.archivoSeleccionado)
      });
    }

    // EDITAR
    if (this.modalModo === 'editar' && this.cotizacionSeleccionada) {
      this.cotizacionesService.actualizar(
        this.cotizacionSeleccionada.id,
        this.form.value
      );
    }

    this.cerrarModal();
    this.cargar();
  }

  eliminar(id: number): void {
  const confirmar = confirm(
    '¿Está seguro de que desea eliminar esta cotización?'
  );

  if (!confirmar) {
    return;
  }

  this.cotizacionesService.eliminar(id);
  this.cargar();
}


  /* =========================
     MODAL CONTROL
  ========================== */

  abrirCrear(): void {
    this.modalModo = 'crear';
    this.cotizacionSeleccionada = null;
    this.form.reset({ estado: 'publicada' });
    this.archivoSeleccionado = null;
    this.modalOpen = true;
  }

  abrirEditar(c: Cotizacion): void {
    this.modalModo = 'editar';
    this.cotizacionSeleccionada = c;

    this.form.patchValue({
      titulo: c.titulo,
      descripcion: c.descripcion,
      estado: c.estado
    });

    this.modalOpen = true;
  }

  abrirPreview(c: Cotizacion): void {
    this.modalModo = 'preview';
    this.cotizacionSeleccionada = c;
    this.modalOpen = true;
  }

  cerrarModal(): void {
    this.modalOpen = false;
    this.cotizacionSeleccionada = null;
    this.archivoSeleccionado = null;
    this.form.reset({ estado: 'publicada' });
  }

  /* =========================
     FILE
  ========================== */

  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length) {
      this.archivoSeleccionado = input.files[0];
    }
  }

  /* =========================
     HELPERS
  ========================== */

  esPreview(): boolean {
    return this.modalModo === 'preview';
  }

  esEditar(): boolean {
    return this.modalModo === 'editar';
  }
}
