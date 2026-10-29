import { Component, computed, input } from '@angular/core';
import { leerIcono } from '../../iconos/iconos';

/**
 * Muestra el ícono de una página del CMS.
 * Acepta "govco:<nombre>" (fuente nativa GOV.CO) o texto/emoji (páginas anteriores).
 * Es decorativo: el texto que lo acompaña ya da el significado.
 */
@Component({
  selector: 'app-icono-cms',
  template: `
    @if (icono(); as i) {
      @if (i.tipo === 'govco') {
        <span class="icono-govco" aria-hidden="true">{{ i.caracter }}</span>
      } @else {
        <span aria-hidden="true">{{ i.texto }}</span>
      }
    }
  `,
  styles: `:host { display: inline-flex; align-items: center; justify-content: center; line-height: 1; }`,
})
export class IconoCms {
  readonly valor = input<string | null | undefined>('');
  readonly icono = computed(() => leerIcono(this.valor()));
}
