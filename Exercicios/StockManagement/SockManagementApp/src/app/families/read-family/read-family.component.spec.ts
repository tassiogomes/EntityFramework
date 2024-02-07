import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReadFamilyComponent } from './read-family.component';

describe('ReadFamilyComponent', () => {
  let component: ReadFamilyComponent;
  let fixture: ComponentFixture<ReadFamilyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ReadFamilyComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ReadFamilyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
