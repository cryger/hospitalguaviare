import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MenuService } from '../../../shared/services/menu/menu.service';
import { MenuItem } from '../../../shared/models/menu/menu.model/menu.model-module';

@Component({
  selector: 'app-editar-menu-admin',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './edicion-menu-admin.html',
  styleUrls: ['./edicion-menu-admin.css']
})
export class EdicionMenuAdmin implements OnInit {

  form!: FormGroup;
  menus: MenuItem[] = [];
  modalOpen = false;
  editando: MenuItem | null = null;

  constructor(
    private fb: FormBuilder,
    private menuService: MenuService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      label: ['', Validators.required],
      route: ['', Validators.required],
      parentId: [null],
      activo: [true]
    });

    this.cargarMenus();
  }

  cargarMenus(): void {
    this.menus = this.menuService.getAll();
  }

  guardar(): void {
  if (this.form.invalid) return;

  if (this.editando) {
    this.menuService.actualizar(this.editando.id, this.form.value);
  } else {
    this.menuService.crear(this.form.value);
  }

  this.cerrarModal();
  this.cargarMenus();
}


  editar(menu: MenuItem): void {
  this.editando = menu;
  this.modalOpen = true;

  this.form.patchValue({
    label: menu.label,
    route: menu.route,
    parentId: menu.parentId,
    activo: menu.activo
  });
}


  eliminar(id: number): void {
    const ok = confirm('¿Está seguro de eliminar este elemento del menú?');
    if (!ok) return;

    this.menuService.eliminar(id);
    this.cargarMenus();
  }

  resetForm(): void {
    this.editando = null;
    this.form.reset({
      parentId: null,
      activo: true
    });
  }

  get menusPrincipales(): MenuItem[] {
    return this.menus.filter(m => m.parentId === null);
  }

  abrirModal():void{
    this.modalOpen = true;
    this.editando = null;

    this.form.reset({
      parentId: null,
      activo:true
    });
  }

  cerrarModal():void{
    this.modalOpen = false;
    this.editando = null;

    this.form.reset({
      parentId: null,
      activo:true
    });
  }
}
