import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class Accessibility {

  private CONTRAST_KEY = 'high-contrast';

  constructor(){
    const saved = localStorage.getItem(this.CONTRAST_KEY);
    if(saved === 'true'){
      document.body.classList.add('high-contrast');
    }
  }

  toggleContrast():void{
    const enabled = document.body.classList.toggle ('high-contrast');
    localStorage.setItem(this.CONTRAST_KEY, String(enabled));

  }

  isContrastEnabled():boolean{
    return document.body.classList.contains('high-contrast');
  }

}
