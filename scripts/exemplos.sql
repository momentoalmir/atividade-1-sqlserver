-- Inserir cliente
INSERT INTO Cliente (CodCliente, Nome, CPF, Sexo, Estado, Cidade, Bairro, Numero, Rua, TelefoneFixo, TelefoneCelular)
VALUES (1, 'Maria Silva', '111.111.111-11', 'Feminino', 'São Paulo', 'Itapira', 'Centro', '100', 'Rua A', '1111-1111', '99999-9999');

-- Inserir carro
INSERT INTO Carro (CodCarro, Placa, Marca, Modelo, Ano, Chassi, Cor)
VALUES (1, 'ABC-1234', 'Ford', 'Fiesta', '2018', 'ABC1234DEF5678', 'Prata');

-- Inserir apólice
INSERT INTO Apolice (CodApolice, ValorCobertura, ValorFranquia, DataInicioVigencia, DataFimVigencia, Cliente_CodCliente, Carro_CodCarro)
VALUES (1, 50000.00, 1000.00, '2022-01-01', '2023-01-01', 1, 1);

-- Inserir sinistro
INSERT INTO Sinistro (CodSinistro, HoraSinistro, DataSinistro, LocalSinistro, Condutor, Carro_CodCarro)
VALUES (1, 1430, '2022-06-01', 'Rua B', 'João', 1);

-- Selecionar todos os clientes e suas apólices
SELECT *
FROM Cliente
LEFT JOIN Apolice ON Cliente.CodCliente = Apolice.Cliente_CodCliente;

-- Selecionar todos os carros e seus sinistros
SELECT *
FROM Carro
LEFT JOIN Sinistro ON Carro.CodCarro = Sinistro.Carro_CodCarro;
