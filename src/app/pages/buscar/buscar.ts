import { Component, computed, effect, inject, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { ActivatedRoute, Router, RouterLink } from '@angular/router';
import { Title } from '@angular/platform-browser';
import { BuscadorGovco } from '../../shared/components/buscador-govco/buscador-govco';
import { BusquedaSitioService, ETIQUETAS_TIPO, TipoResultado } from '../../shared/services/busqueda/busqueda-sitio.service';
import { resaltar, terminosDe } from '../../shared/utils/busqueda';

const POR_PAGINA = 10;
const TIPOS: TipoResultado[] = ['seccion', 'noticia', 'documento', 'servicio', 'contenido'];

/** Resultados del buscador general del portal (/buscar?q=…&tipo=…) */
@Component({
  selector: 'app-buscar',
  imports: [RouterLink, DatePipe, BuscadorGovco],
  templateUrl: './buscar.html',
  styleUrl: './buscar.css',
})
export class Buscar {
  private busqueda = inject(BusquedaSitioService);
  private route = inject(ActivatedRoute);
  private router = inject(Router);

  readonly etiquetas = ETIQUETAS_TIPO;
  readonly tipos = TIPOS;
  readonly cargado = signal(false);
  readonly consulta = signal(this.route.snapshot.queryParamMap.get('q') ?? '');
  readonly tipo = signal<TipoResultado | ''>(this.tipoValido(this.route.snapshot.queryParamMap.get('tipo')));
  readonly mostrar = signal(POR_PAGINA);

  readonly terminos = computed(() => terminosDe(this.consulta()));
  readonly todos = computed(() => (this.cargado() ? this.busqueda.buscar(this.consulta()) : []));
  readonly conteo = computed(() => {
    const c = new Map<TipoResultado, number>();
    this.todos().forEach((r) => c.set(r.tipo, (c.get(r.tipo) ?? 0) + 1));
    return c;
  });
  readonly resultados = computed(() => (this.tipo() ? this.todos().filter((r) => r.tipo === this.tipo()) : this.todos()));
  readonly hayFiltros = computed(() => !!this.consulta().trim() || !!this.tipo());

  constructor() {
    inject(Title).setTitle('Buscar en el portal | E.S.E. Hospital San José del Guaviare');
    this.busqueda.cargar().then(() => this.cargado.set(true));

    // Si llega una nueva búsqueda desde la cabecera estando ya en /buscar
    this.route.queryParamMap.subscribe((q) => {
      const texto = q.get('q') ?? '';
      if (texto !== this.consulta()) { this.consulta.set(texto); this.mostrar.set(POR_PAGINA); }
      this.tipo.set(this.tipoValido(q.get('tipo')));
    });

    effect(() => {
      // La URL refleja la búsqueda para poder compartirla
      const q = this.consulta().trim() || null;
      const tipo = this.tipo() || null;
      this.router.navigate([], { relativeTo: this.route, queryParams: { q, tipo }, replaceUrl: true });
    });
  }

  private tipoValido(t: string | null): TipoResultado | '' {
    return TIPOS.find((x) => x === t) ?? '';
  }

  cambiarConsulta(texto: string): void {
    this.consulta.set(texto);
    this.mostrar.set(POR_PAGINA);
  }

  cambiarTipo(t: string): void {
    this.tipo.set(this.tipoValido(t));
    this.mostrar.set(POR_PAGINA);
  }

  limpiar(): void {
    this.consulta.set('');
    this.tipo.set('');
    this.mostrar.set(POR_PAGINA);
  }

  marcar(texto: string): string {
    return resaltar(texto, this.terminos());
  }
}
