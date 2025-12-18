import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
    imports: [CommonModule, FormsModule],
  templateUrl: './login.html',
  styleUrls: ['./login.css']
})
export class Login {

  tipoPersona: 'natural' | 'juridica' = 'natural';

  // Persona natural
  tipoAccesoNatural = '';
  valorAcceso = '';
  labelAcceso = '';

  // Persona juridica
  tipoAccesoJuridica = '';
  documentoJuridico = '';
  nit = '';
  dv = '';

  onTipoPersonaChange(): void {
    this.resetForm();
  }

  onTipoAccesoChange(): void {
    const labels: any = {
      email: 'Correo electrónico',
      cc: 'Cédula de ciudadanía',
      ce: 'Cédula de extranjería',
      ti: 'Tarjeta de identidad',
      pep: 'Permiso especial de permanencia'
    };
    this.labelAcceso = labels[this.tipoAccesoNatural] || '';
    this.valorAcceso = '';
  }

  resetForm(): void {
    this.tipoAccesoNatural = '';
    this.valorAcceso = '';
    this.tipoAccesoJuridica = '';
    this.documentoJuridico = '';
    this.nit = '';
    this.dv = '';
  }

  formValido(): boolean {
    if (this.tipoPersona === 'natural') {
      return !!this.tipoAccesoNatural && !!this.valorAcceso;
    }

    if (this.tipoPersona === 'juridica') {
      return !!this.tipoAccesoJuridica &&
             !!this.documentoJuridico &&
             this.nit.length === 9 &&
             this.dv.length === 1;
    }

    return false;
  }
}
