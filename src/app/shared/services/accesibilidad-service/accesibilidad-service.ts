import { Injectable } from '@angular/core';
import { AccesibilidadItem } from '../../models/accesibilidad-model/accesibilidad-model/accesibilidad-model-module';

@Injectable({ providedIn: 'root' })
export class AccesibilidadService {

  private storageKey = 'accesibilidad-menu';

  private items: AccesibilidadItem[] = [];

  constructor() {
    this.items = JSON.parse(
      localStorage.getItem(this.storageKey) || '[]'
    );
  }

  getAll(): AccesibilidadItem[] {
    return [...this.items];
  }

  getActivos(): AccesibilidadItem[] {
    return this.items.filter(i => i.activo);
  }

  guardar(items: AccesibilidadItem[]): void {
    this.items = [...items];
    localStorage.setItem(this.storageKey, JSON.stringify(this.items));
    this.generarCSS();
  }

  /*========== admin =========*/




  private generarCSS(): void {
    const css = this.items.map(i => `
.accessibility-btn-${i.id} {
  background: ${i.css.backgroundColor};
  color: ${i.css.color};
  border-radius: ${i.css.borderRadius};
}
`).join('\n');

    localStorage.setItem('accessibility-css', css);
  }
}
