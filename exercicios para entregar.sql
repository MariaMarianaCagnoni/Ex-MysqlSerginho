######################################################################################################################################3
# EXERCICIO 1 --#########################################################################################################
#######################################################################################################################################




#### A)
CREATE DATABASE Segur;
SHOW DATABASES;
USE Segur;

CREATE TABLE Seguranca(
	Matricula int PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(35) NOT NULL,
	Cargo VARCHAR(30) NOT NULL ,
	Salario DECIMAL(6,2) NOT NULL

);

CREATE TABLE Material(
	Numero int PRIMARY KEY AUTO_INCREMENT,
	Tipo VARCHAR(20) NOT NULL,
	Marca VARCHAR(20) NOT NULL

);


CREATE TABLE Cliente (
	CNPJ VARCHAR(22) PRIMARY KEY,
	Nome VARCHAR (30) NOT NULL,
	Endereco VARCHAR (30) NOT NULL

);

CREATE TABLE Escala(
	Id int PRIMARY KEY AUTO_INCREMENT,
	Data DATE NOT NULL,
	SegMatricula int NOT NULL ,
	FOREIGN KEY(SegMatricula) REFERENCES Seguranca(Matricula),
	MatNumero int NOT NULL ,
	FOREIGN KEY(MatNumero) REFERENCES Material(Numero),
	CliCNPJ VARCHAR(22) NOT NULL,
	FOREIGN KEY (CliCNPJ) REFERENCES Cliente(CNPJ)


);

SHOW TABLES;
DESC Cliente;
DESC Material;
DESC Escala;
DESC Seguranca;


ALTER TABLE Cliente ADD COLUMN Email VARCHAR(30);
ALTER TABLE Seguranca CHANGE COLUMN Cargo Funcao VARCHAR(30) default 'Recem Contratado';
ALTER TABLE Cliente DROP COLUMN Email;
ALTER TABLE Material RENAME Materiais;

INSERT INTO  Seguranca VALUES
(0,'Jonny Ramone','segurança',2500.00),
(0,' Serji Tankian','seguranca',2000.00);
INSERT Seguranca (Matricula,Nome,Salario) VALUES (0,'Corey taylor',973.00);

INSERT INTO Materiais VALUES
(0,'Lanterna','Shing Ling'),
(0,'Cassetete','Arrebenta');

INSERT INTO Cliente VALUES
('00.123.445.685/0001-22','89fm','Av. paulista'),
('11.987.654.321/0001-33','Supermercado Extra','Av. Interlagos'),
('11.999.888.777/0001-66','Supermercado Extra', 'Av. Cupêce');


INSERT Escala (Id, Data, SegMatricula, MatNumero, CliCNPJ) VALUES (0, "08/08/2018", 1, 2, "00.123.445.685/0001-22");
INSERT Escala (Id, Data, SegMatricula, MatNumero, CliCNPJ) VALUES (0, "09/08/2018", 2, 1, "11.987.654.321/0001-33");



SELECT AVG(Salario) AS "Media Salarios" FROM Seguranca;


SELECT Nome, Salario FROM Seguranca WHERE Salario = (SELECT MAX(Salario) FROM Seguranca);


SELECT DISTINCT Nome FROM Cliente; 


SELECT * FROM Seguranca WHERE Funcao != "Recém contratado";


SELECT Numero FROM Materiais WHERE Marca = "Shing Ling";


SELECT SegMatricula FROM Escala WHERE CliCNPJ = "00.123.445.685/0001-22";


SELECT Nome, Salario FROM Seguranca WHERE Salario < 1500;



#######################################################################################################################################################
##############################################################################################################################################
#EXERCICIO 2	-Extra
CREATE DATABASE banco;
USE banco;
CREATE TABLE Agencia(
	Id INT  PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(45) NOT NULL,
	Cidade VARCHAR (20)
);

	CREATE TABLE Funcionario(
		Matricula int PRIMARY KEY AUTO_INCREMENT,
		Nome VARCHAR(45) NOT NULL,
		Cargo VARCHAR(30) NOT NULL,
		Salario DECIMAL(6,2) NOT NULL,
		Agencia_id INT NOT NULL,
		FOREIGN KEY (Agencia_id) REFERENCES Agencia(Id)
		);


#A)
INSERT Agencia VALUES (0,'BRADESCO','CAMPINAS'),(0,'BRADESCO','OSASCO');

#B)
INSERT INTO Funcionario VALUES(0,'SID VICIOUS','SUPERVISOR',2000.00,1),
INSERT INTO Funcionario VALUES(0,'STEVE JONES','SUPERVISOR',2000.00,2),
INSERT INTO Funcionario VALUES(0,'JOHNNY ROTTEN','AGENTE COMERCIAL',4000.00,1),
INSERT INTO Funcionario VALUES(0,'PAUL COOK','ATENDENTE',1200.00,2),
INSERT INTO Funcionario VALUES(0,'GERARD WAY','ATENDENTE',1200.00,1);


#C)
INSERT INTO Funcionario VALUES(0,'MARILYN MANSON','GERENTE',5000.00,1)
INSERT INTO Funcionario VALUES(0,'EDDIE VAN HALEN','GERENTE',5000.00,2);


#D)
UPDATE Funcionario
SET salario = salario * 1.10
WHERE cargo != 'GERENTE';


#E)
UPDATE Funcionario
SET salario = salario * 1.05
WHERE cargo = 'GERENTE';

#F)
UPDATE Funcionario
SET Cargo = 'DIRETOR'
WHERE Matricula = 6;


#G)
UPDATE Funcionario
SET salario = 6250.00
WHERE Cargo = 'DIRETOR';


#H)
SELECT  NOME,SALARIO 
FROM Funcionario
WHERE Salario < 2000.00;
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################







# aula 4 - EXERCICIO##################################################################################################################################
####################################################################################################################################################
############################################################################################################################################
#############################################################################################################################################


Create database LojaMotos;

Use LojaMotos;

Create table Marca(
Codigo int primary key auto_increment,
Nome varchar (30) not null
);

INSERT Marca VALUES (0, "Honda"),
(0, "Yamaha"),
(0, "Kawasaki"),
(0, "Suzuki");

Create table Moto(
Chassi int primary key,
Nome varchar(30) not null,
Cor varchar(20) not null,
MarcaCodigo int not null,
foreign key(MarcaCodigo) references Marca(Codigo)
);

INSERT Moto VALUES (12356789, "Titan", "Azul", 1),
(321654987, "Twister", "Preta", 1),
(147258369, "Factor", "Prata", 2),
(852258022, "Fazer", "Vermelha", 2),
(996655887, "Ninja 250", "Preta", 3),
(753951254, "Ninja 650", "Preta", 3),
(102030550, "CBR", "Prata", 1),
(805099604, "R1", "Amarela", 2);
create table Cliente(
Numero int(3) primary key auto_increment,
Nome varchar(30) not null,
Celular varchar(13) not null
);
INSERT Cliente VALUES (0, "Corey Taylor", "(19)988552266"),
(0, "Joey Jordison", "(19)977441122"),
(0, "Paul Gray", "(19)992365417"),
(0, "Shawn Crahan", "(19)998004433"),
(0, "James Root", "(19)920360055"),
(0, "Mick Thomson", "(19)914523688"),
(0, "Sid Wilson", "(19)977553344");
create table Servicos(
Cod int(3) primary key auto_increment,
Nome varchar(30) not null,
Preco decimal (6,2) not null
);
INSERT Servicos VALUES (0, "Troca de óleo", 120.00),
(0, "Troca pastilha", 100.00),
(0, "Troca transmissao", 150.00),
(0, "Eletrica", 80.00),
(0, "Troca cabo freio", 50.00),
(0, "Troca cabo do acelerador", 70.00);

create table Produtos(
Numero int(3) primary key auto_increment,
Nome varchar(30) not null,
Preco decimal (6,2) not null
);
INSERT Produtos VALUES (0, "Oleo", 30.00),
(0, "Pastilha de freio", 50.00),
(0, "Transmissao", 120.00),
(0, "Fio", 20.00),
(0, "Cabo freio", 25.00),
(0, "Cabo do acelerador", 30.00);
create table Vendas(
Numero int(3) primary key auto_increment,
MotoChassi int not null,
ClieNumero int(3) not null,
ServCod int(3) not null,
ProdNumero int(3) not null,
foreign key (MotoChassi) references Moto(Chassi),
foreign key (ClieNumero) references Cliente(Numero),
foreign key (ServCod) references Servicos(Cod),
foreign key (ProdNumero) references Produtos(Numero)
);


INSERT Vendas VALUES (0, 12356789, 1, 2, 2),
(0, 321654987, 2, 4, 4),
(0, 147258369, 3, 6, 6),
(0, 852258022, 6, 1, 1),
(0, 996655887, 7, 3, 3),
(0, 753951254, 5, 5, 3),
(0, 102030550, 4, 2, 2),
(0, 805099604, 3, 3, 3);



#   A)
SELECT Moto.Nome as "Moto",Marca.Nome as "Marca"
FROM Moto INNER JOIN Marca
ON Moto.MarcaCodigo = Marca.Codigo
ORDER BY Moto.Nome ASC;


#  B)
SELECT Marca.Nome AS "Marca",Moto.Nome AS "Moto"
From Marca LEFT JOIN Moto
ON Marca.Codigo = Moto.MarcaCodigo;

#  C)
SELECT Cliente.Nome as "Cliente",Moto.Nome as "Moto",Moto.Chassi as " Chassi"
From Vendas INNER JOIN Cliente
ON Vendas.ClieNumero = Cliente.Numero
	INNER JOIN Moto
	ON Vendas.MotoChassi = Moto.Chassi
ORDER BY Cliente.Nome ASC;

# D)
SELECT Moto.Nome as "Moto",Moto.Chassi as " Chassi",Produtos.nome as "Produto"
From Vendas INNER JOIN Moto
ON Vendas.MotoChassi = Moto.Chassi
	 INNER JOIN Produtos
	 ON Vendas.ProdNumero = Produtos.Numero
WHERE Moto.MarcaCodigo = 1;


#E)
SELECT Cliente.Nome as "Cliente", (Produtos.preco + Servicos.Preco) as "Total a pagar"
FROM Vendas INNER JOIN Cliente
ON Vendas.ClieNumero = Cliente.Numero
	INNER JOIN Produtos
	ON Vendas.ProdNumero = Produtos.Numero
		INNER JOIN Servicos
		ON Vendas.ServCod = Servicos.Cod
ORDER BY (Produtos.preco + Servicos.Preco),Cliente.Nome ASC;



#  F)
SELECT Moto.nome as "Moto", Moto.Cor as "Cor",Marca.Nome as "Marca"
FROM Moto INNER JOIN Marca 
ON Moto.MarcaCodigo = Marca.Codigo
WHERE(Moto.Cor = "Preta" OR moto.Cor = "Prata") AND (Marca.Nome = "Honda" OR Marca.nome = "Kawasaki");


# G)
SELECT round(AVG(Produtos.Preco + Servicos.Preco), 2 )as "Gasto Médio"
FROM Vendas inner join produtos                # round arredonda o valor
on Vendas.ProdNumero = produtos.Numero
	INNER JOIN Servicos
	ON Vendas.ServCod = Servicos.Cod;


# H)
 SELECT Cliente.Noome AS "Cliente",Cliente.Celular AS "Contato",Moto.nome AS "Moto"
FROM Vendas INNER JOIN Cliente
ON Vendas.ClieNumero = Cliente.Numero
INNER JOIN Moto
ON Vendas.MotoChassi = Moto.Chassi
WHERE Moto.MarcaCodigo = 2;

# i)
SELECT Moto.Nome AS "Moto",Moto.Chassi AS "Chassi"
FROM Vendas INNER JOIN Moto
ON Vendas.MotoChassi = Moto.Chassi
	INNER JOIN Servicos
	ON Vendas.ServCod = Servicos.Cod
WHERE  Servicos.Cod = 1;


# J)
SELECT Moto.Nome AS "Moto",Moto.Chassi AS "Chassi",Cliente.Nome AS "Cliente",
Servicos.Nome AS "Servico", Servicos.Preco AS "Preço do Servico",
Produtos.Nome AS "Produto", produtos.preco AS "preço do Produto",
(Servicos.preco + Produtos.preco)  AS "Total a pagar"
FROM vendas INNER JOIN Moto
ON Vendas.MotoChassi = Moto.Chassi
	INNER JOIN Cliente
	ON Vendas,ClieNumero = Cliente.Numero
	INNER JOIN Servicos
	ON vendas.ServCod = servicos.Cod
		INNER JOIN produtos
		ON Vendas.ProdNumero = Produtos.Numero
ORDER BY Cliente.Nome ASC;


#####################################################################################################################################
########################################################################################################################################################
########################################################################################################################################################
################## AULA 05 EXERCICIO 1 E 2 ####################################################################################################

