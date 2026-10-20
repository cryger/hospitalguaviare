import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, FormsModule, Validators } from '@angular/forms';
import { PqrsfService } from '../../../shared/services/pqrsf/pqrsf';
import { PQRSF } from '../../../shared/models/pqrsf/pqrsf/pqrsf-module';
import { ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-pqrsf-admin',
  standalone: true,
  imports: [CommonModule, FormsModule,ReactiveFormsModule],
  templateUrl: './pqrsf-admin.html',
  styleUrls: ['./pqrsf-admin.css']
})
export class PqrsfAdminComponent implements OnInit {

  pqrsf: PQRSF[] = [];
  seleccionado: PQRSF | any = null;
  respuesta = '';
  modalPQRSFOpen = false;

  pqrsfSeleccionada: any = null;

  formRespuesta!: FormGroup;



  constructor(private pqrsfService: PqrsfService, private fb:FormBuilder) {}

  ngOnInit(): void {
    this.pqrsfService.pqrsf$.subscribe(data => {
      this.pqrsf = data;
    });

    this.formRespuesta = this.fb.group({
    respuesta: ['', Validators.required]
  });
  }

  verDetalle(pqrsf: any): void {
  this.seleccionado = pqrsf;
  this.formRespuesta.reset();
  this.modalPQRSFOpen = true;
}

  responder(): void {
    if (!this.seleccionado || !this.respuesta) return;

    this.pqrsfService.responder(this.seleccionado.id, this.respuesta);
    this.seleccionado = null;
    this.respuesta = '';
  }

  responderPQRSF(): void {


  if (this.formRespuesta.invalid) return;

  // 🔜 LÓGICA REAL (API / servicio)
  this.seleccionado.estado = 'Respondida';
  this.seleccionado.respuesta = this.formRespuesta.value.respuesta;

  this.cerrarModalPQRSF();
}

  filtroEstado: 'Todas' | 'Pendientes' | 'Respondidas' = 'Todas';

  get pqrsfFiltradas(): PQRSF[] {
  if (this.filtroEstado === 'Todas') {
    return this.pqrsf;
  }

  if (this.filtroEstado === 'Pendientes') {
    return this.pqrsf.filter(p => p.estado !== 'Respondida');
  }

  return this.pqrsf.filter(p => p.estado === 'Respondida');
}

cerrarModalPQRSF(): void {
  this.modalPQRSFOpen = false;
  this.seleccionado = null;
}
}
