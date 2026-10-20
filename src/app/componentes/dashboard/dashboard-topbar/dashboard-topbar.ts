import { Component, Output, EventEmitter } from '@angular/core';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-dashboard-topbar',
  imports: [RouterLink],
  templateUrl: './dashboard-topbar.html',
  styleUrl: './dashboard-topbar.css',
})
export class DashboardTopbar {
  @Output() toggleSidebar = new EventEmitter<void>();

  readonly nombreUsuario =
    localStorage.getItem('username') || localStorage.getItem('usuario') || 'Administrador';

  get iniciales(): string {
    return this.nombreUsuario
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
