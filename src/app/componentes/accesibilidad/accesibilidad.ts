import { Component } from '@angular/core';
import { Accessibility } from '../../shared/services/accessibility/accessibility';
import { ScreenReaderService } from '../../shared/services/accessibility/screen-reader.service';
import { AccesibilidadService } from '../../shared/services/accesibilidad-service/accesibilidad-service';
import { AccesibilidadItem } from '../../shared/models/accesibilidad-model/accesibilidad-model/accesibilidad-model-module';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-accesibilidad',
  standalone: true,
  templateUrl: './accesibilidad.html',
  styleUrls: ['./accesibilidad.css'],
  imports: [CommonModule],
})
export class Accesibilidad {

  menuOpen: boolean = true;
  fontSize: number = 16; // tamaño base
  private contrast_key = 'high-contrast';
  items: AccesibilidadItem[] = [];
  abrir: any;

  constructor(private accessiblity:Accessibility, private screenReader:ScreenReaderService, private accesibilidadService: AccesibilidadService){}

  ngOnInit():void{
    this.items = this.accesibilidadService.getActivos();

  }

  // Abrir/cerrar menú
  toggleMenu(): void {
    this.menuOpen = !this.menuOpen;
  }

  // Alterna contraste alto
  cambiarContexto(): void {

    this.accessiblity.toggleContrast();
    console.log('Se cambio el contraste a un color govco');

    /*document.body.classList.toggle('alto-contraste');*/

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

  //Centro de relevo para lengua de senas
  centroRelevo():void{
    window.open(
    'https://ticsinbarreras.mintic.gov.co/791/w3-propertyvalue-339742.html',
    '_blank',
    'noopener,noreferrer'
  );
  }
}
