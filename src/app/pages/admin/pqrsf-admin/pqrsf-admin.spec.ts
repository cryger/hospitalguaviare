import { ComponentFixture, TestBed } from '@angular/core/testing';
import { PqrsfAdminComponent } from '../../admin/pqrsf-admin/pqrsf-admin';

describe('PqrsfAdminComponent', () => {
  let component: PqrsfAdminComponent;
  let fixture: ComponentFixture<PqrsfAdminComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PqrsfAdminComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PqrsfAdminComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
