import { ComponentFixture, TestBed } from '@angular/core/testing';

import { transparenciaAdminComponent } from './transparencia-admin';

describe('TransparenciaAdminComponent', () => {
  let component: transparenciaAdminComponent;
  let fixture: ComponentFixture<transparenciaAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [transparenciaAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(transparenciaAdminComponent);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
