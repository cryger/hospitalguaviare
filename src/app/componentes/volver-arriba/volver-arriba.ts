import { Component } from '@angular/core';

@Component({
  selector: 'app-volver-arriba',
  imports: [],
  templateUrl: './volver-arriba.html',
  styleUrl: './volver-arriba.css',
})
export class VolverArriba {
  backGoToUp(): void {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
}
