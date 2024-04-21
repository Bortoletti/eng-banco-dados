create view recebiveis as 
select r.id_conta_receber 
, c.nome as id_cliente , c.cpf 
, r.data_vendimento 
, r.valor 
from conta_receber r
  join cliente c on( c.id_cliente = r.id_cliente )
where ( r.situacao = '1');

select * from recebiveis ;