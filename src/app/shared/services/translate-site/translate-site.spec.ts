import { TestBed } from '@angular/core/testing';

import { TranslateSite } from './translate-site';

describe('TranslateSite', () => {
  let service: TranslateSite;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TranslateSite);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
