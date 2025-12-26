import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NoticiasForm } from './noticias-form';

describe('NoticiasForm', () => {
  let component: NoticiasForm;
  let fixture: ComponentFixture<NoticiasForm>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NoticiasForm]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NoticiasForm);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
