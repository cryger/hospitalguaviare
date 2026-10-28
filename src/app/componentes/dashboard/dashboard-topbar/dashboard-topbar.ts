import { Component, Output, EventEmitter, computed, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { PermisosService } from '../../../shared/services/permisos/permisos.service';

@Component({
  selector: 'app-dashboard-topbar',
  imports: [RouterLink],
  templateUrl: './dashboard-topbar.html',
  styleUrl: './dashboard-topbar.css',
})
export class DashboardTopbar {
  @Output() toggleSidebar = new EventEmitter<void>();

  readonly permisos = inject(PermisosService);
  readonly nombreUsuario = computed(() => this.permisos.usuario()?.nombre || 'Usuario');

  get iniciales(): string {
    return this.nombreUsuario()
      .split(/\s+/)
      .map((p) => p.charAt(0))
      .join('')
      .slice(0, 2)
      .toUpperCase();
  }

  toggle(): void {
    this.toggleSidebar.emit();
  }
}
