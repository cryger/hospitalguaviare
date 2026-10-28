import { inject, Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { CmsAuthService } from '../../services/cms/cms-auth.service';
import { PermisosService } from '../../services/permisos/permisos.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  private cmsAuth = inject(CmsAuthService);
  private permisos = inject(PermisosService);

  constructor(private router: Router) {}

  /** Login local (solo modo 'local', sin API). En modo 'api' se usa CmsAuthService. */
  login(username: string, password: string): boolean {
    if (username === 'admin' && password === 'admin123') {
      localStorage.setItem('auth', 'true');
      localStorage.setItem('username', 'Administrador');
      return true;
    }
    localStorage.removeItem('auth');
    return false;
  }

  logout(): void {
    this.cmsAuth.logout();
    this.permisos.recargar();
    this.router.navigate(['/login']);
  }

  canActivate(): boolean {
    const ok = this.cmsAuth.usaApi
      ? this.cmsAuth.sesionValida()
      : localStorage.getItem('auth') === 'true';

    if (!ok) {
      this.cmsAuth.logout();
      this.permisos.recargar();
      this.router.navigate(['/login']);
      return false;
    }
    return true;
  }
}
