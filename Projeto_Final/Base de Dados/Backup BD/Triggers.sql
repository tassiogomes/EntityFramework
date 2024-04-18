USE GestaoParques3
--USE [master]

-- TRIGGERS

GO
CREATE OR ALTER TRIGGER tr_QrCode_Log
ON dbo.QrCode
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    -- Inserir no LOG
    INSERT INTO dbo.TableLog(TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(), 
        ORIGINAL_LOGIN(), 
        GETDATE(), 
        XACT_STATE(), 
        CONCAT('TRIGGER Novo QR Code adicionado. DataCriacaoQr: ' , CONVERT(NVARCHAR, DataCriacaoQr),
            ', DataExpiracaoQr: ' , CONVERT(NVARCHAR, DataExpiracaoQr),
            ', Link: ' , Link) 
    FROM INSERTED;
END;

-- Trigger para garantir que a data de resolução na tabela Ocorrencia quando o status for 3.
GO
CREATE TRIGGER trg_AutoSetDataResolucao
ON [dbo].[HistoricoOcorrencia]
AFTER INSERT
AS
BEGIN
    UPDATE O
    SET DataResolucaoOcorrencia = GETDATE()
    FROM [dbo].[Ocorrencia] O
    JOIN inserted I ON O.IdOcorrencia = I.IdOcorrencia
    WHERE I.IdStatusOcorrencia = 3; -- Assumindo que o ID 3 representa o status "Resolvido"
   
    -- Inserir no LOG
    INSERT INTO dbo.TableLog(TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(), 
        ORIGINAL_LOGIN(), 
        GETDATE(), 
        XACT_STATE(), 
        CONCAT('TRIGGER AUTOSET: ', 'AQUI')
    FROM INSERTED;

END;

/*SELECT * FROM TABLELOG
ORDER BY LOGID DESC;

SELECT * FROM OCORRENCIA
ORDER BY IDOCORRENCIA DESC;*/