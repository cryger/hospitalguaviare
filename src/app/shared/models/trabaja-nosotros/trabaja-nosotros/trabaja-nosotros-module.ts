import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';



@NgModule({
  declarations: [],
  imports: [
    CommonModule
  ]
})
export class TrabajaNosotrosModule {


 }

  export interface Vacante {
  id: number;
  titulo: string;
  tipoContrato: 'prestacion de servicios' | 'Termino Definido' | 'Termino Indefinido';
  vacantes: number;
  salario: string;
  horario: string;
  ubicacion: string;
  descripcion: string;
  requisitos: string[];
  imagenUrl: string;
  fechaPublicacion: Date;
  estado: 'publicada' | 'borrador';
}
