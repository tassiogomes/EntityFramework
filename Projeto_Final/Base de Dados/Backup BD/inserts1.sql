USE GestaoParques3
-- USE [master]

GO
-- RIO -------------------------------------------------------------------------------------------------
-- INSERT RIO
EXEC InsertRio 'Douro', 897, 0;
EXEC InsertRio 'Tejo', 1007, 0;
EXEC InsertRio 'Mondego', 234, 0;
EXEC InsertRio 'Guadiana', 742, 0;
EXEC InsertRio 'Sado', 120, 0;
EXEC InsertRio 'Cávado', 135, 0;


SELECT * FROM RIO


-- TIPO ESTRUTURA -----------------------------------------------------------------------------------------
--INSERT TIPO ESTRUTURA
EXEC InsertTipoEstrutura 'Ponte', 'Descrição: A ponte é uma estrutura elevada que atravessa um riacho ou rio dentro do parque.', 0;
EXEC InsertTipoEstrutura 'Cais', 'Descrição: O cais é uma estrutura construída ao longo da margem de um lago, rio ou oceano dentro do parque.', 0;
EXEC InsertTipoEstrutura 'Miradouro', 'Descrição: Uma estrutura elevada que oferece vistas panorâmicas da paisagem circundante no parque.', 0;
EXEC InsertTipoEstrutura 'Área de Piquenique', 'Descrição: Uma área designada no parque com mesas, bancos e churrasqueiras para piqueniques e refeições ao ar livre.', 0;
EXEC InsertTipoEstrutura 'Parque Infantil', 'Descrição: Uma área equipada com estruturas para crianças se divertirem', 0;
EXEC InsertTipoEstrutura 'Aqueduto', 'Descrição: O aqueduto é uma estrutura arquitetônica impressionante que transporta água através do parque.', 0;

SELECT * FROM TIPOESTRUTURA



-- FAUNA ---------------------------------------------------------------------------------------
--INSERT FAUNA
EXEC InsertFauna'Lince Ibérico', 'Lynx pardinus', 'Mamífero', 0;
EXEC InsertFauna 'Coelho-Europeu', 'Oryctolagus cuniculus', 'Mamífero', 0;
EXEC InsertFauna 'Águia-De asa-Redonda', 'Buteo buteo', 'Ave', 0;
EXEC InsertFauna 'Lontra-Europeia', 'Lutra lutra', 'Mamífero', 0;
EXEC InsertFauna 'Poupa', 'Upupa epops', 'Ave', 0;


SELECT * FROM FAUNA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



-- FLORA ----------------------------------------------------------------------------------------------
--INSERT FLORA
EXEC InsertFlora 'Rosa', 'Rosa spp.', 'Flor', 0;
EXEC InsertFlora 'Lírio', 'Lilium spp.', 'Flor', 0;
EXEC InsertFlora 'Girassol', 'Helianthus annuus', 'Flor', 0;
EXEC InsertFlora 'Hortênsia', 'Hydrangea macrophylla', 'Flor', 0;


SELECT * FROM FLORA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;

-- QRCODE -----------------------------------------------------------------------------
--INSERT QR CODE
EXEC InsertQrCode '2024-01-26', 'https://example.com/qr1', 0;
EXEC InsertQrCode '2024-03-27', 'https://example.com/qr2', 0;
EXEC InsertQrCode '2024-03-28', 'https://example.com/qr3', 0;
EXEC InsertQrCode '2024-03-29', 'https://example.com/qr4', 0;
EXEC InsertQrCode '2024-03-30', 'https://example.com/qr5', 0;
EXEC InsertQrCode '2024-03-31', 'https://example.com/qr6', 0;
EXEC InsertQrCode '2024-03-01', 'https://example.com/qr7', 0;
EXEC InsertQrCode '2024-03-02', 'https://example.com/qr8', 0;


SELECT * FROM QRCODE



-- CODIGO POSTAL ----------------------------------------------------------------------------------------------
--INSERT CODIGO POSTAL
EXEC InsertCodigoPostal 1000234, 'Lisboa', 'Lisboa', 'Avenida da Liberdade', 123, 38.7223, -9.1393, 0;
EXEC InsertCodigoPostal 4000346, 'Porto', 'Porto', 'Rua de Santa Catarina', 456, 41.1496, -8.6109, 0;
EXEC InsertCodigoPostal 1500678, 'Lisboa', 'Lisboa', 'Rua Professor Simões Raposo', 789, 38.7538, -9.1853, 0;
EXEC InsertCodigoPostal 3000213, 'Coimbra', 'Coimbra', 'Avenida Emídio Navarro', 1011, 40.2115, -8.4299, 0;
EXEC InsertCodigoPostal 9500234, 'Ponta Delgada', 'São Miguel', 'Rua dos Mercadores', 1213, 37.7432, -25.6682, 0;
EXEC InsertCodigoPostal 4050187, 'Porto', 'Porto', 'Rua de Cedofeita', 789, 41.1496, -8.6157, 0;
EXEC InsertCodigoPostal 2750112, 'Cascais', 'Lisboa', 'Avenida Marginal', 101, 38.7018, -9.4176, 0;
EXEC InsertCodigoPostal 1750879, 'Lisboa', 'Lisboa', 'Avenida Marechal Gomes da Costa', 456, 38.7371, -9.1619, 0;

