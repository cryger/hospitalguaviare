import { Component } from '@angular/core';
import { DashboardTopbar } from '../../componentes/dashboard/dashboard-topbar/dashboard-topbar';
import { DashboardSidebar } from '../../componentes/dashboard/dashboard-sidebar/dashboard-sidebar';
import { DashboardCards } from '../../componentes/dashboard/dashboard-cards/dashboard-cards';
import { DashboardTable } from '../../componentes/dashboard/dashboard-table/dashboard-table';

@Component({
  selector: 'app-dashboard-layout',
  imports: [DashboardSidebar, DashboardTopbar, DashboardCards, DashboardTable],
  templateUrl: './dashboard-layout.html',
  styleUrl: './dashboard-layout.css',
})
export class DashboardLayout {

}
