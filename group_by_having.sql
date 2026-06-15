--------------------------------------------------------------------------------------------------------------
-- quantidade pedidos agrupados por status 

select status, count(id_venda) as quantidade from venda
group by status 
order by count(id_venda) desc;

--------------------------------------------------------------------------------------------------------------
-- maiores valores de compras agrupadas pelo nome do cliente, sendo pelo menos acima de 5000

select cliente.nome, max(venda.valor_total) as maior_compra
from cliente inner join venda
on cliente.id_cliente = venda.id_cliente 
group by cliente.nome 
having max(venda.valor_total)>5000
order by max(venda.valor_total) desc;
