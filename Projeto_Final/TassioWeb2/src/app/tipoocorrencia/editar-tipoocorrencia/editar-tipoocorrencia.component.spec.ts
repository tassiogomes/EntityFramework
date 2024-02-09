import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditarTipoocorrenciaComponent } from './editar-tipoocorrencia.component';

describe('EditarTipoocorrenciaComponent', () => {
  let component: EditarTipoocorrenciaComponent;
  let fixture: ComponentFixture<EditarTipoocorrenciaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [EditarTipoocorrenciaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(EditarTipoocorrenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
