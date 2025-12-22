import { Component } from '@angular/core';
import { SliderGovcoComponent } from '../slider-home/slider-home';
import { Noticias } from '../../pages/noticias/noticias';

@Component({
  selector: 'app-home',
  imports: [SliderGovcoComponent, Noticias],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {

}
