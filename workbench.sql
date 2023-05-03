SET SQL_SAFE_UPDATES = 0;
-- 1. importuoti duomenis
SELECT * FROM bi_task.ca_test_data;

-- 2.sumuoti pajamas per sali
select Country, round(sum(UnitPrice*Quantity),2) as sum
from ca_test_data
group by Country;

-- 3.surusiuoti prekes pagal kaina desc
select Description, UnitPrice
from ca_test_data
order by UnitPrice desc;

-- 4. prekes su zodziu vintage
select Description
from ca_test_data
where Description like "%VINTAGE%";

-- 5. sukurti view su papildomu stulpeliu
create view ca_test_data_adjusted as
select * ,
case when Country = "United Kingdom" then"yes"
else "no" end as Country_United_kingdom
from ca_test_data;

select * from ca_test_data_adjusted;

