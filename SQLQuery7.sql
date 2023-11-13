DECLARE @ProximoValor INT;
SET @ProximoValor = NEXT VALUE FOR Seq_Pessoa;

INSERT INTO Pessoa (idPessoa, nome, logradouro, cidade, estado, telefone, email)
VALUES (@ProximoValor, 'Joao', 'Rua 12, casa 3, Quitanda', 'Riacho do Sul', 'PA', '1111-1111', 'joao@riacho.com');

--DECLARE @PessoaId INT;
--SET @PessoaId = (SELECT idPessoa FROM Pessoa WHERE nome = 'Joao');

--INSERT INTO PessoaFisica (Pessoa_idPessoa, CPF)
--VALUES (@PessoaId, '11111111111');


--INSERT INTO PessoaJuridica (Pessoa_idPessoa, CNPJ)
--VALUES (@NextPersonId, '22222222222');
