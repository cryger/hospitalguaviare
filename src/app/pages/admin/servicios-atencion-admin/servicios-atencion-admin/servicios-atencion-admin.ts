import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { ServiciosAtencionService } from '../../../../shared/services/servicios-atencion/servicios-atencion';
import { CategoriaServicio, Servicio } from '../../../../shared/models/servicios-atencion/servicios-atencion/servicios-atencion-module';



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

  constructor(
  private fb: FormBuilder,
  private serviciosAtencionService: ServiciosAtencionService
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
    this.categorias = this.serviciosAtencionService.getCategoriasActivas();
    this.servicios = this.serviciosAtencionService.getServiciosActivos();
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

  // ✅ PASO 3: persistir
  this.serviciosAtencionService.guardarCategorias(this.categorias);

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

    this.serviciosAtencionService.guardarServicios(this.servicios);
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
