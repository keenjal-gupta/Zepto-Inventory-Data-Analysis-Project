drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category varchar(120),
name varchar(150) NOT NULL,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountSellingPrice numeric(8,2),
weightInGms integer,
outOfStock boolean,
quantity integer
);

--data exploration

--count of rows
select count(*) from zepto;

--sample data
select * from zepto limit 10;

--NULL VALUES
select * from zepto 
where name is NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
select distinct category
from zepto
order by category;

--products in stock vs out of stock
select outOfStock, count(sku_id)
from zepto
group by outOfStock;

--product names present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning

--products with price = 0
select * from zepto 
where mrp = 0 or discountSellingPrice =0;

delete from zepto 
where mrp = 0;

--convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

select mrp, discountSellingPrice from zepto;

--data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

--Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp
from zepto
where outOfStock = true and mrp>300
order by mrp desc;

--Q3.Calculate Estimated Revenue for each category
select category,
sum(discountSellingPrice * availableQuantity) as total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select name, mrp, discountPercent
from zepto 
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountSellingPrice,
ROUND(discountSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name, weightInGms,
case 
when weightInGms < 1000 then 'LOW'
when weightInGms < 5000 then 'MEDIUM'
else 'BULK'
end as weight_category
from zepto;

--Q8.What is the Total Inventory Weight Per Category 
select category,
sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;

--Q9.What is the average MRP and discounted price per category?
select category,
round(AVG(mrp), 2) AS avg_mrp,
round(AVG(discountSellingPrice), 2) AS avg_discount_price
FROM zepto
GROUP BY category
ORDER BY avg_mrp DESC;

