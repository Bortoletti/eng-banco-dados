
-- conectar com usuario trabalho
-- $ mysql -u trabalho -p

-- executar o script com mysql> \. 02-criar-tabelas.sql

use trabalho;

create table estado(
  id_estado int8 auto_increment not null,
  nome varchar(50) not null,
  uf varchar(2) not null,
  primary key(id_estado)
);

drop table if exists municipio;

create table municipio(
  id_municipio int8 auto_increment not null,
  nome varchar(50) not null,
  id_estado int8 not null,
  cod_ibge int8 not null,
  primary key( id_municipio ) );
  
ALTER TABLE municipio
ADD CONSTRAINT fk_estado
  FOREIGN KEY (id_estado)
  REFERENCES estado(id_estado);

create table cliente(
  id_cliente int8 auto_increment not null,
  nome varchar(80) not null,
  cpf char(11) not null,
  celular char(11),
  end_logradouro varchar(100) not null,
  end_numero varchar(10) not null,
  id_municipio int8 not null,
  end_cep char(8),
  primary key( id_cliente ) );
  
ALTER TABLE cliente
ADD CONSTRAINT fk_cliente_municipio
  FOREIGN KEY (id_municipio)
  REFERENCES municipio(id_municipio);

create table conta_receber(
  id_conta_receber int8 auto_increment not null,
  id_cliente int8 not null,
  fatura_venda_id int8,
  data_conta date not null,
  data_vendimento date not null,
  valor decimal(18,2) default 0 not null,
  situacao enum('1','2','3'),
  primary key( id_conta_receber ));

ALTER TABLE conta_receber
ADD CONSTRAINT conta_receber_fk_cliente
  FOREIGN KEY (id_cliente)
  REFERENCES cliente(id_cliente);
  
show tables;