import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VolverArriba } from './volver-arriba';

describe('VolverArriba', () => {
  let component: VolverArriba;
  let fixture: ComponentFixture<VolverArriba>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VolverArriba]
    })
    .compileComponents();

    fixture = TestBed.createComponent(VolverArriba);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
