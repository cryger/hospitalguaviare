import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NoticiasService } from '../../../shared/services/noticias/noticias';
import { Noticia } from '../../../shared/models/noticias/noticias/noticias-module';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-noticias-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, FormsModule],
  templateUrl: './noticias.html',
  styleUrls: ['./noticias.css']
})
export class NoticiasAdminComponent implements OnInit {

  /* =========================
     FORMULARIO
  ========================== */
  form!: FormGroup;

  /* =========================
     DATA
  ========================== */
  noticias: Noticia[] = [];

  /* =========================
     UI STATE
  ========================== */
  crearOpen = false;
  previewOpen = false;
  filtro = '';

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

  /* =========================
     CRUD BÁSICO
  ========================== */

  cargar(): void {
    this.noticias = this.noticiasService.getAll();
  }

  guardar(): void {
    if (this.form.invalid) return;

    this.noticiasService.crear(this.form.value);
    this.form.reset({ estado: 'publicada' });
    this.cerrarModalCrear();
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

  /* =========================
     FILTRO LISTADO
  ========================== */

  get noticiasFiltradas(): Noticia[] {
    if (!this.filtro) return this.noticias;

    return this.noticias.filter(n =>
      n.titulo.toLowerCase().includes(this.filtro.toLowerCase()) ||
      n.autor.toLowerCase().includes(this.filtro.toLowerCase())
    );
  }
  get totalNoticias(): number {
  return this.noticias.length;
}

get totalPublicadas(): number {
  return this.noticias.filter(n => n.estado === 'publicada').length;
}

get totalBorradores(): number {
  return this.noticias.filter(n => n.estado === 'borrador').length;
}


  /* =========================
     MODAL CREAR
  ========================== */

  abrirModalCrear(): void {
    this.crearOpen = true;
  }

  cerrarModalCrear(): void {
    this.crearOpen = false;
    this.form.reset({ estado: 'publicada' });
  }

  /* =========================
     PREVIEW
  ========================== */

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
