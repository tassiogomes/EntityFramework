import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';

const routes: Routes = [{ path: '', component: TipoocorrenciaComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TipoocorrenciaRoutingModule { }
