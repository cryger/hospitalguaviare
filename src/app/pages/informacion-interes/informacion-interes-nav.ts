import { Component } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';

/** Pestañas para moverse entre las secciones de "Información de interés" */
@Component({
  selector: 'app-info-interes-nav',
  standalone: true,
  imports: [RouterLink, RouterLinkActive],
  template: `
    <nav class="ii-nav" aria-label="Secciones de Información de interés">
      <a routerLink="/informacion-de-interes/invitaciones-a-cotizar" routerLinkActive="on" ariaCurrentWhenActive="page">
        <span aria-hidden="true">💼</span> Invitaciones a cotizar
      </a>
      <a routerLink="/informacion-de-interes/trabaja-con-nosotros" routerLinkActive="on" ariaCurrentWhenActive="page">
        <span aria-hidden="true">🧑‍⚕️</span> Trabaja con nosotros
      </a>
    </nav>
  `,
  styles: `
    .ii-nav { display: flex; flex-wrap: wrap; gap: .5rem; margin: 0 0 1.5rem; }
    .ii-nav a {
      display: inline-flex; align-items: center; gap: .45rem;
      padding: .55rem 1rem; border-radius: 999px; border: 1px solid #c9d7ee;
      background: #fff; color: #004884; font-weight: 600; font-size: .92rem; text-decoration: none;
      transition: background .15s, color .15s, border-color .15s;
    }
    .ii-nav a:hover { background: #eef4fc; }
    .ii-nav a.on { background: #004884; border-color: #004884; color: #fff; }
    .ii-nav a:focus-visible { outline: 3px solid #ffab00; outline-offset: 2px; }
  `,
})
export class InformacionInteresNav {}
