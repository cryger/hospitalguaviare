import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MenuService } from '../../../shared/services/menu/menu.service';
import { MenuItem } from '../../../shared/models/menu/menu.model/menu.model-module';

@Component({
  selector: 'app-edicion-menu-admin',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './edicion-menu-admin.html',
  styleUrl: './edicion-menu-admin.css',
})
export class EdicionMenuAdmin implements OnInit {
  form!: FormGroup;
  items: MenuItem[] = [];
  modalOpen = false;

  constructor(
    private fb: FormBuilder,
    private menuService: MenuService
  ) {}

  ngOnInit(): void {
    this.form = this.fb.group({
      label: ['', Validators.required],
      route: [''],
      parentId: [null],
      activo: [true]
    });

    this.cargar();
  }

  cargar(): void {
    this.items = this.menuService.getAll();
  }

  abrirModal(): void {
    this.form.reset({ activo: true, parentId: null });
    this.modalOpen = true;
  }

  guardar(): void {
    if (this.form.invalid) return;

    this.menuService.crear({
      ...this.form.value,
      orden: this.items.length + 1
    });

    this.modalOpen = false;
    this.cargar();
  }

  eliminar(id: number): void {
    if (!confirm('¿Eliminar este elemento del menú?')) return;
    this.menuService.eliminar(id);
    this.cargar();
  }

  get principales(): MenuItem[] {
    return this.items.filter(i => !i.parentId);
  }

  subItems(parentId: number): MenuItem[] {
    return this.items.filter(i => i.parentId === parentId);
  }

}
