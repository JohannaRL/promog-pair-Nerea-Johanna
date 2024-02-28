CREATE SCHEMA northwind;
USE northwind;

-- 4 --
SELECT employee_id, last_name, first_name
	FROM employees; 
    
-- 5 --

SELECT * 
FROM products 
WHERE unit_price BETWEEN 0 AND 5;

-- 6 --

SELECT * 
FROM products
WHERE unit_price IS NULL;

-- 7 --

SELECT * 
FROM products 
WHERE product_id < 10 AND unit_price < 15;

-- 8 --

SELECT * 
FROM products
WHERE NOT (product_id < 10 AND unit_price < 15);

-- 9 -- 

SELECT DISTINCT ship_country
	FROM orders;

-- 10 -- 

SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id
LIMIT 10;

-- 11 -- 
SELECT product_id, product_name, unit_price
FROM products
ORDER BY product_id DESC
LIMIT 10;

-- 12 -- 
SELECT DISTINCT order_id
FROM order_details;

-- 13 --

SELECT order_id,  SUM(unit_price * quantity) AS ImporteTotal
FROM order_details
GROUP BY order_id
ORDER BY ImporteTotal DESC
LIMIT 3; 

-- 14 -- 

SELECT order_id,  SUM(unit_price * quantity) AS ImporteTotal
FROM order_details
GROUP BY order_id
ORDER BY ImporteTotal DESC
LIMIT 5 OFFSET 4;

-- 15 -- 

SELECT category_name AS NombreDeCategoria 
FROM categories;
    
-- 16 -- 

SELECT order_id, 
    shipped_date, DATE_ADD(shipped_date, INTERVAL 5 DAY) AS FechaRetrasada
FROM 
    orders;
    
-- 17 --
SELECT *
FROM products
WHERE unit_price  BETWEEN 15 AND 50;

-- 18 -- 
SELECT *
FROM products
WHERE unit_price IN (18, 19, 20);
