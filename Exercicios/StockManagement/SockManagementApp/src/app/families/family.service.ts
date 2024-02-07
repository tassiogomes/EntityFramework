import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment.development';
import { Observable } from 'rxjs';
import { Family } from './family';

@Injectable({
  providedIn: 'root'
})
export class FamilyService {

  apiUrl: string="";

  constructor(private httpClient: HttpClient) {
    this.apiUrl = environment.apiUrl + "Families"
   }

   async getAll(): Promise<Observable<(Family[])>>{
    return await this.httpClient.get<Family[]>(this.apiUrl);
  }
}
