import { Component, computed, effect, inject, input, OnInit, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CmsEntrada, EstadoEntrada, TIPOS_ENTRADA, TipoEntrada } from '../../../../shared/models/cms/cms.models';
import { MediaThumb } from '../shared/media-thumb';
import { BuscadorGovco } from '../../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../../shared/utils/busqueda';

@Component({
  selector: 'app-cms-entradas',
  imports: [FormsModule, RouterLink, DatePipe, MediaThumb, BuscadorGovco],
  templateUrl: './cms-entradas.html',
  styleUrls: ['../cms-admin.css'],
  styles: `
    .miniatura { width: 56px; flex-shrink: 0; }
    .celda-titulo { display: flex; align-items: center; gap: .7rem; min-width: 220px; }
    .destacada { color: #f59e0b; }
  `,
})
export class CmsEntradas implements OnInit {
  readonly cms = inject(CmsService);
  readonly tipos = TIPOS_ENTRADA;

  /** ?pagina=ID desde el listado de páginas */
  readonly pagina = input<string>();

  readonly filtroPagina = signal<number | ''>('');
  readonly filtroTipo = signal<TipoEntrada | ''>('');
  readonly filtroEstado = signal<EstadoEntrada | ''>('');
  readonly busqueda = signal('');

  readonly paginasOrdenadas = computed(() => {
    this.cms.paginas();
    return [
      ...this.cms.menus().flatMap((m) => this.cms.plano(m.id)),
      ...this.cms.plano(null),
    ];
  });

  readonly lista = computed<CmsEntrada[]>(() => {
    const q = terminosDe(this.busqueda());
    const fp = this.filtroPagina();
    const ft = this.filtroTipo();
    const fe = this.filtroEstado();
    return this.cms
      .entradas()
      .filter((e) => fp === '' || e.paginaId === fp)
      .filter((e) => !ft || e.tipo === ft)
      .filter((e) => !fe || e.estado === fe)
      .filter((e) => coincide(`${e.titulo} ${e.slug} ${e.resumen ?? ''} ${e.contenido ?? ''}`, q))
      .sort((a, b) => (b.fechaPublicacion || b.creadoEn).localeCompare(a.fechaPublicacion || a.creadoEn));
  });

  readonly hayFiltros = computed(
    () => !!this.busqueda().trim() || this.filtroPagina() !== '' || !!this.filtroTipo() || !!this.filtroEstado(),
  );

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroPagina.set('');
    this.filtroTipo.set('');
    this.filtroEstado.set('');
  }

  constructor() {
    effect(() => {
      const p = Number(this.pagina());
      this.filtroPagina.set(p || '');
    });
  }

  ngOnInit(): void {
    this.cms.cargar();
  }

  tituloPagina(id: number): string {
    return this.cms.paginaPorId().get(id)?.titulo ?? '—';
  }

  iconoTipo(t: TipoEntrada): string {
    return this.tipos.find((x) => x.valor === t)?.icono ?? '📝';
  }

  etiquetaTipo(t: TipoEntrada): string {
    return this.tipos.find((x) => x.valor === t)?.etiqueta ?? t;
  }

  sangria(nivel: number): string {
    return '— '.repeat(nivel);
  }

  async cambiarEstado(e: CmsEntrada, estado: EstadoEntrada): Promise<void> {
    try {
      await this.cms.guardarEntrada({ ...e, estado });
    } catch {}
  }

  async eliminar(e: CmsEntrada): Promise<void> {
    if (!confirm(`¿Eliminar la entrada "${e.titulo}"?\nLos archivos multimedia se conservan en la biblioteca.`)) return;
    try {
      await this.cms.eliminarEntrada(e.id);
    } catch {}
  }
}
