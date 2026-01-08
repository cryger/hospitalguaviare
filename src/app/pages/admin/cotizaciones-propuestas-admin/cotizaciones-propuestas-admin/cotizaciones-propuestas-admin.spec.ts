import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CotizacionesPropuestasAdmin } from './cotizaciones-propuestas-admin';

describe('CotizacionesPropuestasAdmin', () => {
  let component: CotizacionesPropuestasAdmin;
  let fixture: ComponentFixture<CotizacionesPropuestasAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CotizacionesPropuestasAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CotizacionesPropuestasAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
