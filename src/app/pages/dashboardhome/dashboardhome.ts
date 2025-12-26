import { Component } from '@angular/core';

@Component({
  selector: 'app-dashboard-home',
  templateUrl: './dashboardhome.html',
  styleUrls: ['./dashboardhome.css']
})
export class DashboardHome {

  stats = {
    totalNoticias: 8,
    publicadas: 5,
    borradores: 3,
    pqrsPendientes: 2,
    ultimaActualizacion: '2025-01-10'
  };

}
