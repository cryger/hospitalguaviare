import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { PqrsfService } from '../../shared/services/pqrsf/pqrsf';


@Component({
  selector: 'app-pqrsf',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './pqrsf.html',
  styleUrls: ['./pqrsf.css']
})
export class PqrsfComponent {

  form: FormGroup;
  enviado = false;
  archivos: String[] = [];

  constructor(
    private fb: FormBuilder,
    private pqrsfService: PqrsfService
  ) {
    this.form = this.fb.group({
      tipo: ['Petición', Validators.required],
      nombre: ['', Validators.required],
      correo: ['', [Validators.required, Validators.email]],
      telefono: [''],
      asunto: ['', Validators.required],
      mensaje: ['', Validators.required]
    });
  }

  onFileChange(event: any): void {
  const file = event.target.files[0];
  if (!file) return;

  const reader = new FileReader();
  reader.onload = () => {
    this.archivos.push(reader.result as string);
  };
  reader.readAsDataURL(file);
}

  enviar(): void {
    if (this.form.invalid) return;


    this.pqrsfService.crear({
      ...this.form.value,
      archivos: this.archivos

    });
    this.archivos = [];
    this.enviado = true;
    this.form.reset({ tipo: 'Petición' });
  }
}
