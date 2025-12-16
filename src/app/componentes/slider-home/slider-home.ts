import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-slider-home',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './slider-home.html',
  styleUrls: ['./slider-home.css']
})
export class SliderHomeComponent {

  currentIndex = 0;

  slides = [
    {
      image: 'assets/img/slider/BANNER_PLATAFORMA-2025.jpg',
      alt: 'Servicio de urgencias Hospital San José del Guaviare',
      title: 'Atención en Urgencias 24/7',
      description: 'Atención oportuna y humanizada para toda la comunidad.',
      link: '/atencion-ciudadano',
      linkText: 'Conoce más'
    },
    {
      image: 'assets/img/slider/vacunacion.jpg',
      alt: 'Jornada de vacunación',
      title: 'Jornadas de Vacunación',
      description: 'Protegemos la salud de nuestros niños y adultos mayores.',
      link: '/servicios',
      linkText: 'Ver jornadas'
    },
    {
      image: 'assets/img/slider/pqrsf.jpg',
      alt: 'PQRSF Hospital San José del Guaviare',
      title: 'PQRSF',
      description: 'Tu opinión es importante para mejorar nuestros servicios.',
      link: '/pqrsf',
      linkText: 'Registrar PQRSF'
    }
  ];

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slides.length;
  }

  prev() {
    this.currentIndex =
      (this.currentIndex - 1 + this.slides.length) % this.slides.length;
  }
}
