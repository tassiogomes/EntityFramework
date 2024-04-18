USE GestaoParques2
USE [master]

GO
-- RIO -------------------------------------------------------------------------------------------------
-- INSERT RIO
EXEC InsertRio 'Douro', 897, 0;
EXEC InsertRio 'Tejo', 1007, 0;
EXEC InsertRio 'Mondego', 234, 0;
EXEC InsertRio 'Guadiana', 742, 0;
EXEC InsertRio 'Sado', 120, 0;
EXEC InsertRio 'Cávado', 135, 0;

-- UPDATE RIO
EXEC UpdateRio 1, 'Douro updated', 897, 0;
EXEC UpdateRio 2, 'Tejo updated', -2, 0; -- erro

-- DELETE RIO
EXEC DeleteRio 8;

-- GETBYID AND GETALL

EXEC GetAllRio;
EXEC GetRioById 1;


SELECT * FROM RIO
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;

-- ZONA RIO ------------------------------------------------------------------------------------------------ 

--INSERT ZONA RIO
EXEC InsertZonaRio 18, 7, 1;
EXEC InsertZonaRio 19, 10, 1;


-- UPDATE ZONA RIO
EXEC UpdateZonaRio 19, 10, 0;
EXEC UpdateZonaRio 18, 7, 0;

-- DELETE ZONARIO
EXEC DeleteZonaRio 18, 7;

-- GETBYID AND GETALL

EXEC GetAllZonaRio;
EXEC GetZonaRioById 1, 1;


SELECT * FROM ZONARIO
SELECT * FROM ZONAS
SELECT * FROM RIO
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;


-- TIPO ESTRUTURA -----------------------------------------------------------------------------------------
--INSERT TIPO ESTRUTURA
EXEC InsertTipoEstrutura 'Ponte', 'Descrição: A ponte é uma estrutura elevada que atravessa um riacho ou rio dentro do parque.', 0;
EXEC InsertTipoEstrutura 'Cais', 'Descrição: O cais é uma estrutura construída ao longo da margem de um lago, rio ou oceano dentro do parque.', 0;
EXEC InsertTipoEstrutura 'Miradouro', 'Descrição: Uma estrutura elevada que oferece vistas panorâmicas da paisagem circundante no parque.', 0;
EXEC InsertTipoEstrutura 'Área de Piquenique', 'Descrição: Uma área designada no parque com mesas, bancos e churrasqueiras para piqueniques e refeições ao ar livre.', 0;
EXEC InsertTipoEstrutura 'Parque Infantil', 'Descrição: Uma área equipada com estruturas para crianças se divertirem', 0;
EXEC InsertTipoEstrutura 'Aqueduto', 'Descrição: O aqueduto é uma estrutura arquitetônica impressionante que transporta água através do parque.', 0;

-- UPDATE TIPOESTRUTURA
EXEC UpdateTipoEstrutura 1, 'Ponte', 'updated.', 1;
EXEC UpdateTipoEstrutura 2, 'Cais', 'updated.', 1;
EXEC UpdateTipoEstrutura 3, 'Miradouro', 'updated.', 1;

-- DELETE TIPOESTRUTURA
EXEC DeleteTipoEstrutura 1;

-- GETBYID AND GETALL
EXEC GetAllTipoEstrutura;
EXEC GetTipoEstruturaById 1;



SELECT * FROM tipoestrutura
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



-- ESTRUTURA --------------------------------------------------------------------------------------------------------
-- INSERT ESTRUTURA
EXEC InsertEstrutura 18, 2, 0;
EXEC InsertEstrutura 19, 3, 0;
EXEC InsertEstrutura 18, 4, 0;
EXEC InsertEstrutura 18, 5, 0;
EXEC InsertEstrutura 18, 11, 0;
EXEC InsertEstrutura 18, 2, 0;
EXEC InsertEstrutura 18, 3, 0;

-- UPADATE ESTRUTURA
EXEC UpdateEstrutura 1, 1;
EXEC UpdateEstrutura 2, 1;
EXEC UpdateEstrutura 3, 1;

-- DELETE ESTRUTURA
EXEC DeleteEstrutura 1;
EXEC DeleteEstrutura 2;
EXEC DeleteEstrutura 3;

-- GETBYID AND GETALL
EXEC GetAllEstrutura;
EXEC GetEstruturaById 1;



SELECT * FROM ESTRUTURA
SELECT * FROM ZONAS
SELECT * FROM tipoestrutura
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



-- FAUNA ---------------------------------------------------------------------------------------
--INSERT FAUNA
EXEC InsertFauna'Lince Ibérico', 'Lynx pardinus', 'Mamífero', 0;
EXEC InsertFauna 'Coelho-Europeu', 'Oryctolagus cuniculus', 'Mamífero', 0;
EXEC InsertFauna 'Águia-De asa-Redonda', 'Buteo buteo', 'Ave', 0;
EXEC InsertFauna 'Lontra-Europeia', 'Lutra lutra', 'Mamífero', 0;
EXEC InsertFauna 'Poupa', 'Upupa epops', 'Ave', 0;

-- UPDATE FAUNA
EXEC UpdateFauna 1, 'UPDATED', 'UPDATED', 'UPDATE', 1;
EXEC UpdateFauna 2, 'UPDATED', 'UPDATED', 'UPDATE', 1;
EXEC UpdateFauna 3, 'UPDATED', 'UPDATED', 'UPDATE', 1;

-- DELETE FAUNA
EXEC DeleteFauna 1;

-- GETBYID AND GETALL
EXEC GetAllFauna;
EXEC GetFaunaById 1;


SELECT * FROM FAUNA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



