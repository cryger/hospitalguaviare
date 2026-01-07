import { Directive, ElementRef,HostListener,Input } from '@angular/core';
import { ScreenReaderService } from '../../services/accessibility/screen-reader.service';

@Directive({
  selector: '[appReadOnHoverDirective]',
})
export class ReadOnHoverDirective {

   @Input('readOnHover') text = '';

  constructor(
    private el: ElementRef,
    private reader: ScreenReaderService
  ) {}

  @HostListener('mouseenter')
  @HostListener('focus')
  onHover(): void {
    const texto = this.text || this.el.nativeElement.innerText;
    this.reader.speak(texto.trim());
  }

}
