import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NoticiasPublicComponent } from '../../../../pages/noticias/noticias';
import { ReactiveFormsModule } from '@angular/forms';



@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    NoticiasPublicComponent,
    ReactiveFormsModule
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
