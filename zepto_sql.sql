select count(*)from zepto;

select*from zepto

--check there is any null values--

SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discount_percent IS NULL
OR
discounted_selling_price IS NULL
OR
available_quantity IS NULL
OR
weight_in_gms IS NULL
OR
out_of_stock IS NULL
OR
quantity IS NULL;

--product categories--
select distinct category from zepto
order by category

--product in stock and outofstock--
select out_of_stock, count(sno_id) from zepto
group by out_of_stock

--product names of more than 2 items--

select name,count(sno_id) from zepto
group by name
having count(sno_id)>1
order by count(sno_id)desc

--data cleaning--
--check the product where mrp is 0--

select * from zepto where mrp =0 or discounted_selling_price=0

--delete the row where mrp is 0--
delete from zepto where mrp=0

--convert paise into rupee--
update zepto
set mrp=mrp/100.0,
discounted_selling_price=discounted_selling_price/100.0

select mrp,discounted_selling_price from zepto

--q1.top 10 best value products based on discount percentage

select distinct name, mrp,discount_percent from zepto
order by discount_percent desc
limit 10;

--q2.what are the product with high mrp and out of stock

select distinct name , mrp, out_of_stock from zepto
where out_of_stock=true and mrp>300
order by mrp desc

--q3.calculate the estimated revenue from each category
select category,
sum(discounted_selling_price*available_quantity)as total_revenue
from zepto
group by category
order by total_revenue

alter table zepto
add column total_revenue numeric(8,2)

update zepto
set total_revenue=discounted_selling_price*available_quantity






--q4.find all product where mrp is greater than 500 and discount percent is less than 10 percent
select distinct name, mrp,discount_percent from zepto
where mrp>500 and discount_percent<10
order by mrp

--q5.identify the top 5 category offering the highest average discount percentage
select category,ROUND(avg(discount_percent),2)as avg_discount from zepto
group by category
order by avg_discount desc
limit 5

--q6.find the price per gram for products above 100g and sort by best value
select distinct name,weight_in_gms,discounted_selling_price,
ROUND(discounted_selling_price/weight_in_gms,2) as price_per_gram
from zepto
where weight_in_gms>=100
order by price_per_gram

alter table zepto
add column price_per_gram numeric(8,2)

update zepto
set price_per_gram=ROUND(discounted_selling_price/weight_in_gms,2)
where weight_in_gms>=100

--q7.group the product into categories like low,medium.bulk
select distinct name, weight_in_gms,
case when weight_in_gms < 1000 then 'low'
when weight_in_gms > 1000 then 'medium'
else 'bulk'
end as weight_category
from zepto

--q8.what is the total inventory weight for category
select category,
sum(weight_in_gms*available_quantity)as total_grms
from zepto
group by category
order by total_grms






