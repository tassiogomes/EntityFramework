import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoOcorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';
import { EditarTipoocorrenciaComponent } from './editar-tipoocorrencia/editar-tipoocorrencia.component';
import { DeleteTipoocorrenciaComponent } from './delete-tipoocorrencia/delete-tipoocorrencia.component';

const routes: Routes = [
  { path: '', redirectTo: 'tipoocorrencia', pathMatch: 'full' }, // Redireciona a raiz para 'tipoocorrencia'
  { path: 'tipoocorrencia', component: TipoocorrenciaComponent },
  { path: 'criar-tipoocorrencia', component: CriarTipoOcorrenciaComponent},
  { path: 'editar-tipoocorrencia/:id', component: EditarTipoocorrenciaComponent},
  { path: 'delete-tipoocorrencia/:id', component: DeleteTipoocorrenciaComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TipoocorrenciaRoutingModule { }
