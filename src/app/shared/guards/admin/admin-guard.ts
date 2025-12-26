import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class AdminGuard implements CanActivate {

  constructor(private router: Router) {}

  canActivate(): boolean {
    const isAdmin = localStorage.getItem('admin_logged') === 'true';


    if (!isAdmin) {
      this.router.navigate(['/login']);
      return false;
    }else{
      console.log('Acceso concedido al área de administración.');

    }

    return true;
  }
}
