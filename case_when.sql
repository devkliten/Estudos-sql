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
