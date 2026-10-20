import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { Topbar } from '../../componentes/topbar/topbar';
import { Navbar } from '../../componentes/navbar/navbar';
import { Cabecera } from '../../componentes/cabecera/cabecera';

import { Footer } from '../../componentes/footer/footer';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';



@Component({
  selector: 'app-public-layout',
  imports: [RouterOutlet, Navbar, Topbar, Footer, Accesibilidad, CommonModule, NgbAlertModule, Cabecera],
  templateUrl: './public-layout.html',
  styleUrl: './public-layout.css',
})
export class PublicLayout {

}
