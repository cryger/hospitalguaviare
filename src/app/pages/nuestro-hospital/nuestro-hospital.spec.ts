import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NuestroHospital } from './nuestro-hospital';

describe('NuestroHospital', () => {
  let component: NuestroHospital;
  let fixture: ComponentFixture<NuestroHospital>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NuestroHospital]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NuestroHospital);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
