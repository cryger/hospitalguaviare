import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TrabajaNosotrosAdmin } from './trabaja-nosotros-admin';

describe('TrabajaNosotrosAdmin', () => {
  let component: TrabajaNosotrosAdmin;
  let fixture: ComponentFixture<TrabajaNosotrosAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TrabajaNosotrosAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TrabajaNosotrosAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
