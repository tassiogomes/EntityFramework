import { Component } from '@angular/core';

@Component({
  selector: 'app-families',
  templateUrl: './families.component.html',
  styleUrl: './families.component.css'
})
export class FamiliesComponent {
  currentComponent: string = "none"; // variável criada
  openComponent(hiperlink: any) {

    if (hiperlink) {
      if (hiperlink.id == "list")
        this.currentComponent = "list-family";
      else if (hiperlink.id == "create")
        this.currentComponent == "create-family"
      else if (hiperlink.id == "update")
        this.currentComponent == "update-family"
      else if (hiperlink.id == "read")
        this.currentComponent == "read-family"
      else if (hiperlink.id == "delete")
        this.currentComponent == "delete-family"
      else
        this.currentComponent = ""
    }
  }
}
