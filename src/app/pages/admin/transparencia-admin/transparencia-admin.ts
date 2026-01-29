import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { TransparenciaService } from '../../../shared/services/transparencia/transparencia';
import { CategoriaTransparencia, TransparenciaPublicaciones } from '../../../shared/models/transparencia-module/transparencia-module';



@Component({
  selector: 'app-servicios-atencion-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './transparencia-admin.html',
  styleUrls: ['./transparencia-admin.css']
})
export class transparenciaAdminComponent implements OnInit {


  /* =========================
     DATA
  ========================== */

  categorias: CategoriaTransparencia[] = [];
  publicaciones: TransparenciaPublicaciones[] = [];

  /* =========================
     FORMULARIOS
  ========================== */

  formCategoria!: FormGroup;
  formServicio!: FormGroup;

  /* =========================
     UI STATE
  ========================== */

  modalCategoriaOpen = false;
  modalPublicacionOpen = false;

  categoriaEditando: CategoriaTransparencia | null = null;
  publicacionEditando: TransparenciaPublicaciones | null = null;

  constructor(
  private fb: FormBuilder,
  private TransparenciaService: TransparenciaService
) {}


  ngOnInit(): void {
    this.initForms();
    this.cargarDatos();
  }

  /* =========================
     INIT
  ========================== */

  private initForms(): void {
    this.formCategoria = this.fb.group({
      nombre: ['', Validators.required],
      parentId: [null],
      activo: [true]
    });

    this.formServicio = this.fb.group({
      categoriaId: [null, Validators.required],
      titulo: ['', Validators.required],
      descripcion: ['', Validators.required],
      ruta: [''],
      activo: [true]
    });
  }

  private cargarDatos(): void {
    this.categorias = this.TransparenciaService.getCategoriasActivas();
    this.publicaciones = this.TransparenciaService.getPublicaciones();
  }

  /* =========================
     CATEGORÍAS
  ========================== */
  traerCategorias(categoriaId: number):string{

    const categoria = this.categorias.find(c => c.id === categoriaId);
    return categoria ? categoria.nombre : '-';

  }


  abrirModalCategoria(): void {
    this.modalCategoriaOpen = true;
    this.categoriaEditando = null;
    this.formCategoria.reset({ activo: true, parentId: null });
  }

  editarCategoria(cat: CategoriaTransparencia): void {
    this.categoriaEditando = cat;
    this.modalCategoriaOpen = true;

    this.formCategoria.patchValue(cat);
  }

 guardarCategoria(): void {
  if (this.formCategoria.invalid) return;

  if (this.categoriaEditando) {
    Object.assign(this.categoriaEditando, this.formCategoria.value);
  } else {
    this.categorias.push({
      id: Date.now(),
      ...this.formCategoria.value
    });
  }

  // ✅ PASO 3: persistir
  this.TransparenciaService.guardarCategorias(this.categorias);

  this.cerrarModalCategoria();
}


  cerrarModalCategoria(): void {
    this.modalCategoriaOpen = false;
    this.categoriaEditando = null;
  }

  eliminarCategoria(id: number): void {
    this.categorias = this.categorias.filter(c => c.id !== id);
    this.publicaciones = this.publicaciones.filter(s => s.categoriaId !== id);
  }

  /* =========================
     SERVICIOS
  ========================== */

  abrirModalPublicacion(): void {
    this.modalPublicacionOpen = true;
    this.publicacionEditando = null;
    this.formServicio.reset({ activo: true });
  }

  editarPublicacion(serv: TransparenciaPublicaciones): void {
    this.publicacionEditando = serv;
    this.modalPublicacionOpen = true;

    this.formServicio.patchValue(serv);
  }

  guardarPublicacion(): void {
    if (this.formServicio.invalid) return;

    if (this.publicacionEditando) {
      Object.assign(this.publicacionEditando, this.formServicio.value);
    } else {
      this.publicaciones.push({
        id: Date.now(),
        ...this.formServicio.value
      });
    }

    this.TransparenciaService.guardarPublicaciones(this.publicaciones);
  this.cerrarModalPublicacion();
  }

  cerrarModalPublicacion(): void {
    this.modalPublicacionOpen = false;
    this.publicacionEditando = null;
  }

  eliminarPublicacion(id: number): void {
    this.publicaciones = this.publicaciones.filter(s => s.id !== id);
  }

}
