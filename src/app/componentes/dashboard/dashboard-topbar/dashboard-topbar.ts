import { Component,Output, EventEmitter } from '@angular/core';
import { TranslationService } from '../../../shared/services/translate-site/translate-site';

@Component({
  selector: 'app-dashboard-topbar',
  imports: [],
  templateUrl: './dashboard-topbar.html',
  styleUrl: './dashboard-topbar.css',
})
export class DashboardTopbar {

  @Output() toggleSidebar = new EventEmitter<void>();

  toggle():void{
    this.toggleSidebar.emit();
  }



}
