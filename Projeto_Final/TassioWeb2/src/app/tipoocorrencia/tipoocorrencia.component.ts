import { Component } from '@angular/core';
import { TipoOcorrenciaInterface } from './tipoocorrencia';
import { TipoocorrenciaService } from './tipoocorrencia.service';

@Component({
  selector: 'app-tipoocorrencia',
  templateUrl: './tipoocorrencia.component.html',
  styleUrl: './tipoocorrencia.component.css'
})
export class TipoocorrenciaComponent {
  funcoesList: TipoOcorrenciaInterface[] = [];
  funcao?: TipoOcorrenciaInterface = undefined;

  constructor (private TipoocorrenciaService: TipoocorrenciaService){
    
  }


}
