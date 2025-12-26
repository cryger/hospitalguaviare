import { Injectable } from '@angular/core';
import { Noticia } from '../../models/noticias/noticias/noticias-module';

@Injectable({ providedIn: 'root' })
export class NoticiasService {

  private noticias: Noticia[] = [
    {
      id: 1,
      titulo: 'Jornada de vacunación',
      resumen: 'Vacunación para niños y adultos mayores',
      contenido: 'Texto completo de la noticia...',
      fechaPublicacion: new Date(2025, 0, 5),
      autor: 'Admin',
      imagenUrl: 'assets/images/vacunacion.jpg',
      estado: 'publicada'
    }
  ];

  getAll(): Noticia[] {
    return [...this.noticias];
  }

  getById(id: number): Noticia | undefined {
    return this.noticias.find(n => n.id === id);
  }

  create(noticia: Noticia): void {
    noticia.id = Date.now();
    this.noticias.push(noticia);
  }

  update(noticia: Noticia): void {
    const index = this.noticias.findIndex(n => n.id === noticia.id);
    if (index !== -1) this.noticias[index] = noticia;
  }

  delete(id: number): void {
    this.noticias = this.noticias.filter(n => n.id !== id);
  }
}
