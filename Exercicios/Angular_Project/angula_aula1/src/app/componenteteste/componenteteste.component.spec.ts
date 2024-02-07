import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ComponentetesteComponent } from './componenteteste.component';

describe('ComponentetesteComponent', () => {
  let component: ComponentetesteComponent;
  let fixture: ComponentFixture<ComponentetesteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ComponentetesteComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ComponentetesteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
