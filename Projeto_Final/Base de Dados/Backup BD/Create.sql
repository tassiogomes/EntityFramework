USE [master]
GO
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GestaoParques3')
BEGIN
	CREATE DATABASE [GestaoParques3]
END

-- DROP DATABASE [GestaoParques3]
GO
USE [GestaoParques3]
GO
DROP TABLE IF EXISTS [Rio];
DROP TABLE IF EXISTS [ZonaRio];
DROP TABLE IF EXISTS [Estrutura];
DROP TABLE IF EXISTS [TipoEstrutura];
DROP TABLE IF EXISTS [Fauna];
DROP TABLE IF EXISTS [ZonaFauna];
DROP TABLE IF EXISTS [Flora];
DROP TABLE IF EXISTS [ZonaFlora];
DROP TABLE IF EXISTS [CodigoPostal];
DROP TABLE IF EXISTS [Parques];
DROP TABLE IF EXISTS [QrCode];
DROP TABLE IF EXISTS [Zonas];
DROP TABLE IF EXISTS [Funcao];
DROP TABLE IF EXISTS [User];
DROP TABLE IF EXISTS [Funcionario];
DROP TABLE IF EXISTS [Ocorrencia];
DROP TABLE IF EXISTS [TipoOcorrencia];
DROP TABLE IF EXISTS [StatusOcorrencia];
DROP TABLE IF EXISTS [HistoricoOcorrencia];
DROP TABLE IF EXISTS [TableLog];

