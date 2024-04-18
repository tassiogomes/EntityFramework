import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TipoocorrenciaComponent } from './tipoocorrencia.component';

describe('TipoocorrenciaComponent', () => {
  let component: TipoocorrenciaComponent;
  let fixture: ComponentFixture<TipoocorrenciaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [TipoocorrenciaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TipoocorrenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
