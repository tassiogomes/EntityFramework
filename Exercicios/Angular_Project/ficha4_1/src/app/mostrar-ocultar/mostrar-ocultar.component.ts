import { Component } from '@angular/core';

@Component({
  selector: 'app-mostrar-ocultar',
  templateUrl: './mostrar-ocultar.component.html',
  styleUrl: './mostrar-ocultar.component.css'
})
export class MostrarOcultarComponent {
  mostrarConteudo: boolean = false;

  mostrarConteudoFunc() {
    this.mostrarConteudo = true;
  }

  ocultarConteudoFunc() {
    this.mostrarConteudo = false;
  }

}
