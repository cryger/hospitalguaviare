import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AccesibilidadAdmin } from './accesibilidad-admin';

describe('AccesibilidadAdmin', () => {
  let component: AccesibilidadAdmin;
  let fixture: ComponentFixture<AccesibilidadAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AccesibilidadAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AccesibilidadAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
