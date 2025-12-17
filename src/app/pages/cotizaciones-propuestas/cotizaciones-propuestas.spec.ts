import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CotizacionesPropuestas } from './cotizaciones-propuestas';

describe('CotizacionesPropuestas', () => {
  let component: CotizacionesPropuestas;
  let fixture: ComponentFixture<CotizacionesPropuestas>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [CotizacionesPropuestas]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CotizacionesPropuestas);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
