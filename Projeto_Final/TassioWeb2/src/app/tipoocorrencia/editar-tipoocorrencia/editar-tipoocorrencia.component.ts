import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TipoOcorrenciaInterface } from '../tipoocorrencia';
import { TipoocorrenciaService } from '../tipoocorrencia.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-editar-tipoocorrencia',
  templateUrl: './editar-tipoocorrencia.component.html',
  styleUrls: ['./editar-tipoocorrencia.component.css']
})
export class EditarTipoocorrenciaComponent implements OnInit {
  tipoOcorrencia: TipoOcorrenciaInterface;
  createForm: FormGroup;

  constructor(
    private tipoocorrenciaService: TipoocorrenciaService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.createForm = this.formBuilder.group({
      nomeTipoOcorrencia: ['', [Validators.required]]
    });

    this.tipoOcorrencia = {
      idTipoOcorrencia: 0,
      nomeTipoOcorrencia: ''
    };
  }

  ngOnInit(): void {
    this.route.params.subscribe(params => {
      const id = +params['id']; // Captura o ID da rota e converte para número
      this.tipoOcorrencia.idTipoOcorrencia = id;
    });
  }

  update(): void {
    if (!this.tipoOcorrencia.nomeTipoOcorrencia.trim()) {
      alert('Por favor, preencha o campo Nome.');
      return;
    }

    console.log(this.tipoOcorrencia);
    const id = this.tipoOcorrencia.idTipoOcorrencia ?? 0;
    this.tipoocorrenciaService.update(id, this.tipoOcorrencia).then(data => {
      data.subscribe(data => {
        console.log('Tipo de Ocorrência atualizada com sucesso', data);
        alert('Tipo de Ocorrência atualizada com sucesso');
        this.createForm.reset();
        this.tipoOcorrencia = { idTipoOcorrencia: 0, nomeTipoOcorrencia: '' };
        this.router.navigate(['/tipoocorrencia']);
      });
    }).catch(error => {
      console.log('Erro ao atualizar o Tipo de Ocorrência', error);
      alert('Não foi possível atualizar o Tipo de Ocorrência');
    });
  }
}
