import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { NoticiasService } from '../../../shared/services/noticias/noticias';
import { Noticia} from '../../../shared/models/noticias/noticias/noticias-module';
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
  Noticia: any;

  modoEdicion = false;
  noticiaEditandoId: number | null = null;

  eliminarOpen = false;
  noticiaEliminarId: number | null = null;

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

  if (this.modoEdicion && this.noticiaEditandoId !== null) {
    // 🔄 ACTUALIZAR
    this.noticiasService.actualizar(
      this.noticiaEditandoId,
      this.form.value
    );
  } else {
    // ➕ CREAR
    this.noticiasService.crear(this.form.value);
  }

  this.resetFormulario();
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

  /*==========================
    acciones sobre la noticia
    =======================*/

  editarNoticia(id:number):void{
    const noticia = this.noticias.find(n => n.id === id);

    if (!noticia) return;

    this.modoEdicion = true;
    this.noticiaEditandoId = id;

    this.form.patchValue({
      titulo: noticia.titulo,
      resumen: noticia.resumen,
      contenido: noticia.contenido,
      autor: noticia.autor,
      imagenUrl: noticia.imagenUrl,
      estado: noticia.estado
    });

    this.crearOpen = true; // abre el modal
  }

  resetFormulario(): void {
  this.form.reset({ estado: 'publicada' });
  this.crearOpen = false;
  this.modoEdicion = false;
  this.noticiaEditandoId = null;
}

  eliminarNoticia(id: number): void {
  this.noticiaEliminarId = id;
  this.eliminarOpen = true;
}

confirmarEliminacion(): void {
  if (this.noticiaEliminarId === null) return;

  this.noticiasService.eliminar(this.noticiaEliminarId);
  this.cargar();

  this.cerrarModalEliminar();
}

cerrarModalEliminar(): void {
  this.eliminarOpen = false;
  this.noticiaEliminarId = null;
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
    this.resetFormulario();
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
