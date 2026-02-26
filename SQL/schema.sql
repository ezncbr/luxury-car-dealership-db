CREATE TABLE Marca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL UNIQUE
);

CREATE TABLE Modelo (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    ano INT NOT NULL,
    marca_id INT NOT NULL,
    FOREIGN KEY (marca_id) 
        REFERENCES marca_id
);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    cpf CHAR (11) NOT NULL UNIQUE,
    telefone VARCHAR (20),
    email VARCHAR (150),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Funcionario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (100),
    cargo VARCHAR (100),
    salario NUMERIC (10,2) NOT NULL,
    data_adimissao DATE NOT NULL
);

CREATE TABLE Veiculo (
    id SERIAL PRIMARY KEY 
    chassi VARCHAR (50) NOT NULL UNIQUE,
    cor VARCHAR (50) NOT NULL,
    valor NUMERIC (12,2) NOT NULL,
    status VARCHAR (20) NOT NULL CHECK (status IN ('disponivel', 'vendido')).
    modelo_id INT NOT NULL
    FOREIGN KEY (modelo_id) 
        REFERENCES modelo(id)
);

CREATE TABLE venda (
    id SERIAL PRIMARY KEY 
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total NUMERIC (12,2) NOT NULL,
    cliente_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    veiculo_id INT NO NULL UNIQUE,
    FOREIGN KEY (cliente_id)
        REFERENCES cliente(id),
    FOREIGN KEY (funcionario_id)
        REFERENCES funcionario(id),
    FOREIGN KEY (veiculo_id)
        REFERENCES veiculo(id)
);

CREATE TABLE pagamento (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR (50) NOT NULL,
    parcelas INT,
    vendas_id INT NOT NULL
    FOREIGN KEY (vendas_id)
        REFERENCES vendas(id)
);