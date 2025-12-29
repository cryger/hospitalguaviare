import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class Auth {
  login(user: string, pass: string): boolean {
    if (user === 'admin' && pass === 'admin123') {
      localStorage.setItem('token', 'mock-token');
      localStorage.setItem('role', 'ADMIN');
      localStorage.setItem('username', user);
      localStorage.setItem('admin_logged', 'true');

      return true;
    }else{
      localStorage.setItem('admin_logged', 'false');
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
