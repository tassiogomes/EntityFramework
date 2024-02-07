import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateFamilyComponent } from './update-family.component';

describe('UpdateFamilyComponent', () => {
  let component: UpdateFamilyComponent;
  let fixture: ComponentFixture<UpdateFamilyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [UpdateFamilyComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(UpdateFamilyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
