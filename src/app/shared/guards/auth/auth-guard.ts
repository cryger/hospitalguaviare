import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { Auth } from '../../services/auth/auth';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(
    private auth: Auth,
    private router: Router
  ) {}

  canActivate(): boolean {

    if (this.auth.isLogged()) {
      this.router.navigate(['/admin']);
      return true;
    }

    // Si no está logueado → login
    this.router.navigate(['/login']);
    return false;
  }
}
