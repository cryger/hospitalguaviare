import { Component, computed, inject, signal } from '@angular/core';
import { Router, RouterLink } from '@angular/router';
import { BuscadorGovco, SugerenciaBusqueda } from '../../shared/components/buscador-govco/buscador-govco';
import { BusquedaSitioService, ETIQUETAS_TIPO } from '../../shared/services/busqueda/busqueda-sitio.service';
import { resaltar, terminosDe } from '../../shared/utils/busqueda';

@Component({
  selector: 'app-cabecera',
  imports: [RouterLink, BuscadorGovco],
  templateUrl: './cabecera.html',
  styleUrl: './cabecera.css',
})
export class Cabecera {
  private busqueda = inject(BusquedaSitioService);
  private router = inject(Router);

  readonly consulta = signal('');

  /** Hasta 6 sugerencias: secciones, noticias, documentos y trámites del portal */
  readonly sugerencias = computed<SugerenciaBusqueda[]>(() => {
    const terminos = terminosDe(this.consulta());
    if (!terminos.length) return [];
    return this.busqueda
      .buscar(this.consulta())
      .slice(0, 6)
      .map((r) => ({ html: resaltar(r.titulo, terminos), detalle: `${ETIQUETAS_TIPO[r.tipo]} · ${r.seccion}`, url: r.url }));
  });

  /** Carga el contenido del CMS la primera vez que se usa el buscador */
  preparar(): void {
    this.busqueda.cargar();
  }

  irAResultados(texto: string): void {
    this.router.navigate(['/buscar'], { queryParams: { q: texto || null } });
    this.consulta.set('');
  }
}
