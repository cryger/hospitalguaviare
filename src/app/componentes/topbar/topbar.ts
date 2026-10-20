import { Component, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TranslationService, IdiomaLibre } from '../../shared/services/translate-site/translate-site';


@Component({
  selector: 'app-topbar',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './topbar.html',
  styleUrls: ['./topbar.css']
})
export class Topbar {
  // Propiedad para controlar si el menú está visible
  mostrarMenuIdiomas = false;

  // Idioma actual
  idiomaActual: IdiomaLibre = 'es';

  // Lista de idiomas disponibles
  idiomas: { codigo: IdiomaLibre; nombre: string; bandera: string }[] = [
    { codigo: 'es', nombre: 'Español', bandera: '🇪🇸'},
    { codigo: 'en', nombre: 'English', bandera: '🇺🇸' },
    { codigo: 'fr', nombre: 'Français', bandera: '🇫🇷' },
    { codigo: 'pt', nombre: 'Português', bandera: '🇵🇹' },
    { codigo: 'de', nombre: 'Deutsch', bandera: '🇩🇪' },
    { codigo: 'it', nombre: 'Italiano', bandera: '🇮🇹' },
  ];

  constructor(public translationService: TranslationService) {
    // Obtener idioma guardado
    this.idiomaActual = this.translationService.getIdiomaActual();
  }

  /**
   * Alterna la visibilidad del menú de idiomas
   */
  toggleMenuIdiomas(): void {
    this.mostrarMenuIdiomas = !this.mostrarMenuIdiomas;
  }

  /**
   * Cambia el idioma de toda la página
   */
  async cambiarIdioma(nuevoIdioma: IdiomaLibre): Promise<void> {
    // Cerrar el menú
    this.mostrarMenuIdiomas = false;

    // Si ya está en ese idioma, no hacer nada
    if (this.idiomaActual === nuevoIdioma) {
      console.log('Ya estás en este idioma');
      return;
    }

    try {
      console.log(`🌐 Cambiando idioma de ${this.idiomaActual} a ${nuevoIdioma}`);

      // Llamar al servicio para traducir toda la página
      await this.translationService.setIdioma(nuevoIdioma);

      // Actualizar idioma actual
      this.idiomaActual = nuevoIdioma;

      console.log('✅ Idioma cambiado exitosamente');

    } catch (error) {
      console.error('❌ Error al cambiar idioma:', error);
      alert('Error al traducir la página. Por favor, intenta de nuevo.');
    }
  }

  /**
   * Cierra el menú si se hace clic fuera de él
   */
  @HostListener('document:click', ['$event'])
  onDocumentClick(event: MouseEvent): void {
    const target = event.target as HTMLElement;
    const clickedInside = target.closest('.language-selector');

    if (!clickedInside && this.mostrarMenuIdiomas) {
      this.mostrarMenuIdiomas = false;
    }
  }
}
