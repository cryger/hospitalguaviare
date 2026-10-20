import { Component, OnInit } from '@angular/core';
import { Usuario } from '../../../shared/models/usuarios/usuarios-module';
import { CommonModule } from '@angular/common';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UsuariosService } from '../../../shared/services/usuarios/usuarios';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-usuarios',
  imports: [CommonModule,ReactiveFormsModule],
  templateUrl: './usuarios.html',
  styleUrl: './usuarios.css',
})
export class Usuarios implements OnInit {

  usuarios: Usuario[] = [];

  form!: FormGroup;
  modalOpen = false;
  editando: Usuario | null = null;

  constructor(
    private fb: FormBuilder,
    private usuariosService: UsuariosService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      nombre: ['', Validators.required],
      usuario: ['', Validators.required],
      password: ['', Validators.required],
      rol: ['funcionario', Validators.required],
      activo: [true]
    });

    this.cargar();
  }

  cargar(): void {
    this.usuarios = this.usuariosService.getAll();
  }

  abrirModal(): void {
    this.modalOpen = true;
    this.editando = null;
    this.form.reset({ rol: 'funcionario', activo: true });
  }

  editar(u: Usuario): void {
    this.editando = u;
    this.modalOpen = true;
    this.form.patchValue(u);
  }

  guardar(): void {
    if (this.form.invalid) return;

    if (this.editando) {
      this.usuariosService.actualizar(this.editando.id, this.form.value);
    } else {
      this.usuariosService.crear(this.form.value);
    }

    this.cerrarModal();
    this.cargar();
  }

  eliminar(id: number): void {
    if (!confirm('¿Eliminar este usuario?')) return;
    this.usuariosService.eliminar(id);
    this.cargar();
  }

  cerrarModal(): void {
    this.modalOpen = false;
    this.editando = null;
  }

}
