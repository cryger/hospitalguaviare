import { Component } from '@angular/core';
import { RouterLink } from "@angular/router";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-navbar',
  imports: [RouterLink,CommonModule],
  templateUrl: './navbar.html',
  styleUrl: './navbar.css',
})
export class Navbar {
  menuAbierto = false;

  toggleMenu(): void {
  this.menuAbierto = !this.menuAbierto;
  this.toggleBodyScroll();
}

cerrarMenu(): void {
  this.menuAbierto = false;
  this.toggleBodyScroll();
}

private toggleBodyScroll(): void {
  document.body.style.overflow = this.menuAbierto ? 'hidden' : '';
}

}
