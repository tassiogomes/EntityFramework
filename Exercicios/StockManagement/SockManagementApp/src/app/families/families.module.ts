import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FamiliesRoutingModule } from './families-routing.module';
import { FamiliesComponent } from './families.component';
import { CreateFamilyComponent } from './create-family/create-family.component';
import { UpdateFamilyComponent } from './update-family/update-family.component';
import { ReadFamilyComponent } from './read-family/read-family.component';
import { ListFamilyComponent } from './list-family/list-family.component';
import { DeleteFamilyComponent } from './delete-family/delete-family.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    FamiliesComponent,
    CreateFamilyComponent,
    UpdateFamilyComponent,
    ReadFamilyComponent,
    ListFamilyComponent,
    DeleteFamilyComponent
  ],
  imports: [
    CommonModule,
    FamiliesRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class FamiliesModule { }
