import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TrabajaNosotrosService } from '../../shared/services/trabaja-nosotros/trabaja-nosotros-service';
import { Vacante } from '../../shared/models/trabaja-nosotros/trabaja-nosotros/trabaja-nosotros-module';

@Component({
  selector: 'app-trabaja-nosotros',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './trabaja-nosotros.html',
  styleUrls: ['./trabaja-nosotros.css']
})
export class TrabajaNosotros implements OnInit {

  vacantes: Vacante[] = [];
  modalOpen = false;
  seleccionada: Vacante | null = null;

  constructor(private service: TrabajaNosotrosService) {}

  ngOnInit(): void {
    this.vacantes = this.service.getPublicadas();
  }

  verRequisitos(v: Vacante): void {
    this.seleccionada = v;
    this.modalOpen = true;
  }

  cerrarModal(): void {
    this.modalOpen = false;
    this.seleccionada = null;
  }
}
