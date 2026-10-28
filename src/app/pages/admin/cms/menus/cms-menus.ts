import { Component, computed, inject, OnInit, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { CmsService } from '../../../../shared/services/cms/cms.service';
import { CambioOrdenPagina } from '../../../../shared/services/cms/cms-datasource';
import {
  CmsMenu,
  CmsPagina,
  CmsPaginaNodo,
  UBICACIONES_MENU,
  UbicacionMenu,
} from '../../../../shared/models/cms/cms.models';

const CLAVE_EXPANDIDOS = 'cms-menus-expandidos';

function leerExpandidos(): Set<number> {
  try {
    const v = JSON.parse(localStorage.getItem(CLAVE_EXPANDIDOS) || '[]');
    return new Set(Array.isArray(v) ? v.map(Number) : []);
  } catch {
    return new Set();
  }
}

@Component({
  selector: 'app-cms-menus',
  imports: [FormsModule, RouterLink],
  templateUrl: './cms-menus.html',
  styleUrls: ['../cms-admin.css', './cms-menus.css'],
})
export class CmsMenus implements OnInit {
  readonly cms = inject(CmsService);
  readonly ubicaciones = UBICACIONES_MENU;

  readonly menuSeleccionadoId = signal<number | null>(null);
  readonly menuSeleccionado = computed(
    () => this.cms.menus().find((m) => m.id === this.menuSeleccionadoId()) ?? null,
  );

  /** Árbol aplanado del menú seleccionado */
  readonly estructura = computed<CmsPaginaNodo[]>(() => {
    this.cms.paginas(); // dependencia reactiva
    const id = this.menuSeleccionadoId();
    return id === null ? [] : this.cms.plano(id);
  });

  /* ===== Contraer / expandir (se recuerda en este navegador) ===== */
  /** Páginas con subpáginas que están abiertas. Por defecto todo arranca contraído. */
  readonly expandidos = signal<Set<number>>(leerExpandidos());

  /** Solo los nodos cuyos ancestros están todos expandidos */
  readonly visibles = computed<CmsPaginaNodo[]>(() => {
    const abiertos = this.expandidos();
    const porId = this.cms.paginaPorId();
    return this.estructura().filter((n) => {
      let padre = n.pagina.parentId;
      let guardia = 0;
      while (padre !== null && guardia++ < 50) {
        if (!abiertos.has(padre)) return false;
        padre = porId.get(padre)?.parentId ?? null;
      }
      return true;
    });
  });

  readonly conHijos = computed(() => this.estructura().filter((n) => n.hijos.length));
  readonly todoExpandido = computed(() => this.conHijos().every((n) => this.expandidos().has(n.pagina.id)));
  readonly todoContraido = computed(() => this.conHijos().every((n) => !this.expandidos().has(n.pagina.id)));

  estaExpandido(id: number): boolean {
    return this.expandidos().has(id);
  }

  /** Total de páginas que cuelgan del nodo (todos los niveles) */
  totalDescendientes(n: CmsPaginaNodo): number {
    return n.hijos.reduce((acc, h) => acc + 1 + this.totalDescendientes(h), 0);
  }

  alternar(id: number, abrir?: boolean): void {
    const s = new Set(this.expandidos());
    const nuevo = abrir ?? !s.has(id);
    if (nuevo) s.add(id);
    else s.delete(id);
    this.guardarExpandidos(s);
  }

  expandirTodo(): void {
    const s = new Set(this.expandidos());
    this.conHijos().forEach((n) => s.add(n.pagina.id));
    this.guardarExpandidos(s);
  }

  contraerTodo(): void {
    const s = new Set(this.expandidos());
    this.conHijos().forEach((n) => s.delete(n.pagina.id));
    this.guardarExpandidos(s);
  }

  /** Flechas ← → sobre el botón: contraer / expandir (patrón de árbol WAI-ARIA) */
  teclaToggle(ev: KeyboardEvent, n: CmsPaginaNodo): void {
    if (ev.key === 'ArrowRight' && !this.estaExpandido(n.pagina.id)) {
      ev.preventDefault();
      this.alternar(n.pagina.id, true);
    } else if (ev.key === 'ArrowLeft' && this.estaExpandido(n.pagina.id)) {
      ev.preventDefault();
      this.alternar(n.pagina.id, false);
    }
  }

  private guardarExpandidos(s: Set<number>): void {
    this.expandidos.set(s);
    try {
      localStorage.setItem(CLAVE_EXPANDIDOS, JSON.stringify([...s]));
    } catch {
      /* almacenamiento no disponible */
    }
  }

  readonly paginasSinMenu = computed(() =>
    this.cms.paginas().filter((p) => p.menuId === null).sort((a, b) => a.titulo.localeCompare(b.titulo)),
  );

  // Formulario de menú
  editandoMenu = signal<Partial<CmsMenu> | null>(null);

  // Alta rápida
  nuevaPaginaTitulo = '';
  paginaExistenteId: number | null = null;
  readonly ocupado = signal(false);

  async ngOnInit(): Promise<void> {
    await this.cms.cargar();
    if (this.menuSeleccionadoId() === null && this.cms.menus().length) {
      this.menuSeleccionadoId.set(this.cms.menus()[0].id);
    }
  }

  etiquetaUbicacion(u: UbicacionMenu): string {
    return this.ubicaciones.find((x) => x.valor === u)?.etiqueta ?? u;
  }

  contarPaginas(menuId: number): number {
    return this.cms.paginas().filter((p) => p.menuId === menuId).length;
  }

  /* ===== CRUD menús ===== */
  nuevoMenu(): void {
    this.editandoMenu.set({ nombre: '', ubicacion: 'principal', activo: true });
  }

  editarMenu(m: CmsMenu): void {
    this.editandoMenu.set({ ...m });
  }

  async guardarMenu(): Promise<void> {
    const m = this.editandoMenu();
    if (!m?.nombre?.trim()) return;
    const guardado = await this.cms.guardarMenu({ ...m, nombre: m.nombre.trim() });
    this.editandoMenu.set(null);
    this.menuSeleccionadoId.set(guardado.id);
  }

  async eliminarMenu(m: CmsMenu): Promise<void> {
    const n = this.contarPaginas(m.id);
    const msg = n
      ? `¿Eliminar "${m.nombre}"? Sus ${n} página(s) NO se borran: quedarán sin menú.`
      : `¿Eliminar "${m.nombre}"?`;
    if (!confirm(msg)) return;
    await this.cms.eliminarMenu(m.id);
    this.menuSeleccionadoId.set(this.cms.menus()[0]?.id ?? null);
  }

  /* ===== Estructura ===== */
  private hermanos(p: CmsPagina): CmsPagina[] {
    return this.cms
      .paginas()
      .filter((x) => x.menuId === p.menuId && x.parentId === p.parentId)
      .sort((a, b) => a.orden - b.orden || a.titulo.localeCompare(b.titulo));
  }

  private numerar(lista: CmsPagina[], extra: Partial<CmsPagina> = {}): CambioOrdenPagina[] {
    return lista.map((x, i) => ({
      id: x.id,
      menuId: extra.menuId !== undefined && x.id === extra.id ? extra.menuId : x.menuId,
      parentId: extra.parentId !== undefined && x.id === extra.id ? extra.parentId : x.parentId,
      orden: i,
    }));
  }

  esPrimero(p: CmsPagina): boolean {
    return this.hermanos(p)[0]?.id === p.id;
  }

  esUltimo(p: CmsPagina): boolean {
    const h = this.hermanos(p);
    return h[h.length - 1]?.id === p.id;
  }

  async mover(p: CmsPagina, delta: -1 | 1): Promise<void> {
    const h = this.hermanos(p);
    const i = h.findIndex((x) => x.id === p.id);
    const j = i + delta;
    if (j < 0 || j >= h.length) return;
    [h[i], h[j]] = [h[j], h[i]];
    await this.ejecutar(() => this.cms.reordenar(this.numerar(h)));
  }

  /** Convierte la página en hija de su hermano anterior */
  async indentar(p: CmsPagina): Promise<void> {
    const h = this.hermanos(p);
    const i = h.findIndex((x) => x.id === p.id);
    if (i <= 0) return;
    const nuevoPadre = h[i - 1];
    const hijosPadre = this.cms.paginas().filter((x) => x.parentId === nuevoPadre.id).length;
    const restantes = h.filter((x) => x.id !== p.id);
    // La página pasa a ser hija: se abre su nuevo padre para que siga a la vista
    this.alternar(nuevoPadre.id, true);
    await this.ejecutar(() =>
      this.cms.reordenar([
        ...this.numerar(restantes),
        { id: p.id, menuId: p.menuId, parentId: nuevoPadre.id, orden: hijosPadre },
      ]),
    );
  }

  /** Sube la página un nivel, quedando justo después de su padre */
  async desindentar(p: CmsPagina): Promise<void> {
    if (p.parentId === null) return;
    const padre = this.cms.paginaPorId().get(p.parentId);
    if (!padre) return;
    const anteriores = this.hermanos(p).filter((x) => x.id !== p.id);
    const nivelPadre = this.hermanos(padre);
    const pos = nivelPadre.findIndex((x) => x.id === padre.id);
    const movida = { ...p, parentId: padre.parentId };
    nivelPadre.splice(pos + 1, 0, movida);
    await this.ejecutar(() =>
      this.cms.reordenar([
        ...this.numerar(anteriores),
        ...this.numerar(nivelPadre, { id: p.id, parentId: padre.parentId }),
      ]),
    );
  }

  /** Saca la página (y sus subpáginas) del menú, sin borrarla */
  async quitarDelMenu(p: CmsPagina): Promise<void> {
    const ids = this.cms.descendientes(p.id);
    const cambios: CambioOrdenPagina[] = this.cms
      .paginas()
      .filter((x) => ids.has(x.id))
      .map((x) => ({
        id: x.id,
        menuId: null,
        parentId: x.id === p.id ? null : x.parentId,
        orden: x.orden,
      }));
    const restantes = this.hermanos(p).filter((x) => x.id !== p.id);
    await this.ejecutar(() => this.cms.reordenar([...cambios, ...this.numerar(restantes)]));
  }

  async alternarVisible(p: CmsPagina): Promise<void> {
    await this.ejecutar(() => this.cms.guardarPagina({ ...p, visibleEnMenu: !p.visibleEnMenu }));
  }

  /* ===== Agregar ===== */
  async agregarNueva(): Promise<void> {
    const titulo = this.nuevaPaginaTitulo.trim();
    const menuId = this.menuSeleccionadoId();
    if (!titulo || menuId === null) return;
    await this.ejecutar(() =>
      this.cms.guardarPagina({
        menuId,
        parentId: null,
        titulo,
        plantilla: 'contenido',
        estado: 'borrador',
        visibleEnMenu: true,
      }),
    );
    this.nuevaPaginaTitulo = '';
  }

  async agregarExistente(): Promise<void> {
    const menuId = this.menuSeleccionadoId();
    const id = Number(this.paginaExistenteId);
    if (!id || menuId === null) return;
    const ids = this.cms.descendientes(id);
    const raiz = this.cms.paginas().filter((p) => p.menuId === menuId && p.parentId === null).length;
    const cambios = this.cms
      .paginas()
      .filter((p) => ids.has(p.id))
      .map((p) => ({ id: p.id, menuId, parentId: p.id === id ? null : p.parentId, orden: p.id === id ? raiz : p.orden }));
    await this.ejecutar(() => this.cms.reordenar(cambios));
    this.paginaExistenteId = null;
  }

  private async ejecutar(fn: () => Promise<unknown>): Promise<void> {
    if (this.ocupado()) return;
    this.ocupado.set(true);
    try {
      await fn();
    } catch {
      /* el error queda en cms.error() */
    } finally {
      this.ocupado.set(false);
    }
  }
}
