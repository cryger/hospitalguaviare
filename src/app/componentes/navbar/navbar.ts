import { Component, computed, DestroyRef, HostListener, inject, OnInit, signal } from '@angular/core';
import { NavigationEnd, Router, RouterLink, RouterLinkActive } from '@angular/router';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { filter } from 'rxjs';
import { CmsService } from '../../shared/services/cms/cms.service';
import { CmsPaginaNodo } from '../../shared/models/cms/cms.models';

interface ItemMenu {
  id: string;
  titulo: string;
  url: string;
  externo: boolean;
  hijos: ItemMenu[];
}

/** Menú de respaldo si el CMS aún no tiene un menú principal publicado */
const MENU_FIJO: ItemMenu[] = [
  ['Transparencia y acceso a la información pública', '/transparencia'],
  ['Nuestro Hospital', '/nuestro-hospital'],
  ['Atención y servicios a la ciudadanía', '/atencion-y-servicios-a-la-ciudadania'],
  ['Participa', '/participa'],
  ['Información de interés', '/informacion-de-interes'],
].map(([titulo, url]) => ({ id: url, titulo, url, externo: false, hijos: [] }));

@Component({
  selector: 'app-navbar',
  imports: [RouterLink, RouterLinkActive],
  templateUrl: './navbar.html',
  styleUrl: './navbar.css',
})
export class Navbar implements OnInit {
  private cms = inject(CmsService);

  /** Escritorio con mouse: los submenús se abren al pasar el cursor */
  private readonly escritorio = window.matchMedia('(min-width: 992px)');

  readonly menuAbierto = signal(false);
  /** Solo un submenú abierto a la vez */
  readonly submenuAbierto = signal<string | null>(null);

  /** Ítems del menú principal administrado desde el CMS */
  readonly items = computed<ItemMenu[]>(() => {
    this.cms.paginas();
    this.cms.menus();
    const nodos = this.cms.menuPublico('principal');
    return nodos.length ? nodos.map((n) => this.aItem(n)) : MENU_FIJO;
  });

  constructor() {
    // Al cambiar de sección se cierran el submenú y el menú móvil
    inject(Router)
      .events.pipe(filter((e) => e instanceof NavigationEnd), takeUntilDestroyed())
      .subscribe(() => this.cerrarMenu());

    // Si pasa de escritorio a móvil (o al revés) se reinicia el estado
    const alCambiar = () => this.cerrarMenu();
    this.escritorio.addEventListener('change', alCambiar);
    inject(DestroyRef).onDestroy(() => this.escritorio.removeEventListener('change', alCambiar));
  }

  ngOnInit(): void {
    this.cms.cargar();
  }

  private aItem(n: CmsPaginaNodo): ItemMenu {
    const url = this.cms.urlPagina(n.pagina);
    return {
      id: String(n.pagina.id),
      titulo: n.pagina.titulo,
      url,
      externo: this.cms.esExterna(url),
      hijos: n.hijos.map((h) => this.aItem(h)),
    };
  }

  /* ===== Escritorio: mouse ===== */
  alEntrar(id: string): void {
    if (this.escritorio.matches) this.submenuAbierto.set(id); // cierra el anterior y abre este
  }

  alSalir(id: string): void {
    if (this.escritorio.matches && this.submenuAbierto() === id) this.submenuAbierto.set(null);
  }

  /* ===== Escritorio: teclado (Tab) ===== */
  alEnfocar(id: string): void {
    if (this.escritorio.matches) this.submenuAbierto.set(id);
  }

  alDesenfocar(id: string, e: FocusEvent): void {
    const li = e.currentTarget as HTMLElement;
    if (this.escritorio.matches && !li.contains(e.relatedTarget as Node | null) && this.submenuAbierto() === id) {
      this.submenuAbierto.set(null);
    }
  }

  @HostListener('document:keydown.escape')
  cerrarConEscape(): void {
    if (this.submenuAbierto() || this.menuAbierto()) this.cerrarMenu();
  }

  /* ===== Clic (móvil, tablet y escritorio) ===== */
  toggleMenu(): void {
    this.menuAbierto.update((v) => !v);
    if (!this.menuAbierto()) this.submenuAbierto.set(null);
    this.toggleBodyScroll();
  }

  cerrarMenu(): void {
    this.menuAbierto.set(false);
    this.submenuAbierto.set(null);
    this.toggleBodyScroll();
    // Quita el foco del enlace pulsado para que no quede "pegado" abierto
    const activo = document.activeElement as HTMLElement | null;
    if (activo?.closest('.cms-dropdown')) activo.blur();
  }

  toggleSubmenu(id: string): void {
    // En escritorio el mouse/foco ya lo abrió: el clic solo lo asegura abierto
    if (this.escritorio.matches) {
      this.submenuAbierto.set(id);
      return;
    }
    this.submenuAbierto.update((actual) => (actual === id ? null : id));
  }

  private toggleBodyScroll(): void {
    document.body.style.overflow = this.menuAbierto() ? 'hidden' : '';
  }
}
