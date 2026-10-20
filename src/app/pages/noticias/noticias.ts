import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../shared/services/cms/cms.service';

interface NoticiaTarjeta {
  id: number;
  categoria: string;
  titulo: string;
  resumen: string;
  fecha: Date;
  imagen: string | null;
  alt: string;
  url: string;
}

/**
 * Noticias del inicio: entradas publicadas de tipo "noticia" del CMS
 * (se cargan en Admin › Contenido › Entradas).
 */
@Component({
  selector: 'app-noticias',
  standalone: true,
  imports: [DatePipe, RouterLink],
  templateUrl: './noticias.html',
  styleUrls: ['./noticias.css'],
})
export class NoticiasPublicComponent implements OnInit {
  private cms = inject(CmsService);

  readonly orden = signal<'recientes' | 'antiguas'>('recientes');
  readonly fechaFiltro = signal<string | null>(null);
  readonly paginaActual = signal(1);
  readonly itemsPorPagina = 4;

  private readonly noticias = computed<NoticiaTarjeta[]>(() => {
    const multimedia = this.cms.multimediaPorId();
    return this.cms
      .entradas()
      .filter((e) => e.tipo === 'noticia' && this.cms.esEntradaPublica(e))
      .filter((e) => {
        const p = this.cms.paginaPorId().get(e.paginaId);
        return !!p && this.cms.esPublica(p);
      })
      .map((e) => {
        const img = e.imagenDestacadaId ? multimedia.get(e.imagenDestacadaId) : undefined;
        return {
          id: e.id,
          categoria: this.cms.paginaPorId().get(e.paginaId)?.titulo ?? 'Noticias',
          titulo: e.titulo,
          resumen: e.resumen ?? '',
          fecha: new Date(e.fechaPublicacion || e.creadoEn),
          imagen: img?.tipo === 'imagen' ? img.url : null,
          alt: img?.alt || '',
          url: this.cms.urlEntrada(e),
        };
      });
  });

  readonly noticiasFiltradas = computed(() => {
    const f = this.fechaFiltro();
    const lista = this.noticias().filter((n) => !f || this.fechaLocal(n.fecha) === f);
    return lista.sort((a, b) =>
      this.orden() === 'recientes' ? b.fecha.getTime() - a.fecha.getTime() : a.fecha.getTime() - b.fecha.getTime(),
    );
  });

  readonly totalPaginas = computed(() => Math.ceil(this.noticiasFiltradas().length / this.itemsPorPagina));
  readonly paginas = computed(() => Array.from({ length: this.totalPaginas() }, (_, i) => i + 1));
  readonly noticiasPaginadas = computed(() => {
    const inicio = (this.paginaActual() - 1) * this.itemsPorPagina;
    return this.noticiasFiltradas().slice(inicio, inicio + this.itemsPorPagina);
  });

  ngOnInit(): void {
    this.cms.cargar();
  }

  cambiarOrden(v: string): void {
    this.orden.set(v === 'antiguas' ? 'antiguas' : 'recientes');
    this.paginaActual.set(1);
  }

  cambiarFecha(v: string): void {
    this.fechaFiltro.set(v || null);
    this.paginaActual.set(1);
  }

  irPagina(p: number): void {
    if (p >= 1 && p <= this.totalPaginas()) this.paginaActual.set(p);
  }

  private fechaLocal(d: Date): string {
    return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
  }
}
