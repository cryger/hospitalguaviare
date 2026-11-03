import { Component, computed, effect, inject, signal, untracked } from '@angular/core';
import { DatePipe, NgTemplateOutlet } from '@angular/common';
import { CotizacionesService } from '../../shared/services/cotizaciones/cotizaciones';
import { InformacionInteresNav } from '../informacion-interes/informacion-interes-nav';
import { BuscadorGovco } from '../../shared/components/buscador-govco/buscador-govco';
import { Cotizacion } from '../../shared/models/cotizacion/cotizacion/cotizacion-module';

/** Texto sin tildes y en minúsculas, para buscar «radiologia» y encontrar «radiología» */
const normalizar = (t: string) => t.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();

@Component({
  selector: 'app-cotizaciones-propuestas',
  standalone: true,
  imports: [DatePipe, NgTemplateOutlet, InformacionInteresNav, BuscadorGovco],
  templateUrl: './cotizaciones-propuestas.html',
  styleUrls: ['./cotizaciones-propuestas.css'],
})
export class CotizacionesPropuestas {
  readonly service = inject(CotizacionesService);
  readonly porPagina = 10;

  readonly busqueda = signal('');
  readonly anio = signal('');
  readonly pagina = signal(1);

  readonly vigentes = computed(() => this.service.cotizaciones().filter((c) => c.estado === 'publicada'));
  readonly anteriores = computed(() => this.service.cotizaciones().filter((c) => c.estado === 'cerrada'));

  /** Años con invitaciones anteriores (para el filtro), del más reciente al más antiguo */
  readonly anios = computed(() =>
    [...new Set(this.anteriores().map((c) => this.anioDe(c)))].filter(Boolean).sort((a, b) => b.localeCompare(a)),
  );

  readonly filtradas = computed(() => {
    const palabras = normalizar(this.busqueda().trim()).split(/\s+/).filter(Boolean);
    const anio = this.anio();
    return this.anteriores().filter((c) => {
      if (anio && this.anioDe(c) !== anio) return false;
      if (!palabras.length) return true;
      const texto = normalizar(`${c.titulo} ${c.descripcion} ${c.documentoNombre ?? ''}`);
      return palabras.every((p) => texto.includes(p));
    });
  });

  readonly hayFiltros = computed(() => !!this.busqueda().trim() || !!this.anio());
  readonly totalPaginas = computed(() => Math.max(1, Math.ceil(this.filtradas().length / this.porPagina)));
  readonly visibles = computed(() => {
    const inicio = (this.pagina() - 1) * this.porPagina;
    return this.filtradas().slice(inicio, inicio + this.porPagina);
  });

  /** Paginación compacta: 1 … 4 5 6 … 24 (null = «…») */
  readonly paginas = computed<(number | null)[]>(() => {
    const total = this.totalPaginas();
    const actual = this.pagina();
    const orden = [...new Set([1, total, actual - 1, actual, actual + 1])].filter((p) => p >= 1 && p <= total).sort((a, b) => a - b);
    const salida: (number | null)[] = [];
    orden.forEach((p, i) => {
      if (i > 0 && p - orden[i - 1] > 1) salida.push(null);
      salida.push(p);
    });
    return salida;
  });

  constructor() {
    this.service.cargar();
    // Al cambiar la búsqueda o el año se vuelve a la primera página
    effect(() => {
      this.busqueda();
      this.anio();
      untracked(() => this.pagina.set(1));
    });
  }

  irPagina(p: number): void {
    if (p < 1 || p > this.totalPaginas()) return;
    this.pagina.set(p);
    document.getElementById('invitaciones-anteriores')?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.anio.set('');
  }

  anioDe(c: Cotizacion): string {
    return String(c.fechaPublicacion ?? '').slice(0, 4);
  }

  /** Divide el texto en partes para mostrar como enlace las URL que contiene (ej. anexos) */
  partes(texto: string): { texto: string; url?: string }[] {
    return (texto || '')
      .split(/(https?:\/\/[^\s]+)/)
      .filter(Boolean)
      .map((t) => (/^https?:\/\//.test(t) ? { texto: 'Descargar anexo', url: t } : { texto: t }));
  }

  /** Días que faltan para la fecha límite (null si no tiene) */
  diasRestantes(fecha?: string | null): number | null {
    if (!fecha) return null;
    const ms = new Date(fecha).getTime() - Date.now();
    return isNaN(ms) ? null : Math.ceil(ms / 86_400_000);
  }
}
