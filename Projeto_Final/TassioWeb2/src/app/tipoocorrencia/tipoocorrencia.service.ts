import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.development';

@Injectable({
  providedIn: 'root'
})
export class TipoocorrenciaService {

  apiUrl: string = "";

  constructor(private httpClient: HttpClient){
    this.apiUrl = environment.apiUrl + "TipoOcorrencium";
  }
}
