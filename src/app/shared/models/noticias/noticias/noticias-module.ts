import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class NoticiasModule { }

export interface Noticia {
  id: number;
  titulo: string;
  resumen: string;
  contenido: string;
  fechaPublicacion: Date;
  autor: string;
  imagenUrl?: string;
  estado: 'borrador' | 'publicada' | 'archivada';
}
