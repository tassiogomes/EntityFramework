import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.development';
import { TipoOcorrencia } from './tipoocorrencia';
import { Observable } from 'rxjs/internal/Observable';

@Injectable({
  providedIn: 'root'
})
export class TipoocorrenciaService {

  apiUrl: string = "";

  constructor(private httpClient: HttpClient){
    this.apiUrl = environment.apiUrl + "TipoOcorrenciums";
  }

  async getAllTipoOcorrencia():Promise<Observable<TipoOcorrencia[]>>{
    return await this.httpClient.get<TipoOcorrencia[]>(this.apiUrl);
  }

}
