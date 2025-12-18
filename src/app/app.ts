import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NgbPaginationModule, NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
import { NgbAlert } from '@ng-bootstrap/ng-bootstrap';

      import { NgbPagination,
	NgbPaginationEllipsis,
	NgbPaginationFirst,
	NgbPaginationLast,
	NgbPaginationNext,
	NgbPaginationNumber,
	NgbPaginationPrevious,
	NgbPaginationPages, } from '@ng-bootstrap/ng-bootstrap';
  import { Home } from './componentes/home/home';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet,NgbAlertModule,NgbPaginationModule],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('hospitalguaviare');
}
