import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TrabajaNosotros } from './trabaja-nosotros';

describe('TrabajaNosotros', () => {
  let component: TrabajaNosotros;
  let fixture: ComponentFixture<TrabajaNosotros>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TrabajaNosotros]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TrabajaNosotros);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
