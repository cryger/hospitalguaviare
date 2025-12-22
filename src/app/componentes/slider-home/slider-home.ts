import {
  Component,
  OnInit,
  OnDestroy,
  AfterViewInit,
  ElementRef
} from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import * as bootstrap from 'bootstrap';

@Component({
  selector: 'app-slider-govco',
  templateUrl: './slider-home.html',
  styleUrls: ['./slider-home.css']
})
export class SliderGovcoComponent implements AfterViewInit, OnDestroy {

  private carousels: HTMLElement[] = [];
  private configurationCarousel: Record<string, any> = [];
  private resizeHandler = this.windowSizeCarrusel.bind(this);

  constructor(private el: ElementRef) {}

  /* =====================================================
     INIT
  ===================================================== */

  ngAfterViewInit(): void {
    this.initCarouselGovco();
    window.addEventListener('resize', this.resizeHandler);
    this.windowSizeCarrusel();
  }

  ngOnDestroy(): void {
    window.removeEventListener('resize', this.resizeHandler);
  }

  /* =====================================================
     INIT CARRUSEL GOV.CO
  ===================================================== */

  private initCarouselGovco(): void {
    this.carousels = Array.from(
      this.el.nativeElement.querySelectorAll('.carrusel-govco')
    );

    this.carousels.forEach((carousel: HTMLElement) => {
      if (!carousel.id) return;

      // Inicializa Bootstrap Carousel
      this.configurationCarousel[carousel.id] =
        new bootstrap.Carousel(carousel, {
          pause: false
        });

      // Play / Pause
      const controls = carousel.querySelectorAll(
        '.control-start-pause .controls'
      );

      controls.forEach(control => {
        control.addEventListener(
          'click',
          this.startStopCarousel.bind(this)
        );
      });

      // Accesibilidad GOV.CO
      carousel.addEventListener('slid.bs.carousel', () => {
        carousel
          .querySelectorAll('.carousel-item:not(.active) a')
          .forEach((a: any) => (a.tabIndex = -1));

        carousel
          .querySelectorAll('.carousel-item.active a')
          .forEach((a: any) => (a.tabIndex = 0));
      });
    });
  }

  /* =====================================================
     RESPONSIVE
  ===================================================== */

  private windowSizeCarrusel(): void {
    this.carousels.forEach(carousel => {
      if (carousel.offsetWidth < 652) {
        carousel.classList.add('responsive-carrusel-govco');
      } else {
        carousel.classList.remove('responsive-carrusel-govco');
      }
    });
  }

  /* =====================================================
     PLAY / PAUSE
  ===================================================== */

  private startStopCarousel(event: Event): void {
    const button = event.currentTarget as HTMLElement;
    const container = button.closest('.carrusel-govco') as HTMLElement;

    if (!container || !container.id) return;

    button.classList.remove('active');

    if (button.classList.contains('start')) {
      button.nextElementSibling?.classList.add('active');
      this.configurationCarousel[container.id].cycle();
    } else {
      button.previousElementSibling?.classList.add('active');
      this.configurationCarousel[container.id].pause();
    }
  }
}
