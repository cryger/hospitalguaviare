import { TestBed } from '@angular/core/testing';

import { TranslateDomService } from './translate-dom';

describe('TranslateDom', () => {
  let service: TranslateDomService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TranslateDomService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
