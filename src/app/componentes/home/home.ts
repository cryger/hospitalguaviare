import { Component } from '@angular/core';
import { SliderHomeComponent } from '../slider-home/slider-home';
import { NoticiasPublicComponent } from '../../pages/noticias/noticias';
import { ServiciosHome } from '../servicios-home/servicios-home';

@Component({
  selector: 'app-home',
  imports: [SliderHomeComponent, NoticiasPublicComponent, ServiciosHome],
  templateUrl: './home.html',
  styleUrl: './home.css',
})
export class Home {

}
