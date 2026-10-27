import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { BuscadorGovco } from '../../../../shared/components/buscador-govco/buscador-govco';
import { coincide, terminosDe } from '../../../../shared/utils/busqueda';
import {
  CmsPagina,
  CmsPaginaNodo,
  EstadoPagina,
  PLANTILLAS_PAGINA,
} from '../../../../shared/models/cms/cms.models';

interface Fila extends CmsPaginaNodo {
  menuNombre: string;
}

@Component({
  selector: 'app-cms-paginas',
  imports: [FormsModule, RouterLink, DatePipe, BuscadorGovco],
  templateUrl: './cms-paginas.html',
  styleUrls: ['../cms-admin.css'],
  styles: `
    .indent { display: inline-block; color: #94a3b8; }
    .kpis { display: flex; gap: .75rem; flex-wrap: wrap; margin-bottom: 1rem; }
    .kpi { background: #fff; border: 1px solid var(--c-borde); border-radius: 8px; padding: .6rem .9rem; font-size: .8rem; color: var(--c-muted); }
    .kpi b { display: block; font-size: 1.3rem; color: var(--c-primario); }
  `,
})
export class CmsPaginas implements OnInit {
  readonly cms = inject(CmsService);
  readonly plantillas = PLANTILLAS_PAGINA;

  readonly filtroMenu = signal<number | 'sin' | ''>('');
  readonly filtroEstado = signal<EstadoPagina | ''>('');
  readonly busqueda = signal('');

  readonly filas = computed<Fila[]>(() => {
    this.cms.paginas();
    const menus = this.cms.menus();
    const fm = this.filtroMenu();
    const grupos: { id: number | null; nombre: string }[] = [
      ...menus.map((m) => ({ id: m.id as number | null, nombre: m.nombre })),
      { id: null, nombre: 'Sin menú' },
    ].filter((g) => fm === '' || (fm === 'sin' ? g.id === null : g.id === fm));

    const q = terminosDe(this.busqueda());
    const est = this.filtroEstado();

    return grupos
      .flatMap((g) => this.cms.plano(g.id).map((n) => ({ ...n, menuNombre: g.nombre })))
      .filter((f) => !est || f.pagina.estado === est)
      .filter((f) => coincide(`${f.pagina.titulo} ${f.pagina.slug} ${f.pagina.descripcion ?? ''}`, q));
  });

  readonly hayFiltros = computed(() => !!this.busqueda().trim() || this.filtroMenu() !== '' || !!this.filtroEstado());

  limpiarFiltros(): void {
    this.busqueda.set('');
    this.filtroMenu.set('');
    this.filtroEstado.set('');
  }

  readonly resumen = computed(() => {
    const p = this.cms.paginas();
    return {
      total: p.length,
      publicadas: p.filter((x) => x.estado === 'publicada').length,
      borradores: p.filter((x) => x.estado === 'borrador').length,
      sinMenu: p.filter((x) => x.menuId === null).length,
    };
  });

  ngOnInit(): void {
    this.cms.cargar();
  }

  etiquetaPlantilla(v: string): string {
    return this.plantillas.find((p) => p.valor === v)?.etiqueta ?? v;
  }

  sangria(nivel: number): string {
    return nivel ? '   '.repeat(nivel - 1) + '└ ' : '';
  }

  async eliminar(p: CmsPagina): Promise<void> {
    const n = this.cms.conteoEntradasPorPagina().get(p.id) || 0;
    const hijos = this.cms.paginas().filter((x) => x.parentId === p.id).length;
    let msg = `¿Eliminar la página "${p.titulo}"?`;
    if (n) msg += `\n\n⚠️ Se eliminarán también sus ${n} entrada(s).`;
    if (hijos) msg += `\nSus ${hijos} subpágina(s) quedarán en el nivel superior.`;
    if (!confirm(msg)) return;
    try {
      await this.cms.eliminarPagina(p.id);
    } catch {
      /* cms.error() */
    }
  }
}
