import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TipoocorrenciaRoutingModule } from './tipoocorrencia-routing.module';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoOcorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EditarTipoocorrenciaComponent } from './editar-tipoocorrencia/editar-tipoocorrencia.component';


@NgModule({
  declarations: [
    TipoocorrenciaComponent,
    CriarTipoOcorrenciaComponent,
    EditarTipoocorrenciaComponent
  ],
  imports: [
    CommonModule,
    TipoocorrenciaRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class TipoocorrenciaModule { }
