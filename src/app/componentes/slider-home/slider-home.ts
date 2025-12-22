import { AfterViewInit, Component } from '@angular/core';
import Swiper from 'swiper';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

@Component({
  selector: 'app-slider-home',
  standalone: true,
  templateUrl: './slider-home.html',
  styleUrls: ['./slider-home.css']
})
export class SliderHomeComponent implements AfterViewInit {

  ngAfterViewInit(): void {
    new Swiper('.swiper', {
      direction: 'horizontal', // 🔑 CLAVE
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
      }
    });
  }
}
