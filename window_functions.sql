--Numera todas as vendas de cada cliente em ordem cronológica.
select cliente.nome, venda.data_venda,venda.valor_total, id_venda, row_number () over (partition by cliente.nome order by venda.data_venda asc ) as numero
from cliente inner join venda 
on cliente.id_cliente = venda.id_cliente;
-------------------------------------------------------------------------------------------------
--Ranking de vendedores pelo total de vendas somado. 
select vendedor.nome, sum(venda.valor_total)as total, rank () over (order by sum(venda.valor_total)desc) as Raking
from vendedor inner join venda 
on vendedor.id_vendedor = venda.id_vendedor 
group by vendedor.nome;
-------------------------------------------------------------------------------------------------
--Ranking de produtos pelo preço
select nome, preco, dense_rank() over (order by preco desc) Dense_Raking
from produto;
-------------------------------------------------------------------------------------------------
--Mostra para cada venda o valor atual e o valor da venda anterior do mesmo cliente. 
select cliente.nome, venda.valor_total, lag(venda.valor_total) over (partition by cliente.nome order by venda.data_venda desc) as comparacao
from cliente inner join venda 
on cliente.id_cliente = venda.id_cliente;
-------------------------------------------------------------------------------------------------
-- Traz apenas a primeira compra de cada cliente, a mais antiga.
with exemplo as (
select cliente.nome,venda.data_venda, venda.valor_total, row_number() over (partition by cliente.nome order by venda.data_venda asc) as numero
from cliente inner join venda 
on cliente.id_cliente = venda.id_cliente)

select * from exemplo
where numero = 1;
