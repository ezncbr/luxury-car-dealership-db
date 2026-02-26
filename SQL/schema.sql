CREATE TABLE Marca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Modelo (
    id SERIAL PRIMARY KEY
    nome VARCHAR (100) NOT NULL,
    ano INT NOT NULL
    marca_id INT NOT NULL 
    FOREIGN KEY (marca_id) 
        REFERENCES marca_id
);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY
    nome VARCHAR(100)
)
