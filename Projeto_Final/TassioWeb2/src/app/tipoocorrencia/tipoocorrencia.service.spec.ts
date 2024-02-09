import { TestBed } from '@angular/core/testing';

import { TipoocorrenciaService } from './tipoocorrencia.service';

describe('TipoocorrenciaService', () => {
  let service: TipoocorrenciaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TipoocorrenciaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
