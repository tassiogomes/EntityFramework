import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoocorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';

const routes: Routes = [
  { path: '', component: TipoocorrenciaComponent },
  { path: 'criar-tipoocorrencia', component: CriarTipoocorrenciaComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TipoocorrenciaRoutingModule { }
