import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FamiliesComponent } from './families.component';
import { CreateFamilyComponent } from './create-family/create-family.component';
import { DeleteFamilyComponent } from './delete-family/delete-family.component';
import { ListFamilyComponent } from './list-family/list-family.component';
import { ReadFamilyComponent } from './read-family/read-family.component';
import { UpdateFamilyComponent } from './update-family/update-family.component';

const routes: Routes = [
  { path: '', component: FamiliesComponent },
  { path: 'create-family', component: CreateFamilyComponent },
  { path: 'delete-family', component: DeleteFamilyComponent },
  { path: 'list-family', component: ListFamilyComponent },
  { path: 'read-family', component: ReadFamilyComponent },
  { path: 'updatefamily', component: UpdateFamilyComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FamiliesRoutingModule { }
