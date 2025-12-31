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

  noticias: {
    categoria: string;
    titulo: string;
    resumen: string;
    fecha: Date;
    imagen: string;
  }[] = [];

  constructor(private noticiasService: NoticiasService) {}

  ngOnInit(): void {
    this.cargarNoticias();
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
}
