import { Component } from '@angular/core';
import { SliderHomeComponent } from '../slider-home/slider-home';
import { NoticiasPublicComponent } from '../../pages/noticias/noticias';

@Component({
  selector: 'app-home',
  imports: [SliderHomeComponent, NoticiasPublicComponent],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {

}
