CREATE TABLE clientes(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cpf CHAR(11) NOT NULL,
  idade INT NOT NULL,
  sexo CHAR(1),
  telefone VARCHAR(14) NOT NULL,
  dt_nasc DATE,
  email VARCHAR(50),
  endereco VARCHAR(50),
  PRIMARY KEY(id)
)ENGINE = InnoDB;

CREATE TABLE dependentes(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cpf CHAR(11) NOT NULL,
  idade INT NOT NULL,
  PRIMARY KEY(id)
)ENGINE = InnoDB;

CREATE TABLE funcionarios(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  cpf CHAR(11) NOT NULL,
  idade INT NOT NULL,
  sexo CHAR(1),
  telefone VARCHAR(14) NOT NULL,
  dt_nasc DATE,
  email VARCHAR(50),
  endereco VARCHAR(50),
  dependente INT NOT NULL,
  funcao VARCHAR(50),
  PRIMARY KEY(id),
  CONSTRAINT FK_Funcionario_Dependente FOREIGN KEY(dependente) REFERENCES dependentes(id)
)ENGINE = InnoDB;

CREATE TABLE categoria(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  status BOOLEAN NOT NULL,  
  PRIMARY KEY(id)
)ENGINE = InnoDB;

CREATE TABLE periodo(
  id INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(50) NOT NULL,
  periodo INT NOT NULL,
  multa_atraso DECIMAL(10,2),
  PRIMARY KEY(id)
)ENGINE = InnoDB;

CREATE TABLE filmes(
  id INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(50) NOT NULL,
  ano DATE NOT NULL,
  duracao TIME,
  elenco VARCHAR(50),
  produtora VARCHAR(50) NOT NULL,
  categoria_id INT NOT NULL,
  descricao VARCHAR(50),
  quantidade INT NOT NULL,
  preco DECIMAL(10,2),
  periodo_id INT NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT FK_filme_categoria FOREIGN KEY(categoria_id) REFERENCES categoria (id),
  CONSTRAINT FK_filme_periodo FOREIGN KEY(periodo_id) REFERENCES periodo (id)  
)ENGINE = InnoDB;

CREATE TABLE locacao(
  id INT NOT NULL AUTO_INCREMENT,
  funcionario_id INT NOT NULL, 
  cliente_id INT NOT NULL, 
  filme_id INT NOT NULL, 
  periodo_id INT NOT NULL,
  preco DECIMAL(10,2),
  quantidade INT NOT NULL,
  dt_locacao DATE,
  dt_entrega DATE,
  PRIMARY KEY(id),
  CONSTRAINT FK_locacao_funcionario FOREIGN KEY(funcionario_id) REFERENCES funcionario(id),
  CONSTRAINT FK_locacao_cliente FOREIGN KEY(cliente_id) REFERENCES cliente(id),
  CONSTRAINT FK_locacao_filme FOREIGN KEY(filme_id) REFERENCES filme(id),
  CONSTRAINT FK_locacao_periodo FOREIGN KEY(periodo_id) REFERENCES periodo(id)
)ENGINE = InnoDB; 

