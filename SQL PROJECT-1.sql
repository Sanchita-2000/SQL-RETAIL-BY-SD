create database SQL_Project_3;
--create table
---sql
create table retail_sales(
transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(15),
age int,
category varchar(256),
quantiy int,
price_per_unit float,
cogs float,
total_sale float
);
---sql
select * from retail_sales;
select * from retail_sales
where 
     transactions_id is null
	 or
	 sale_date is null
	 or
	 sale_time is null
	 or
	 customer_id is null
	 or
	 gender is null
	 or
	 age is null
	 or 
	 category is null
	 or
	 quantiy is null
	 or
	 price_per_unit is null
	 or
	 COGS is null
	 or
	 total_sale is null;
delete from retail_sales
where
    transactions_id is null
	 or
	 sale_date is null
	 or
	 sale_time is null
	 or
	 customer_id is null
	 or
	 gender is null
	 or
	 age is null
	 or 
	 category is null
	 or
	 quantiy is null
	 or
	 price_per_unit is null
	 or
	 COGS is null
	 or
	 total_sale is null;
--How many unique customer we have
select count(distinct customer_id)from retail_sales;
--Write a SQL query to retrieve all transaction where clothing and quantity sold is more than 4 in the month of 
--Nov
select 
     *
	 from retail_sales
	 where category='Clothing'
	 and 
	 TO_CHAR(sale_date,'YYYY-MM')='2022-11'
	 AND
	 Quantiy>=4;
--SQL Query to calculate the total sales for each category
select 
     category,sum(total_sale) as salessum
	 from retail_sales
	 group by category;
--Avg age of customers 	who purchased items from beauty category
select Round(avg(age))from retail_sales
where category='Beauty';
--Find all transactions where the total sale is greater than 1000
select total_sale,transactions_id
from retail_sales
where total_sale>1000
--Find the total number of transactions made by each gender in each category
select gender,category,count (*) as Totaltransaction
from retail_sales
group by (gender,category);
--Calculate the avg sale for each month , find out the best selling month
--Top 5 customers based on the highest total sales
select customer_id,sum(total_sale) 
from retail_sales
group by customer_id
order by sum(total_sale) 
limit 5
--Find the number of unique customers who purchase5d items from each category
select count(distinct (customer_id)),category
from retail_sales
group by category;
--create each shifht and number of orders ( Morning-<=12,Afternoon between 12 & 17, Evening>17 )
with hourly_sales
as(

select *,
    case
	    when extract( hour from sale_time)<12 then 'Morning'
        when extract( hour from sale_time)between 12 and 17 then 'Afternoon'
		Else 'Evening'
	End as Shift
from retail_sales
)	
select Shift,count(*)as total_order from  hourly_sales
group by shift;

--End of project





