-- SELECT CODIGO POSTAL BY ID
GO
CREATE OR ALTER PROCEDURE GetCodigoPostalById
	@idCodPostal INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.CodigoPostal WHERE IdCodPostal = @idCodPostal OR @idCodPostal IS NULL)
		BEGIN
			PRINT 'Erro: O ID do código postal não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.CodigoPostal c
			WHERE c.IdCodPostal = @idCodPostal;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT ESTRUTURA BY ID
GO
CREATE OR ALTER PROCEDURE GetEstruturaById
	@idEstrutura INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Estrutura WHERE IdEstrutura = @idEstrutura OR @idEstrutura IS NULL)
		BEGIN
			PRINT 'Erro: O ID da estrutura não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Estrutura e
			WHERE e.IdEstrutura = @idEstrutura;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT FAUNA BY ID
GO
CREATE OR ALTER PROCEDURE GetFaunaById
	@idFauna INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Fauna WHERE IdFauna = @idFauna OR @idFauna IS NULL)
		BEGIN
			PRINT 'Erro: O ID da fauna não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Fauna f
			WHERE f.IdFauna = @idFauna;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT FLORA BY ID
GO
CREATE OR ALTER PROCEDURE GetFloraById
	@idFlora INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Flora WHERE IdFlora = @idFlora OR @idFlora IS NULL)
		BEGIN
			PRINT 'Erro: O ID da flora não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Flora fl
			WHERE fl.IdFlora = @idFlora;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT FUNCAO BY ID
GO
CREATE OR ALTER PROCEDURE GetFuncaoById
	@idFuncao INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Funcao WHERE IdFuncao = @idFuncao OR @idFuncao IS NULL)
		BEGIN
			PRINT 'Erro: O ID da função não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Funcao fu
			WHERE fu.IdFuncao = @idFuncao;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT FUNCIONARIO BY ID
GO
CREATE OR ALTER PROCEDURE GetFuncionarioById
	@idFuncionario INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Funcionario WHERE IdFuncionario = @idFuncionario OR @idFuncionario IS NULL)
		BEGIN
			PRINT 'Erro: O ID do funcionário não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Funcionario fc
			WHERE fc.IdFuncionario = @idFuncionario;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT HISTORICO OCORRENCIA BY ID
GO
CREATE OR ALTER PROCEDURE GetHistoricoOcorrenciaById
	@idStatusOcorrencia INT,
	@idFuncionario INT,
	@IdOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.HistoricoOcorrencia WHERE IdStatusOcorrencia = @idStatusOcorrencia OR @idStatusOcorrencia IS NULL
		AND IdFuncionario = @idFuncionario OR @idFuncionario IS NULL
		AND IdOcorrencia = @IdOcorrencia OR @IdOcorrencia IS NULL)
		BEGIN
			PRINT 'Erro: O ID do histórico de ocorrência não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.HistoricoOcorrencia h
			WHERE h.IdStatusOcorrencia = @idStatusOcorrencia AND h.IdFuncionario = @idFuncionario AND h.IdOcorrencia = @IdOcorrencia;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT OCORRENCIA BY ID
GO
CREATE OR ALTER PROCEDURE GetOcorrenciaById
	@IdOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Ocorrencia WHERE IdOcorrencia = @IdOcorrencia OR @IdOcorrencia IS NULL)
		BEGIN
			PRINT 'Erro: O ID da ocorrência não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Ocorrencia o
			WHERE o.IdOcorrencia = @IdOcorrencia;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;



-- SELECT PARQUES BY ID
GO
CREATE OR ALTER PROCEDURE GetParqueById
	@idparque INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Parques WHERE IdParque = @idparque OR @idparque IS NULL)
		BEGIN
			PRINT 'Erro: O ID do parque não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Parques p
			WHERE p.IdParque = @idparque;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT QRCODE BY ID
GO
CREATE OR ALTER PROCEDURE GetQrCodeById
	@idQrCode INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.QrCode WHERE IdQrCode = @idQrCode OR @idQrCode IS NULL)
		BEGIN
			PRINT 'Erro: O ID do QrCode não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.QrCode q
			WHERE q.IdQrCode = @idQrCode;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT RIO BY ID
