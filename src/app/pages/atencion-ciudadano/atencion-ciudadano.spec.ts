import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AtencionCiudadano } from './atencion-ciudadano';

describe('AtencionCiudadano', () => {
  let component: AtencionCiudadano;
  let fixture: ComponentFixture<AtencionCiudadano>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AtencionCiudadano]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AtencionCiudadano);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
