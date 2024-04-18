USE GestaoParques3
--USE [master]

-- STORAGE PROCEDURES

-- Rio ---------------------------------------------------------------------------------------------
-- INSERT Rio
GO
CREATE OR ALTER PROCEDURE InsertRio
(
	@NomeRio NVARCHAR(50),
	@Comprimento INT,
	@Inativo BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Rio (NomeRio, Comprimento, DataCriacao,DataAtualizacao,Inativo)
            VALUES (@NomeRio, @Comprimento, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Rio Inserido com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Novo Rio adicionado. NomeRio: ' , CONVERT(NVARCHAR, @NomeRio),
            ', Comprimento: ' , CONVERT(NVARCHAR, @Comprimento))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar o rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Rio
GO
CREATE OR ALTER PROCEDURE UpdateRio
	@IdRio INT,
	@NomeRio NVARCHAR(50),
	@Comprimento INT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE Rio
			SET NomeRio = @NomeRio,
			Comprimento = @Comprimento,
			DataAtualizacao = GETDATE(),
			Inativo = @Inativo
			WHERE idRio = @IdRio
		COMMIT TRANSACTION;
		PRINT 'Rio actualizado com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Rio actualizado. NomeRio: ' , CONVERT(NVARCHAR, @NomeRio),
            ', Comprimento: ' , CONVERT(NVARCHAR, @Comprimento))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar o Rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE Rio
-- DELETE Rio
GO
CREATE OR ALTER PROCEDURE DeleteRio
   	@IdRio INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM Rio 
		WHERE IdRio	= @idRio
		COMMIT TRANSACTION;
		PRINT 'Rio eliminado com sucesso'
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Rio eliminado. IDRIO: ' , CONVERT(NVARCHAR, @IdRio))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar o Rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- ZonaRio---------------------------------------------------------------------------------------------------------
-- INSERT ZonaRio
GO
CREATE OR ALTER PROCEDURE InsertZonaRio
(
	@IdZona INT,
	@IdRio INT,
	@Inativo BIT 
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO ZonaRio (IdZona, IdRio, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdZona, @IdRio, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'ZonaRio criada com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Zona Rio adicionada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdRio: ' , CONVERT(NVARCHAR, @IdRio))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

---- UPDATE ZonaRio
GO
CREATE OR ALTER PROCEDURE UpdateZonaRio
	@IdZona INT,
	@IdRio INT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE ZonaRio
			SET DataAtualizacao = GETDATE(),
			Inativo = @Inativo
			WHERE IdZona = @IdZona AND IdRio = @IdRio
		COMMIT TRANSACTION;
		PRINT 'Zona Rio actualizada com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Rio actualizada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdRio: ' , CONVERT(NVARCHAR, @IdRio))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

