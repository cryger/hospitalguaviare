import { TestBed } from '@angular/core/testing';

import { TransparenciaService } from './transparencia';

describe('Transparencia', () => {
  let service: TransparenciaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TransparenciaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
