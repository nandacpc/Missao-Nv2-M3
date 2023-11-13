CREATE TABLE Movimento (
  idMovimento INTEGER  NOT NULL   IDENTITY ,
  Usuario_idUsuario INTEGER  NOT NULL  ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  Produtos_idProduto INTEGER  NOT NULL  ,
  quantidade INTEGER    ,
  tipo CHAR(1)  NOT NULL  ,
  valorUnitario NUMERIC      ,
PRIMARY KEY(idMovimento));
GO



CREATE TABLE Pessoa (
  idPessoa INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR(255)    ,
  logradouro VARCHAR(255)    ,
  cidade VARCHAR(255)    ,
  estado CHAR(2)    ,
  telefone VARCHAR(11)    ,
  email VARCHAR(255)      ,
PRIMARY KEY(idPessoa));
GO



CREATE TABLE PessoaFisica (
  idPessoaFisica INTEGER  NOT NULL   IDENTITY ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  Movimento_idMovimento INTEGER  NOT NULL  ,
  CPF INTEGER      ,
PRIMARY KEY(idPessoaFisica, Pessoa_idPessoa, Movimento_idMovimento));
GO



CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER  NOT NULL   IDENTITY ,
  Pessoa_idPessoa INTEGER  NOT NULL  ,
  Movimento_idMovimento INTEGER  NOT NULL  ,
  CNPJ INTEGER      ,
PRIMARY KEY(idPessoaJuridica, Pessoa_idPessoa, Movimento_idMovimento));
GO



CREATE TABLE Produtos (
  idProduto INTEGER  NOT NULL   IDENTITY ,
  nome VARCHAR(255)    ,
  quantidade INTEGER    ,
  precoVenda NUMERIC      ,
PRIMARY KEY(idProduto));
GO



CREATE TABLE Usuario (
  idUsuario INTEGER  NOT NULL   IDENTITY ,
  nomeUsuario VARCHAR(255)    ,
  senhaUsuario VARCHAR(20)      ,
PRIMARY KEY(idUsuario));
GO




