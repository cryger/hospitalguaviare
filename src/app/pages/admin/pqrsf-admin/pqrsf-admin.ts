import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { PqrsfService } from '../../../shared/services/pqrsf/pqrsf';
import { PQRSF } from '../../../shared/models/pqrsf/pqrsf/pqrsf-module';

@Component({
  selector: 'app-pqrsf-admin',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './pqrsf-admin.html',
  styleUrls: ['./pqrsf-admin.css']
})
export class PqrsfAdminComponent implements OnInit {

  pqrsf: PQRSF[] = [];
  seleccionado: PQRSF | null = null;
  respuesta = '';



  constructor(private pqrsfService: PqrsfService) {}

  ngOnInit(): void {
    this.pqrsfService.pqrsf$.subscribe(data => {
      this.pqrsf = data;
    });
  }

  ver(item: PQRSF): void {
    this.seleccionado = item;
    this.respuesta = item.respuesta || '';
  }

  responder(): void {
    if (!this.seleccionado || !this.respuesta) return;

    this.pqrsfService.responder(this.seleccionado.id, this.respuesta);
    this.seleccionado = null;
    this.respuesta = '';
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
}
