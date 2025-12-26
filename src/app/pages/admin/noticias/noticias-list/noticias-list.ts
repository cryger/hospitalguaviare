import { Component, OnInit } from '@angular/core';
import { NoticiasService } from '../../../../shared/services/noticias/noticias';
import { Noticia } from '../../../../shared/models/noticias/noticias/noticias-module';
import { RouterLink } from "@angular/router";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-noticias-list',
  imports: [RouterLink,CommonModule],
  templateUrl: './noticias-list.html',
  styleUrl: './noticias-list.css',
})
export class NoticiasList implements OnInit {

  noticias : Noticia[] = [];
  constructor(private noticiasService: NoticiasService) {}

  ngOnInit(): void {
      this.noticias = this.noticiasService.getAll();
  }

  eliminar(id:number){
    if(confirm("¿Está seguro de eliminar la noticia?")){
      this.noticiasService.delete(id);
      this.noticias = this.noticiasService.getAll();
  }
}

}
