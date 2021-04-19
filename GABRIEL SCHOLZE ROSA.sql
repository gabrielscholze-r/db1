create database ProjetoBancodeDados;
use ProjetoBancodeDados;

CREATE TABLE veiculo(placa varchar(20),  cor VARCHAR(15), data_de_registro DATE, velocidade int not null,nome_modelo VARCHAR(50),
	primary key(PLACA),
    foreign key(nome_modelo) references modelo(nome_modelo));
create table modelo(nome_modelo varchar(50), id_marca int, tipo_veiculo varchar(30), peso float,
	primary key(nome_modelo),
    foreign key(id_marca) references marca(id_marca));
create table marca(id_marca int, nome_marca varchar(50),
	primary key(id_marca));
create table PolicialRodoviario(CPF_policial varchar(11), nome VARCHAR(50), numero_identificacao INT not null,
	primary key(CPF_policial));
create table rodovia(nome_rodovia varchar(15), em_obra varchar(15), aberta varchar(15), qtd_acidentes int not null,
	primary key(nome_rodovia));
create table DepartPoliciaRodoviaria(codigo_departamento int not null, id_localizacao int not null,
	primary key(codigo_departamento),
    foreign key(id_localizacao) references endereco(identificador_rua));
create table endereco(identificador_rua int not null, rua varchar(50), numero int not null, cidade varchar(30), uf varchar(2), pais varchar(30), codigo_departamento int not null,
	primary key(identificador_rua),
    foreign key(codigo_departamento) references DepartPoliciaRodoviaria(codigo_departamento));
    
create table multa(placa varchar(20), tipo_multa varchar(50), valor decimal,CPF_policial varchar(11),data_multa date,
	foreign key(placa) references veiculo(placa),
    foreign key(CPF_policial) references PolicialRodoviario(CPF_policial));
create table fechar(nome_rodovia varchar(15), CPF_policial varchar(11),
	foreign key(nome_rodovia) references rodovia(nome_rodovia),
    foreign key(CPF_policial) references PolicialRodoviario(CPF_policial));
create table ordem(tipo_de_ordem varchar(30), CPF_policial varchar(11), codigo_departamento int not null,
	foreign key(CPF_policial) references PolicialRodoviario(CPF_policial),
	foreign key(codigo_departamento) references DepartPoliciaRodoviaria(codigo_departamento));
    
insert into marca values (10219,'AUDI');
insert into marca values (54765,'HONDA');
insert into marca values (46332,'HARLEY DAVIDSON');
insert into marca values (44170,'VOLVO');

insert into modelo values('A3',10219,'Carro','928.327');
insert into modelo values('Hornet',54765,'Moto','188558');
insert into modelo values('Fat Boy',46332,'Moto','176868');
insert into modelo values ('Scania',44170,'Caminhão','18782.35');

insert into veiculo values ('AFN8662','Vermelho', '2020-10-08', '80', 'A3');
insert into veiculo values ('AWS3633','Preto', '2020-10-08', '100', 'Hornet');
insert into veiculo values ('ADO4567','Vermelho', '2020-10-08', '110', 'Scania');
insert into veiculo values ('AQA1894','Marrom', '2020-10-09', '60', 'Scania');




insert into PolicialRodoviario value ('57256208081','Josimar Dias', 38987609);
insert into PolicialRodoviario value ('29483679052','Alfredo Sampaio', 60725558);
insert into PolicialRodoviario value ('28541446000','Justino Freitas', 85851587);
insert into PolicialRodoviario value ('22695128045','Alcides da Cunha', 22520641);

insert into rodovia value('277','não','sim',12);
insert into rodovia value('366','não','não',3);
insert into rodovia value('299','sim','não',36);
insert into rodovia value('201','não','sim',8);

insert into DepartPoliciaRodoviaria value(57503,43869);
insert into DepartPoliciaRodoviaria value(82091,67768);
insert into DepartPoliciaRodoviaria value(54214,39228);
insert into DepartPoliciaRodoviaria value(35014,50493);

insert into endereco value (43869,'Oito de Maio',125,'Curitiba','PR','Brasil',57503);
insert into endereco value (67768,'Nove de Setembro',75,'Curitiba','PR','Brasil',8209);
insert into endereco value (39228,'Treze',23,'Curitiba','PR','BRASIL',54214);
insert into endereco value (50493,'Av dos Estados',1235,'Almirante Tamandare','PR','BRASIL',35014);

insert into fechar values ('57256208081','277');
insert into fechar values ('29483679052','366');
insert into fechar values ('28541446000','299');
insert into fechar values ('22695128045','201');

insert into multa values ('AFN8662','Velocidade',200,'57256208081','2021-03-25');
insert into multa values ('AWS3633','Velocidade',350,'29483679052','2021-02-21');
insert into multa values ('ADO4567','Velocidade',400,'28541446000','2021-03-04');
insert into multa values ('AQA1894','Ultrapassagem Indevida',500,'22695128045','2021-04-03');