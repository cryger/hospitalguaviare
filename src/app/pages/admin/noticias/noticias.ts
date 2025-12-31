import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { NoticiasService } from '../../../shared/services/noticias/noticias';
import { Noticia } from '../../../shared/models/noticias/noticias/noticias-module';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-noticias-admin',
  templateUrl: './noticias.html',
  imports: [ReactiveFormsModule,CommonModule],
  styleUrls: ['./noticias.css']
})
export class NoticiasAdminComponent implements OnInit {

  form!: FormGroup;
  noticias: Noticia[] = [];

  constructor(
    private fb: FormBuilder,
    private noticiasService: NoticiasService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      titulo: ['', Validators.required],
      resumen: ['', Validators.required],
      contenido: ['', Validators.required],
      autor: ['', Validators.required],
      imagenUrl: [''],
      estado: ['publicada']
    });

    this.cargar();
  }

  cargar(): void {
    this.noticias = this.noticiasService.getAll();
  }

  guardar(): void {
    if (this.form.invalid) return;

    this.noticiasService.crear(this.form.value);
    this.form.reset({ estado: 'publicada' });
    this.cargar();
  }

  cambiarEstado(id: number, estado: Noticia['estado']): void {
    this.noticiasService.cambiarEstado(id, estado);
    this.cargar();
  }

  eliminar(id: number): void {
    this.noticiasService.eliminar(id);
    this.cargar();
  }
}
