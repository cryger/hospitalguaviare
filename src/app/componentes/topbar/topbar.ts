import { Component } from '@angular/core';
import { TranslationService, IdiomaLibre } from '../../shared/services/translate-site/translate-site';


@Component({
  selector: 'app-topbar',
  imports: [],
  templateUrl: './topbar.html',
  styleUrl: './topbar.css',
})
export class Topbar {
  textoOriginal = '';
  textoTraducido = '';
  evaluar : any;

  constructor(public  translationService: TranslationService){ }

  async traducirAE():Promise<void>{
    const target = this.translationService.getIdiomaActual() === 'es' ? 'en' : 'es';
    this.textoTraducido = await this.translationService.traducir(
      this.textoOriginal,
      this.translationService.getIdiomaActual(),
      target
    );
    await this.translationService.setIdioma(target as IdiomaLibre);
  }




}
