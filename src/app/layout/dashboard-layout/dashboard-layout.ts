import { Component, HostListener } from '@angular/core';
import { DashboardTopbar } from '../../componentes/dashboard/dashboard-topbar/dashboard-topbar';
import { DashboardSidebar } from '../../componentes/dashboard/dashboard-sidebar/dashboard-sidebar';
import { DashboardCards } from '../../componentes/dashboard/dashboard-cards/dashboard-cards';
import { DashboardTable } from '../../componentes/dashboard/dashboard-table/dashboard-table';
import { RouterOutlet } from "@angular/router";
import { Route } from '@angular/router';
import { Accesibilidad } from '../../componentes/accesibilidad/accesibilidad';
import { CommonModule } from '@angular/common';
import { IdleService } from '../../shared/services/idle-service/idle-service';
import { Breadcrumb } from '../../componentes/breadcrumb/breadcrumb';

@Component({
  selector: 'app-dashboard-layout',
  imports: [DashboardSidebar, DashboardTopbar, RouterOutlet,Accesibilidad,CommonModule,Breadcrumb],
  templateUrl: './dashboard-layout.html',
  styleUrl: './dashboard-layout.css',
})
export class DashboardLayout {

  constructor(private idleService: IdleService){}
  isSidebarCollapsed = false;
  isSidebarOpenMobile = false;       // Mobile
  isMobile = false;

  ngOnInit():void{
    // 🔐 Recupera el estado guardado
    const savedState = localStorage.getItem('sidebar-collapsed');
    this.isSidebarCollapsed = savedState === 'true';
    this.idleService.startWatching();


  }


  toggleSidebar(): void {
  if (this.isMobile) {
    this.isSidebarOpenMobile = !this.isSidebarOpenMobile;
  } else {
    this.isSidebarCollapsed = !this.isSidebarCollapsed;
    localStorage.setItem(
      'sidebar-collapsed',
      this.isSidebarCollapsed.toString()
    );
  }
}

 @HostListener('window:resize')
checkScreen(): void {
  this.isMobile = window.innerWidth < 992;

  if (this.isMobile) {
    // 🔴 EN MOBILE SIEMPRE INICIA CERRADO
    this.isSidebarOpenMobile = false;
  }
}

  closeMobileSidebar(): void {
    if (this.isMobile) {
      this.isSidebarOpenMobile = false;
    }
  }



}
