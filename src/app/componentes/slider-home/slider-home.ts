import { AfterViewInit, Component } from '@angular/core';

declare const Swiper: any; // 👈 CLAVE para usar CDN

@Component({
  selector: 'app-slider-home',
  standalone: true,
  templateUrl: './slider-home.html',
  styleUrls: ['./slider-home.css']
})
export class SliderHomeComponent implements AfterViewInit {

  ngAfterViewInit(): void {
    // Espera un ciclo para asegurar que el DOM esté listo
    setTimeout(() => {
      new Swiper('.swiper', {
        direction: 'horizontal', // ✅ horizontal
        loop: true,

        autoplay: {
          delay: 5000,
          disableOnInteraction: false
        },

        pagination: {
          el: '.swiper-pagination',
          clickable: true
        },

        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        },

        a11y: {
          enabled: true
        }
      });
    }, 0);
  }
}