create database LimeCar;
use LimeCar;
create table Fabricante (
Codigo int(3) primary key auto_increment,
Marca char (20) not null
);
INSERT Fabricante VALUES (0, "Volkswagen"),
(0, "Fiat"),
(0, "Chevrolet"),
(0, "Ford"),
(0, "Audi"),
(0, "Hyundai")
;

create table Veiculo (
RENAVAN int(8) primary key,
Nome varchar (30) not null,
Cor varchar (20) not null,
Preco decimal (10,2) not null,
FabricanteCod int(3) not null,
foreign key (FabricanteCod) references Fabricante (Codigo)
);


INSERT Veiculo VALUES (95195195, "Gol", "preto", 18000.00, 1),
(01234567, "Corsa", "azul", 15000.00, 3),
(02589967, "Idea", "prata", 44000.00, 2),
(12345678, "A3", "prata", 44000.00, 5),
(87654321, "Golf", "azul", 32000.00, 1),
(04445566, "A5", "azul", 80000.00, 5),
(78889994, "Jetta", "prata", 55000.00, 1),
(11122255, "S10", "preto", 33000.00, 3),
(36544477, "Linea", "prata", 35000.00, 2),
(77889966, "Montana", "preto", 32000.00, 3),
(55220044, "Fiesta", "branco", 25000.00, 4),
(01444558, "Ka", "verde", 49000.00, 4),
(10102020, "Saveiro", "preto", 22000.00, 1),
(30303030, "Strada", "preto", 27000.00, 2),
(11111111, "SpaceFox", "amarelo", 39000.00, 1),
(22222222, "Siena", "preto", 18000.00, 2),
(33333333, "Spin", "preto", 40000.00, 3),
(44444444, "Spin", "prata", 38000.00, 3),
(55555555, "Uno", "vermelho", 12000.00, 2),
(66666666, "Ka", "preto", 19000.00, 4),
(77777777, "A1", "preto", 49000.00, 5),
(88888888, "Captiva", "preto", 62000.00, 3),
(99999999, "Eco Sport", "preto", 49000.00, 4),
(32132132, "A8", "branco", 90000.00, 5),
(12312312, "Corsa", "rosa", 18000.00, 3),
(45645645, "Idea", "branco", 42000.00, 2),
(65465465, "A3", "verde", 54000.00, 5),
(78978998, "Golf", "dourado", 82000.00, 1),
(98798798, "A5", "blindado", 40000.00, 5),
(14714714, "Jetta", "prata", 45000.00, 1),
(74174174, "S10", "azul", 23000.00, 3),
(85285285, "Linea", "amarelo", 55000.00, 2),
(02582582, "Montana", "lilas", 62000.00, 3),
(96396396, "Fiesta", "marrom", 25000.00, 4);


#EX 1 - A)
CREATE VIEW vw_MarcaNome as
SELECT Fabricante.Marca  as "Marca", Veiculo.Nome as "Modelo"
FROM Veiculo INNER join Fabricante
ON Veiculo.FabricanteCod = Fabricante.Codigo;

#B)
SELECT * FROM vw_MarcaNome;

#C)
ALTER VIEW vw_MarcaNome as
SELECT Fabricante.Marca as "Marca",Veiculo.Nome as "Modelo"
FROM Veiculo INNER JOIN Fabricante
ON Veiculo.FabricanteCod = Fabricante.Codigo
WHERE Fabricante.Codigo = 5;
SELECT * FROM vw_MarcaNome;

#D)
CREATE VIEW  vw_MarcaNome1 as 
SELECT Veiculo.Nome as "Nome", Veiculo.preco as "preço"
FROM Veiculo

#E)
select * from vw_MarcaNome1
where Preco >= 700000.00;

#F)

#G)
CREATE VIEW vw_MarcaCor as
SELECT Veiculo.Nome,Veiculo.Cor,Fabricante.Marca
FROM Fabricante INNER JOIN Veiculo
ON Veiculo.FabricanteCod = Fabricante.Codigo
ORDER BY Veiculo.Nome ASC;
SELECT * FROM vw_MarcaCor;


#EXERCICIO2)
CREATE DATABASE Lanchonete;
USE Lanchonete;

