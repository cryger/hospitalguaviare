import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { NoticiasService } from '../../shared/services/noticias/noticias';
import { Noticia } from '../../shared/models/noticias/noticias/noticias-module';

@Component({
  selector: 'app-noticias',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './noticias.html',
  styleUrls: ['./noticias.css']
})
export class NoticiasPublicComponent implements OnInit {

  orden: 'recientes' | 'antiguas' = 'recientes';
  fechaFiltro: string | null = null;

  paginaActual = 1;
  itemsPorPagina = 4; // 4 columnas x 2 filas

  noticias: {
    categoria: string;
    titulo: string;
    resumen: string;
    fecha: Date;
    imagen: string;
  }[] = [];

  constructor(private noticiasService: NoticiasService) {}

  ngOnInit(): void {
    this.noticiasService.noticias$.subscribe(() => {
    this.cargarNoticias();
  });
  }

  /*=========================
    RESETEA LA PAGINA AL INICIAR EL PAGINADO
  =============================*/
  ngOnChanges(): void {
  this.paginaActual = 1;
}

  private cargarNoticias(): void {
    const publicadas = this.noticiasService.getPublicadas();

    // 🔄 Adaptamos al formato que YA usa tu vista
    this.noticias = publicadas.map((n: Noticia) => ({
      categoria: 'Noticias', // o puedes mapear según lógica futura
      titulo: n.titulo,
      resumen: n.resumen,
      fecha: new Date(n.fechaPublicacion),
      imagen: n.imagenUrl || 'assets/noticias/default.jpg'
    }));
  }

  get noticiasFiltradas() {
    let resultado = [...this.noticias];

    if (this.fechaFiltro) {
      resultado = resultado.filter(n =>
        n.fecha.toISOString().split('T')[0] === this.fechaFiltro
      );
    }

    resultado.sort((a, b) => {
      return this.orden === 'recientes'
        ? b.fecha.getTime() - a.fecha.getTime()
        : a.fecha.getTime() - b.fecha.getTime();
    });

    return resultado;
  }

  /* ======================================
    PAGINACION
  ============================================*/
  get paginas(): number[] {
  return Array.from({ length: this.totalPaginas }, (_, i) => i + 1);
}



  get totalPaginas(): number {
  return Math.ceil(this.noticiasFiltradas.length / this.itemsPorPagina);
  }
  get noticiasPaginadas() {
    const inicio = (this.paginaActual - 1) * this.itemsPorPagina;
    return this.noticiasFiltradas.slice(
      inicio,
      inicio + this.itemsPorPagina
    );
  }

irPagina(pagina: number): void {
  if (pagina < 1 || pagina > this.totalPaginas) return;
  this.paginaActual = pagina;
}

paginaAnterior(): void {
  if (this.paginaActual > 1) {
    this.paginaActual--;
  }
}

paginaSiguiente(): void {
if (this.paginaActual < this.totalPaginas) {
    this.paginaActual++;
  }
}



}
