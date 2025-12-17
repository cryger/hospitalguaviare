import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Normatividad } from './normatividad';

describe('Normatividad', () => {
  let component: Normatividad;
  let fixture: ComponentFixture<Normatividad>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Normatividad]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Normatividad);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
