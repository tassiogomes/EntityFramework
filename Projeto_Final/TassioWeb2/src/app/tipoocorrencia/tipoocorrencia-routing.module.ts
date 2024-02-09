import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoOcorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';

const routes: Routes = [
  { path: '', component: TipoocorrenciaComponent },
  { path: 'criar-tipoocorrencia', component: CriarTipoOcorrenciaComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TipoocorrenciaRoutingModule { }
