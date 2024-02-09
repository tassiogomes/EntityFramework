import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CriarTipoocorrenciaComponent } from './criar-tipoocorrencia.component';

describe('CriarTipoocorrenciaComponent', () => {
  let component: CriarTipoocorrenciaComponent;
  let fixture: ComponentFixture<CriarTipoocorrenciaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [CriarTipoocorrenciaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(CriarTipoocorrenciaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
