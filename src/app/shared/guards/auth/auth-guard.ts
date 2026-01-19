import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { audit } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {



  constructor(private router: Router) {}

  login(username: string, password: string): boolean {
    if (username === 'admin' && password === 'admin123') {
      localStorage.setItem('auth', 'true');
      return true;
    }else{
      if(username != 'admin'){
        localStorage.setItem('auth','false' )
        localStorage.setItem('Usuario',username)
      }
    }
    return false;
  }

  logout(): void {
    localStorage.removeItem('auth');
    this.router.navigate(['/login']);
  }

  canActivate(): boolean {
    const isAuth = localStorage.getItem('auth') === 'true';

    if (!isAuth) {
      this.router.navigate(['/login']);
      return false;
    }

    return true;
  }
}
