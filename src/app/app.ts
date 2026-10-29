import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NgbPaginationModule, NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
import { NgbAlert } from '@ng-bootstrap/ng-bootstrap';
import { ReactiveFormsModule } from '@angular/forms';
import { NgbPagination,
	NgbPaginationEllipsis,
	NgbPaginationFirst,
	NgbPaginationLast,
	NgbPaginationNext,
	NgbPaginationNumber,
	NgbPaginationPrevious,
	NgbPaginationPages, } from '@ng-bootstrap/ng-bootstrap';
import { VisorDocumentosComponent } from './shared/components/visor-documentos/visor-documentos';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet,NgbAlertModule,NgbPaginationModule,ReactiveFormsModule,VisorDocumentosComponent],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('hospitalguaviare');
}
