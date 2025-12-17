import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Participa } from './participa';

describe('Participa', () => {
  let component: Participa;
  let fixture: ComponentFixture<Participa>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Participa]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Participa);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
