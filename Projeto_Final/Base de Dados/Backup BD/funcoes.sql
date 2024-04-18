USE GestaoParques3
--USE [master]

-- funcao que retorna o numero de ocorrencia por zonas
GO
CREATE OR ALTER FUNCTION getTodasOcorrenciasPorZona(@zonaId INT)
RETURNS @ocorrencias TABLE (
    idOcorrencia INT,
    tipoOcorrencia NVARCHAR(50),
    dataCriacaoOcorrencia DATE,
    dataResolucaoOcorrencia DATE,
    email VARCHAR(50)
)
AS
BEGIN
    INSERT INTO @ocorrencias
    SELECT o.IdOcorrencia, o.IdTipoOcorrencia, o.DataCriacaoOcorrencia, o.DataResolucaoOcorrencia, o.Email
    FROM Ocorrencia o
    WHERE o.IdZona = @zonaId;

    RETURN;
END;


--SELECT * FROM getTodasOcorrenciasPorZona(1);



-- funcao que retorna numero de ocorrencia por status
GO
CREATE OR ALTER FUNCTION getNumeroDeOcorrenciasPorStatus()
RETURNS @numeroDeOcorrencias TABLE (
  idStatusOcorrencia INT,
  contagem INT
)
AS
BEGIN
  INSERT INTO @numeroDeOcorrencias
  SELECT h.IdStatusOcorrencia, COUNT(h.IdOcorrencia) AS contagem
  FROM HistoricoOcorrencia h
  GROUP BY h.IdStatusOcorrencia;

  RETURN;
END;


--SELECT * FROM getNumeroDeOcorrenciasPorStatus();

-- funcao que da a media de tempo de cada resolucao
GO
CREATE OR ALTER FUNCTION getMediaDeResolucaoPorTipoDeOcorrencias()
RETURNS @mediaTempoResolucao TABLE (
    tipoOcorrencia NVARCHAR(50),
    mediaTempoResolucao INT
)
AS
BEGIN
    INSERT INTO @mediaTempoResolucao
    SELECT o.IdTipoOcorrencia, AVG(DATEDIFF(DAY, o.DataCriacaoOcorrencia, o.DataResolucaoOcorrencia)) AS mediaTempoResolucao
    FROM Ocorrencia o
    WHERE o.DataResolucaoOcorrencia IS NULL
    GROUP BY o.IdTipoOcorrencia;

    RETURN;
END;

--SELECT * FROM getMediaDeResolucaoPorTipoDeOcorrencias();

--SELECT * FROM OCORRENCIA