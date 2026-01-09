import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EdicionMenuAdmin } from './edicion-menu-admin';

describe('EdicionMenuAdmin', () => {
  let component: EdicionMenuAdmin;
  let fixture: ComponentFixture<EdicionMenuAdmin>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EdicionMenuAdmin]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EdicionMenuAdmin);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
