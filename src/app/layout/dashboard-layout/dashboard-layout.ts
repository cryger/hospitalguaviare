import { Component } from '@angular/core';
import { DashboardTopbar } from '../../componentes/dashboard/dashboard-topbar/dashboard-topbar';
import { DashboardSidebar } from '../../componentes/dashboard/dashboard-sidebar/dashboard-sidebar';
import { DashboardCards } from '../../componentes/dashboard/dashboard-cards/dashboard-cards';
import { DashboardTable } from '../../componentes/dashboard/dashboard-table/dashboard-table';
import { RouterOutlet } from "@angular/router";
import { Route } from '@angular/router';

@Component({
  selector: 'app-dashboard-layout',
  imports: [DashboardSidebar, DashboardTopbar, RouterOutlet],
  templateUrl: './dashboard-layout.html',
  styleUrl: './dashboard-layout.css',
})
export class DashboardLayout {

}
