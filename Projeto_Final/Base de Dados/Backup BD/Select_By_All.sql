USE GestaoParques2
--USE [master]

-- STORAGE PROCEDURES

-- Rio
--GET ALL Rio
GO
CREATE OR ALTER PROCEDURE GetAllRio
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Rio r

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

EXEC GetAllRio

-- ZonaRio
-- GET ALL ZonaRio
GO
CREATE OR ALTER PROCEDURE GetAllZonaRio
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaRio z

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- Estrutura
-- GET ALL Estrutura
GO
CREATE OR ALTER PROCEDURE GetAllEstrutura
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Estrutura e

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- TipoEstrutura
-- GET ALL TipoEstrutura
GO
CREATE OR ALTER PROCEDURE GetAllTipoEstrutura
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.TipoEstrutura t

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- Fauna
-- GET ALL Fauna
GO
CREATE OR ALTER PROCEDURE GetAllFauna
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Fauna f

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- ZonaFauna
-- GET ALL ZonaFauna
GO
CREATE OR ALTER PROCEDURE GetAllZonaFauna
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaFauna z

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- Flora
-- GET ALL Flora
GO
CREATE OR ALTER PROCEDURE GetAllFlora
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Flora f

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- ZonaFlora
-- GET ALL ZonaFlora
GO
CREATE OR ALTER PROCEDURE GetAllZonaFlora
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaFlora z

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- CodigoPostal
-- INSERT CodigoPostal
GO
CREATE OR ALTER PROCEDURE GetAllCodigoPostal
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.CodigoPostal c

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;



-- Parques
-- GELL ALL Parques
GO
CREATE OR ALTER PROCEDURE GetAllParques
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Parques p

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- QrCode
-- GET ALL QrCode
GO
CREATE OR ALTER PROCEDURE GetAllQrCode
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.QrCode q

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- Zonas
-- GET ALL Zonas
GO
CREATE OR ALTER PROCEDURE GetAllZonas
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Zonas z

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- Funcao
-- GET ALL Funcao
GO
CREATE OR ALTER PROCEDURE GetAllFuncao
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Funcao f

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- User
-- GET ALL User
GO
CREATE OR ALTER PROCEDURE GetAllUser
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo."User" u

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- Funcionario
-- GET ALL Funcionario
GO
CREATE OR ALTER PROCEDURE GetAllFuncionario
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Funcionario f

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- Ocorrencia
-- GET ALL OCorrencia
GO
CREATE OR ALTER PROCEDURE GetAllOcorrencia
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Ocorrencia o

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- TipoOcorrencia
-- GET ALL TipoOcorrencia
GO
CREATE OR ALTER PROCEDURE GetAllTipoOcorrencia
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.TipoOcorrencia t

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- StatusOcorrencia
-- GET ALL StatusOcorrencia
GO
CREATE OR ALTER PROCEDURE GetAllStatusOcorrencia
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.StatusOcorrencia s

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- HistoricoOcorrencia
-- GET ALL HistoricoOcorrencia
GO
CREATE OR ALTER PROCEDURE GetAllHistoricoOcorrencia
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		BEGIN TRANSACTION
			SELECT *
			FROM dbo.HistoricoOcorrencia h

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

