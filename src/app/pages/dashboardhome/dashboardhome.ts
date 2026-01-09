import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NoticiasService } from '../../shared/services/noticias/noticias';
import { Noticia } from '../../shared/models/noticias/noticias/noticias-module';
import { Cotizacion } from '../../shared/models/cotizacion/cotizacion/cotizacion-module';
import { filter } from 'rxjs';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';

@Component({
  selector: 'app-dashboard-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './dashboardhome.html',
  styleUrls: ['./dashboardhome.css']
})
export class DashboardHomeComponent implements OnInit {

  // CONTADORES
  totalNoticias = 0;
  publicadas = 0;
  borradores = 0;

  // LISTADOS
  ultimasNoticias: Noticia[] = [];
  ultimasPublicadas: Noticia[] = [];
  ultimosBorradores: Noticia[] = [];
  cotizacionespropuestas: Cotizacion[] | undefined;

  constructor(private noticiasService: NoticiasService) {}

  ngOnInit(): void {
    this.cargarNoticias();
    this.cargarCotizaciones();
  }

  private cargarNoticias(): void {
    const todas = this.noticiasService.getAll();

    this.totalNoticias = todas.length;
    this.publicadas = todas.filter(n => n.estado === 'publicada').length;
    this.borradores = todas.filter(n => n.estado === 'borrador').length;

    this.ultimasNoticias = todas.slice(0, 5);
    this.ultimasPublicadas = todas.filter(n => n.estado === 'publicada').slice(0, 5);
    this.ultimosBorradores = todas.filter(n => n.estado === 'borrador').slice(0, 5);
  }

  private cargarCotizaciones():void{
    console.log ("Aqui debe traer las cotizaciones");
  }
}
