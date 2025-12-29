import { Component, Input } from '@angular/core';
import { AuthGuard } from '../../../shared/guards/auth/auth-guard';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-dashboard-sidebar',
  imports:[CommonModule],
  templateUrl: './dashboard-sidebar.html',
  styleUrl: './dashboard-sidebar.css',
})
export class DashboardSidebar {

  @Input() collapsed = false;
  showLogoutModal = false;

  constructor(private authGuard: AuthGuard){}

  logout(event: Event): void{
    event.preventDefault();
    this.authGuard.logout();
  }

  openLogoutModal(): void {
    this.showLogoutModal = true;
  }

  closeLogoutModal(): void {
    this.showLogoutModal = false;
  }

  confirmLogout(): void {
    this.showLogoutModal = false;
    this.authGuard.logout();
  }

}
