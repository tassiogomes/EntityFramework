import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TipoocorrenciaRoutingModule } from './tipoocorrencia-routing.module';
import { TipoocorrenciaComponent } from './tipoocorrencia.component';


@NgModule({
  declarations: [
    TipoocorrenciaComponent
  ],
  imports: [
    CommonModule,
    TipoocorrenciaRoutingModule
  ]
})
export class TipoocorrenciaModule { }