---- DELETE ZonaRio
GO
CREATE OR ALTER PROCEDURE DeleteZonaRio
   	@IdZona INT,
	@IdRio INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM ZonaRio
		WHERE IdZona = @IdZona AND IdRio = @IdRio
		COMMIT TRANSACTION;
		PRINT 'Zona Rio eliminada com sucesso'
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Rio eliminada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdRio: ' , CONVERT(NVARCHAR, @IdRio))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Zona Rio. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Estrutura ------------------------------------------------------------------------------------------------------
-- INSERT Estrutura
GO
CREATE OR ALTER PROCEDURE InsertEstrutura
(
	@IdZona INT,
	@IdTipoEstrutura INT,
	@Inativo BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Estrutura(IdZona, IdTipoEstrutura, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdZona, @IdTipoEstrutura, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Estrutura inserida com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Estrutura adicionada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdTipoEstrutura: ' , CONVERT(NVARCHAR, @IdTipoEstrutura))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar a Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Estrutura
GO
CREATE OR ALTER PROCEDURE UpdateEstrutura
	@IdEstrutura INT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		UPDATE Estrutura
			SET Inativo = @Inativo,
			DataAtualizacao = GETDATE()
			WHERE IdEstrutura = @IdEstrutura
		COMMIT TRANSACTION;
		PRINT 'Estrutura actualizada com sucesso'
		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Estrutura actualizada. IdEstrutura: ' , CONVERT(NVARCHAR, @Inativo))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar a Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH;
END

-- DELETE Estrutura
GO
CREATE OR ALTER PROCEDURE DeleteEstrutura
   	@IdEstrututra INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM Estrutura
		WHERE IdEstrutura = @IdEstrututra
		COMMIT TRANSACTION;
		PRINT 'Estrutura eliminada com sucesso'
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Estrutura eliminada. IdEstrutura: ' , CONVERT(NVARCHAR, @IdEstrututra))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar a Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- TipoEstrutura -------------------------------------------------------------------------------------
-- INSERT TipoEstrutura
GO
CREATE OR ALTER PROCEDURE InsertTipoEstrutura
(
	@NomeTipoEstrutura NVARCHAR(50),
	@DescricaoTipoEstrutura NVARCHAR(500),
	@Inativo BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO TipoEstrutura(NomeTipoEstrutura, DescricaoTipoEstrutura, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@NomeTipoEstrutura, @DescricaoTipoEstrutura, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Tipo de Estrutura inserido com sucesso'
	-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Novo Tipo de Estrutura adicionado. Nome do Tipo de Estrutura: ' , CONVERT(NVARCHAR, @NomeTipoEstrutura),
            ', Descrição: ' , CONVERT(NVARCHAR, @DescricaoTipoEstrutura))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar o Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE TipoEstrutura
GO
CREATE OR ALTER PROCEDURE UpdateTipoEstrutura
	@IdTipoEstrutura INT,
	@NomeTipoEstrutura NVARCHAR(50),
	@DescricaoTipoEstrutura NVARCHAR(500),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		UPDATE TipoEstrutura
			SET NomeTipoEstrutura = @NomeTipoEstrutura,
			DescricaoTipoEstrutura = @DescricaoTipoEstrutura,
			DataAtualizacao = GETDATE(),
			Inativo = @Inativo
			WHERE IdTipoEstrutura = @IdTipoEstrutura
		COMMIT TRANSACTION;
		PRINT 'Tipo de Estrutura actualizado com sucesso'
		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Tipo de Estrutura actualizado. Nome do Tipo de Estrutura: ' , CONVERT(NVARCHAR, @NomeTipoEstrutura),
            ', Descrição do Tipo de Estrutura: ' , CONVERT(NVARCHAR, @DescricaoTipoEstrutura))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.	
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar o Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar o Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE TipoEstrutura
GO
CREATE OR ALTER PROCEDURE DeleteTipoEstrutura
	@IdTipoEstrutura INT
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM TipoEstrutura
		WHERE IdTipoEstrutura = @IdTipoEstrutura
		COMMIT TRANSACTION;
		PRINT 'Tipo de Estrutura eliminado com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Tipo de Estrutura eliminado. ID TIPO ESTRUTURA: ' , CONVERT(NVARCHAR, @IdTipoEstrutura))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar o Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Fauna
-- INSERT Fauna
GO
CREATE OR ALTER PROCEDURE InsertFauna
(
	@EspecieFauna NVARCHAR(50),
	@NomeCientificoFauna NVARCHAR(100),
	@CategoriaFauna NVARCHAR(50),
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Fauna(EspecieFauna, NomeCientificoFauna, CategoriaFauna, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@EspecieFauna, @NomeCientificoFauna, @CategoriaFauna, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Fauna inserida com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Fauna adicionada. Espécia de Fauna: ' , CONVERT(NVARCHAR, @EspecieFauna),
            ', Nome científico: ' , CONVERT(NVARCHAR, @NomeCientificoFauna), ', Categoria: ' , CONVERT(NVARCHAR, @CategoriaFauna))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Fauna. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Fauna. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END


-- UPDATE Fauna
GO
CREATE OR ALTER PROCEDURE UpdateFauna
	@IdFauna INT,
	@EspecieFauna NVARCHAR(50),
	@NomeCientificoFauna NVARCHAR(100),
	@CategoriaFauna NVARCHAR(50),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		UPDATE Fauna
			SET EspecieFauna = @EspecieFauna,
			NomeCientificoFauna = @NomeCientificoFauna,
			CategoriaFauna = @CategoriaFauna,
			Inativo = @Inativo
			WHERE IdFauna = @IdFauna
		COMMIT TRANSACTION;
		PRINT 'Fauna actualizada com sucesso'
		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Fauna actualizada. Espécie: ' , CONVERT(NVARCHAR, @EspecieFauna),
            ', Nome Científico: ' , CONVERT(NVARCHAR, @NomeCientificoFauna), ' Categoria: ' , CONVERT(NVARCHAR, @CategoriaFauna))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Fauna. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Fauna. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE Fauna
-- DELETE Fauna
GO
CREATE OR ALTER PROCEDURE DeleteFauna
	@IdFauna INT
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM Fauna
		WHERE IdFauna = @IdFauna
		COMMIT TRANSACTION;
		PRINT 'Fauna eliminada com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Fauna eliminada. IDFAUNA: ' , CONVERT(NVARCHAR, @IdFauna))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar o Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Tipo de Estrutura. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END


