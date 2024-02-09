import { Component } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TipoOcorrenciaInterface } from '../tipoocorrencia';
import { TipoocorrenciaService } from '../tipoocorrencia.service';

@Component({
  selector: 'app-criar-tipoocorrencia',
  templateUrl: './criar-tipoocorrencia.component.html',
  styleUrl: './criar-tipoocorrencia.component.css'
})
export class CriarTipoOcorrenciaComponent {
  tipoOcorrencia: TipoOcorrenciaInterface;
  createForm: FormGroup;

  constructor(private tipoocorrenciaService: TipoocorrenciaService, private formBuilder: FormBuilder) {
    this.createForm = this.formBuilder.group({
      idTipoOcorrencia: [0, [Validators.required]],
      nomeTipoOcorrencia: ['', [Validators.required]]
    });

    this.tipoOcorrencia = {
      idTipoOcorrencia: 0,
      nomeTipoOcorrencia: ''
    };
  }

  criarOcorrencia() {
    console.log(this.tipoOcorrencia);
    this.tipoocorrenciaService.createTipoOcorrencia(this.tipoOcorrencia).then(data => {
      data.subscribe(data =>{
        console.log('Tipo de Ocorrência adicionado com sucesso', data);
        alert("Tipo do Ocorrência não adicionado")
      })
    }).then(()=>{
      this.createForm.reset();
      this.tipoOcorrencia = {
        idTipoOcorrencia: 0,
        nomeTipoOcorrencia: ''
      }
    
    }).catch(error =>{
      console.log('Tipo de Ocorrência não pode ser criada', error);
      alert("Tipo de Ocorrência não pode ser adicionada")

    })
      
  }
}
