import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TipoocorrenciaRoutingModule } from './tipoocorrencia-routing.module';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';
import { CriarTipoocorrenciaComponent } from './criar-tipoocorrencia/criar-tipoocorrencia.component';


@NgModule({
  declarations: [
    TipoocorrenciaComponent,
    CriarTipoocorrenciaComponent
  ],
  imports: [
    CommonModule,
    TipoocorrenciaRoutingModule
  ]
})
export class TipoocorrenciaModule { }
