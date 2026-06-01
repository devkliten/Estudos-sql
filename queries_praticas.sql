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
--------------------------------------------------------------------------------------------------------------
-- produtos que nunca foram vendidos

select nome as produto_nao_vendidos from produto 
left join item_venda
on produto.id_produto = item_venda.id_produto
where item_venda.id_item is null;
--------------------------------------------------------------------------------------------------------------
-- quantidade pedidos agrupados por status 

select status, count(status) as quantidade from venda
group by status 
order by count(status) desc;
--------------------------------------------------------------------------------------------------------------
-- maiores valores de compras agrupadas pelo nome do cliente, sendo pelo menos acima de 5000

select cliente.nome, max(venda.valor_total) as maior_compra
from cliente inner join venda
on cliente.id_cliente = venda.id_cliente 
group by cliente.nome 
having max(venda.valor_total)>5000
order by max(venda.valor_total) desc;
--------------------------------------------------------------------------------------------------------------
-- quais foram os dias da semana que mais tiveram vendas

select case dayofweek(data_venda) 
when 1 then 'Domingo'
when 2 then 'Segunda-feira'
when 3 then 'Terca-feira'
when 4 then 'Quarta-feira'
when 5 then 'Quinta-feira'
when 6 then 'Sexta-feira'
when 7 then 'Sabado'
end as dias_da_semana, count(id_venda) as vendas
from venda
group by case dayofweek(data_venda) 
when 1 then 'Domingo'
when 2 then 'Segunda-feira'
when 3 then 'Terca-feira'
when 4 then 'Quarta-feira'
when 5 then 'Quinta-feira'
when 6 then 'Sexta-feira'
when 7 then 'Sabado' 
end
order by count(id_venda) desc;



