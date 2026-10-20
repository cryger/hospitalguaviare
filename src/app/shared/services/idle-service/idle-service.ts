import { Injectable, NgZone } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({ providedIn: 'root' })
export class IdleService {

  private timeoutId: any;
  private readonly idleTime = 5 * 60 * 1000; // 15 minutos

  constructor(
    private router: Router,
    private ngZone: NgZone
  ) {}

  startWatching(): void {
    this.resetTimer();

    ['mousemove', 'keydown', 'click', 'scroll'].forEach(event => {
      window.addEventListener(event, () => this.resetTimer());
    });
  }

  stopWatching(): void {
    clearTimeout(this.timeoutId);
  }

  private resetTimer(): void {
    clearTimeout(this.timeoutId);

    this.ngZone.runOutsideAngular(() => {
      this.timeoutId = setTimeout(() => {
        this.logout();
      }, this.idleTime);
    });
  }

  private logout(): void {
    localStorage.removeItem('auth');
    localStorage.removeItem('sidebar-collapsed');
    this.router.navigate(['/login']);
  }
}
