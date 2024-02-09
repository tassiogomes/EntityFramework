import { Component, OnInit } from '@angular/core';
import { TipoOcorrenciaInterface } from './tipoocorrencia';
import { TipoocorrenciaService } from './tipoocorrencia.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-tipoocorrencia',
  templateUrl: './tipoocorrencia.component.html',
  styleUrl: './tipoocorrencia.component.css'
})
export class TipoocorrenciaComponent implements OnInit {
  tipoocorrenciaList: TipoOcorrenciaInterface[] = [];
  tipoocorrencia?: TipoOcorrenciaInterface = undefined;

  constructor (private TipoocorrenciaService: TipoocorrenciaService){

  }
  ngOnInit(): void {
    this.TipoocorrenciaService.getAllTipoOcorrencia().then((data: Observable<TipoOcorrenciaInterface[]>) => {
      data.subscribe(list => {
        console.log(list);
        this.tipoocorrenciaList = list;
      });

    }).catch(error => {
      console.log(error);
    })


    throw new Error('Method not implemented.');
  }


}