-- ZONAFAUNA ----------------------------------------------------------------------------------------
--INSERT ZONAFAUNA
EXEC InsertZonaFauna 2, 18, 'Habitat do Lince-ibérico', 0;
EXEC InsertZonaFauna 3, 19, 'Área do Coelho-europeu', 0;
EXEC InsertZonaFauna 3, 18, 'Local de nidificação do Águia-da asa-redonda', 0;
EXEC InsertZonaFauna 4, 19, 'Habitat da Lontra-europeia', 0;
EXEC InsertZonaFauna 5, 18, 'Área da Poupa-europeia', 0;

-- UPDATE ZONAFAUNA
EXEC UpdateZonaFauna 18, 2, 'updated', 0;
EXEC UpdateZonaFauna 18, 23, 'updated', 0;
EXEC UpdateZonaFauna 18, 4, 'updated', 0;

-- DELETE ZONAFAUNA
EXEC DeleteZonaFauna 2, 18;

-- GETBYID AND GETALL
EXEC GetAllZonaFauna;
EXEC GetZonaFaunaById 1, 1;


SELECT * FROM ZONAFAUNA
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

-- UPDATE FLORA
--INSERT FLORA
EXEC UpdateFlora 1, 'UPDATED', 'UPDATED', 'UPDATED', 1;
EXEC UpdateFlora 2, 'UPDATED', 'UPDATED', 'UPDATED', 1;

-- DELETE FLORA
EXEC DeleteFlora 3;

-- GETBYID AND GETALL
EXEC GetAllFlora
EXEC GetFloraById 1;



SELECT * FROM FLORA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;


-- FLORA --------------------------------------------------------------------------------------------------
--INSERT ZONA FLORA
EXEC InsertZonaFlora 1, 18, 'Jardim das Rosas', 0;
EXEC InsertZonaFlora 2, 19, 'Bosque de Carvalhos', 0;
EXEC InsertZonaFlora 4, 19, 'Área de Bambus', 0;
EXEC InsertZonaFlora 4, 18, 'INSERIDO TESTE', 0;

-- UPDATE ZONAFLORA
EXEC UpdateZonaFlora 18, 4, 'UPDATED', 1;

-- DELETE ZONAFLORA
EXEC DeleteZonaFlora 18, 1;

-- GETBYID AND GETALL
EXEC GetAllZonaFlora;
EXEC GetZonaFloraById 1, 1;


