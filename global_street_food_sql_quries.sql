create Database Global_Street_Food;
use global_street_Food;
select * from global_food;

-- 1. List all vegetarian street foods.
select * from global_food where Vegetarian = 'Yes';

-- 2. Find the average price of all street foods.
select round(avg(Typical_Price),2) as Average_Price_USD
from global_food;

-- 3. Find the total price of all street foods.
select round(sum(Typical_Price),2) as Total_Price_USD
from global_food;

-- 4. Show all dishes that are fried.
select distinct Dish_Name, Cooking_Method
from global_food
where Cooking_Method = 'Fried';

-- 5. Which country has the most street food dishes listed?
select Country, count(*) as Dish_Count
from global_food
group by Country
order by Dish_Count desc;

-- 6. List dishes priced above the average price.
select Dish_Name, Typical_Price as Dish_Price
from global_food
where Typical_Price > (select round(avg(Typical_Price),2) as Average_Price_USD
from global_food)
order by Dish_Price desc;

-- 7. Show the number of vegetarian dishes by cooking method.
select Cooking_Method, count(*) as Dish_Count
from global_food
where Vegetarian = 'Yes'
group by Cooking_Method
order by Dish_Count desc;

-- 8. Which region/city has the highest average street food price?
select `Region/City`, round(avg(Typical_Price),2) as Average_Price_USD
from global_food
group by `Region/City`
order by Average_Price_USD desc
limit 1;

-- 9. List all dishes whose description contains the word "crispy".
select Dish_Name, Description
from global_food
where Description like '%Crispy%';

-- 10. Get the count of dishes for each cooking method in each country.

select Country, Cooking_Method, count(*) as Dish_Count
from global_food
group by Country, Cooking_Method
order by Dish_Count desc;



