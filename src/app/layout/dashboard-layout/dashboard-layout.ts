import { Component, DestroyRef, HostListener, inject, signal } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { filter } from 'rxjs';
import { takeUntilDestroyed } from '@angular/core/rxjs-interop';
import { DashboardTopbar } from '../../componentes/dashboard/dashboard-topbar/dashboard-topbar';
import { DashboardSidebar } from '../../componentes/dashboard/dashboard-sidebar/dashboard-sidebar';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { IdleService } from '../../shared/services/idle-service/idle-service';
import { Breadcrumb } from '../../componentes/breadcrumb/breadcrumb';
import { PermisosService } from '../../shared/services/permisos/permisos.service';

/** Mismo punto de corte que el CSS (max-width: 991px) */
const CONSULTA_MOVIL = '(max-width: 991px)';

@Component({
  selector: 'app-dashboard-layout',
  imports: [DashboardSidebar, DashboardTopbar, RouterOutlet, Accesibilidad, Breadcrumb],
  templateUrl: './dashboard-layout.html',
  styleUrl: './dashboard-layout.css',
})
export class DashboardLayout {
  private readonly idleService = inject(IdleService);

  /** Se evalúa desde el primer render: en el teléfono nunca se pinta el sidebar de escritorio */
  private readonly media = window.matchMedia(CONSULTA_MOVIL);

  readonly isMobile = signal(this.media.matches);
  readonly isSidebarCollapsed = signal(leerColapsado());
  readonly isSidebarOpenMobile = signal(false);

  constructor() {
    this.idleService.startWatching();
    // Si el administrador cambió el rol de este usuario, el menú se actualiza al entrar
    inject(PermisosService).refrescar();

    // Cambio de resolución / rotación del teléfono: se adapta de inmediato
    const alCambiar = (e: MediaQueryListEvent) => {
      this.isMobile.set(e.matches);
      this.isSidebarOpenMobile.set(false);
    };
    this.media.addEventListener('change', alCambiar);
    inject(DestroyRef).onDestroy(() => this.media.removeEventListener('change', alCambiar));

    // En el teléfono el menú se cierra al navegar
    inject(Router)
      .events.pipe(filter((e) => e instanceof NavigationEnd), takeUntilDestroyed())
      .subscribe(() => this.isSidebarOpenMobile.set(false));
  }

  toggleSidebar(): void {
    if (this.isMobile()) {
      this.isSidebarOpenMobile.update((v) => !v);
      return;
    }
    this.isSidebarCollapsed.update((v) => !v);
    try {
      localStorage.setItem('sidebar-collapsed', String(this.isSidebarCollapsed()));
    } catch {
      /* almacenamiento no disponible */
    }
  }

  closeMobileSidebar(): void {
    this.isSidebarOpenMobile.set(false);
  }

  @HostListener('document:keydown.escape')
  cerrarConEscape(): void {
    if (this.isSidebarOpenMobile()) this.closeMobileSidebar();
  }
}

function leerColapsado(): boolean {
  try {
    return localStorage.getItem('sidebar-collapsed') === 'true';
  } catch {
    return false;
  }
}
