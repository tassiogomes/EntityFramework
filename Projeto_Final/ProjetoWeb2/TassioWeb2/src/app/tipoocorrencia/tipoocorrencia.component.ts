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
  isListView: boolean = true;
  countItens?: number;


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
    this.TipoocorrenciaService.count().then((data: Observable<number>) => {
      data.subscribe(
      (itens: number) => {
        console.log(itens);
        this.countItens = itens;
      }),
      (error: any) => {
        console.log(error);
      }
  });
  
  }

  toggleView() {
    this.isListView = !this.isListView;
  }
}
// d-flex flex-wrap