SELECT * FROM ZONAFLORA
SELECT * FROM FLORA
SELECT * FROM ZONAS
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;





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
EXEC InsertCodigoPostal 4900560, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Aveiro', 789, 41.6932, -8.8273, 0;
EXEC InsertCodigoPostal 2560455, 'Torres Vedras', 'Lisboa', 'Avenida Tenente Coronel João Luís de Moura', 1011, 39.0936, -9.2656, 0;
EXEC InsertCodigoPostal 4905456, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Braga', 1213, 41.6961, -8.8336, 0;
EXEC InsertCodigoPostal 4904112, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Coimbra', 789, 41.6902, -8.8304, 0;
EXEC InsertCodigoPostal 4901221, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Lisboa', 101, 41.6961, -8.8311, 0;
EXEC InsertCodigoPostal 4935111, 'Viana do Castelo', 'Viana do Castelo', 'Rua do Porto', 456, 41.7054, -8.8266, 0;
EXEC InsertCodigoPostal 4710100, 'Braga', 'Braga', 'Avenida Central', 789, 41.5503, -8.4216, 0;
EXEC InsertCodigoPostal 2800456, 'Almada', 'Setúbal', 'Avenida Cristo Rei', 1011, 38.6774, -9.1659, 0;
EXEC InsertCodigoPostal 4902332, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Madrid', 1213, 41.6957, -8.8311, 0;
EXEC InsertCodigoPostal 4903433, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Paris', 789, 41.6947, -8.8333, 0;
EXEC InsertCodigoPostal 4906234, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Roma', 101, 41.6983, -8.8344, 0;
EXEC InsertCodigoPostal 4930111, 'Viana do Castelo', 'Viana do Castelo', 'Avenida da Liberdade', 456, 41.6976, -8.8277, 0;
EXEC InsertCodigoPostal 4907021, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Santiago', 789, 41.6993, -8.8342, 0;
EXEC InsertCodigoPostal 4935412, 'Viana do Castelo', 'Viana do Castelo', 'Rua de São Paulo', 1011, 41.7043, -8.8247, 0;
EXEC InsertCodigoPostal 4700568, 'Braga', 'Braga', 'Rua dos Chãos', 1213, 41.5489, -8.4281, 0;
EXEC InsertCodigoPostal 4715789, 'Braga', 'Braga', 'Rua dos Santos', 789, 41.5468, -8.4235, 0;
EXEC InsertCodigoPostal 4711098, 'Braga', 'Braga', 'Rua dos Trilhos', 101, 41.5535, -8.4227, 0;
EXEC InsertCodigoPostal 4716768, 'Braga', 'Braga', 'Rua dos Vermelhos', 456, 41.5437, -8.4298, 0;
EXEC InsertCodigoPostal 4714889, 'Braga', 'Braga', 'Rua dos Vinhedos', 789, 41.5479, -8.4246, 0;
EXEC InsertCodigoPostal 4717765, 'Braga', 'Braga', 'Rua dos Vinhos', 1011, 41.5459
EXEC InsertCodigoPostal 4710544, 'Braga', 'Braga', 'Avenida Central', 789, 41.5503, -8.4216, 0;
EXEC InsertCodigoPostal 2800445, 'Almada', 'Setúbal', 'Avenida Cristo Rei', 1011, 38.6774, -9.1659, 0;
EXEC InsertCodigoPostal 4902444, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Madrid', 1213, 41.6957, -8.8311, 0;
EXEC InsertCodigoPostal 4903223, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Paris', 789, 41.6947, -8.8333, 0;
EXEC InsertCodigoPostal 4906321, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Roma', 101, 41.6983, -8.8344, 0;
EXEC InsertCodigoPostal 4930221, 'Viana do Castelo', 'Viana do Castelo', 'Avenida da Liberdade', 456, 41.6976, -8.8277, 0;
EXEC InsertCodigoPostal 4907111, 'Viana do Castelo', 'Viana do Castelo', 'Rua de Santiago', 789, 41.6993, -8.8342, 0;
EXEC InsertCodigoPostal 4935444, 'Viana do Castelo', 'Viana do Castelo', 'Rua de São Paulo', 1011, 41.7043, -8.8247, 0;
EXEC InsertCodigoPostal 4700567, 'Braga', 'Braga', 'Rua dos Chãos', 1213, 41.5489, -8.4281, 0;
EXEC InsertCodigoPostal 4715890, 'Braga', 'Braga', 'Rua dos Santos', 789, 41.5468, -8.4235, 0;
EXEC InsertCodigoPostal 4711835, 'Braga', 'Braga', 'Rua dos Trilhos', 101, 41.5535, -8.4227, 0;
EXEC InsertCodigoPostal 4716467, 'Braga', 'Braga', 'Rua dos Vermelhos', 456, 41.5437, -8.4298, 0;
EXEC InsertCodigoPostal 4714789, 'Braga', 'Braga', 'Rua dos Vinhedos', 789, 41.5479, -8.4246, 0;
EXEC InsertCodigoPostal 4717467, 'Braga', 'Braga', 'Rua dos Vinhos', 1011, 41.5459, -8.4224, 0;
EXEC InsertCodigoPostal 4713576, 'Braga', 'Braga', 'Rua dos Vinicultores', 1213, 41.5474, -8.4231, 0;
EXEC InsertCodigoPostal 4712322, 'Braga', 'Braga', 'Rua dos Viveiros', 789, 41.5534, -8.4205, 0;
EXEC InsertCodigoPostal 4720678, 'Braga', 'Braga', 'Rua Dr. António Coelho de Carvalho', 101, 41.5552, -8.4213, 0;
EXEC InsertCodigoPostal 4785546, 'Trofa', 'Porto', 'Rua D. Pedro V', 456, 41.3059, -8.5314, 0;
EXEC InsertCodigoPostal 4705234, 'Braga', 'Braga', 'Rua Eng. Duarte Pacheco', 789, 41.5517, -8.4149, 0;
EXEC InsertCodigoPostal 4701456, 'Braga', 'Braga', 'Rua Eng. Ferreira Dias', 1011, 41.5517, -8.4166, 0;
EXEC InsertCodigoPostal 4760879, 'Vila Nova de Famalicão', 'Braga', 'Rua Espírito Santo', 1213, 41.4076, -8.5156, 0;
EXEC InsertCodigoPostal 4780333, 'Santo Tirso', 'Porto', 'Rua Fernando Bragança Gil', 789, 41.3442, -8.4764, 0;
EXEC InsertCodigoPostal 4704234, 'Braga', 'Braga', 'Rua Fernando Magalhães', 1011, 41.5523, -8.4149, 0;
EXEC InsertCodigoPostal 4785223, 'Trofa', 'Porto', 'Rua Gago Coutinho', 456, 41.3037, -8.5375, 0;
EXEC InsertCodigoPostal 4780456, 'Santo Tirso', 'Porto', 'Rua General Humberto Delgado', 789, 41.3444, -8.4806, 0;
EXEC InsertCodigoPostal 4780235, 'Santo Tirso', 'Porto', 'Rua Gonçalves Zarco', 1011, 41.3465, -8.4767, 0;
EXEC InsertCodigoPostal 4785789, 'Trofa', 'Porto', 'Rua Guilherme Ferreira', 1213, 41.3102, -8.5371, 0;
EXEC InsertCodigoPostal 4780122, 'Santo Tirso', 'Porto', 'Rua Hermenegildo Capelo', 789, 41.3449, -8.4798, 0;
EXEC InsertCodigoPostal 4785443, 'Trofa', 'Porto', 'Rua Joaquim Vieira Lopes', 1011, 41.3146, -8.5403, 0;
EXEC InsertCodigoPostal 1200224, 'Lisboa', 'Lisboa', 'Avenida da Liberdade', 789, 38.7172, -9.1439, 0;
EXEC InsertCodigoPostal 1500234, 'Lisboa', 'Lisboa', 'Avenida Dom Vasco da Gama', 1011, 38.7428, -9.1766, 0;
EXEC InsertCodigoPostal 1400678, 'Lisboa', 'Lisboa', 'Avenida Dom João II', 1213, 38.6977, -9.1947, 0;
EXEC InsertCodigoPostal 1600908, 'Lisboa', 'Lisboa', 'Avenida Dom Luís I', 789, 38.7553, -9.1702, 0;
EXEC InsertCodigoPostal 1700777, 'Lisboa', 'Lisboa', 'Avenida Doutor Alfredo Bensaúde', 1011, 38.7519, -9.1529, 0;
EXEC InsertCodigoPostal 1900357, 'Lisboa', 'Lisboa', 'Avenida Doutor Francisco Luís Gomes', 1213, 38.7412, -9.1112, 0;
EXEC InsertCodigoPostal 1750332, 'Lisboa', 'Lisboa', 'Avenida Doutor João Freitas Branco', 789, 38.7535, -9.1496, 0;
EXEC InsertCodigoPostal 1800245, 'Lisboa', 'Lisboa', 'Avenida Doutor José Maria Barbosa de Magalhães', 1011, 38.7708, -9.1213, 0;
EXEC InsertCodigoPostal 1850565, 'Lisboa', 'Lisboa', 'Avenida Doutor Salgado Zenha', 1213, 38.7731, -9.1235, 0;
EXEC InsertCodigoPostal 1950376, 'Lisboa', 'Lisboa', 'Avenida Doutor Augusto de Castro', 789, 38.7448, -9.1101, 0;
EXEC InsertCodigoPostal 1400112, 'Lisboa', 'Lisboa', 'Avenida Marechal Craveiro Lopes', 1011, 38.7034, -9.1798, 0;
EXEC InsertCodigoPostal 1900112, 'Lisboa', 'Lisboa', 'Avenida Marechal Gomes da Costa', 1213, 38.7423, -9.1127, 0;
EXEC InsertCodigoPostal 1700098, 'Lisboa', 'Lisboa', 'Avenida Marechal Humberto Delgado', 789, 38.7485, -9.1549, 0;
EXEC InsertCodigoPostal 1500176, 'Lisboa', 'Lisboa', 'Avenida Marechal José Estevão de Oliveira', 1011, 38.7429, -9.1748, 0;
EXEC InsertCodigoPostal 1800647, 'Lisboa', 'Lisboa', 'Avenida Marechal Norton de Matos', 1213, 38.7732, -9.1198, 0;
EXEC InsertCodigoPostal 1600098, 'Lisboa', 'Lisboa', 'Avenida Marechal António de Spínola', 789, 38.7596, -9.1637, 0;
EXEC InsertCodigoPostal 1950567, 'Lisboa', 'Lisboa', 'Avenida Marechal Francisco da Costa Gomes', 1011, 38.7407, -9.1164, 0;
EXEC InsertCodigoPostal 1900246, 'Lisboa', 'Lisboa', 'Avenida Marechal Francisco da Costa Gomes', 1213, 38.7441, -9.1121, 0;
EXEC InsertCodigoPostal 1700468, 'Lisboa', 'Lisboa', 'Avenida Marechal José Gomes da Costa', 789, 38.7513, -9.1546, 0;
EXEC InsertCodigoPostal 1800378, 'Lisboa', 'Lisboa', 'Avenida Marechal Tomás de Morais', 1011, 38.7758, -9.1197, 0;