SELECT * FROM CODIGOPOSTAL

-- PARQUES-------------------------------------------------------------------------------------------

-- INSERT PARQUES
EXEC InsertParques 1, 'Parque Eduardo VII', 12.5, 0;
EXEC InsertParques 2, 'Jardim da Estrela', 8.2, 0;
EXEC InsertParques 3, 'Parque Florestal de Monsanto', 120.0, 0;
EXEC InsertParques 4, 'Jardim Botânico de Lisboa', 6.8, 0;
EXEC InsertParques 5, 'Parque das Nações', 35.6, 0;



SELECT * FROM PARQUES



-- ZONAS ------------------------------------------------------------------------------------------------
--INSERT ZONAS

EXEC InsertZonas 1, 5, 'Zona A', 1, 'Azul', 0;
EXEC InsertZonas 2, 4, 'Zona B', 2, 'Vermelho', 1;
EXEC InsertZonas 3, 3, 'Zona C', 3, 'Verde', 0;
EXEC InsertZonas 4, 2, 'Zona D', 4, 'Amarelo', 1;
EXEC InsertZonas 5, 8, 'Zona E', 5, 'Laranja', 0;

SELECT * FROM PARQUES
SELECT * FROM QRCODE
SELECT * FROM ZONAS


-- ZONA RIO ------------------------------------------------------------------------------------------------ 
--INSERT ZONA RIO
EXEC InsertZonaRio 1, 2, 1;
EXEC InsertZonaRio 2, 1, 0;

SELECT * FROM ZonaRio


-- ZONAFAUNA ----------------------------------------------------------------------------------------
--INSERT ZONAFAUNA
EXEC InsertZonaFauna 2, 1, 'Habitat do Lince-ibérico', 0;
EXEC InsertZonaFauna 3, 2, 'Área do Coelho-europeu', 0;
EXEC InsertZonaFauna 3, 3, 'Local de nidificação do Águia-da asa-redonda', 0;
EXEC InsertZonaFauna 4, 4, 'Habitat da Lontra-europeia', 0;
EXEC InsertZonaFauna 3, 6, 'Área da Poupa-europeia', 0;


SELECT * FROM ZonaFauna
SELECT * FROM FAUNA
SELECT * FROM ZonaS

-- ZONA FLORA --------------------------------------------------------------------------------------------------
--INSERT ZONA FLORA
EXEC InsertZonaFlora 1, 1, 'Jardim das Rosas', 0;
EXEC InsertZonaFlora 2, 2, 'Bosque de Carvalhos', 0;
EXEC InsertZonaFlora 4, 3, 'Área de Bambus', 0;
EXEC InsertZonaFlora 4, 4, 'INSERIDO TESTE', 0;


SELECT * FROM ZONAFLORA
SELECT * FROM FLORA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;

-- ESTRUTURA --------------------------------------------------------------------------------------------------------
-- INSERT ESTRUTURA
EXEC InsertEstrutura 1, 1, 0;
EXEC InsertEstrutura 2, 2, 0;
EXEC InsertEstrutura 3, 3, 0;
EXEC InsertEstrutura 4, 4, 0;
EXEC InsertEstrutura 3, 6, 0;


SELECT * FROM ESTRUTURA
SELECT * FROM ZONAS
SELECT * FROM tipoestrutura
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;


-- FUNÇÃO -----------------------------------------------------------------------------
--INSERT FUNCAO-

EXEC InsertFuncao 'Guarda Florestal', 0;
EXEC InsertFuncao 'Técnico Ambiental', 0;
EXEC InsertFuncao 'Gestor de Parque', 0;
EXEC InsertFuncao 'Monitor de Trilhas', 0;
EXEC InsertFuncao 'Especialista em Ecologia', 0;
EXEC InsertFuncao 'Engenheiro Florestal', 0;
EXEC InsertFuncao 'Educador Ambiental', 0;
EXEC InsertFuncao 'Coordenador de Eventos', 0;
EXEC InsertFuncao 'Técnico de Manutenção de Áreas Verdes', 0;
EXEC InsertFuncao 'Analista de Recursos Naturais', 0;



select * from funcao


-- USER -----------------------------------------------------------------------------
--INSERT USER
EXEC InsertUser 2, 'john_doe', 'abc123%', 0;
EXEC InsertUser 2, 'alice_smith', 'hello12%3', 0;
EXEC InsertUser 3, 'bob_jones', 'welcome123', 0;
EXEC InsertUser 4, 'emily_davis', 'pass%word123', 0;
EXEC InsertUser 5, 'michael_clark', '123456%', 0;
EXEC InsertUser 6, 'sophia_wilson', 'letmein123%', 0;
EXEC InsertUser 7, 'william_thomas', 'test123%', 0;
EXEC InsertUser 8, 'olivia_johnson', '123abc%', 0;
EXEC InsertUser 9, 'jacob_white', 'password1%', 0;
EXEC InsertUser 10, 'emma_brown', 'abc1234%', 0;
EXEC InsertUser 2, 'mia_thompson', 'welcome%', 0;


