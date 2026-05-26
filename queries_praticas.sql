-- Query que mostra a média de valor total gasto agrupado pelo nome do cliente e em ordem decrescente.
------------------------------------------------------------------------------------------------------
select cliente.nome, avg(venda.valor_total) as media_de_gastos
from cliente inner join venda
on cliente.id_cliente  = venda.id_cliente
group by cliente.nome 
order by avg(venda.valor_total) desc;
------------------------------------------------------------------------------------------------------
-- query que demonstra quais sao os clientes que não tiveram compras 

select nome as cliente_sem_compras from cliente 
left join venda 
on cliente.id_cliente = venda.id_cliente
where venda.id_venda is null;
------------------------------------------------------------------------------------------------------
-- demonstra as 5 categorias mais vendidas 
select categoria.nome, sum(item_venda.quantidade) as total_unidades_vendidas from categoria
inner join produto 
on categoria.id_categoria = produto.id_categoria
inner join item_venda 
on produto.id_produto = item_venda.id_produto
group by categoria.nome 
order by sum(item_venda.quantidade) desc limit 5;

--------------------------------------------------------------------------------------------------------------
-- vendedores que mais venderam com os valores vendido por cada um 

select vendedor.nome, sum(venda.valor_total) as total_de_vendas
from vendedor 
inner join venda
on vendedor.id_vendedor = venda.id_vendedor 
group by vendedor.nome 
order by (total_de_vendas) desc;

--------------------------------------------------------------------------------------------------------------
-- vendedores que nunca atenderam nenhuma venda
select nome  as vendedores_sem_vendas from vendedor
left join venda 
on vendedor.id_vendedor = venda.id_vendedor
where venda.id_venda is null;











