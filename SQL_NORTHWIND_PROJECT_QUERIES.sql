SELECT *
FROM products
LIMIT 5

SELECT *
FROM orders
LIMIT 5

SELECT *
FROM products
LIMIT 5

SELECT
	MIN(order_date) AS first_date,
	MAX(order_date) AS last_date
	FROM orders
	
	
SELECT *
FROM orders
LIMIT 5

SELECT *
FROM orders
WHERE ship_region IS NULL 

SELECT *
FROM order_details
LIMIT 5

SELECT *
FROM order_details
WHERE discount > 0;

SELECT *
FROM products
LIMIT 5
--Top 5 products with the highest inventory turnover between 07-04-1996 and 03-07-1997
SELECT 
	pd.product_id,
	pd.product_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
	GROUP BY pd.product_id, pd.product_name
	HAVING AVG(pd.units_in_stock)  > 0
	ORDER BY inventory_turnover DESC
	LIMIT 5;
	
	

-- '1997-07-04' AND '1998-05-06'
-- AND (SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100


SELECT 
	pd.product_id,
	pd.product_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
	GROUP BY pd.product_id, pd.product_name
	HAVING AVG(pd.units_in_stock)  > 0
	ORDER BY inventory_turnover DESC
	LIMIT 5;
	
	
SELECT *
FROM products
WHERE product_name = 'NuNuCa Nuß-Nougat-Creme' 
	--AND order_date BETWEEN '1997-07-04' AND '1998-05-06'

SELECT *
FROM categories

SELECT pd.product_id, pd.product_name, ca.category_name, ca.description
FROM products pd
JOIN categories ca ON pd.category_id = ca.category_id 
WHERE ca.category_name IN (SELECT category_name FROM categories)
ORDER BY pd.product_id


SELECT 
	pd.product_id,
	pd.product_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1997-07-04' AND '1998-05-06')
	HAVING AVG(pd.units_in_stock)  > 0 AND 
	(SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100
	ORDER BY inventory_turnover ASC
	LIMIT 5;
	
	--ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover
SELECT 
	pd.product_id,
	pd.product_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
	GROUP BY pd.product_id, pd.product_name
	HAVING AVG(pd.units_in_stock)  > 0
	ORDER BY inventory_turnover DESC
	LIMIT 5;
		  

SELECT 
     pd.product_id,
	pd.product_name,
	ca.category_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS    inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	JOIN categories ca ON pd.category_id = ca.category_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE      order_date BETWEEN '1996-07-04' AND '1997-07-03')
		AND ca.category_name IN ('Dairy Products', 'Meat/Poutry', 'Seafood')
	GROUP BY pd.product_id, pd.product_name, ca.category_name
	HAVING AVG(pd.units_in_stock)  > 0 AND 
	(SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100
	ORDER BY inventory_turnover DESC
	LIMIT 5;
-- (SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100

SELECT 
	pd.product_id,
	pd.product_name,
	ca.category_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS  inventory_turnover	
FROM products pd
JOIN order_details od ON pd.product_id = od.product_id
JOIN orders oe ON od.order_id = oe.order_id
JOIN categories ca ON pd.category_id = ca.category_id
WHERE oe.order_date IN (SELECT order_date FROM orders WHERE   order_date BETWEEN '1997-07-04' AND '1998-05-06')
  AND ca.category_name IN ('Dairy Products', 'Meat/Poutry', 'Seafood')
GROUP BY pd.product_id, pd.product_name, ca.category_name
HAVING AVG(pd.units_in_stock) > 0  -- Filter for positive average inventory only
  AND (SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100 -- Limit based on inventory turnover
ORDER BY inventory_turnover DESC
LIMIT 5;
		  
		  
		  
		  
SELECT 
	pd.product_id,
	pd.product_name,
	ca.category_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	JOIN categories ca ON pd.category_id = ca.category_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
		AND ca.category_name IN ('Beverages', 'Condiments', 'Confections','Grains/Cereals', 'Produce' )
		AND pd.discontinued = 0
	GROUP BY pd.product_id, pd.product_name, ca.category_name
	HAVING AVG(pd.units_in_stock)  > 0 AND 
	(SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100
	ORDER BY inventory_turnover DESC
	LIMIT 5;

		  
	
SELECT *
FROM products
LIMIT 5
		  
SELECT *
FROM order_details
LIMIT 5

SELECT *
FROM orders
LIMIT 5
		  
-- Stockout Rate
SELECT 
	pd.product_id,
	pd.product_name,
	pd.units_in_stock,
    (COUNT(CASE WHEN pd.units_in_stock = 0 AND od.quantity > 0 THEN 1 END) / COUNT(od.order_id)) * 100 AS stockout_rate
FROM order_details od
JOIN products pd ON od.product_id = pd.product_id
WHERE pd.discontinued = 0
GROUP BY pd.product_id, pd.product_name
ORDER BY stockout_rate DESC
LIMIT 5;
		  

		  
-- DSI
		  
SELECT 
	pd.product_id,
	pd.product_name,
	ca.category_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	JOIN categories ca ON pd.category_id = ca.category_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
		AND ca.category_name IN ('Beverages', 'Condiments', 'Confections','Grains/Cereals', 'Produce' )
		AND pd.discontinued = 0
	GROUP BY pd.product_id, pd.product_name, ca.category_name
	HAVING AVG(pd.units_in_stock)  > 0 AND 
	(SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100
	ORDER BY inventory_turnover DESC
	LIMIT 5;

SELECT 
	pd.product_id,
	pd.product_name,
	ca.category_name,
	ROUND(SUM(od.quantity * pd.unit_price)) AS COGS,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock))) AS inventory_turnover	
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	JOIN categories ca ON pd.category_id = ca.category_id
	WHERE oe.order_date IN (SELECT order_date FROM orders WHERE order_date BETWEEN '1996-07-04' AND '1997-07-03')
		AND ca.category_name IN ('Beverages', 'Condiments', 'Confections','Grains/Cereals', 'Produce' )
		AND pd.discontinued = 0
	GROUP BY pd.product_id, pd.product_name, ca.category_name
	HAVING AVG(pd.units_in_stock)  > 0 AND 
	(SUM(od.quantity * pd.unit_price) / AVG(pd.units_in_stock)) <= 100
	ORDER BY inventory_turnover DESC
	LIMIT 5;
		  
		  
SELECT 
	pd.product_id,
	pd.product_name,
	ROUND(AVG(pd.units_in_stock)) AS average_inventory,
	ROUND((SUM(od.quantity * pd.unit_price))/ 365) AS COGS,
	ROUND((AVG(pd.units_in_stock)) /(SUM(od.quantity * pd.unit_price) / 365)) AS DSI
	FROM products pd
	JOIN order_details od ON pd.product_id = od.product_id
	JOIN orders oe ON od.order_id = oe.order_id
	GROUP BY pd.product_id, pd.product_name
	HAVING AVG(pd.units_in_stock)  > 0
	ORDER BY DSI DESC
	LIMIT 5;
