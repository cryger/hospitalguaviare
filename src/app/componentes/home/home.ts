import { Component } from '@angular/core';
import { SliderHomeComponent } from '../slider-home/slider-home';
import { Noticias } from '../../pages/noticias/noticias';

@Component({
  selector: 'app-home',
  imports: [SliderHomeComponent, Noticias],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {

}