-- UPDATE CODIGOPOSTAL
EXEC UpdateCodigoPostal 1, 1234567, 'Lisboa', 'Areeiro', 'Rua A', 10, 0;
EXEC UpdateCodigoPostal 2, 5439921, 'Porto', 'Boavista', 'Rua B', 20, 0;
EXEC UpdateCodigoPostal 999, 98795, 'Fictícia', 'Inexistente', 'Rua Inexistente', 0, 0;

-- DELETE CODIGOPOSTAL
EXEC DeleteCodigoPostal 1;
EXEC DeleteCodigoPostal 2;
EXEC DeleteCodigoPostal 999;


-- GETBYID AND GETALL
EXEC GetAllCodigoPostal;
EXEC GetCodigoPostalById 1;


-- PARQUES-------------------------------------------------------------------------------------------

-- INSERT PARQUES
EXEC InsertParques 28, 'Parque Eduardo VII', 12.5, 0;
EXEC InsertParques 6, 'Jardim da Estrela', 8.2, 0;
EXEC InsertParques 52, 'Parque Florestal de Monsanto', 120.0, 0;
EXEC InsertParques 58, 'Jardim Botânico de Lisboa', 6.8, 0;
EXEC InsertParques 17, 'Parque das Nações', 35.6, 0;
EXEC InsertParques 38, 'Parque Bela Vista', 18.9, 0;
EXEC InsertParques 55, 'Parque Recreativo do Alto da Serafina', 10.2, 0;
EXEC InsertParques 10, 'Parque José Gomes Ferreira', 7.5, 0;
EXEC InsertParques 44, 'Parque do Vale Fundão', 15.3, 0;
EXEC InsertParques 2, 'Parque Quinta das Conchas e Lilases', 25.7, 0;
EXEC InsertParques 39, 'Jardim Botânico Tropical', 5.4, 0;
EXEC InsertParques 57, 'Parque Eduardo Setúbal', 8.9, 0;
EXEC InsertParques 32, 'Jardim da Praça do Império', 3.2, 0;
EXEC InsertParques 24, 'Parque José Gomes Ferreira', 6.7, 0;
EXEC InsertParques 31, 'Jardim do Palácio da Ajuda', 4.5, 0;
EXEC InsertParques 11, 'Parque do Castelo de São Jorge', 2.8, 0;
EXEC InsertParques 16, 'Jardim da Estrela', 7.3, 0;
EXEC InsertParques 3, 'Parque Recreativo da Várzea', 9.1, 0;
EXEC InsertParques 51, 'Jardim do Príncipe Real', 6.0, 0;
EXEC InsertParques 59, 'Parque Urbano de Miraflores', 11.2, 0;
EXEC InsertParques 27, 'Jardim do Campo Grande', 8.6, 0;
EXEC InsertParques 33, 'Parque Municipal de Monsanto', 14.3, 0;
EXEC InsertParques 22, 'Jardim Botânico da Universidade de Lisboa', 7.8, 0;
EXEC InsertParques 14, 'Parque dos Poetas', 10.9, 0;
EXEC InsertParques 7, 'Jardim da Cerca da Graça', 5.6, 0;
EXEC InsertParques 18, 'Parque do Alvito', 6.4, 0;
EXEC InsertParques 41, 'Jardim Amália Rodrigues', 4.7, 0;
EXEC InsertParques 45, 'Parque da Quinta do Covelo', 9.8, 0;
EXEC InsertParques 26, 'Jardim do Palácio de Santos', 3.9, 0;
EXEC InsertParques 54, 'Parque Tejo', 12.0, 0;
EXEC InsertParques 23, 'Jardim Bordalo Pinheiro', 5.1, 0;
EXEC InsertParques 13, 'Parque Marechal Carmona', 8.4, 0;
EXEC InsertParques 60, 'Jardim do Parque das Conchas', 6.5, 0;
EXEC InsertParques 5, 'Parque da Cidade de Aveiro', 14.7, 0;
EXEC InsertParques 36, 'Jardim do Campo Pequeno', 7.2, 0;
EXEC InsertParques 47, 'Parque do Bonito', 9.3, 0;
EXEC InsertParques 48, 'Jardim do Arco do Cego', 4.2, 0;
EXEC InsertParques 56, 'Parque das Gerações', 11.5, 0;
EXEC InsertParques 29, 'Jardim do Campo da Bola', 6.6, 0;
EXEC InsertParques 40, 'Parque da Paz', 8.1, 0;
EXEC InsertParques 42, 'Jardim Botânico da Ajuda', 5.8, 0;
EXEC InsertParques 25, 'Jardim do Passeio Alegre', 7.9, 0;
EXEC InsertParques 9, 'Parque da Cidade do Porto', 13.2, 0;
EXEC InsertParques 19, 'Jardim Botânico do Porto', 6.3, 0;
EXEC InsertParques 8, 'Parque da Devesa', 8.7, 0;
EXEC InsertParques 15, 'Jardim de São Lázaro', 4.6, 0;
EXEC InsertParques 35, 'Parque do Covelo', 9.5, 0;
EXEC InsertParques 37, 'Jardim da Cordoaria', 5.7, 0;
EXEC InsertParques 53, 'Parque da Lavandeira', 10.6, 0;
EXEC InsertParques 43, 'Jardim do Palácio de Cristal', 8.2, 0;
EXEC InsertParques 1, 'Parque de São Roque', 6.1, 0;
EXEC InsertParques 46, 'Jardim Botânico de Coimbra', 11.1, 0;
EXEC InsertParques 30, 'Parque Verde do Mondego', 14.5, 0;
EXEC InsertParques 49, 'Jardim da Sereia', 6.8, 0;
EXEC InsertParques 20, 'Parque do Bonfim', 9.7, 0;
EXEC InsertParques 34, 'Jardim do Morro', 8.3, 0;
EXEC InsertParques 4, 'Parque da Ponte de Lima', 12.3, 0;
EXEC InsertParques 50, 'Jardim da Arca D''Água', 5.2, 0;
EXEC InsertParques 21, 'Parque de Santo António da Caparica', 9.0, 0;
EXEC InsertParques 12, 'Jardim de Santa Catarina', 7.1, 0;
EXEC InsertParques 7, 'Parque do Matosinhos', 10.4, 0;

