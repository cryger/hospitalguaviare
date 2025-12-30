import { Component } from '@angular/core';
import { DashboardTopbar } from '../../componentes/dashboard/dashboard-topbar/dashboard-topbar';
import { DashboardSidebar } from '../../componentes/dashboard/dashboard-sidebar/dashboard-sidebar';
import { DashboardCards } from '../../componentes/dashboard/dashboard-cards/dashboard-cards';
import { DashboardTable } from '../../componentes/dashboard/dashboard-table/dashboard-table';
import { RouterOutlet } from "@angular/router";
import { Route } from '@angular/router';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';

@Component({
  selector: 'app-dashboard-layout',
  imports: [DashboardSidebar, DashboardTopbar, RouterOutlet,Accesibilidad],
  templateUrl: './dashboard-layout.html',
  styleUrl: './dashboard-layout.css',
})
export class DashboardLayout {

  ngOnInit():void{
    // 🔐 Recupera el estado guardado
    const savedState = localStorage.getItem('sidebar-collapsed');
    this.isSidebarCollapsed = savedState === 'true';
  }

  isSidebarCollapsed = false;

  toggleSidebar(): void {
    this.isSidebarCollapsed = !this.isSidebarCollapsed;

     // 💾 Guarda el estado
    localStorage.setItem(
      'sidebar-collapsed',
      this.isSidebarCollapsed.toString()
    );
  }


}
