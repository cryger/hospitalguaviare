import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { Topbar } from '../../componentes/topbar/topbar';
import { Navbar } from '../../componentes/navbar/navbar';
import { Cabecera } from '../../componentes/cabecera/cabecera';
import { Breadcrumb } from '../../componentes/breadcrumb/breadcrumb';
import { Footer } from '../../componentes/footer/footer';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { VolverArriba } from '../../componentes/volver-arriba/volver-arriba';
import { NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
import { Contenido } from '../../componentes/contenido/contenido';



@Component({
  selector: 'app-public-layout',
  imports: [RouterOutlet, Navbar, Topbar, Footer, Accesibilidad, CommonModule, NgbAlertModule, Cabecera,Breadcrumb,VolverArriba, Contenido],
  templateUrl: './public-layout.html',
  styleUrl: './public-layout.css',
})
export class PublicLayout {

}
