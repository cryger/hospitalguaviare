import { TestBed } from '@angular/core/testing';

import { Pqrsf } from './pqrsf';

describe('Pqrsf', () => {
  let service: Pqrsf;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Pqrsf);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
