import { Component, computed, effect, inject, input, signal, untracked } from '@angular/core';
import { DatePipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { SelectorIcono } from '../../../../shared/components/selector-icono/selector-icono';
import {
  CmsEntrada,
  CmsPagina,
  PLANTILLAS_PAGINA,
  TIPOS_ENTRADA,
} from '../../../../shared/models/cms/cms.models';

@Component({
  selector: 'app-cms-pagina-editor',
  imports: [FormsModule, RouterLink, DatePipe, SelectorIcono],
  templateUrl: './cms-pagina-editor.html',
  styleUrls: ['../cms-admin.css', './cms-pagina-editor.css'],
})
export class CmsPaginaEditor {
  readonly cms = inject(CmsService);
  private router = inject(Router);

  /** Parámetro de ruta (/paginas/:id) */
  readonly id = input<string>();
  /** Query param opcional (?menu=1) para preseleccionar el menú */
  readonly menu = input<string>();

  readonly plantillas = PLANTILLAS_PAGINA;
  readonly tipos = TIPOS_ENTRADA;

  form = this.vacia();
  slugManual = false;
  readonly guardando = signal(false);
  readonly mensajeOk = signal<string | null>(null);
  readonly noEncontrada = signal(false);
  readonly paginaId = signal<number | null>(null);

  readonly entradas = computed<CmsEntrada[]>(() => {
    const id = this.paginaId();
    this.cms.entradas();
    return id ? this.cms.entradasDe(id) : [];
  });

  constructor() {
    // Se re-inicializa si cambia el :id sin destruir el componente
    effect(() => {
      const id = this.id();
      untracked(() => this.inicializar(id));
    });
  }

  private async inicializar(idParam?: string): Promise<void> {
    await this.cms.cargar();
    this.noEncontrada.set(false);
    const id = Number(idParam);
    if (id) {
      const p = this.cms.paginaPorId().get(id);
      if (!p) {
        this.noEncontrada.set(true);
        return;
      }
      this.form = { ...p };
      this.slugManual = true;
      this.paginaId.set(id);
    } else {
      this.form = this.vacia();
      this.slugManual = false;
      this.paginaId.set(null);
      this.form.menuId = this.menu() ? Number(this.menu()) || null : (this.cms.menus()[0]?.id ?? null);
    }
  }

  private vacia(): Partial<CmsPagina> {
    return {
      titulo: '',
      slug: '',
      descripcion: '',
      menuId: null,
      parentId: null,
      plantilla: 'contenido',
      urlExterna: '',
      icono: '',
      estado: 'borrador',
      visibleEnMenu: true,
    };
  }

  /** Páginas que pueden ser padre: mismo menú y que no sean esta ni sus descendientes */
  padresPosibles(): { id: number; titulo: string; nivel: number }[] {
    const excluir = this.paginaId() ? this.cms.descendientes(this.paginaId()!) : new Set<number>();
    return this.cms
      .plano(this.form.menuId ?? null)
      .filter((n) => !excluir.has(n.pagina.id))
      .map((n) => ({ id: n.pagina.id, titulo: n.pagina.titulo, nivel: n.nivel }));
  }

  sangria(nivel: number): string {
    return '— '.repeat(nivel);
  }

  alCambiarTitulo(): void {
    if (!this.slugManual) this.form.slug = CmsService.slugify(this.form.titulo || '');
  }

  alCambiarMenu(): void {
    // Si el padre no pertenece al nuevo menú, se limpia
    const padre = this.form.parentId ? this.cms.paginaPorId().get(this.form.parentId) : null;
    if (padre && padre.menuId !== this.form.menuId) this.form.parentId = null;
  }

  ayudaPlantilla(): string {
    return this.plantillas.find((p) => p.valor === this.form.plantilla)?.ayuda ?? '';
  }

  iconoTipo(t: string): string {
    return this.tipos.find((x) => x.valor === t)?.icono ?? '📝';
  }

  async guardar(publicar = false): Promise<void> {
    if (!this.form.titulo?.trim()) return;
    this.guardando.set(true);
    this.mensajeOk.set(null);
    try {
      const datos: Partial<CmsPagina> = {
        ...this.form,
        titulo: this.form.titulo.trim(),
        estado: publicar ? 'publicada' : this.form.estado,
      };
      // si cambió de menú o de padre, va al final del nuevo nivel
      const previa = this.paginaId() ? this.cms.paginaPorId().get(this.paginaId()!) : null;
      if (previa && (previa.menuId !== datos.menuId || previa.parentId !== datos.parentId)) {
        datos.orden = this.cms
          .paginas()
          .filter((p) => p.menuId === datos.menuId && p.parentId === datos.parentId && p.id !== previa.id).length;
      }
      const guardada = await this.cms.guardarPagina(datos);
      this.form = { ...guardada };
      this.slugManual = true;
      this.mensajeOk.set('Página guardada.');
      if (!this.paginaId()) {
        this.router.navigate(['/admin/contenido/paginas', guardada.id], { replaceUrl: true });
      }
    } catch {
      /* cms.error() */
    } finally {
      this.guardando.set(false);
    }
  }

  async eliminar(): Promise<void> {
    const id = this.paginaId();
    if (!id) return;
    const n = this.entradas().length;
    if (!confirm(`¿Eliminar "${this.form.titulo}"?${n ? `\n\n⚠️ Se eliminarán sus ${n} entrada(s).` : ''}`)) return;
    await this.cms.eliminarPagina(id);
    this.router.navigate(['/admin/contenido/paginas']);
  }

  async moverEntrada(e: CmsEntrada, delta: -1 | 1): Promise<void> {
    const lista = [...this.entradas()];
    const i = lista.findIndex((x) => x.id === e.id);
    const j = i + delta;
    if (j < 0 || j >= lista.length) return;
    [lista[i], lista[j]] = [lista[j], lista[i]];
    for (const [orden, x] of lista.entries()) {
      if (x.orden !== orden) await this.cms.guardarEntrada({ ...x, orden });
    }
  }
}
