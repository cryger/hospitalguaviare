import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

interface CategoriaServicio {
  id: number;
  nombre: string;
  parentId?: number | null;
  activo: boolean;
}

interface Servicio {
  id: number;
  categoriaId: number;
  titulo: string;
  descripcion: string;
  ruta?: string;
  activo: boolean;
}

@Component({
  selector: 'app-servicios-atencion-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './servicios-atencion-admin.html',
  styleUrls: ['./servicios-atencion-admin.css']
})
export class ServiciosAtencionAdmin implements OnInit {

  /* =========================
     DATA
  ========================== */

  categorias: CategoriaServicio[] = [];
  servicios: Servicio[] = [];

  /* =========================
     FORMULARIOS
  ========================== */

  formCategoria!: FormGroup;
  formServicio!: FormGroup;

  /* =========================
     UI STATE
  ========================== */

  modalCategoriaOpen = false;
  modalServicioOpen = false;

  categoriaEditando: CategoriaServicio | null = null;
  servicioEditando: Servicio | null = null;

  constructor(private fb: FormBuilder) {}

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
    // TEMPORAL (luego servicio/API)
    this.categorias = [
      { id: 1, nombre: 'Canales oficiales', activo: true },
      { id: 2, nombre: 'Solicitud de citas', activo: true },
      { id: 3, nombre: 'Información de interés', activo: true }
    ];

    this.servicios = [];
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

  editarCategoria(cat: CategoriaServicio): void {
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

    this.cerrarModalCategoria();
  }

  cerrarModalCategoria(): void {
    this.modalCategoriaOpen = false;
    this.categoriaEditando = null;
  }

  eliminarCategoria(id: number): void {
    this.categorias = this.categorias.filter(c => c.id !== id);
    this.servicios = this.servicios.filter(s => s.categoriaId !== id);
  }

  /* =========================
     SERVICIOS
  ========================== */

  abrirModalServicio(): void {
    this.modalServicioOpen = true;
    this.servicioEditando = null;
    this.formServicio.reset({ activo: true });
  }

  editarServicio(serv: Servicio): void {
    this.servicioEditando = serv;
    this.modalServicioOpen = true;

    this.formServicio.patchValue(serv);
  }

  guardarServicio(): void {
    if (this.formServicio.invalid) return;

    if (this.servicioEditando) {
      Object.assign(this.servicioEditando, this.formServicio.value);
    } else {
      this.servicios.push({
        id: Date.now(),
        ...this.formServicio.value
      });
    }

    this.cerrarModalServicio();
  }

  cerrarModalServicio(): void {
    this.modalServicioOpen = false;
    this.servicioEditando = null;
  }

  eliminarServicio(id: number): void {
    this.servicios = this.servicios.filter(s => s.id !== id);
  }

}
