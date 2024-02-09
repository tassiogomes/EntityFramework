import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TipoocorrenciaRoutingModule } from './tipoocorrencia-routing.module';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoOcorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


@NgModule({
  declarations: [
    TipoocorrenciaComponent,
    CriarTipoOcorrenciaComponent
  ],
  imports: [
    CommonModule,
    TipoocorrenciaRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ]
})
export class TipoocorrenciaModule { }
