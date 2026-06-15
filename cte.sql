--Total de vendas por vendedor, mostrando apenas os que venderam mais de R$ 5.000 no total.

with vendas_por_vendedor as (
select vendedor.nome, sum(venda.valor_total) as total
from vendedor inner join venda 
on vendedor.id_vendedor = venda.id_vendedor
group by vendedor.nome 
having sum(venda.valor_total)>5000)

select * from vendas_por_vendedor
order by (total) desc;
---------------------------------------------------------------------------------------------------------------------
--Traz o nome do cliente e o valor total que cada um já gastou. Ordenando do maior para o menor.
	
with cliente_total as (
select cliente.nome, sum(venda.valor_total) as total
from cliente inner join venda 
on cliente.id_cliente = venda.id_cliente
group by cliente.nome)

select * from cliente_total 
order by total desc;
