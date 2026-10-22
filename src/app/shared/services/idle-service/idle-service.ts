import { Injectable, NgZone, inject } from '@angular/core';
import { Router } from '@angular/router';
import { ConfiguracionService } from '../configuracion/configuracion.service';

/** Cierra la sesión del panel tras el tiempo de inactividad definido en Admin › Configuración */
@Injectable({ providedIn: 'root' })
export class IdleService {
  private readonly router = inject(Router);
  private readonly ngZone = inject(NgZone);
  private readonly configuracion = inject(ConfiguracionService);

  private timeoutId: ReturnType<typeof setTimeout> | undefined;
  private escuchando = false;
  private readonly alActividad = () => this.resetTimer();

  private get tiempoInactividad(): number {
    return this.configuracion.sesion().minutosInactividad * 60 * 1000;
  }

  startWatching(): void {
    this.configuracion.cargar().then(() => this.resetTimer());
    this.resetTimer();
    if (this.escuchando) return;
    this.escuchando = true;
    ['mousemove', 'keydown', 'click', 'scroll', 'touchstart'].forEach((evento) =>
      window.addEventListener(evento, this.alActividad, { passive: true }),
    );
  }

  stopWatching(): void {
    clearTimeout(this.timeoutId);
    ['mousemove', 'keydown', 'click', 'scroll', 'touchstart'].forEach((evento) =>
      window.removeEventListener(evento, this.alActividad),
    );
    this.escuchando = false;
  }

  /** Reinicia el conteo (también se usa al cambiar el tiempo en Configuración) */
  resetTimer(): void {
    clearTimeout(this.timeoutId);
    this.ngZone.runOutsideAngular(() => {
      this.timeoutId = setTimeout(() => this.ngZone.run(() => this.logout()), this.tiempoInactividad);
    });
  }

  private logout(): void {
    this.stopWatching();
    ['auth', 'cms-token', 'cms-usuario', 'username'].forEach((k) => localStorage.removeItem(k));
    localStorage.removeItem('sidebar-collapsed');
    this.router.navigate(['/login'], { queryParams: { inactividad: 1 } });
  }
}
