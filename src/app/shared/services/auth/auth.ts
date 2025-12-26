import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class Auth {
  login(user: string, pass: string): boolean {
    if (user === 'admin' && pass === 'admin123') {
      localStorage.setItem('token', 'mock-token');
      localStorage.setItem('role', 'ADMIN');
      return true;
    }
    return false;
  }

  isLogged(): boolean {
    return !!localStorage.getItem('token');
  }

  logout() {
    localStorage.clear();
  }
}
