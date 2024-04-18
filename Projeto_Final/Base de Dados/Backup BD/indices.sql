-- ÍNDICES

CREATE INDEX Idx_FuncionarioActiv ON Funcionario (Inativo ) WHERE Inativo = 1;

CREATE INDEX Idx_OcorrenciaRes ON Ocorrencia (DataResolucaoOcorrencia) WHERE DataResolucaoOcorrencia IS NOT NULL;

CREATE INDEX IDX_DataModHistOcorr ON HistoricoOcorrencia (DataModificacao DESC);