import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Pqrsf } from './pqrsf';

describe('Pqrsf', () => {
  let component: Pqrsf;
  let fixture: ComponentFixture<Pqrsf>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Pqrsf]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Pqrsf);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
