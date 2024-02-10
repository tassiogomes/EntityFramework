import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DeleteTipoocorrenciaComponent } from './delete-tipoocorrencia.component';

describe('DeleteTipoocorrenciaComponent', () => {
  let component: DeleteTipoocorrenciaComponent;
  let fixture: ComponentFixture<DeleteTipoocorrenciaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [DeleteTipoocorrenciaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DeleteTipoocorrenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
