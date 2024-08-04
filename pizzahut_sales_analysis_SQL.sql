-- creating database
create database pizza_hut;

use pizza_hut;

-- creating tables and importing data
CREATE TABLE orders (
    order_id INT PRIMARY KEY NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL
);

create table order_details (order_details_id int primary key not null,
order_id int  not null,
pizza_id text not null,
quantity int not null);



# 1. Retrieve the total number of orders placed.

SELECT 
    COUNT(*) AS count_of_orders
FROM
    orders;

# 2. Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id;


# 3. Identify the highest-priced pizza.

SELECT 
    p.pizza_id, pt.name, p.price
FROM
    pizzas p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

# 4. Identify the most common pizza size ordered.

SELECT 
    p.size, COUNT(od.order_id) AS total_count
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY p.size
ORDER BY total_count DESC;




# 5. List the top 5 most ordered pizza types along with their quantities.

SELECT 
    COUNT(od.order_id) AS quantity, pt.name
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY quantity DESC
LIMIT 5;

-- ---------------------------------------------------- 

-- 1.	Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category, COUNT(od.order_id) AS total_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- 2.	Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(order_time) AS hour_of_the_day,
    COUNT(order_id) AS total_orders
FROM
    orders 
GROUP BY hour_of_the_day
ORDER BY hour_of_the_day;

-- 3.	Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name)
FROM
    Pizza_types
GROUP BY category;


-- 4.	Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(quantity),0) AS AVG_ORDERES_PER_DAY
FROM
    (SELECT 
        o.order_date, SUM(od.quantity) as quantity
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_date) as order_quantity;

-- 5.	Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.name, SUM(od.quantity * p.price) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;



-- ---------------------------------------------------------------------

-- 1.	Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pt.category,
    ROUND((SUM(od.quantity * p.price) / (SELECT 
                    ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
                FROM
                    order_details od
                        JOIN
                    pizzas p ON od.pizza_id = p.pizza_id)) * 100,
            0) AS revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY revenue DESC;

-- 2.	Analyse the cumulative revenue generated over time.

SELECT 
	  order_date,
      revenue,
      SUM(revenue) OVER (ORDER BY order_date) AS  cum_revenue
FROM 
    (SELECT  
           o.order_date,
		   SUM(od.quantity* p.price) AS revenue 
	 FROM 
          orders o 
           JOIN 
		  order_details od ON o.order_id = od.order_id
           JOIN 
		  pizzas p ON od.pizza_id = p.pizza_id
     GROUP BY o.order_date) AS sales;


-- 3.	Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select rank_, category, name, revenue from (select category, name , revenue , rank() over(partition by category order by revenue desc) as rank_ from
 (select pt.category, pt.name , round(sum(od.quantity* p.price),2) as revenue from order_details od join pizzas p on od.pizza_id = p.pizza_id 
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id 
group by pt.category,pt.name) as a) as b
where rank_ <=3;

