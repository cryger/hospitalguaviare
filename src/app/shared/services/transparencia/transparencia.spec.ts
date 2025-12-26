import { TestBed } from '@angular/core/testing';

import { Transparencia } from './transparencia';

describe('Transparencia', () => {
  let service: Transparencia;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Transparencia);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