GO
CREATE TABLE [dbo].[Rio] (
	IdRio INT IDENTITY(1,1) NOT NULL,
	NomeRio NVARCHAR(50) NOT NULL,
	Comprimento INT NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idRio PRIMARY KEY (idRio),
	CONSTRAINT CHK_Rio_Comprimento CHECK (comprimento > 0),
	CONSTRAINT CHK_Rio_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Rio_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Rio_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[ZonaRio] (
	IdZona INT NOT NULL,
	IdRio INT NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_ZonaRio PRIMARY KEY (idZona, idRio),
	CONSTRAINT CHK_ZonaRio_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_ZonaRio_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_ZonaRio_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[Estrutura] (
	IdEstrutura INT IDENTITY(1,1) NOT NULL,
	IdZona INT NOT NULL,
	IdTipoEstrutura INT NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idEstrutura PRIMARY KEY (idEstrutura),
	CONSTRAINT CHK_Estrutura_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Estrutura_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Estrutura_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[TipoEstrutura] (
	IdTipoEstrutura INT IDENTITY(1,1) NOT NULL,
	NomeTipoEstrutura NVARCHAR(50) NOT NULL,
	DescricaoTipoEstrutura NVARCHAR(500) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idTipoEstrutura PRIMARY KEY (idTipoEstrutura),
	CONSTRAINT CHK_TipoEstrutura_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_TipoEstrutura_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_TipoEstrutura_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[Fauna] (
	IdFauna INT IDENTITY(1,1) NOT NULL,
	EspecieFauna NVARCHAR(50) NOT NULL,
	NomeCientificoFauna NVARCHAR(100) NOT NULL,
	CategoriaFauna NVARCHAR(50) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idFauna PRIMARY KEY (idFauna),
	CONSTRAINT CHK_Fauna_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Fauna_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Fauna_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[ZonaFauna] (
	IdFauna INT NOT NULL,
	IdZona INT NOT NULL,
	Descricao NVARCHAR(500),
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_ZonaFauna PRIMARY KEY (idFauna, idZona),
	CONSTRAINT CHK_ZonaFauna_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_ZonaFauna_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_ZonaFauna_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[Flora] (
	IdFlora INT IDENTITY(1,1) NOT NULL,
	EspecieFlora NVARCHAR(50) NOT NULL,
	NomeCientificoFlora NVARCHAR(100) NOT NULL,
	TipoPlanta NVARCHAR(50) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idFlora PRIMARY KEY (idFlora),
	CONSTRAINT CHK_Flora_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Flora_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Flora_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[ZonaFlora] (
	idFlora INT NOT NULL,
	idZona INT NOT NULL,
	Descricao NVARCHAR(500),
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_ZonaFlora PRIMARY KEY (idFlora, idZona),
	CONSTRAINT CHK_ZonaFlora_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_ZonaFlora_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_ZonaFlora_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[CodigoPostal] (
    IdCodPostal INT IDENTITY(1,1),
	CodPostal  INT NOT NULL,
    Concelho NVARCHAR(50) NOT NULL,
    Freguesia NVARCHAR(50) NOT NULL,
    Rua NVARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Lat FLOAT NOT NULL,
    Long FLOAT NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idCodPostal PRIMARY KEY (IdCodPostal),
	CONSTRAINT CHK_CodigoPostal_CodPostal CHECK(LEN(CodPostal) = 7),
	CONSTRAINT CHK_CodigoPostal_Numero CHECK (Numero >= 0 AND Numero <= 9999999999),
	CONSTRAINT CHK_CodigoPostal_Lat CHECK (Lat >= -90 AND Lat <= 90),
	CONSTRAINT CHK_CodigoPostal_Long CHECK (Long >= -180 AND Long <= 180 ),
	CONSTRAINT CHK_CodigoPostal_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_CodigoPostal_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_CodigoPostal_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[Parques] (
    IdParque INT IDENTITY(1,1),
    idCodPostal INT NOT NULL,
    NomeParque NVARCHAR(50) NOT NULL,
    Dimensao FLOAT CHECK (Dimensao >= 0) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_idParque PRIMARY KEY (idParque),
    CONSTRAINT CHK_Parque_Dimensao CHECK (Dimensao >= 0),
	CONSTRAINT CHK_Parques_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Parques_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Parques_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[QrCode] (
    IdQrCode INT IDENTITY(1,1),
    DataCriacaoQr DATE NOT NULL,
    DataExpiracaoQr DATE NULL,
    Link NVARCHAR(200) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_IdQrCode PRIMARY KEY (IdQrCode),
    CONSTRAINT CHK_QRCode_DataCriacaoQr CHECK (DataCriacaoQr <= GETDATE()), -- Assume que a DataCriacao não pode ser no futuro
    CONSTRAINT CHK_QRCode_DataExpiracao CHECK (DataExpiracaoQr IS NULL OR DataExpiracaoQr >= DataCriacaoQr), -- DataExpiracao pode ser nula ou maior que DataCriacao
    CONSTRAINT CHK_QRCode_Link CHECK (LEN(Link) <= 200),
	CONSTRAINT CHK_QrCode_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_QrCode_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_QrCode_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[Zonas] (
    IdZona INT IDENTITY(1,1),
    IdParque INT,
    IdQrCode INT,
    NomeZona NVARCHAR(50) NOT NULL,
    NumeroZona INT NOT NULL,
    Cor NVARCHAR(10) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_IdZona PRIMARY KEY(IdZona),
	CONSTRAINT CHK_Zonas_NumeroZona CHECK (NumeroZona BETWEEN 1 AND 50),
	CONSTRAINT CHK_Zonas_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Zonas_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Zonas_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[Funcao] (
    IdFuncao INT IDENTITY(1,1),
    NomeFuncao VARCHAR(50) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_IdFuncao PRIMARY KEY (IdFuncao),
	CONSTRAINT CHK_Funcao_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Funcao_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Funcao_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[User] (
    IdUser INT IDENTITY(1,1),
    IdFuncao INT,
    UserName NVARCHAR(10) NOT NULL,
    [Password] NVARCHAR(255) NOT NULL,
    DataCriacao DATETIME NOT NULL,
    DataAtualizacao DATETIME NOT NULL,
    Inativo BIT NOT NULL,

	CONSTRAINT PK_IdUser PRIMARY KEY (IdUser),
    CONSTRAINT CHK_USER_UserName CHECK (LEN(UserName) <= 10),
    CONSTRAINT CHK_USER_PasswordLen CHECK (LEN(Password) > 6), -- Verifica se a senha não está vazia
    CONSTRAINT CHK_USER_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_USER_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_USER_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
);

GO
CREATE TABLE [dbo].[Funcionario] (
    IdFuncionario INT IDENTITY(1,1),
    IdParque INT,
    IdUser INT UNIQUE,
    NomeFuncionario VARCHAR(50),
    DataNascimento DATETIME,
    DataAdmissao DATETIME,
    DataCriacao DATETIME NOT NULL,
    DataAtualizacao DATETIME NOT NULL,
    Inativo BIT NOT NULL,

    CONSTRAINT PK_IdFuncionario PRIMARY KEY (IdFuncionario),
    CONSTRAINT CHK_Funcionario_NomeFuncionario CHECK (LEN(NomeFuncionario) <= 50),
	CONSTRAINT CHK_Funcionario_DataAdmissao CHECK (DataAdmissao > DataNascimento),
    CONSTRAINT CHK_Funcionario_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_Funcionario_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Funcionario_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao)
);

GO
CREATE TABLE [dbo].[Ocorrencia] (
	IdOcorrencia INT IDENTITY(1,1) NOT NULL,
	IdTipoOcorrencia INT NOT NULL,
	IdZona INT NOT NULL,
	DataCriacaoOcorrencia DATE NOT NULL,
	DataResolucaoOcorrencia DATE,
	Email NVARCHAR(50) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_Ocorrencia PRIMARY KEY (IdOcorrencia),
	CONSTRAINT CHK_DataCriacaoOcorrencia_DataResolucaoOcorrencia CHECK (DataResolucaoOcorrencia >= DataCriacaoOcorrencia), -- DataResolucao pode ser nula ou maior que DataCriacao
	CONSTRAINT CHK_Ocorrencia_Email CHECK (Email LIKE '%@%'), -- Garante que a pessoa que reporta a ocorrência introduz, pelo menos, um formato email
	CONSTRAINT CHK_Ocorrencia_DataCriacao CHECK (DataCriacao <= GETDATE()), -- Assume que a DataCriacao não pode ser no futuro
    CONSTRAINT CHK_Ocorrencia_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_Ocorrencia_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[TipoOcorrencia] (
	IdTipoOcorrencia INT IDENTITY(1,1) NOT NULL,
	NomeTipoOcorrencia NVARCHAR(50) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_TipoOcorrencia PRIMARY KEY (IdTipoOcorrencia),
	CONSTRAINT CHK_TipoOcorrencia_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_TipoOcorrencia_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_TipoOcorrencia_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[StatusOcorrencia] (
	IdStatusOcorrencia INT IDENTITY(1,1) NOT NULL,
	DescricaoStatus NVARCHAR(500) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_StatusOcorrencia PRIMARY KEY (IdStatusOcorrencia),
	CONSTRAINT CHK_StatusOcorrencia_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_StatusOcorrencia_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_StatusOcorrencia_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[HistoricoOcorrencia] (
	IdStatusOcorrencia INT NOT NULL,
	IdFuncionario INT NOT NULL,
	IdOcorrencia INT NOT NULL,
	DataModificacao DATETIME NOT NULL,
	Descricao NVARCHAR(500) NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
	Inativo BIT NOT NULL,

	CONSTRAINT PK_HistoricoOcorrencia PRIMARY KEY (IdStatusOcorrencia, IdFuncionario, IdOcorrencia),
	CONSTRAINT CHK_HistoricoOcorrencia_DataCriacao CHECK (DataCriacao <= GETDATE()),
    CONSTRAINT CHK_HistoricoOcorrencia_DataAtualizacao CHECK (DataAtualizacao <= GETDATE()),
    CONSTRAINT CHK_HistoricoOcorrencia_DataAtualizacao_DataCriacao CHECK (DataAtualizacao >= DataCriacao),
	);

GO
CREATE TABLE [dbo].[TableLog] (
	LogId INT IDENTITY(1,1) PRIMARY KEY,
	TransactionId INT DEFAULT SCOPE_IDENTITY(),
	UserId NVARCHAR(30) DEFAULT ORIGINAL_LOGIN(),
	"Data" DATETIME DEFAULT GETDATE(),
	"Status" INT DEFAULT XACT_STATE(),
	Observacao NVARCHAR(255)
	);

-- CONSTRAINTS FK
ALTER TABLE ZonaRio
	ADD CONSTRAINT FK_Rio_ZonaRio FOREIGN KEY (idRio) REFERENCES Rio (idRio) ON DELETE NO ACTION,
		CONSTRAINT FK_Zonas_ZonaRio FOREIGN KEY (idZona) REFERENCES Zonas (idZona)ON DELETE NO ACTION;

ALTER TABLE Estrutura
	ADD CONSTRAINT FK_TipoEstrutura_Estrutura FOREIGN KEY (idTipoEstrutura) REFERENCES TipoEstrutura (idTipoEstrutura)ON DELETE NO ACTION,
		CONSTRAINT FK_Zonas_ZonaEstrutura FOREIGN KEY (idZona) REFERENCES Zonas (idZona)ON DELETE NO ACTION;

ALTER TABLE ZonaFauna
	ADD CONSTRAINT FK_Fauna_ZonaFauna FOREIGN KEY (idFauna) REFERENCES Fauna (idFauna)ON DELETE NO ACTION,
		CONSTRAINT FK_Zonas_ZonaFauna FOREIGN KEY (idZona) REFERENCES Zonas (idZona)ON DELETE NO ACTION;

ALTER TABLE ZonaFlora
	ADD CONSTRAINT FK_Flora_ZonaFlora FOREIGN KEY (idFlora) REFERENCES Flora (idFlora)ON DELETE NO ACTION,
		CONSTRAINT FK_Zonas_ZonaFlora FOREIGN KEY (idZona) REFERENCES Zonas (idZona)ON DELETE NO ACTION;

ALTER TABLE Parques
	ADD CONSTRAINT FK_CodPostal_Parque FOREIGN KEY (IdCodPostal) REFERENCES CodigoPostal(IdCodPostal)ON DELETE NO ACTION;

ALTER TABLE Zonas
	ADD CONSTRAINT FK_Parque_Zonas FOREIGN KEY (IdParque) REFERENCES Parques(IdParque)ON DELETE NO ACTION,
		CONSTRAINT FK_QrCode_Zonas FOREIGN KEY (IdQrCode) REFERENCES QrCode(IdQrCode)ON DELETE NO ACTION;

ALTER TABLE [User]
	ADD CONSTRAINT FK_User_IdFuncao FOREIGN KEY (IdFuncao) REFERENCES Funcao(IdFuncao) ON DELETE NO ACTION;

ALTER TABLE Funcionario
	ADD CONSTRAINT FK_Funcionario_IdParque FOREIGN KEY (IdParque) REFERENCES Parques(IdParque) ON DELETE NO ACTION,
		CONSTRAINT FK_Funcionario_IdUser FOREIGN KEY (IdUser) REFERENCES [User](IdUser) ON DELETE NO ACTION;

ALTER TABLE Ocorrencia
	ADD CONSTRAINT FK_TipoOcorrencia_Ocorrencia FOREIGN KEY (IdTipoOcorrencia) REFERENCES TipoOcorrencia(IdTipoOcorrencia) ON DELETE NO ACTION,
		CONSTRAINT FK_Zonas_Ocorrencia FOREIGN KEY (IdZona) REFERENCES Zonas(IdZona) ON DELETE NO ACTION;

ALTER TABLE HistoricoOcorrencia
	ADD CONSTRAINT FK_Ocorrencia_HistoricoOcorrencia FOREIGN KEY (IdOcorrencia) REFERENCES Ocorrencia(IdOcorrencia) ON DELETE NO ACTION,
		CONSTRAINT FK_StatusOcorrencia_HistoricoOcorrencia FOREIGN KEY (IdStatusOcorrencia) REFERENCES StatusOcorrencia(IdStatusOcorrencia) ON DELETE NO ACTION,
		CONSTRAINT FK_Funcionario_HistoricoOcorrencia FOREIGN KEY (IdFuncionario) REFERENCES Funcionario(IdFuncionario) ON DELETE NO ACTION;