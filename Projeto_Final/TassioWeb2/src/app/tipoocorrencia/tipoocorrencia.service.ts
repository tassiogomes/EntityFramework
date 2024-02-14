import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.development';
import { TipoOcorrenciaInterface } from './tipoocorrencia';
import { Observable } from 'rxjs/internal/Observable';

@Injectable({
  providedIn: 'root'
})
export class TipoocorrenciaService {

  apiUrl: string = "";

  constructor(private httpClient: HttpClient){
    this.apiUrl = environment.apiUrl + "TipoOcorrenciums";
  }

  // GetAll
  async getAllTipoOcorrencia():Promise<Observable<TipoOcorrenciaInterface[]>>{
    return await this.httpClient.get<TipoOcorrenciaInterface[]>(this.apiUrl);
  }

  // Criar
  async createTipoOcorrencia(tipoOcorrenciaBody: any): Promise<Observable<TipoOcorrenciaInterface>> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      })
    };
    return await this.httpClient.post<TipoOcorrenciaInterface>(this.apiUrl, tipoOcorrenciaBody, httpOptions);
  }

  // Editar

  async update(id: number, body: any):  Promise<Observable<TipoOcorrenciaInterface>> {
    const httpOptions = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'

      })
    };
    return this.httpClient.put<TipoOcorrenciaInterface>(this.apiUrl + "/" + id, body, httpOptions); //return observable
  }

    // Excluir
    async delete(id: number): Promise<Observable<any>> {
      const httpOptions = {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      };
      return this.httpClient.delete<any>(this.apiUrl + "/" + id, httpOptions); // Retorna um observable
    }


    // Get By Id
    async getTipoOcorrenciaById(id: number): Promise<Observable<TipoOcorrenciaInterface>> {
      const httpOptions = {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      };
      return this.httpClient.get<TipoOcorrenciaInterface>(this.apiUrl + "/" + id, httpOptions);
    }
    

}
