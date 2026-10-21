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

export type EstadoVacante = 'publicada' | 'borrador' | 'cerrada';

export interface Vacante {
  id: number;
  titulo: string;
  tipoContrato: string;
  vacantes: number;
  salario: string;
  horario: string;
  ubicacion: string;
  descripcion: string;
  requisitos: string[];
  imagenUrl: string;
  /** PDF con los requisitos / términos de la convocatoria */
  documentoUrl?: string;
  fechaPublicacion: string | Date;
  fechaCierre?: string | null;
  estado: EstadoVacante;
  migradoDe?: string;
}
