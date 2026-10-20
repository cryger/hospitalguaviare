import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { MenuItem } from '../../../shared/models/menu/menu.model/menu.model-module';

@Injectable({ providedIn: 'root' })
export class MenuService {

  private storageKey = 'menu-data';

  private data: MenuItem[] = [];
  private menu$ = new BehaviorSubject<MenuItem[]>([]);

  constructor() {
    const saved = localStorage.getItem(this.storageKey);
    this.data = saved ? JSON.parse(saved) : [];
    this.menu$.next(this.data);
  }

  getAll(): MenuItem[] {
    return [...this.data];
  }

  menuChanges() {
    return this.menu$.asObservable();
  }

  crear(item: Omit<MenuItem, 'id'>): void {
    this.data.push({
      ...item,
      id: Date.now()
    });
    this.save();
  }

  actualizar(id: number, data: Partial<MenuItem>): void {
    const i = this.data.findIndex(x => x.id === id);
    if (i !== -1) {
      this.data[i] = { ...this.data[i], ...data };
      this.save();
    }
  }

  eliminar(id: number): void {
    this.data = this.data.filter(
      x => x.id !== id && x.parentId !== id
    );
    this.save();
  }

  private save(): void {
    localStorage.setItem(this.storageKey, JSON.stringify(this.data));
    this.menu$.next(this.data);
  }
}