select * from [User]

-- FUNCIONARIO --------------------------------------------------------------------------------
--INSERT FUNCIONARIO
EXEC InsertFuncionario 1, 2, 'Ricardo Ferreira', '1983-07-05', '2022-10-15', 0;
EXEC InsertFuncionario 1, 1, 'Catarina Carvalho', '1989-11-18', '2021-08-27', 0;
EXEC InsertFuncionario 3, 3, 'Paulo Santos', '1976-04-12', '2023-05-19', 0;
EXEC InsertFuncionario 4, 9, 'Sara Silva', '1993-09-30', '2020-12-08', 0;
EXEC InsertFuncionario 1, 4, 'Tiago Rodrigues', '1981-03-24', '2024-01-10', 0;
EXEC InsertFuncionario 3, 10, 'Filipa Sousa', '1986-01-14', '2022-07-03', 0;
EXEC InsertFuncionario 4, 7, 'Joana Costa', '1984-06-08', '2021-04-22', 0;
EXEC InsertFuncionario 1, 8, 'Miguel Oliveira', '1978-08-29', '2023-11-30', 0;

EXEC InsertFuncionario 1, 8, 'TESTE ERRO2233', '1978-08-29', '2023-11-30', 1;

SELECT * FROM [USER]
SELECT * FROM FUNCIONARIO

SELECT * FROM TABLELOG
ORDER BY LOGID DESC;

-- TIPO OCORRENCIA -------------------------------------------------------------------------------------
--INSERT TIPO DE OCORRENCIA
EXEC InsertTipoOcorrencia 'Incêndio Florestal', 0;
EXEC InsertTipoOcorrencia 'Emergência Médica', 0;
EXEC InsertTipoOcorrencia 'Furto', 0;
EXEC InsertTipoOcorrencia 'Atividade Suspeita', 0;
EXEC InsertTipoOcorrencia 'Danos à Propriedade', 0;
EXEC InsertTipoOcorrencia 'Conflito entre Visitantes', 0;
EXEC InsertTipoOcorrencia 'Presença de Animal Perigoso', 0;
EXEC InsertTipoOcorrencia 'Poluição Ambiental', 0;
EXEC InsertTipoOcorrencia 'Ruído Excessivo', 0;
EXEC InsertTipoOcorrencia 'Vandalismo', 0;
EXEC InsertTipoOcorrencia 'Desaparecimento de Pessoa', 0;

SELECT * FROM TIPOOCORRENCIA


SELECT * FROM Funcionario
-- OCORRENCIA -------------------------------------------------------------------------------------
-- INSERT OCORRENCIA
EXEC InsertOcorrencia 1, 2, NULL, 'fulano@example.com', 0;
EXEC InsertOcorrencia 2, 4, NULL, 'sicrano@example.com', 0;
EXEC InsertOcorrencia 3, 5, NULL, 'ciclano@example.com', 0;
EXEC InsertOcorrencia 4, 1, NULL, 'beltrano@example.com', 0;
EXEC InsertOcorrencia 5, 2, NULL, 'outrousuario@example.com', 0;



SELECT * FROM TIPOOCORRENCIA
SELECT * FROM ZONAS
SELECT * FROM PARQUES
SELECT * FROM Funcionario
SELECT * FROM OCORRENCIA
SELECT * FROM TABLELOG




-- STATUSOCORRENCIA -------------------------------------------------------------------------------
--INSERT STATUS OCORRENCIA

EXEC InsertStatusOcorrencia 'Aberto', 0;
EXEC InsertStatusOcorrencia 'Em andamento', 0;
EXEC InsertStatusOcorrencia 'Concluído', 0;
EXEC InsertStatusOcorrencia 'Cancelado', 0;

SELECT * FROM STATUSOCORRENCIA
SELECT * FROM Funcionario

-- HISTORICO OCORRENCIA ---------------------------------------------------------------------------
-- INSERT HISTORICO OCORRENCIA
-- INSERT HISTORICO OCORRENCIA INTERCALADO
EXEC InsertHistoricoOcorrencia 1, 1, 1, 'Ocorrência em análise.', 0;
EXEC InsertHistoricoOcorrencia 1, 2, 2, 'Ocorrência em análise.', 0;
EXEC InsertHistoricoOcorrencia 2, 1, 3, 'Ocorrência em andamento.', 0;
EXEC InsertHistoricoOcorrencia 2, 2, 4, 'Ocorrência em andamento.', 0;
EXEC InsertHistoricoOcorrencia 3, 1, 5, 'Ocorrência concluída.', 0;
EXEC InsertHistoricoOcorrencia 3, 2, 5, 'Ocorrência concluída.', 0




SELECT * FROM STATUSOCORRENCIA
SELECT * FROM FUNCIONARIO
SELECT * FROM OCORRENCIA
SELECT * FROM HISTORICOOCORRENCIA
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



EXEC InsertHistoricoOcorrencia 3, 1, 10, 'TESTE TRIGGER', 0;


