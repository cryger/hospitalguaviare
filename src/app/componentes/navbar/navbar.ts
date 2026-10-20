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
  submenuAbierto: string | null = null;

  toggleMenu(): void {
  this.menuAbierto = !this.menuAbierto;
  if(!this.menuAbierto){
    this.submenuAbierto = null;
  }
  this.toggleBodyScroll();
}

cerrarMenu(): void {
  this.menuAbierto = false;
  this.submenuAbierto = null;
  this.toggleBodyScroll();
}
toggleSubmenu(menu: string){
this.submenuAbierto = this.submenuAbierto === menu ? null: menu;
}

private toggleBodyScroll(): void {
  document.body.style.overflow = this.menuAbierto ? 'hidden' : '';
}

}
