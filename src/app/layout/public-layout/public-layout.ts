import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { Topbar } from '../../componentes/topbar/topbar';
import { Navbar } from '../../componentes/navbar/navbar';
import { Cabecera } from '../../componentes/cabecera/cabecera';
<<<<<<< HEAD

import { Footer } from '../../componentes/footer/footer';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
=======
import { Breadcrumb } from '../../componentes/breadcrumb/breadcrumb';
import { Footer } from '../../componentes/footer/footer';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { VolverArriba } from '../../componentes/volver-arriba/volver-arriba';
import { NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
import { Contenido } from '../../componentes/contenido/contenido';
>>>>>>> 6865d3237f4bc5713e442c82baab8c7322857aba



@Component({
  selector: 'app-public-layout',
<<<<<<< HEAD
  imports: [RouterOutlet, Navbar, Topbar, Footer, Accesibilidad, CommonModule, NgbAlertModule, Cabecera],
=======
  imports: [RouterOutlet, Navbar, Topbar, Footer, Accesibilidad, CommonModule, NgbAlertModule, Cabecera,Breadcrumb,VolverArriba, Contenido],
>>>>>>> 6865d3237f4bc5713e442c82baab8c7322857aba
  templateUrl: './public-layout.html',
  styleUrl: './public-layout.css',
})
export class PublicLayout {

}
