import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Configuacion } from './configuracion';

describe('Configuracion', () => {
  let component: Configuacion;
  let fixture: ComponentFixture<Configuacion>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Configuacion]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Configuacion);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
