import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { PermisosService } from '../../services/permisos/permisos.service';
import { Modulo } from '../../models/permisos/permisos';

/**
 * Permite entrar a una ruta del dashboard solo si el usuario tiene el módulo
 * indicado en `data: { modulo: '...' }`. Si no, lo lleva a su primera página permitida.
 */
export const moduloGuard: CanActivateFn = async (route) => {
  const permisos = inject(PermisosService);
  const router = inject(Router);
  const modulo = route.data?.['modulo'] as Modulo | undefined;
  if (!modulo) return true;

  if (!permisos.puede(modulo)) {
    // Puede que el administrador le haya dado el permiso hace poco
    await permisos.refrescar();
  }
  if (permisos.puede(modulo)) return true;

  const destino = permisos.rutaInicio();
  return router.parseUrl(destino === '/admin' && modulo === 'resumen' ? '/login' : destino);
};
