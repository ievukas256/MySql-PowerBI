-- 1. 5V 1.didelės apimties duomenys (gaunami realiu laiku ir kaskart jų vis daugiau) 2. duomenų įvairovė (lentelės, failai, audio, pranešimai)
--       3. greitis (duomenų tvarkymas realiu laiku) 4. teisingumas (sutvarkomos klaidos) 5. vertė (duomenų analizė)

-- 2. b. varchar - nes jis yra kintamo ilgio
-- 3. left join - paimsim kas bendra ir viską iš kairės lentelės, o right join - viską iš dešinės lentelės
-- 4. nauja lentelė
-- create view CustAggregation as
-- select customer_id, product_name, product_quantity as product_amount, round(sum(product_quantity*price),2) as total_sum
-- from Transaction;

-- 5. sql užklausos
-- a. klientu sk per klientu salis be U%
select count(cust_country) as cust_amount, cust_country
from customer
where CUST_COUNTRY not like "U%"
group by cust_country
order by cust_amount desc;

-- b. klientas, jo uzsakymai ir unikalus agentai
select cust_name, count(ord_num) as orders, count(distinct o.agent_code) as agents
from customer c
join orders o on o.CUST_CODE = c.CUST_CODE
join agents a on a.AGENT_CODE = o.AGENT_CODE
group by cust_name
order by orders desc;

-- c. data menesio lygiu, uzsakymu veres suma ir vidutine suma
select month(ord_date) as month, sum(ord_amount) as total_sum, round(avg(ord_amount),2) as avg_sum
from orders
group by month
order by month desc;

-- d. agentas ir jo uzsakymu bei komisiniu suma virs 500
select agent_name, sum(ord_amount) as total_sum, sum(ord_amount - advance_amount) as commission
from agents
join orders using(agent_code)
group by agent_name
having commission>500
order by commission desc;
