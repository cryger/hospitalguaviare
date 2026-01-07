import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NoticiasService } from '../../../shared/services/noticias/noticias';
import { Noticia } from '../../../shared/models/noticias/noticias/noticias-module';




@Component({
  selector: 'app-noticias-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './noticias.html',
  styleUrls: ['./noticias.css']
})
export class NoticiasAdminComponent implements OnInit {

  form!: FormGroup;
  noticias: Noticia[] = [];
  previewOpen = false;

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

  //Sirve para previsualizar el contenido de las noticias en el dashboard Noticias antes de agregarla
  get previewData() {
  if (!this.form) return null;

  return {
    titulo: this.form.value.titulo,
    resumen: this.form.value.resumen,
    contenido: this.form.value.contenido,
    autor: this.form.value.autor,
    fecha: new Date(),
    imagen: this.form.value.imagenUrl || 'assets/noticias/default.jpg'
  };
}

abrirPreview(): void {
  this.previewOpen = true;
}

cerrarPreview(): void {
  this.previewOpen = false;
}
}