GO
CREATE OR ALTER PROCEDURE GetRioById
	@idRio INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Rio WHERE IdRio = @idRio OR @idRio IS NULL)
		BEGIN
			PRINT 'Erro: O ID do Rio não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Rio r
			WHERE r.IdRio = @idRio;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT STATUS OCORRENCIA BY ID
GO
CREATE OR ALTER PROCEDURE GetStatusOcorrenciaById
	@idStatusOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.StatusOcorrencia WHERE IdStatusOcorrencia = @idStatusOcorrencia OR @idStatusOcorrencia IS NULL)
		BEGIN
			PRINT 'Erro: O ID do status de ocorrência não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.StatusOcorrencia s
			WHERE s.IdStatusOcorrencia = @idStatusOcorrencia;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT TIPO ESTRUTURA BY ID
GO
CREATE OR ALTER PROCEDURE GetTipoEstruturaById
	@idTipoEstrutura INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.TipoEstrutura WHERE IdTipoEstrutura = @idTipoEstrutura OR @idTipoEstrutura IS NULL)
		BEGIN
			PRINT 'Erro: O ID do tipo de estrutura não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.TipoEstrutura t
			WHERE t.IdTipoEstrutura = @idTipoEstrutura;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT TIPO ESTRUTURA BY ID
GO
CREATE OR ALTER PROCEDURE GetTipoOcorrenciaById
	@idTipoOcorrencia INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.TipoOcorrencia WHERE IdTipoOcorrencia = @idTipoOcorrencia OR @idTipoOcorrencia IS NULL)
		BEGIN
			PRINT 'Erro: O ID do tipo de ocorrência não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.TipoOcorrencia ti
			WHERE ti.IdTipoOcorrencia = @idTipoOcorrencia;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT USER BY ID
GO
CREATE OR ALTER PROCEDURE GetUserById
	@idUser INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.[User] WHERE IdUser = @idUser OR @idUser IS NULL)
		BEGIN
			PRINT 'Erro: O ID do user não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.[User] u
			WHERE u.IdUser = @idUser;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;

-- SELECT ZONA FAUNA BY ID
GO
CREATE OR ALTER PROCEDURE GetZonaFaunaById
	@idFauna INT,
	@idZona INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.ZonaFauna WHERE IdFauna = @IdFauna OR @IdFauna IS NULL AND IdZona = @idZona OR @idZona IS NULL)
		BEGIN
			PRINT 'Erro: O ID da zona fauna não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaFauna zf
			WHERE zf.IdFauna = @idFauna AND zf.IdZona = @IdZona;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT ZONA FLORA BY ID
GO
CREATE OR ALTER PROCEDURE GetZonaFloraById
	@idFlora INT,
	@idZona INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.ZonaFlora WHERE IdFlora = @IdFlora OR @IdFlora IS NULL AND IdZona = @idZona OR @idZona IS NULL)
		BEGIN
			PRINT 'Erro: O ID da zona flora não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaFlora zfa
			WHERE zfa.IdFlora = @idFlora AND zfa.IdZona = @IdZona;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT ZONA RIO BY ID
GO
CREATE OR ALTER PROCEDURE GetZonaRioById
	@idRio INT,
	@idZona INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.ZonaRio WHERE IdRio = @IdRio OR @IdRio IS NULL AND IdZona = @idZona OR @idZona IS NULL)
		BEGIN
			PRINT 'Erro: O ID da zona rio não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.ZonaRio zr
			WHERE zr.IdRio = @idRio AND zr.IdZona = @IdZona;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;


-- SELECT ZONA BY ID
GO
CREATE OR ALTER PROCEDURE GetZonaById
	@idZona INT
AS
BEGIN
	SET NOCOUNT ON; -- desativa mensagens ao cliente
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM dbo.Zonas WHERE IdZona = @idZona OR @idZona IS NULL)
		BEGIN
			PRINT 'Erro: O ID da zona rio não existe. Detalhes do erro: ID não encontrado.';
			RETURN;
		END

		BEGIN TRANSACTION
			SELECT *
			FROM dbo.Zonas z
			WHERE z.IdZona = @IdZona;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		-- Realizar o rollback da transação em caso de erro
		ROLLBACK TRANSACTION;
		PRINT 'Erro: Ocorreu um erro ao processar a transação.';
	END CATCH
END;



-- GET ALL PARQUES
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
END