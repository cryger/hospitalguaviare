import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ServiciosAtencionAdmin } from './servicios-atencion-admin';

describe('ServiciosAtencionAdmin', () => {
  let component: ServiciosAtencionAdmin;
  let fixture: ComponentFixture<ServiciosAtencionAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ServiciosAtencionAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ServiciosAtencionAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
