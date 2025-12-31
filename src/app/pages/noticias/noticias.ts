import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-noticias',
  imports: [CommonModule, FormsModule],
  templateUrl: './noticias.html',
  styleUrls: ['./noticias.css']
})
export class NoticiasPublicComponent {

  orden: 'recientes' | 'antiguas' = 'recientes';
  fechaFiltro: string | null = null;

  noticias = [
    {
      categoria: 'Noticias',
      titulo: 'Garantías, deberes y lineamientos para la convivencia',
      resumen: 'Garantías, deberes y lineamientos para la convivencia y prestación segura de los servicios de salud.',
      fecha: new Date('2025-11-24T16:14:00'),
      imagen: 'assets/noticias/noticias_1.jpg'
    },
    {
      categoria: 'Convocatorias',
      titulo: 'Convocatoria Pública No.001 de 2025',
      resumen: 'Proceso de selección y designación del revisor fiscal.',
      fecha: new Date('2025-11-22T09:30:00'),
      imagen: 'assets/noticias/noticias_2.jpg'
    },
    {
      categoria: 'Noticias',
      titulo: 'Octubre Rosa Unidos en la Lucha contra el Cáncer de Mama',
      resumen: 'Reafirmamos nuestro compromiso con la detección temprana.',
      fecha: new Date('2025-10-21T09:36:00'),
      imagen: 'assets/noticias/noticia3.jpg'
    },
    {
      categoria: 'Noticias',
      titulo: 'Jornada de vacunación',
      resumen: 'Campaña de vacunación para la comunidad.',
      fecha: new Date('2025-09-22T12:33:00'),
      imagen: 'assets/noticias/noticia4.jpg'
    },
    {
      categoria: 'Noticias',
      titulo: 'Esta no se mostrará',
      resumen: 'Es la quinta noticia.',
      fecha: new Date(),
      imagen: 'assets/noticias/noticia5.jpg'
    }
  ];

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

