import { TestBed } from '@angular/core/testing';

import { TransparenciaModule } from './transparencia-module';

describe('TransparenciaModule', () => {
  let service: TransparenciaModule;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TransparenciaModule);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
