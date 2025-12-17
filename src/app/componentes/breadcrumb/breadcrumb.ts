import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router, RouterLink } from '@angular/router';
import { filter } from 'rxjs';
import { CommonModule } from '@angular/common';



interface IBreadcrumb{
  label: string;
  url: string;
}

@Component({
  selector: 'app-breadcrumb',
  imports: [RouterLink,CommonModule],
  templateUrl: './breadcrumb.html',
  styleUrl: './breadcrumb.css',
})
export class Breadcrumb implements OnInit {

  breadcrumbs: IBreadcrumb[] = [];

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.router.events.pipe(
      filter((event) => event instanceof NavigationEnd)
    ).subscribe(() => {
      this.breadcrumbs = this.buildBreadcrumbs(this.activatedRoute.root);
    });
  }

  private buildBreadcrumbs(
    route: ActivatedRoute,
    url: string = '',
    breadcrumbs: IBreadcrumb[] = []): IBreadcrumb[] {

    const children: ActivatedRoute[] = route.children;

    if (children.length === 0) {
      return breadcrumbs;
    }

    for (const child of children) {
      const routeURL: string = `${url}/${child.snapshot.url.map(segment => segment.toString()).join('/')}`;
      const label = child.snapshot.data['breadcrumb'] || '';
      if (label) {
        breadcrumbs.push({ label, url: routeURL });
      }
      return this.buildBreadcrumbs(child, routeURL, breadcrumbs);
    }

    return breadcrumbs;
  }
}
