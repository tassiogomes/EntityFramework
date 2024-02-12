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

  delete() {

    console.log(this.tipoOcorrencia);
    const id = this.tipoOcorrencia.idTipoOcorrencia ?? 0;
    this.tipoocorrenciaService.delete(id).then(data => {
      data.subscribe(data => {
        console.log('Tipo de Ocorrência eliminada com sucesso', data);
        alert('Tipo de Ocorrência foi eliminada');
        this.deleteForm.reset();
        this.tipoOcorrencia = { idTipoOcorrencia: 0, nomeTipoOcorrencia: '' };
        this.router.navigate(['/tipoocorrencia']);
      });
    }).catch(error => {
      console.log('Erro ao eliminar Tipo de Ocorrência', error);
      alert('Não foi possível eliminar o Tipo de Ocorrência');
    });
  }

}
