import { Component } from '@angular/core';


@Component({
  selector: 'app-accesibilidad',
  standalone: true,
  templateUrl: './accesibilidad.html',
  styleUrls: ['./accesibilidad.css'],
})
export class Accesibilidad {

  menuOpen: boolean = true;
  fontSize: number = 16; // tamaño base

  // Abrir/cerrar menú
  toggleMenu(): void {
    this.menuOpen = !this.menuOpen;
  }

  // Alterna contraste alto
  cambiarContexto(): void {
    document.body.classList.toggle('alto-contraste');
  }

  // Reduce la letra suavemente
  disminuirTamanio(): void {
    if (this.fontSize > 10) {
      this.fontSize -= 2;
      document.documentElement.style.fontSize = `${this.fontSize}px`;
    }
  }

  // Aumenta letra
  aumentarTamanio(): void {
    if (this.fontSize < 32) {
      this.fontSize += 2;
      document.documentElement.style.fontSize = `${this.fontSize}px`;
    }
  }

  // Lector de pantalla nativo
  screenLecture(): void {
    const texto = document.body.innerText;
    const speech = new SpeechSynthesisUtterance(texto);
    window.speechSynthesis.speak(speech);
  }
}
