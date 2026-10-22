import { Component, computed, inject, OnInit } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';
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

  menuAbierto = false;
  submenuAbierto: string | null = null;

  /** Ítems del menú principal administrado desde el CMS */
  readonly items = computed<ItemMenu[]>(() => {
    this.cms.paginas();
    this.cms.menus();
    const nodos = this.cms.menuPublico('principal');
    return nodos.length ? nodos.map((n) => this.aItem(n)) : MENU_FIJO;
  });

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

  toggleMenu(): void {
    this.menuAbierto = !this.menuAbierto;
    if (!this.menuAbierto) this.submenuAbierto = null;
    this.toggleBodyScroll();
  }

  cerrarMenu(): void {
    this.menuAbierto = false;
    this.submenuAbierto = null;
    this.toggleBodyScroll();
    // Quita el foco del enlace pulsado para que el submenú no se quede abierto
    (document.activeElement as HTMLElement | null)?.blur();
  }

  /** Escritorio: al pasar a otra sección se cierra el submenú anterior y se abre el nuevo */
  abrirEnEscritorio(id: string): void {
    if (window.innerWidth >= 992 && !this.menuAbierto) this.submenuAbierto = id;
  }

  /** Teclado: al salir con Tab de una sección se cierra su submenú */
  cerrarSiSaleElFoco(id: string, evento: FocusEvent): void {
    const seccion = evento.currentTarget as HTMLElement;
    const destino = evento.relatedTarget as Node | null;
    if (!this.menuAbierto && this.submenuAbierto === id && !seccion.contains(destino)) {
      this.submenuAbierto = null;
    }
  }

  toggleSubmenu(id: string): void {
    this.submenuAbierto = this.submenuAbierto === id ? null : id;
  }

  private toggleBodyScroll(): void {
    document.body.style.overflow = this.menuAbierto ? 'hidden' : '';
  }
}