CREATE TABLE Marca(
	ID int AUTO_INCREMENT PRIMARY KEY,
	Nome VARCHAR(30) NOT NULL
);

 INSERT Marca VALUES(0,"Nestle"),(0,"Ambev"),(0,"Caseiro");

 CREATE TABLE Produto(
 	Codigo int AUTO_INCREMENT PRIMARY KEY,
 	Nome VARCHAR(30) NOT NULL,
 	Validade DATE NOT NULL,
 	MarcaId int NOT NULL,
 	FOREIGN KEY (MarcaId) REFERENCES Marca(ID)
	);
 
 INSERT Produto VALUES(0,"Chocolate Prestigio","2018/12/15",1),
 (0,"Pacote Bolacha","2018/12/30",1),
 (0,"Nescau Prontinho","2019/01/01",1),
 (0,"Guarana Antartica","2022/05/05",2),
 (0,"Pepsi","2022/05/05",2),
 (0,"Coxinha","2018/08/29",3),
 (0,"Lanche Natural","2018/08/19",3),
 (0,"Trufa","2018/08/26",3);


CREATE TABLE Financeiro(
	Numero int AUTO_INCREMENT PRIMARY KEY,
	Vl_Compra decimal(4,2) NOT NULL,
	qtd int NOT NULL,
	ProdCod int NOT NULL,
	FOREIGN KEY (ProdCod) REFERENCES Produto(Codigo)

);

INSERT Financeiro VALUES (0,1.60,30,1),
(0,1.99,10,2),
(0,1.50,50,3),
(0,2.00,30,4),
(0,2.00,30,5),
(0,2.00,15,6),
(0,3.50,15,7),
(0,3.00,15,8);


#A)
CREATE VIEW vw_ProdMarcaVenc as 
SELECT Produto.nome as "nome",Produto.Validade as "validade", Marca.Nome As "Marca"
FROM Marca INNER JOIN Produto
ON Produto.MarcaId = Marca.ID;

#B)
ALTER VIEW vw_ProdMarcaVenc as 
SELECT Produto.nome as "nome",Produto.Validade as "validade", Marca.Nome As "Marca"
FROM Marca INNER JOIN Produto
ON Produto.MarcaId = Marca.ID
WHERE  produto.Validade LIKE("2018%")

#C)
CREATE VIEW vw_MarcaNomeTot as
SELECT Marca.Nome as "marca",produto.Nome as "Produto",(Financeiro.qtd * Financeiro.Vl_Compra) as "Total gasto"
FROM Produto INNER JOIN Marca
ON Produto.MarcaId = Marca.ID;
INNER JOIN Financeiro
ON Financeiro.ProdCod = Produto.Codigo;


#D)
SELECT *
FROM vw_MarcaNomeTot;

#E)
CREATE VIEW	vw_exe as
SELECT Produto.Nome as "produto",Financeiro.Qtd as "Quantidade",(Financeiro.Vl_Compra * 1.5) as "preco"
((Financeiro.Vl_Compra* 1.6)- Financeiro.Vl_Compra) as "Lucro"
FROM produto INNER JOIN Financeiro
ON Financeiro.ProdCod = produto.Codigo;

#F)
SELECT *
FROM vw_exe;

#G)
DELETE VIEW vw_ProdMarcaVenc;

#H)
SHOW Tables;

#I)
SELECT SUM(Quantidade * Lucro) AS "Lucro Total"
FROM vw_exe;


########################################################################################################################################################
########################################################################################################################################################
########################################################################################################################################################

-- EXERCICIO 3 -

#a) Desenvolva o BD do DER.

CREATE DATABASE Locadora;
USE Locadora;

CREATE TABLE Locador (	
	Cpf VARCHAR(14) PRIMARY KEY,
	Tel VARCHAR(11) NOT NULL,
	Nome Varchar(40) NOT NULL
);

CREATE TABLE Imovel (
	CEP VARCHAR(9) PRIMARY KEY,
	Endereco VARCHAR(40) NOT NULL,
	Descricao TEXT NOT NULL
);

CREATE TABLE Locatario (
	Numero int PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(40) NOT NULL,
	telefone VARCHAR(11) NOT NULL
);

CREATE TABLE Locacao(
	id int PRIMARY KEY AUTO_INCREMENT,
	valor decimal(7,2) NOT NULL, 
	CPF_Locador VARCHAR(14) NOT NULL,
	FOREIGN KEY(CPF_Locador) REFERENCES Locador(CPF),
	CEP_Imovel VARCHAR(9) NOT NULL,
	FOREIGN KEY(CEP_Imovel) REFERENCES Imovel(CEP),
	Numero_Locatario int NOT NULL,
	FOREIGN KEY(Numero_Locatario) REFERENCES Locatario(Numero)

);
 
#b) Insira diversos registros em todas as tabelas. (No campo
#“descrição” da tabela “Imóvel”, insira uma breve
#observação do imóvel)
 
