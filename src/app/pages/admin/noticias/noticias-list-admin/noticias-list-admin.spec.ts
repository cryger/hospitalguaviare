import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NoticiasListAdmin } from './noticias-list-admin';

describe('NoticiasListAdmin', () => {
  let component: NoticiasListAdmin;
  let fixture: ComponentFixture<NoticiasListAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NoticiasListAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NoticiasListAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