-- ZonaFauna
-- INSERT ZonaFauna
GO
CREATE OR ALTER PROCEDURE InsertZonaFauna
(
	@IdFauna INT,
	@IdZona INT,
	@Descricao NVARCHAR(500),
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO ZonaFauna(IdFauna, IdZona, Descricao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdFauna,@IdZona, @Descricao, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Zona Fauna criada com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Zona Fauna adicionada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFauna: ' , CONVERT(NVARCHAR, @IdFauna), ', Descrição: ' , CONVERT(NVARCHAR, @Descricao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE ZonaFauna
GO
CREATE OR ALTER PROCEDURE UpdateZonaFauna
	@IdZona INT,
	@IdFauna INT,
	@Descricao NVARCHAR(500),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		UPDATE ZonaFauna
			SET Descricao = @Descricao,
			Inativo = @Inativo
			WHERE IdZona = @IdZona AND IdFauna = @IdFauna
		COMMIT TRANSACTION;
		PRINT 'Zona Fauna actualizada com sucesso'
		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Fauna actualizada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFlora: ' , CONVERT(NVARCHAR, @IdFauna), ', Descrição: ' , CONVERT(NVARCHAR, @Descricao))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE ZonaFauna
GO
CREATE OR ALTER PROCEDURE DeleteZonaFauna
	@IdFauna INT,
	@IdZona INT
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
    BEGIN TRANSACTION
		DELETE FROM ZonaFauna
		WHERE IdFauna = @IdFauna AND IdZona = @IdZona
		COMMIT TRANSACTION;
		PRINT 'Zona Fauna eliminada com sucesso'
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Fauna eliminada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFauna: ' , CONVERT(NVARCHAR, @IdFauna))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Zona Fauna. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Flora
-- INSERT Flora
GO
CREATE OR ALTER PROCEDURE InsertFlora
(
	@EspecieFlora NVARCHAR(50),
	@NomeCientificoFlora NVARCHAR(100),
	@TipoPlanta NVARCHAR(50),
	@Inativo BIT 
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Flora(EspecieFlora, NomeCientificoFlora, TipoPlanta, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@EspecieFlora, @NomeCientificoFlora, @TipoPlanta, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Flora inserida com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Flora adicionada. Espécie: ' , CONVERT(NVARCHAR, @EspecieFlora),
            ', Nome científico: ' , CONVERT(NVARCHAR, @NomeCientificoFlora), ', Tipo de Planta: ' , CONVERT(NVARCHAR, @TipoPlanta))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Flora
GO
CREATE OR ALTER PROCEDURE UpdateFlora
	@IdFlora INT,
	@EspecieFlora NVARCHAR(50),
	@NomeCientificoFlora NVARCHAR(100),
	@TipoPlanta NVARCHAR(50),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE Flora
			SET EspecieFlora = @EspecieFlora,
			NomeCientificoFlora = @NomeCientificoFlora,
			TipoPlanta = @TipoPlanta,
			DataAtualizacao = GETDATE(),
			Inativo = @Inativo
			WHERE IdFlora = @IdFlora
		COMMIT TRANSACTION;
		PRINT 'Flora actualizada com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Flora actualizada. Espécie: ' , CONVERT(NVARCHAR, @EspecieFlora),
            ', Nome científico: ' , CONVERT(NVARCHAR, @NomeCientificoFlora), ', Tipo de Planta: ' , CONVERT(NVARCHAR, @TipoPlanta))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE Flora
GO
CREATE OR ALTER PROCEDURE DeleteFlora
	@IdFlora INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM Flora
		WHERE IdFlora = @IdFlora
		COMMIT TRANSACTION;
		PRINT 'Flora eliminada com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Flora eliminada. IDFLORA: ' , CONVERT(NVARCHAR, @IdFlora));
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- ZonaFlora
-- INSERT ZonaFlora
GO
CREATE OR ALTER PROCEDURE InsertZonaFlora
(
	@idFlora INT,
	@idZona INT,
	@Descricao NVARCHAR(500),
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO ZonaFlora(IdFlora, IdZona, Descricao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@idFlora,@IdZona, @Descricao, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Zona Flora criada com sucesso'
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Nova Zona Flora adicionada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFlora: ' , CONVERT(NVARCHAR, @IdFlora), ', Descrição: ' , CONVERT(NVARCHAR, @Descricao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE ZonaFlora
GO
CREATE OR ALTER PROCEDURE UpdateZonaFlora
	@IdZona INT,
	@IdFlora INT,
	@Descricao NVARCHAR(500),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		UPDATE ZonaFlora
			SET Descricao = @Descricao,
			Inativo = @Inativo
			WHERE IdZona = @IdZona AND IdFlora = @IdFlora
		COMMIT TRANSACTION;
		PRINT 'Zona Flora actualizada com sucesso'
		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Flora actualizada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFlora: ' , CONVERT(NVARCHAR, @IdFlora), ', Descrição: ' , CONVERT(NVARCHAR, @Descricao))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE ZonaFlora
GO
CREATE OR ALTER PROCEDURE DeleteZonaFlora
	@IdZona INT,
	@IdFlora INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
	BEGIN TRANSACTION
		DELETE FROM ZonaFlora
		WHERE IdFlora = @IdFlora AND IdZona = @IdZona
		COMMIT TRANSACTION;
		PRINT 'Zona Flora eliminada com sucesso'
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona Flora eliminada. IdZona: ' , CONVERT(NVARCHAR, @IdZona),
            ', IdFlora: ' , CONVERT(NVARCHAR, @IdFlora))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Zona Flora. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- CodigoPostal
-- INSERT CodigoPostal
GO
CREATE OR ALTER PROCEDURE InsertCodigoPostal
(
	@CodPostal INT,
    @Concelho NVARCHAR(50),
    @Freguesia NVARCHAR(50),
    @Rua NVARCHAR(100),
    @Numero INT,
    @Lat FLOAT,
    @Long FLOAT,
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO CodigoPostal(CodPostal,Concelho,Freguesia,Rua,Numero,Lat,Long, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@CodPostal, @Concelho, @Freguesia, @Rua, @Numero, @Lat, @Long, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Código Postal inserido com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo Código Postal adicionado. Código Postal: ', CONVERT(NVARCHAR, @CodPostal),
			', Concelho: ', CONVERT(NVARCHAR, @Concelho), ', Freguesia: ', CONVERT(NVARCHAR, @Freguesia),
			', Rua: ', CONVERT(NVARCHAR, @Rua), ', Número: ', CONVERT(NVARCHAR, @Numero),
			', Latitude: ', CONVERT(NVARCHAR, @Lat), ', Longitude: ', CONVERT(NVARCHAR, @Long))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Código Postal. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Código Postal. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE CodigoPostal
GO
CREATE OR ALTER PROCEDURE UpdateCodigoPostal
	@IdCodPostal INT,
	@CodPostal  INT,
    @Concelho NVARCHAR(50),
    @Freguesia NVARCHAR(50),
    @Rua NVARCHAR(100),
    @Numero INT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE CodigoPostal
			SET CodPostal = @CodPostal,
			Concelho = @Concelho,
			Freguesia = @Freguesia,
			Rua = @Rua,
			Numero = @Numero,
			DataAtualizacao = GETDATE(),
			Inativo = @Inativo
			WHERE IdCodPostal = @IdCodPostal
		COMMIT TRANSACTION;
		PRINT 'Código Postal actualizado com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Código Postal actualizado. Código Postal: ', CONVERT(NVARCHAR, @CodPostal),
			', Concelho: ', CONVERT(NVARCHAR, @Concelho), ', Freguesia: ', CONVERT(NVARCHAR, @Freguesia),
			', Rua: ', CONVERT(NVARCHAR, @Rua), ', Número: ', CONVERT(NVARCHAR, @Numero))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Código Postal. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Código Postal. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE CodigoPostal
GO
CREATE OR ALTER PROCEDURE DeleteCodigoPostal
	@IdCodPostal INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM CodigoPostal
		WHERE IdCodPostal = @IdCodPostal
		COMMIT TRANSACTION;
		PRINT 'Código Postal eliminado com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Código Postal eliminado. Código Postal: ', CONVERT(NVARCHAR, @IdCodPostal))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Código Postal. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Código Postal. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Parques
-- INSERT Parques
GO
CREATE OR ALTER PROCEDURE InsertParques
(
    @idCodPostal INT,
    @NomeParque NVARCHAR(50),
    @Dimensao FLOAT,
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Parques(IdCodPostal,NomeParque,Dimensao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@idCodPostal, @NomeParque, @Dimensao, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Parque inserido com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo Parque adicionado. IdCodPostal: ', CONVERT(NVARCHAR, @IdCodPostal),
			', Nome do Parque: ', CONVERT(NVARCHAR, @NomeParque), ', Dimensão: ', CONVERT(NVARCHAR, @Dimensao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Parque. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Parque. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Parques
GO
CREATE OR ALTER PROCEDURE UpdateParques
	@IdParque INT,
    @NomeParque NVARCHAR(50),
    @Dimensao FLOAT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE Parques
			SET NomeParque = @NomeParque,
			Dimensao = @Dimensao,
			Inativo = @Inativo
			WHERE IdParque = @IdParque
		COMMIT TRANSACTION;
		PRINT 'Parque actualizado com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Parque actualizado. Nome do Parque: ', CONVERT(NVARCHAR, @NomeParque), ', Dimensão: ', CONVERT(NVARCHAR, @Dimensao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Parque. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Parque. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE Parques
GO
CREATE OR ALTER PROCEDURE DeleteParques
	@IdParque INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM Parques
		WHERE IdParque = @IdParque
		COMMIT TRANSACTION;
		PRINT 'Parque eliminado com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Parque eliminado. Nome do Parque: ', CONVERT(NVARCHAR, @IdParque))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Parque. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Parque. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- QrCode
-- INSERT QrCode
GO
CREATE OR ALTER PROCEDURE InsertQrCode
(
    @DataExpiracaoQr DATE,
    @Link NVARCHAR(200),
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO QrCode(DataCriacaoQr,DataExpiracaoQr,Link, DataCriacao, DataAtualizacao, Inativo)
            VALUES (GETDATE(), @DataExpiracaoQr, @Link, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'QrCode inserido com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo QrCode adicionado. Data criação Qr: ', CONVERT(NVARCHAR, GETDATE()),
			', Data expiração Qr: ', CONVERT(NVARCHAR, @DataExpiracaoQr), ', Link: ', CONVERT(NVARCHAR, @Link))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar QrCode. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir QrCode. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE QrCode
GO
CREATE OR ALTER PROCEDURE UpdateQrCode
	@IdQrCode INT,
    @DataExpiracaoQr DATE,
    @Link NVARCHAR(200),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE QrCode
			SET DataExpiracaoQr = @DataExpiracaoQr,
			Link = @Link,
			Inativo = @Inativo
			WHERE IdQrCode = @IdQrCode
		COMMIT TRANSACTION;
		PRINT 'QrCode actualizado com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('QrCode actualizado. Data de Expiração: ', CONVERT(NVARCHAR, @DataExpiracaoQr), ', Link: ', CONVERT(NVARCHAR, @Link))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar QrCode. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar QrCode. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE QrCode
GO
CREATE OR ALTER PROCEDURE DeleteQrCode
	@IdQrCode INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM QrCode
		WHERE IdQrCode = @IdQrCode
		COMMIT TRANSACTION;
		PRINT 'QrCode eliminado com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('QrCode eliminado. ID: ', CONVERT(NVARCHAR, @IdQrCode))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar QrCode. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar QrCode. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Zonas
-- INSERT Zonas
GO
CREATE OR ALTER PROCEDURE InsertZonas
(
    @IdParque INT,
    @IdQrCode INT,
    @NomeZona NVARCHAR(50),
    @NumeroZona INT,
    @Cor NVARCHAR(10),
	@Inativo BIT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Zonas(IdParque, IdQrCode, NomeZona, NumeroZona, Cor, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdParque, @IdQrCode, @NomeZona, @NumeroZona, @Cor, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Zona criada com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Nova Zona adicionada. IdParque: ', CONVERT(NVARCHAR, @IdParque), ', IdQrCode: ', CONVERT(NVARCHAR, @IdQrCode),
			', Nome da Zona: ', CONVERT(NVARCHAR, @NomeZona), ', Número da Zona: ', CONVERT(NVARCHAR, @NumeroZona), ' Cor: ' , CONVERT(NVARCHAR, @Cor))
    END TRY
	BEGIN CATCH
		DECLARE @xactState INT;
		SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
			IF (XACT_STATE()) = -1  
			BEGIN  
				ROLLBACK TRANSACTION;
				PRINT 'The transaction is in an uncommittable state.' +  
						' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
				PRINT 'Erro ao eliminar ZONA. Detalhes do erro: ' + ERROR_MESSAGE();
				INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
				VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar ZONA. Detalhes do erro: ' + ERROR_MESSAGE());
			END;
		END CATCH
END


-- UPDATE Zonas
GO
CREATE OR ALTER PROCEDURE UpdateZonas
	@IdZona INT,
	@IdParque INT,
	@IdQrCode INT,
    @NomeZona NVARCHAR(50),
    @NumeroZona INT,
    @Cor NVARCHAR(10),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE Zonas
			SET NomeZona = @NomeZona,
			NumeroZona = @NumeroZona,
			Cor = @Cor,
			Inativo = @Inativo
			WHERE IdZona = @IdZona
		COMMIT TRANSACTION;
		PRINT 'Zona actualizada com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona actualizada. IdParque: ', CONVERT(NVARCHAR, @IdParque), ', IdQrCode: ', CONVERT(NVARCHAR, @IdQrCode),
			', Nome da Zona: ', CONVERT(NVARCHAR, @NomeZona), ', Número da Zona: ', CONVERT(NVARCHAR, @NumeroZona), ' Cor: ' , CONVERT(NVARCHAR, @Cor))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Zona. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Zona. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE Zonas
GO
CREATE OR ALTER PROCEDURE DeleteZonas
	@IdZona INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM Zonas
		WHERE IdZona = @IdZona
		COMMIT TRANSACTION;
		PRINT 'Zona eliminada com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Zona eliminada. IdParque: ', CONVERT(NVARCHAR, @IdZona))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Zona. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Zona. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Funcao
-- INSERT Funcao
GO
CREATE OR ALTER PROCEDURE InsertFuncao
(
    @NomeFuncao VARCHAR(50),
	@Inativo BIT 
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Funcao(NomeFuncao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@NomeFuncao, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Função criada com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Nova Função adicionada. NomeFuncao: ', CONVERT(NVARCHAR, @NomeFuncao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Função. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Função. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Funcao
GO
CREATE OR ALTER PROCEDURE UpdateFuncao
	@IdFuncao INT,
    @NomeFuncao VARCHAR(50),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE Funcao
			SET NomeFuncao = @NomeFuncao,
			Inativo = @Inativo
			WHERE IdFuncao = @IdFuncao
		COMMIT TRANSACTION;
		PRINT 'Função actualizada com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Função actualizada. Nome da Função: ', CONVERT(NVARCHAR, @NomeFuncao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Função. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Função. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE Funcao
GO
CREATE OR ALTER PROCEDURE DeleteFuncao
	@IdFuncao INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM Funcao
		WHERE IdFuncao = @IdFuncao
		COMMIT TRANSACTION;
		PRINT 'Função eliminada com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Função eliminada. Nome da Função: ', CONVERT(NVARCHAR, @IdFuncao))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Função. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Função. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- User
-- INSERT User
-- INSERT User
GO
CREATE OR ALTER PROCEDURE InsertUser
(
    @IdFuncao INT,
    @UserName NVARCHAR(10),
    @Password NVARCHAR(255), -- Assuming the password is already hashed
    @Inativo BIT 
)
AS
BEGIN
    SET NOCOUNT ON
    SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
        INSERT INTO [User] (IdFuncao, UserName, [Password], DataCriacao, DataAtualizacao, Inativo)
        VALUES (@IdFuncao, @UserName, @Password, GETDATE(), GETDATE(), @Inativo)
        COMMIT TRANSACTION;
        PRINT 'User inserido com sucesso'

        -- Inserir no LOG
        INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
        SELECT 
            CURRENT_TRANSACTION_ID(),
            ORIGINAL_LOGIN(),
            GETDATE(),
            XACT_STATE(), 
            CONCAT('Novo User adicionado. UserName: ', CONVERT(NVARCHAR, @UserName),
                ', IdFunção: ', CONVERT(NVARCHAR, @IdFuncao))
    END TRY
    BEGIN CATCH
        DECLARE @xactState INT;
        SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
        
        IF (XACT_STATE()) = -1  
        BEGIN  
            ROLLBACK TRANSACTION;
            PRINT 'The transaction is in an uncommittable state.' +  
                    ' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
            PRINT 'Erro ao adicionar User. Detalhes do erro: ' + ERROR_MESSAGE();
            INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
            VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir User. Detalhes do erro: ' + ERROR_MESSAGE());
        END; 
    END CATCH;
END



-- UPDATE User
GO
CREATE OR ALTER PROCEDURE UpdateUser
	@IdUser INT,
	@IdFuncao INT,
    @UserName NVARCHAR(10),
    @Password NVARCHAR(255),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE [User]
			SET UserName = @UserName,
			[Password] = @Password,
			Inativo = @Inativo
			WHERE IdUser = @IdUser
		COMMIT TRANSACTION;
		PRINT 'User actualizado com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('User actualizado. UserName: ', CONVERT(NVARCHAR, @UserName), ', IdFunção: ', CONVERT(NVARCHAR, @IdFuncao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar User. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar User. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE User
GO
CREATE OR ALTER PROCEDURE DeleteUser
	@IdUser INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM [User]
		WHERE IdUser = @IdUser
		COMMIT TRANSACTION;
		PRINT 'User eliminado com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('User eliminado. IDUSER: ', CONVERT(NVARCHAR, @iduser))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar User. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar User. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- Funcionario
-- INSERT Funcionario
GO
CREATE OR ALTER PROCEDURE InsertFuncionario
(
    @IdParque INT,
    @IdUser INT,
    @NomeFuncionario VARCHAR(50),
    @DataNascimento DATETIME,
    @DataAdmissao DATETIME,
    @Inativo BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Funcionario(IdParque, IdUser, NomeFuncionario, DataNascimento, DataAdmissao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdParque, @IdUser, @NomeFuncionario, @DataNascimento, @DataAdmissao, GETDATE(), GETDATE(), @Inativo)
            COMMIT TRANSACTION;
			PRINT 'Funcionário inserido com sucesso'
			-- Inserir no LOG
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			SELECT 
				CURRENT_TRANSACTION_ID(),
				ORIGINAL_LOGIN(),
				GETDATE(),
				XACT_STATE(), 
				CONCAT('Novo Funcionário adicionado. Nome do Funcionário: ', CONVERT(NVARCHAR, @NomeFuncionario),
					', IdUser: ', CONVERT(NVARCHAR, @IdUser), ', IdParque: ', CONVERT(NVARCHAR, @IdParque))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (@xactState) <= 0 
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Funcionário. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Funcionário. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END


-- INSERT Funcionario2
GO
CREATE OR ALTER PROCEDURE InsertFuncionario1
(
    @IdParque INT,
    @IdUser INT,
    @NomeFuncionario VARCHAR(50),
    @DataNascimento DATETIME,
    @DataAdmissao DATETIME,
    @Inativo BIT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Funcionario (IdParque, IdUser, NomeFuncionario, DataNascimento, DataAdmissao, DataCriacao, DataAtualizacao, Inativo)
        VALUES (@IdParque, @IdUser, @NomeFuncionario, @DataNascimento, @DataAdmissao, GETDATE(), GETDATE(), @Inativo);

        COMMIT TRANSACTION;
        PRINT 'Funcionário inserido com sucesso';

        -- Inserir no LOG
        INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
        SELECT 
            CURRENT_TRANSACTION_ID(),
            ORIGINAL_LOGIN(),
            GETDATE(),
            XACT_STATE(), 
            CONCAT('Novo Funcionário adicionado. Nome do Funcionário: ', CONVERT(NVARCHAR, @NomeFuncionario),
                    ', IdUser: ', CONVERT(NVARCHAR, @IdUser), ', IdParque: ', CONVERT(NVARCHAR, @IdParque));
    END TRY
    BEGIN CATCH
		DECLARE @xactState INT;
		SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
        ROLLBACK TRANSACTION;
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
        SELECT 
            CURRENT_TRANSACTION_ID(),
            ORIGINAL_LOGIN(),
            GETDATE(),
            XACT_STATE(), 
            CONCAT('Novo Funcionário adicionado. Nome do Funcionário: ', CONVERT(NVARCHAR, @NomeFuncionario),
                    ', IdUser: ', CONVERT(NVARCHAR, @IdUser), ', IdParque: ', CONVERT(NVARCHAR, @IdParque));
    END CATCH;
END;


-- UPDATE Funcionario
GO
CREATE OR ALTER PROCEDURE UpdateFuncionario
	@IdFuncionario INT,
    @NomeFuncionario VARCHAR(50),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRAN
	BEGIN TRY
		UPDATE Funcionario
			SET NomeFuncionario = @NomeFuncionario,
			Inativo = @Inativo
			WHERE IdFuncionario = @IdFuncionario
		COMMIT TRANSACTION;
		PRINT 'Funcionário actualizado com sucesso'

		-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Funcionário actualizado. Nome do Funcionário: ', CONVERT(NVARCHAR, @NomeFuncionario))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Funcionário. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Funcionário. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- DELETE Funcionario
GO
CREATE OR ALTER PROCEDURE DeleteFuncionario
	@IdFuncionario INT
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRAN
	BEGIN TRY
		DELETE FROM Funcionario
		WHERE IdFuncionario = @IdFuncionario
		COMMIT TRANSACTION;
		PRINT 'Funcionário eliminado com sucesso'

		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Funcionário eliminado. ID do Funcionário: ', CONVERT(NVARCHAR, @IdFuncionario))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Funcionário. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Funcionário. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH;
END

-- Ocorrencia
-- INSERT OCorrencia
GO
CREATE OR ALTER PROCEDURE InsertOcorrencia
(
	@IdTipoOcorrencia INT,
	@IdZona INT ,
	@DataResolucaoOcorrencia DATE,
	@Email NVARCHAR(50),
	@Inativo BIT 
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO Ocorrencia(IdTipoOcorrencia, IdZona, DataCriacaoOcorrencia, DataResolucaoOcorrencia, Email, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdTipoOcorrencia, @IdZona, GETDATE(), @DataResolucaoOcorrencia, @Email, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Ocorrência inserida com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Nova Ocorrência adicionada. IdTipoOcorrencia: ', CONVERT(NVARCHAR, @IdTipoOcorrencia),
			', IdZona: ', CONVERT(NVARCHAR, @IdZona), ', Data de criação da Ocorrência: ', CONVERT(NVARCHAR, GETDATE()))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE Ocorrencia
GO
CREATE OR ALTER PROCEDURE UpdateOcorrencia
	@IdOcorrencia INT,
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		UPDATE Ocorrencia
			SET DataResolucaoOcorrencia = GETDATE(),
			Inativo = @Inativo
			WHERE IdOcorrencia = @IdOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Ocorrência actualizado com sucesso'
	-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Ocorrência actualizada. IdOcorrencia: ' , CONVERT(NVARCHAR, @IdOcorrencia),
			', Data de Resolução da Ocorrência: ' , CONVERT(NVARCHAR, GETDATE()))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DeleteOcorrencia
GO
CREATE OR ALTER PROCEDURE DeleteOcorrencia
	@IdOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		DELETE FROM Ocorrencia
		WHERE IdOcorrencia = @IdOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Ocorrência eliminada com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Ocorrência eliminada. IdOcorrencia: ', CONVERT(NVARCHAR, @IdOcorrencia))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- TipoOcorrencia
-- INSERT TipoOcorrencia
GO
CREATE OR ALTER PROCEDURE InsertTipoOcorrencia
(
	@NomeTipoOcorrencia NVARCHAR(50),
	@Inativo BIT
)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO TipoOcorrencia(NomeTipoOcorrencia, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@NomeTipoOcorrencia, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Tipo de Ocorrência inserido com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo Tipo de Ocorrência adicionado. Nome do Tipo de Ocorrência: ', CONVERT(NVARCHAR, @NomeTipoOcorrencia))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE TipoOcorrencia
GO
CREATE OR ALTER PROCEDURE UpdateTipOcorrencia
	@IdTipoOcorrencia INT,
	@NomeTipoOcorrencia NVARCHAR(50),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		UPDATE TipoOcorrencia
			SET NomeTipoOcorrencia = @NomeTipoOcorrencia,
			Inativo = @Inativo
			WHERE IdTipoOcorrencia = @IdTipoOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Tipo de Ocorrência actualizado com sucesso'
	-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Tipo de Ocorrência actualizada. IdTipoOcorrencia: ' , CONVERT(NVARCHAR, @IdTipoOcorrencia),
			', Nome do Tipo de Ocorrência: ' , CONVERT(NVARCHAR, @NomeTipoOcorrencia))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE TipoOcorrencia
GO
CREATE OR ALTER PROCEDURE DeleteTipoOcorrencia
	@IdTipoOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		DELETE FROM TipoOcorrencia
		WHERE IdTipoOcorrencia = @IdTipoOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Tipo de Ocorrência eliminado com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Tipo de Ocorrência eliminado. IdTipoOcorrencia: ', CONVERT(NVARCHAR, @IdTipoOcorrencia))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Tipo de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- StatusOcorrencia
-- INSERT StatusOcorrencia
GO
CREATE OR ALTER PROCEDURE InsertStatusOcorrencia
(
	@DescricaoStatus NVARCHAR(500),
	@Inativo BIT
)
AS
BEGIN
    SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO StatusOcorrencia( DescricaoStatus, DataCriacao, DataAtualizacao, Inativo)
            VALUES ( @DescricaoStatus, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Status de Ocorrência inserido com sucesso'

			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo Status de Ocorrência adicionado. IdStatusOcorrencia: ',
			', Descrição do Status: ', CONVERT(NVARCHAR, @DescricaoStatus))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE StatusOcorrencia
GO
CREATE OR ALTER PROCEDURE UpdateStatusOcorrencia
	@IdStatusOcorrencia INT,
	@DescricaoStatus NVARCHAR(500),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		UPDATE StatusOcorrencia
			SET DescricaoStatus = @DescricaoStatus,
			Inativo = @Inativo
			WHERE IdStatusOcorrencia = @IdStatusOcorrencia
			COMMIT TRANSACTION;
		PRINT 'Status de Ocorrência actualizado com sucesso'
	-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Status de Ocorrência actualizada. IdStatusOcorrencia: ' , CONVERT(NVARCHAR, @IdStatusOcorrencia),
			', Descricao de Status: ' , CONVERT(NVARCHAR, @DescricaoStatus))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE StatusOcorrencia
GO
CREATE OR ALTER PROCEDURE DeleteStatusOcorrencia
	@IdStatusOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	BEGIN TRY
		DELETE FROM StatusOcorrencia
		WHERE IdStatusOcorrencia = @IdStatusOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Status de Ocorrência eliminado com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Status de Ocorrência eliminado. IdStatusOcorrencia: ', CONVERT(NVARCHAR, @IdStatusOcorrencia))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Status de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- HistoricoOcorrencia
-- INSERT HistoricoOcorrencia
GO
CREATE OR ALTER PROCEDURE InsertHistoricoOcorrencia
(
	@IdStatusOcorrencia INT,
	@IdFuncionario INT,
	@IdOcorrencia INT,
	@Descricao NVARCHAR(500),
	@Inativo BIT

)
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO HistoricoOcorrencia (IdStatusOcorrencia, IdFuncionario, IdOcorrencia, DataModificacao, Descricao, DataCriacao, DataAtualizacao, Inativo)
            VALUES (@IdStatusOcorrencia, @IdFuncionario, @IdOcorrencia, GETDATE(), @Descricao, GETDATE(), GETDATE(), @Inativo)
			COMMIT TRANSACTION;
			PRINT 'Histórico de Ocorrência inserido com sucesso'
			
			-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
		CONCAT('Novo Histórico de Ocorrência adicionado. IdStatusOcorrencia: ', CONVERT(NVARCHAR, @IdStatusOcorrencia),
			', IdFuncionario: ', CONVERT(NVARCHAR, @IdFuncionario), ', IdOcorrencia: ', CONVERT(NVARCHAR, @IdOcorrencia),
			', Data de Modificação: ', CONVERT(NVARCHAR, GETDATE()),', Descrição: ', CONVERT(NVARCHAR, @Descricao))
    END TRY
    BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao adicionar Histórico de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao inserir Histórico de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END; 
    END CATCH;
END

-- UPDATE HistoricoOcorrencia
GO
CREATE OR ALTER PROCEDURE UpdateHistoricoOcorrencia
	@IdStatusOcorrencia INT,
	@IdFuncionario INT,
	@IdOcorrencia INT,
	@DataModificacao DATETIME,
	@Descricao NVARCHAR(500),
	@Inativo BIT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON
	BEGIN TRY
		UPDATE HistoricoOcorrencia
			SET DataModificacao = @DataModificacao,
			Descricao = @Descricao,
			Inativo = @Inativo
			WHERE IdStatusOcorrencia = @IdStatusOcorrencia AND IdFuncionario = @IdFuncionario AND IdOcorrencia = @IdOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Histórico de Ocorrência actualizado com sucesso'
	-- Inserir no LOG
    INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Histórico de Ocorrência actualizada. IdStatusOcorrencia: ' , CONVERT(NVARCHAR, @IdStatusOcorrencia),
            ', IdFuncionario: ' , CONVERT(NVARCHAR, @IdFuncionario), ', IdOcorrencia: ' , CONVERT(NVARCHAR, @IdOcorrencia),
			', Data de Modificação: ' , CONVERT(NVARCHAR, @DataModificacao),', Descricao: ' , CONVERT(NVARCHAR, @Descricao))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao actualizar Histórico de Ocorrencia. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao actualizar Histórico de Ocorrencia. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

-- DELETE HistoricoOcorrencia
GO
CREATE OR ALTER PROCEDURE DeleteHistoricoOcorrencia
	@IdStatusOcorrencia INT,
	@IdFuncionario INT,
	@IdOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON
	SET XACT_ABORT ON

	BEGIN TRY
		DELETE FROM HistoricoOcorrencia
		WHERE IdStatusOcorrencia = @IdStatusOcorrencia AND IdFuncionario = @IdFuncionario AND IdOcorrencia = @IdOcorrencia
		COMMIT TRANSACTION;
		PRINT 'Histórico de Ocorrência eliminado com sucesso'
		-- Inserir no LOG
		INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
    SELECT 
        CURRENT_TRANSACTION_ID(),
        ORIGINAL_LOGIN(),
        GETDATE(),
        XACT_STATE(), 
        CONCAT('Histórico de Ocorrência eliminado. IdStatusOcorrencia: ', CONVERT(NVARCHAR, @IdStatusOcorrencia), ', IdFuncionario: ', CONVERT(NVARCHAR, @IdFuncionario), ', IdOcorrencia: ', CONVERT(NVARCHAR, @IdOcorrencia))
	END TRY
	BEGIN CATCH
	DECLARE @xactState INT;
	SET @xactState = XACT_STATE(); -- se não declarar e não fizer set o valor fica sempre 1.
		
		IF (XACT_STATE()) = -1  
		BEGIN  
			ROLLBACK TRANSACTION;
			PRINT 'The transaction is in an uncommittable state.' +  
					' Rolling back transaction.' + CAST(@xactState AS NVARCHAR(10));
			PRINT 'Erro ao eliminar Histórico de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE();
			INSERT INTO dbo.TableLog (TransactionId, UserId, [Data], [Status], Observacao)
			VALUES (CURRENT_TRANSACTION_ID(), ORIGINAL_LOGIN(), GETDATE(), @xactState, 'Erro ao eliminar Histórico de Ocorrência. Detalhes do erro: ' + ERROR_MESSAGE());
		END;
	END CATCH
END

