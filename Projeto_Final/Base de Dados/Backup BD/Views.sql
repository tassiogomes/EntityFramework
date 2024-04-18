USE GestaoParques3

-- View para listar informações detalhadas sobre ocorrências
GO
CREATE OR ALTER VIEW ViewDetalhesOcorrencias AS
SELECT
    O.IdOcorrencia,
    TOC.NomeTipoOcorrencia,
    Z.NomeZona,
    O.DataCriacaoOcorrencia,
    O.DataResolucaoOcorrencia,
    HO.Descricao,
    HO.Descricao AS HistoricoDescricao
FROM
    Ocorrencia O
JOIN
    TipoOcorrencia TOc ON O.IdTipoOcorrencia = TOC.IdTipoOcorrencia
JOIN
    Zonas Z ON O.IdZona = Z.IdZona
LEFT JOIN
    HistoricoOcorrencia HO ON O.IdOcorrencia = HO.IdOcorrencia;

SELECT * FROM ViewDetalhesOcorrencias


	select * from StatusOcorrencia
	select * from Ocorrencia






-- View para listar informações detalhadas sobre estruturas
GO
CREATE OR ALTER VIEW ViewDetalhesEstruturas AS
SELECT
    E.IdEstrutura,
    TE.NomeTipoEstrutura,
    Z.NomeZona,
    E.DataCriacao,
    E.DataAtualizacao,
    E.Inativo
FROM
    Estrutura E
JOIN
    TipoEstrutura TE ON E.IdTipoEstrutura = TE.IdTipoEstrutura
JOIN
    Zonas Z ON E.IdZona = Z.IdZona;

SELECT * FROM ViewDetalhesEstruturas



-- View para listar informações detalhadas sobre funcionários
GO
CREATE OR ALTER VIEW ViewDetalhesFuncionarios AS
SELECT
    F.IdFuncionario,
    F.NomeFuncionario,
    F.DataNascimento,
    F.DataAdmissao,
    P.NomeParque,
    U.UserName,
    U.Inativo AS UsuarioInativo
FROM
    Funcionario F
JOIN
    Parques P ON F.IdParque = P.IdParque
JOIN
    [User] U ON F.IdUser = U.IdUser;


	SELECT * FROM ViewDetalhesFuncionarios