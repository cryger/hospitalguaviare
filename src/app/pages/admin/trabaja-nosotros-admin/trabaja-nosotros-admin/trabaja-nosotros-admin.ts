import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { TrabajaNosotrosService } from '../../../../shared/services/trabaja-nosotros/trabaja-nosotros-service';
import { Vacante } from '../../../../shared/models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';

@Component({
  selector: 'app-trabaja-nosotros-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './trabaja-nosotros-admin.html',
  styleUrls: ['./trabaja-nosotros-admin.css']
})
export class TrabajaNosotrosAdminComponent implements OnInit {

  vacantes: Vacante[] = [];
  form!: FormGroup;

  modalOpen = false;
  editando: Vacante | null = null;

  constructor(
    private fb: FormBuilder,
    private service: TrabajaNosotrosService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      titulo: ['', Validators.required],
      tipoContrato: ['', Validators.required],
      vacantes: [1, Validators.required],
      salario: ['', Validators.required],
      horario: ['', Validators.required],
      ubicacion: ['', Validators.required],
      descripcion: ['', Validators.required],
      requisitos: ['', Validators.required],
      imagenUrl: [''],
      estado: ['publicada']
    });

    this.cargar();
  }

  cargar(): void {
    this.vacantes = this.service.getAll();
  }

  abrirCrear(): void {
    this.editando = null;
    this.form.reset({ estado: 'publicada' });
    this.modalOpen = true;
  }

  editar(v: Vacante): void {
    this.editando = v;
    this.form.patchValue({
      ...v,
      requisitos: v.requisitos.join('\n')
    });
    this.modalOpen = true;
  }

  guardar(): void {
    if (this.form.invalid) return;

    const data = {
      ...this.form.value,
      requisitos: this.form.value.requisitos.split('\n')
    };

    if (this.editando) {
      this.service.actualizar(this.editando.id, data);
    } else {
      this.service.crear(data);
    }

    this.modalOpen = false;
    this.cargar();
  }

  eliminar(id: number): void {
    if (confirm('¿Eliminar vacante?')) {
      this.service.eliminar(id);
      this.cargar();
    }
  }
}
