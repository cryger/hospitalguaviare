import { TestBed } from '@angular/core/testing';

import { TrabajaNosotrosService } from './trabaja-nosotros-service';

describe('TrabajaNosotrosService', () => {
  let service: TrabajaNosotrosService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TrabajaNosotrosService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
