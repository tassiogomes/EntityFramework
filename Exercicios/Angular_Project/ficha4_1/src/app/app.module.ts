import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MostrarOcultarComponent } from './mostrar-ocultar/mostrar-ocultar.component';
import { AvaliacaoComponent } from './avaliacao/avaliacao.component';

@NgModule({
  declarations: [
    AppComponent,
    MostrarOcultarComponent,
    AvaliacaoComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