INSERT Imovel VALUES ("12034-786","Rua Serafim Braga Neto n-789 Bairro Ponte Preta","casa com dois dormitório, banheiro social com box, área de serviço, 
 	cozinha com armário planejado, pia com gabinete, piso de madeira, área de sol, jardim e Edícula"),
("13645-135","Av. Washington Luís n 119", "Sala,  dormitórios, banheiro social com gabinete e box, copa, cozinha                                                                    área de serviço coberta, quintal com churrasqueira.
Edícula com: quarto, cozinha, sala e banheiro. Frente com pequeno jardim e três vagas de garagem (descobertas)."),
("13869-000","Av Campos Sales ", "Excelente localização, casa residencial e ou comercial
Com 2 dormitórios sendo 1 com armários, sala ampla, banheiro social, cozinha e sala de jantar, área de serviço, garagem.
Edicula nos fundos com 1 dormitório, sala, cozinha, churrasqueira, quintal amplo.");


INSERT Locador VALUES("236-978-876-09",19333070712,"Maria Mariana Cagnoni Ferreira"),
("345-967-222-09","21332556453","Paulo Augusto Nunes"),
("487-999-231-65","19337253458","Guilherme Freutz Ferreira"),
("765-149-409-00","21654367769","Paula Andrade Costa"),
("775-498-110-12","19657543671","Jéssica Nascimento De Carvalho");

INSERT Locatario VALUES(0,"Andres Joaquim Sousa","19233456876"),
                       (0,"Lucas Batista Figueredo","21324765981"),
                       (0 ,"Mariana Barbosa Santos","19443769800");

INSERT Locacao VALUES (0,1100.00,"345-967-222-09","13869-000",3),
(0,1500.00,"775-498-110-12","13645-135",1),
(0,2200.00,"765-149-409-00","12034-786",2);


#C)Desenvolva um índice na chave “Numero_Locatario” da tabela “Locação”

CREATE INDEX idx_NumeroLocatario
ON Locacao(Numero_Locatario);


#)D
ALTER TABLE Locatario
ADD INDEX NumeroIndice(Nome, Telefone);

SELECT Nome, Telefone
FROM Locatario 
USE INDEX (NumeroIndice);



#e) 
SELECT Nome, Telefone
FROM Locatario 
USE INDEX (NumeroIndice)
WHERE Nome = "Mariana Barbosa Santos";


#f) Desenvolva um índice FULLTEXT no campo “descrição” da tabela “Imóvel”.

ALTER TABLE Imovel
ADD FULLTEXT(Descricao);


#g) Verifique se o índice foi criado (pesquise a instrução SQL).
SHOW INDEX
FROM Imovel;

#h) Utilize o FULLTEXT para encontrar imóveis com a
#descrição:
#• Suíte;
#• Piscina;
#• Varanda;
#• Etc.

SELECT *
FROM Imovel
Where MATCH (Descricao) AGAINST("Suíte");

SELECT *
FROM Imovel
Where MATCH (Descricao) AGAINST("Piscina");

SELECT *
FROM Imovel
Where MATCH (Descricao) AGAINST("garagem");

SELECT *
FROM Imovel
Where MATCH (Descricao) AGAINST("Varanda");

#i) Exclua o índice FULLTEXT (Pesquise o comando).
ALTER TABLE Imovel
DROP INDEX Descricao;




CREATE DATABASE Redes;
USE Redes;

CREATE TABLE Conversor (
A int,
B int,
C int,
D int,
E int,
F int,
G int,
H int
);

INSERT Conversor VALUES
(0, 0, 0, 0, 0, 0, 0, 0),
(0, 1, 0, 1, 0, 1, 0, 1),
(1, 0, 1, 0, 1, 0, 1, 0),
(1, 1, 1, 0, 0, 0, 1, 0),
(0, 0, 1, 1, 1, 0, 1, 1),
(0, 0, 1, 0, 0, 1, 0, 0),
(1, 1, 1, 1, 1, 1, 1, 1);

CREATE FUNCTION fn_conv(A int, B int, C int, D int, E int,  F int, G int, H int)
RETURNS int
RETURN ((A * 128) + (B * 64) + (C * 32) + (D * 16) + (E * 8) + (F * 4) + (G * 2) + (H * 1));

SELECT fn_conv(A, B, C, D, E, F, G, H) AS "Mascara De Redes"
FROM Conversor; 