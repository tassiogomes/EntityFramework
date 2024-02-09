import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.development';
import { Observable } from 'rxjs';
import { Funcao } from './funcao';

@Injectable({
  providedIn: 'root'
})
export class FuncaoService {

  apiUrl: string = "";
  

  constructor(private httpClient: HttpClient){
    this.apiUrl = environment.apiUrl + "Funcao";
  }


  async getAll():Promise<Observable<Funcao[]>>{
    return await this.httpClient.get<Funcao[]>(this.apiUrl);
  }
}
