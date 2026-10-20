import { TestBed } from '@angular/core/testing';

import { ServiciosAtencion } from './servicios-atencion';

describe('ServiciosAtencion', () => {
  let service: ServiciosAtencion;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ServiciosAtencion);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