-- UPDATE PARQUES
EXEC UpdateParques 1, 'Parque A', 1000.5, 0;
EXEC UpdateParques 2, 'Parque B', 750.2, 1;
EXEC UpdateParques 999, 'Parque Inexistente', 500.0, 0;

-- DELETE PARQUES
EXEC DeleteParques 1;
EXEC DeleteParques 2;
EXEC DeleteParques 999;

-- GETBYID AND GETALL
EXEC GetAllParques;
EXEC GetParqueById 1;


SELECT * FROM PARQUES


-- QRCODE -----------------------------------------------------------------------------
--INSERT QR CODE
EXEC InsertQrCode '2024-01-26', 'https://example.com/qr1', 0;
EXEC InsertQrCode '2024-01-27', 'https://example.com/qr2', 0;
EXEC InsertQrCode '2024-01-28', 'https://example.com/qr3', 0;
EXEC InsertQrCode '2024-01-29', 'https://example.com/qr4', 0;
EXEC InsertQrCode '2024-01-30', 'https://example.com/qr5', 0;
EXEC InsertQrCode '2024-01-31', 'https://example.com/qr6', 0;
EXEC InsertQrCode '2024-02-01', 'https://example.com/qr7', 0;
EXEC InsertQrCode '2024-02-02', 'https://example.com/qr8', 0;
EXEC InsertQrCode '2024-02-03', 'https://example.com/qr9', 0;
EXEC InsertQrCode '2024-02-04', 'https://example.com/qr10', 0;
EXEC InsertQrCode '2024-02-05', 'https://example.com/qr11', 0;
EXEC InsertQrCode '2024-02-06', 'https://example.com/qr12', 0;
EXEC InsertQrCode '2024-02-07', 'https://example.com/qr13', 0;
EXEC InsertQrCode '2024-02-08', 'https://example.com/qr14', 0;
EXEC InsertQrCode '2024-02-09', 'https://example.com/qr15', 0;
EXEC InsertQrCode '2024-02-10', 'https://example.com/qr16', 0;
EXEC InsertQrCode '2024-02-11', 'https://example.com/qr17', 0;
EXEC InsertQrCode '2024-02-12', 'https://example.com/qr18', 0;
EXEC InsertQrCode '2024-02-13', 'https://example.com/qr19', 0;
EXEC InsertQrCode '2024-02-14', 'https://example.com/qr20', 0;
EXEC InsertQrCode '2024-02-15', 'https://example.com/qr21', 0;
EXEC InsertQrCode '2024-02-16', 'https://example.com/qr22', 0;
EXEC InsertQrCode '2024-02-17', 'https://example.com/qr23', 0;
EXEC InsertQrCode '2024-02-18', 'https://example.com/qr24', 0;
EXEC InsertQrCode '2024-02-19', 'https://example.com/qr25', 0;
EXEC InsertQrCode '2024-02-20', 'https://example.com/qr26', 0;
EXEC InsertQrCode '2024-02-21', 'https://example.com/qr27', 0;
EXEC InsertQrCode '2024-02-22', 'https://example.com/qr28', 0;
EXEC InsertQrCode '2024-02-23', 'https://example.com/qr29', 0;
EXEC InsertQrCode '2024-02-24', 'https://example.com/qr30', 0;
EXEC InsertQrCode '2024-02-25', 'https://example.com/qr31', 0;
EXEC InsertQrCode '2024-02-26', 'https://example.com/qr32', 0;
EXEC InsertQrCode '2024-02-27', 'https://example.com/qr33', 0;
EXEC InsertQrCode '2024-02-28', 'https://example.com/qr34', 0;
EXEC InsertQrCode '2024-02-29', 'https://example.com/qr35', 0;
EXEC InsertQrCode '2024-03-01', 'https://example.com/qr36', 0;
EXEC InsertQrCode '2024-03-02', 'https://example.com/qr37', 0;
EXEC InsertQrCode '2024-03-03', 'https://example.com/qr38', 0;
EXEC InsertQrCode '2024-03-04', 'https://example.com/qr39', 0;
EXEC InsertQrCode '2024-03-05', 'https://example.com/qr40', 0;


