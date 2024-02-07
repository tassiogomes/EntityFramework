import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Angular Aula 1';
  modelName: string = 'Students';
  studentName: string = 'Sara Daniel';
  myCSSClass: string = "green";
  applyCSSClass: boolean = true;
  fontCSSColor: string = "#bb1d1d"

  setStudentName(studentName: string){
    this.studentName = studentName;
  }

  onClickSubmit(result:any){
    console.log("Você entrou!: " + result.username)

  }
}
