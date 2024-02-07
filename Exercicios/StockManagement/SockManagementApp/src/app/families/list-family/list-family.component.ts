import { Component, OnInit } from '@angular/core';
import { Family } from '../family';
import { FamilyService } from '../family.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-list-family',
  templateUrl: './list-family.component.html',
  styleUrl: './list-family.component.css'
})
export class ListFamilyComponent implements OnInit {
  familiesList: Family[] = [];
  familia?: Family = undefined;
  constructor(private service : FamilyService){

  }
  ngOnInit(): void {
    this.service.getAll().then((data: Observable<Family[]>) => {
      data.subscribe(list => {
        console.log(list);
        this.familiesList = list;
      });
    }).catch(error => {
      console.log(error);
    });
  }
}
