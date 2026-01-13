import { Injectable } from '@angular/core';
import { MenuItem } from '../../models/menu/menu.model/menu.model-module';

@Injectable({ providedIn: 'root' })
export class MenuService {

  private storageKey = 'menu-items';
  private items: MenuItem[] = [];

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.items = saved ? JSON.parse(saved) : [];
  }

  private save(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.items));
  }

  getAll(): MenuItem[] {
    return [...this.items];
  }

  crear(data: Omit<MenuItem, 'id'>): void {
    this.items.push({
      ...data,
      id: Date.now()
    });
    this.save();
  }

  actualizar(id: number, data: Partial<MenuItem>): void {
    const index = this.items.findIndex(i => i.id === id);
    if (index === -1) return;

    this.items[index] = {
      ...this.items[index],
      ...data
    };
    this.save();
  }

  eliminar(id: number): void {
    // elimina hijos también
    this.items = this.items.filter(i => i.id !== id && i.parentId !== id);
    this.save();
  }
}
