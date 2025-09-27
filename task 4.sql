use ecommerce_sales ;

-- use select keyword 
select * from ecommerce_sales;

-- use where  keyword 
select * from ecommerce_sales where category = 'Home' and price>= 150 ;

-- use group by  , sum and count keyword 
select  category , count(order_id),sum(total_amount)  from ecommerce_sales 
group by category ;

-- use order by  keyword
select * from ecommerce_sales
order by price desc;

-- use inner join keyword

SELECT e1.category , sum(e2.price) as total_price
FROM ecommerce_sales AS e1
INNER JOIN ecom_sale2 AS e2
  ON e1.customer_id = e2.customer_id
  group by e1.category 
  order by total_price desc;

-- use left join keyword
SELECT *
FROM ecommerce_sales AS e1
left JOIN ecom_sale2 AS e2
  ON e1.customer_id = e2.customer_id ;
  
  
  -- use Right join keyword

SELECT *
FROM ecommerce_sales AS e1
Right JOIN ecom_sale2 AS e2
  ON e1.customer_id = e2.customer_id ;
  
  
-- create view 

create view high_value_profit_orders as 
select order_id,
    customer_id,
    category,
    total_amount,
    profit_margin,
    order_date
    from ecommerce_sales 
          where total_amount >=150 and
          profit_margin >= 50 and
          returned = 'NO'
    order by total_amount desc ;
		
select * from high_value_profit_orders  limit 10 ;

-- Optimize queries with indexes

CREATE INDEX idx_category ON ecommerce_sales(category(100));
CREATE INDEX idx_customer_id ON ecommerce_sales(customer_id(100));

