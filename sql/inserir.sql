-- conectar usando usuario trabalho

-- executar scripts abaixo

use trabalho;

 
insert into estado( nome, uf )
select distinct Nome_UF, 'XX' 
from importados
where Nome_UF in('Bahia','Minas Gerais', 'Paraiba');

update estado set uf = 'BA' where nome = 'Bahia';

update estado set uf = 'MG' where nome = 'Minas Gerais';

update estado set uf = 'PB' where nome = 'Paraiba';

select * from estado;

delete from municipio;
  
INSERT INTO trabalho.municipio
( nome, id_estado, cod_ibge)
select distinct i.Nome_Município , e.id_estado, i.Município
from importados as i
  join estado e on( e.nome = i.Nome_UF );

select m.* , e.nome as estado, e.uf
from municipio as m
  join estado e on( e.id_estado = m.id_estado );


INSERT INTO trabalho.cliente
(nome, cpf, celular, end_logradouro, end_numero, id_municipio, end_cep)
select 
concat( 'CLIENTE-', ( floor( rand() * 10 ) +1 ) ) as nome
, ( floor( rand() * 14 ) + 1) as cpf
, concat( m.id_estado, ( floor( rand() * 14 ) + 1)  ) as celular
, concat( 'LOGRADOURO ', ( floor( rand() * 6 ) + 1) ) as end_logradouro
, ( floor( rand() * 4 ) + 1) as end_numero
, m.id_municipio as id_municipio
, ( floor( rand() * 8 ) + 1) as end_cep
from municipio m;

select * from cliente


-- CONTAS A RECEBER
-- INCLUIR PARA CADA CLIENTE 3 PARCELAS.

INSERT INTO trabalho.conta_receber
( id_cliente, fatura_venda_id, data_conta, data_vendimento, valor, situacao)
select c.id_cliente 
, ( floor( rand() * 4 ) + 1) as  fatura_venda_id
, current_date as data_conta
, date_add( current_date, interval (floor(rand()*30)) day ) as data_vendimento
, round( ( ( rand() * 10 ) + 1), 2)  as  valor
, '1' as situacao
from cliente as c 