-- UPDATE QRCODE
EXEC UpdateQrCode 1, '2024-02-10', 'https://example.com/updated-qr1', 1;
EXEC UpdateQrCode 3, '2024-03-15', 'https://example.com/updated-qr3', 0;
EXEC UpdateQrCode 999, '2024-04-01', 'https://example.com/updated-invalid-qr', 1;

-- DELETE QRCODE
EXEC DeleteQrCode 92;
EXEC DeleteQrCode 3;
EXEC DeleteQrCode 999;

-- GETBYID AND GETALL
EXEC GetAllQrCode;
EXEC GetQrCodeById 1;


SELECT * FROM QRCODE


-- ZONAS ------------------------------------------------------------------------------------------------
--INSERT ZONAS

EXEC InsertZonas 1, 5, 'Zona A', 1, 'Azul', 0;
EXEC InsertZonas 2, 6, 'Zona B', 2, 'Vermelho', 1;
EXEC InsertZonas 3, 7, 'Zona C', 3, 'Verde', 0;
EXEC InsertZonas 4, 8, 'Zona D', 4, 'Amarelo', 1;
EXEC InsertZonas 5, 9, 'Zona E', 5, 'Laranja', 0;

-- UPDATE ZONAS 

EXEC UpdateZonas 9, 1, 101, 'Zona Atualizada A', 10, 'Roxo', 0;
EXEC UpdateZonas 17, 2, 102, 'Zona Atualizada B', 20, 'Amarelo', 1;
EXEC UpdateZonas 19, 3, 103, 'Zona Atualizada C', 30, 'Laranja', 0;

-- DELETE ZONAS

EXEC DeleteZonas 9;
EXEC DeleteZonas 17;
EXEC DeleteZonas 3;

-- GETBYID AND GETALL
EXEC GetAllZonas;
EXEC GetZonaById 1;

SELECT * FROM ZONAS


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
EXEC InsertFuncao 'Biólogo Ambiental', 0;
EXEC InsertFuncao 'Engenheiro Agrônomo', 0;
EXEC InsertFuncao 'Especialista em Gestão de Fauna', 0;
EXEC InsertFuncao 'Especialista em Gestão de Flora', 0;
EXEC InsertFuncao 'Coordenador de Projetos Ambientais', 0;
EXEC InsertFuncao 'Técnico em Educação Ambiental', 0;
EXEC InsertFuncao 'Coordenador de Conservação de Habitats', 0;
EXEC InsertFuncao 'Pesquisador em Ecologia', 0;
EXEC InsertFuncao 'Analista de Impacto Ambiental', 0;
EXEC InsertFuncao 'Coordenador de Trilhas', 0;
EXEC InsertFuncao 'Guarda-Parque', 0;
EXEC InsertFuncao 'Especialista em Recuperação de Ecossistemas', 0;
EXEC InsertFuncao 'Fiscal Ambiental', 0;
EXEC InsertFuncao 'Técnico em Gestão de Recursos Naturais', 0;
EXEC InsertFuncao 'Engenheiro Ambiental', 0;
EXEC InsertFuncao 'Diretor de Parque', 0;
EXEC InsertFuncao 'Gerente de Operações', 0;
EXEC InsertFuncao 'Coordenador de Manutenção', 0;
EXEC InsertFuncao 'Supervisor de Atendimento ao Público', 0;
EXEC InsertFuncao 'Analista Financeiro', 0;

-- UPDATE FUNÇÃO
EXEC UpdateFuncao 1, 'Nova Funcao 1', 0;
EXEC UpdateFuncao 3, 'Nova Funcao 3', 1;
EXEC UpdateFuncao 999, 'Invalid Funcao', 0;

-- DELETE FUNÇÃO
EXEC DeleteFuncao 1;
EXEC DeleteFuncao 3;
EXEC DeleteFuncao 999;

