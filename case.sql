--Uma view que mostra o nome do produto e o preço unitário, apenas dos produtos com preço acima de R$ 100
create view preco as 
select nome, preco from produto
where preco>100;
select * from prec
------------------------------------------------------------------------------------------------------
--View que mostre o nome do cliente, o valor total de cada venda e a data da venda
create view dados as
select cliente.nome, venda.valor_total as total, venda.data_venda
from cliente inner join venda
on cliente.id_cliente = venda.id_cliente;
select * from dados; 
------------------------------------------------------------------------------------------------------
--View que mostra cada categoria e a quantidade total de produtos cadastrados nela
create view quantidade as 
select categoria.nome, count(produto.id_produto) as quantidade
from categoria inner join produto
on categoria.id_categoria = produto.id_categoria
group by categoria.nome;
select * from quantidade;
--------------------------------------------------------------------------------------------------------
--View que mostre os clientes que nunca fizeram nenhuma compra
create view sem_compras as 
select cliente.nome 
from cliente left join venda
on cliente.id_cliente = venda.id_cliente
where venda.id_venda is null;
select * from sem_compras;
-----------------------------------------------------------------------------------------------------------
--View que mostra o nome da venda, o valor total e uma coluna chamada porte com os seguintes critérios, pequena média e grande 
create view status as 
select id_venda, case 
when valor_total< 500 then 'Pequena'
when valor_total between 500 and 2000 then 'Média'
else 'Grande'
end as porte
from venda;
select * from status;
------------------------------------------------------------------------------------------------------------

