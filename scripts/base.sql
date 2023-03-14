CREATE DATABASE seguradora;
USE seguradora;

CREATE TABLE Cliente (
    CodCliente INT PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF VARCHAR(45) UNIQUE NOT NULL,
    Sexo VARCHAR(20),
    Estado VARCHAR(45),
    Cidade VARCHAR(45) DEFAULT 'Itapira',
    Bairro VARCHAR(45),
    Numero VARCHAR(45),
    Rua VARCHAR(45),
    TelefoneFixo VARCHAR(45),
    TelefoneCelular VARCHAR(45) UNIQUE NOT NULL
);

CREATE TABLE Apolice (
    CodApolice INT PRIMARY KEY,
    ValorCobertura DECIMAL NOT NULL,
    ValorFranquia DECIMAL NOT NULL,
    DataInicioVigencia DATE NOT NULL,
    DataFimVigencia DATE NOT NULL,
    Cliente_CodCliente INT NOT NULL,
    Carro_CodCarro INT NOT NULL,
    CONSTRAINT chk_dataInicioVigencia CHECK (DataInicioVigencia >= GETDATE()),
    FOREIGN KEY (Cliente_CodCliente) REFERENCES Cliente(CodCliente),
    FOREIGN KEY (Carro_CodCarro) REFERENCES Carro(CodCarro)
);

CREATE TABLE Carro (
    CodCarro INT PRIMARY KEY,
    Placa VARCHAR(45),
    Marca VARCHAR(45),
    Modelo VARCHAR(45),
    Ano VARCHAR(45),
    Chassi VARCHAR(45),
    Cor VARCHAR(45)
);

CREATE TABLE Sinistro (
    CodSinistro INT,
    HoraSinistro INT,
    DataSinistro DATE,
    LocalSinistro VARCHAR(45),
    Condutor VARCHAR(45),
    Carro_CodCarro INT,
    CONSTRAINT pk_sinistro PRIMARY KEY (CodSinistro, Carro_CodCarro),
    FOREIGN KEY (Carro_CodCarro) REFERENCES Carro(CodCarro)
);
