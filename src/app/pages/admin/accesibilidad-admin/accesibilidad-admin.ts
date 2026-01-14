import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { AccesibilidadService } from '../../../shared/services/accesibilidad-service/accesibilidad-service';
import { AccesibilidadItem } from '../../../shared/models/accesibilidad-model/accesibilidad-model/accesibilidad-model-module';

@Component({
  standalone: true,
  selector: 'app-accesibilidad-admin',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './accesibilidad-admin.html',
  styleUrls: ['./accesibilidad-admin.css']
})
export class AccesibilidadAdmin implements OnInit {

  items: AccesibilidadItem[] = [];
  form!: FormGroup;
  modalOpen = false;
  editando: AccesibilidadItem | null = null;

  constructor(
    private fb: FormBuilder,
    private accesibilidadService: AccesibilidadService
  ) {}

  ngOnInit(): void {
    this.items = this.accesibilidadService.getAll();
    this.accesibilidadService.getActivos();

    this.form = this.fb.group({
      titulo: ['', Validators.required],
      tipo: ['enlace', Validators.required],
      url: [''],
      icono: [''],
      activo: [true],
      css: this.fb.group({
        backgroundColor: ['#004884'],
        color: ['#ffffff'],
        borderRadius: ['4px']
      })
    });
  }

  abrirModal(item?: AccesibilidadItem): void {
    this.modalOpen = true;
    this.editando = item || null;

    if (item) {
      this.form.patchValue(item);
    } else {
      this.form.reset({
        tipo: 'enlace',
        activo: true,
        css: {
          backgroundColor: '#004884',
          color: '#ffffff',
          borderRadius: '4px'
        }
      });
    }
  }

  guardar(): void {
    if (this.form.invalid) return;

    if (this.editando) {
      Object.assign(this.editando, this.form.value);
    } else {
      this.items.push({
        id: Date.now(),
        ...this.form.value
      });
    }

    this.accesibilidadService.guardar(this.items);
    this.modalOpen = false;
  }

  eliminar(id: number): void {
    this.items = this.items.filter(i => i.id !== id);
    this.accesibilidadService.guardar(this.items);
  }
}