-- GETBYID AND GETALL
EXEC GetAllFuncao


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
EXEC InsertUser 11, 'daniel_miller', 'qwerty123%', 0;
EXEC InsertUser 12, 'ava_jackson', 'admin123%', 0;
EXEC InsertUser 13, 'james_martinez', '123456789%', 0;
EXEC InsertUser 14, 'isabella_anderson', 'letmein%', 0;
EXEC InsertUser 15, 'benjamin_taylor', 'password%', 0;
EXEC InsertUser 16, 'mia_thompson', 'welcome%', 0;
EXEC InsertUser 17, 'ethan_rodriguez', '123abc456%', 0;
EXEC InsertUser 18, 'charlotte_garcia', 'pass1234%', 0;
EXEC InsertUser 19, 'alexander_martinez', 'abcdef123%', 0;
EXEC InsertUser 20, 'amelia_hernandez', 'welcome1234%', 0;
EXEC InsertUser 21, 'mia_jones', 'password12%', 0;
EXEC InsertUser 22, 'william_smith', 'letmein1234%', 0;
EXEC InsertUser 23, 'sophia_davis', 'test1234%', 0;
EXEC InsertUser 24, 'michael_brown', '12345678%', 0;
EXEC InsertUser 25, 'olivia_taylor', 'passpass%', 0;
EXEC InsertUser 26, 'jacob_martin', 'password1234%', 0;
EXEC InsertUser 27, 'emily_miller', 'adminadmin%', 0;
EXEC InsertUser 28, 'daniel_wilson', '123qwe%', 0;
EXEC InsertUser 29, 'ava_anderson', 'qazwsx123%', 0;
EXEC InsertUser 30, 'benjamin_martinez', 'password%', 0;
EXEC InsertUser 31, 'charlotte_thompson', 'welcome%', 0;
EXEC InsertUser 32, 'mason_garcia', 'password1%', 0;
EXEC InsertUser 33, 'amelia_brown', '123456%', 0;
EXEC InsertUser 34, 'william_johnson', 'letmein%', 0;
EXEC InsertUser 35, 'sophia_martinez', 'password123%', 0;
EXEC InsertUser 36, 'james_miller', 'admin%', 0;

-- UPDATE USER
EXEC UpdateUser 1, 1, 'john_doe_updated', 'newpassword123%', 0;
EXEC UpdateUser 2, 2, 'alice_smith_updated', 'newpassword456%', 1;
EXEC UpdateUser 3, 3, 'bob_jones_updated', NULL, 0;

-- DELETE USER
EXEC DeleteUser 1;
EXEC DeleteUser 2;
EXEC DeleteUser 999;

-- GETBYID AND GETALL
EXEC GetAllUser

select * from [User]

-- FUNCIONARIO --------------------------------------------------------------------------------
--INSERT FUNCIONARIO
EXEC InsertFuncionario 12, 25, 'Ricardo Ferreira', '1983-07-05', '2022-10-15', 0;
EXEC InsertFuncionario 6, 14, 'Catarina Carvalho', '1989-11-18', '2021-08-27', 0;
EXEC InsertFuncionario 33, 30, 'Paulo Santos', '1976-04-12', '2023-05-19', 0;
EXEC InsertFuncionario 41, 19, 'Sara Silva', '1993-09-30', '2020-12-08', 0;
EXEC InsertFuncionario 52, 27, 'Tiago Rodrigues', '1981-03-24', '2024-01-10', 0;
EXEC InsertFuncionario 17, 32, 'Filipa Sousa', '1986-01-14', '2022-07-03', 0;
EXEC InsertFuncionario 9, 7, 'Joana Costa', '1984-06-08', '2021-04-22', 0;
EXEC InsertFuncionario 47, 18, 'Miguel Oliveira', '1978-08-29', '2023-11-30', 0;
EXEC InsertFuncionario 29, 29, 'Rita Fernandes', '1990-02-17', '2020-09-15', 0;
EXEC InsertFuncionario 56, 21, 'Alexandre Martins', '1974-05-22', '2022-12-05', 0;
EXEC InsertFuncionario 40, 34, 'Inês Pereira', '1987-10-02', '2024-03-18', 0;
EXEC InsertFuncionario 8, 28, 'André Almeida', '1980-12-11', '2022-01-28', 0;
EXEC InsertFuncionario 14, 12, 'Carolina Santos', '1995-08-08', '2021-06-14', 0;
EXEC InsertFuncionario 26, 23, 'Hugo Ribeiro', '1977-11-20', '2023-02-22', 0;
EXEC InsertFuncionario 39, 31, 'Diana Costa', '1983-03-19', '2020-10-01', 0;
EXEC InsertFuncionario 54, 24, 'Nuno Martins', '1988-04-03', '2022-07-12', 0;
EXEC InsertFuncionario 13, 15, 'Vanessa Sousa', '1982-09-16', '2021-08-03', 0;
EXEC InsertFuncionario 21, 11, 'Ana Isabel Silva', '1979-12-25', '2023-05-09', 0;
EXEC InsertFuncionario 37, 33, 'Fernando Pereira', '1985-06-30', '2020-12-20', 0;
EXEC InsertFuncionario 50, 26, 'Patrícia Santos', '1991-02-28', '2024-02-05', 0;
EXEC InsertFuncionario 20, 22, 'Jorge Oliveira', '1973-10-10', '2022-09-29', 0;
EXEC InsertFuncionario 44, 16, 'Mónica Rodrigues', '1980-11-15', '2021-07-24', 0;
EXEC InsertFuncionario 11, 20, 'Nelson Pereira', '1976-05-14', '2023-03-17', 0;
EXEC InsertFuncionario 48, 35, 'Susana Almeida', '1989-08-04', '2020-11-28', 0;
EXEC InsertFuncionario 28, 8, 'Vânia Costa', '1977-04-27', '2022-04-10', 0;
EXEC InsertFuncionario 42, 13, 'Daniel Fernandes', '1984-09-08', '2021-07-02', 0;
EXEC InsertFuncionario 16, 17, 'Cristina Carvalho', '1981-03-10', '2023-01-12', 0;
EXEC InsertFuncionario 30, 10, 'Rui Pereira', '1994-06-18', '2021-10-29', 0;
EXEC InsertFuncionario 53, 36, 'Mariana Santos', '1975-08-22', '2024-03-06', 0;

