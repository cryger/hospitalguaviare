import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';
import { CMS_CONFIG } from './cms-config';
import { CmsAuthService } from './cms-auth.service';

/** Agrega el token a las peticiones hacia la API y cierra sesión si expira */
export const cmsAuthInterceptor: HttpInterceptorFn = (req, next) => {
  const config = inject(CMS_CONFIG);
  const auth = inject(CmsAuthService);
  const router = inject(Router);

  if (config.modo !== 'api' || !req.url.startsWith(config.apiUrl)) return next(req);

  const token = auth.token;
  const peticion = token ? req.clone({ setHeaders: { Authorization: `Bearer ${token}` } }) : req;

  return next(peticion).pipe(
    catchError((err: HttpErrorResponse) => {
      if (err.status === 401 && token && !req.url.endsWith('/auth/login')) {
        auth.logout();
        router.navigate(['/login'], { queryParams: { expirada: 1 } });
      }
      return throwError(() => err);
    }),
  );
};
