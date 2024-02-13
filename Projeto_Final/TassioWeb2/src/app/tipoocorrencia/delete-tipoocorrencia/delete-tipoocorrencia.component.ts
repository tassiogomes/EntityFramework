import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TipoOcorrenciaInterface } from '../tipoocorrencia';
import { TipoocorrenciaService } from '../tipoocorrencia.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-delete-tipoocorrencia',
  templateUrl: './delete-tipoocorrencia.component.html',
  styleUrl: './delete-tipoocorrencia.component.css'
})
export class DeleteTipoocorrenciaComponent implements OnInit{
  tipoOcorrencia: TipoOcorrenciaInterface;
  deleteForm: FormGroup;

  constructor(
    private tipoocorrenciaService: TipoocorrenciaService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router
     
     ) {
    this.deleteForm = this.formBuilder.group({
      idTipoOcorrencia: [0, [Validators.required]],
    });

    this.tipoOcorrencia = {
      idTipoOcorrencia: 0,
      nomeTipoOcorrencia: ''
    };
  }


  ngOnInit(): void {
    this.route.params.subscribe(async params => {
      const id = +params['id'];
      const tipoOcorrenciaObservable = await this.tipoocorrenciaService.getTipoOcorrenciaById(id);
      tipoOcorrenciaObservable.subscribe((tipoOcorrencia: TipoOcorrenciaInterface) => {
        this.tipoOcorrencia = tipoOcorrencia;
      });
    });
  }

  async delete() {
    console.log(this.tipoOcorrencia);
    const id = this.tipoOcorrencia.idTipoOcorrencia ?? 0;
    (await this.tipoocorrenciaService.delete(id)).subscribe(
      () => {
        console.log('Tipo de Ocorrência eliminada com sucesso');
        alert('Tipo de Ocorrência foi eliminada');
        this.deleteForm.reset();
        this.tipoOcorrencia = { idTipoOcorrencia: 0, nomeTipoOcorrencia: '' };
        this.router.navigate(['/tipoocorrencia']);
      },
      (error) => {
        console.log('Erro ao eliminar Tipo de Ocorrência', error);
        if (error.error && typeof error.error === 'string') {
          // Se a resposta de erro contiver uma mensagem de texto, exiba-a
          alert('Não foi possível eliminar o Tipo de Ocorrência: ' + error.error);
        } else {
          // Se não, exiba uma mensagem de erro genérica
          alert('Não foi possível eliminar o Tipo de Ocorrência. Por favor, tente novamente mais tarde.');
        }
        this.router.navigate(['/tipoocorrencia']);
      }
    );
  }
  

}