-- UPDATE FUNCIONARIO
EXEC UpdateFuncionario 1, 'João Silva',0;

-- DELETE FUNCIONARIO
EXEC DeleteFuncionario 1;

-- GETBYID AND GETALL
EXEC GetAllFuncionario



SELECT * FROM [USER]
SELECT * FROM FUNCIONARIO
SELECT * FROM PARQUES



-- OCORRENCIA -------------------------------------------------------------------------------------
-- INSERT OCORRENCIA
EXEC InsertOcorrencia 4, 19, NULL, 'ciclano@example.com', 0;
EXEC InsertOcorrencia 3, 18, NULL, 'beltrano@example.com', 0;

-- UPDATE OCORRENCIA

EXEC UpdateOcorrencia 6, 0;
EXEC UpdateOcorrencia 8, 1;
EXEC UpdateOcorrencia 5, 0;

-- DELETE OCORRENCIA
EXEC DeletEOcorrencia 6;

-- GETBYID AND GETALL
EXEC GetAllOcorrencia



SELECT * FROM ZONAS
SELECT * FROM PARQUES
SELECT * FROM TIPOOCORRENCIA
SELECT * FROM OCORRENCIA
SELECT * FROM TABLELOG

EXEC InsertOcorrencia 8, 19, NULL, 'TRIGGER@TRIGGER.COM', 0;


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
EXEC InsertTipoOcorrencia 'Problema de Segurança', 0;
EXEC InsertTipoOcorrencia 'Incumprimento de Regulamentos', 0;
EXEC InsertTipoOcorrencia 'Invasão de Propriedade', 0;
EXEC InsertTipoOcorrencia 'Dano à Vegetação', 0;
EXEC InsertTipoOcorrencia 'Atividade de Caça Ilegal', 0;
EXEC InsertTipoOcorrencia 'Queimada Não Autorizada', 0;
EXEC InsertTipoOcorrencia 'Desordem Pública', 0;
EXEC InsertTipoOcorrencia 'Assédio', 0;
EXEC InsertTipoOcorrencia 'Intoxicação Alimentar', 0;
EXEC InsertTipoOcorrencia 'Agressão Física', 0;
EXEC InsertTipoOcorrencia 'Desorientação', 0;
EXEC InsertTipoOcorrencia 'Problema Ambiental', 0;
EXEC InsertTipoOcorrencia 'Perda de Objeto Pessoal', 0;

-- UPDATE TIPOOCORRENCIA
EXEC UpdateTipOcorrencia 1, 'Tipo A', 0;
EXEC UpdateTipOcorrencia 2, 'Tipo B', 1;
EXEC UpdateTipOcorrencia 999, 'Tipo Inexistente', 0;

-- DELETE TIPOOCORRENCIA
EXEC DeleteTipoOcorrencia 1;
EXEC DeleteTipoOcorrencia 2;
EXEC DeleteTipoOcorrencia 999;

-- GETBYID AND GETALL
EXEC GetAllTipoOcorrencia



SELECT * FROM TIPOOCORRENCIA


-- STATUSOCORRENCIA -------------------------------------------------------------------------------
--INSERT STATUS OCORRENCIA

EXEC InsertStatusOcorrencia 'Pendente', 0;
EXEC InsertStatusOcorrencia 'Em andamento', 0;
EXEC InsertStatusOcorrencia 'Concluído', 0;
EXEC InsertStatusOcorrencia 'Cancelado', 0;

-- UPDATE STATUSOCORRENCIA
EXEC UpdateStatusOcorrencia 3, 'Em Processamento', 0;
EXEC UpdateStatusOcorrencia 4, 'Concluído', 0;
EXEC UpdateStatusOcorrencia 5, 'Cancelado', 0;

-- DELETE STATUSOCORRENCIA
EXEC DeleteStatusOcorrencia 1;

-- GETBYID AND GETALL
EXEC GetAllStatusOcorrencia

SELECT * FROM STATUSOCORRENCIA


-- HISTORICO OCORRENCIA ---------------------------------------------------------------------------
-- INSERT HISTORICO OCORRENCIA
EXEC InsertHistoricoOcorrencia 2, 1, 8, 'Ocorrência pendente.', 0;
EXEC InsertHistoricoOcorrencia 4, 129, 10, 'Inserção 2', 0;

-- UPDATE HISTORICO OCORRENCIA
EXEC UpdateHistoricoOcorrencia 4, 129, 10, 'UPDATED', 1;

-- DELETE HISTORICO OCORRENCIA
EXEC DeleteHistoricoOcorrencia 4, 129, 10;

-- GETBYID AND GETALL
EXEC GetAllHistoricoOcorrencia



SELECT * FROM STATUSOCORRENCIA
SELECT * FROM FUNCIONARIO
SELECT * FROM OCORRENCIA
SELECT * FROM HISTORICOOCORRENCIA
SELECT * FROM TABLELOG
ORDER BY LOGID DESC;



EXEC InsertHistoricoOcorrencia 3, 1, 10, 'TESTE TRIGGER', 0;


