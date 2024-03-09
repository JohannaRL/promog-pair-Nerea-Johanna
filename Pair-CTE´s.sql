USE northwind;

SELECT * 
FROM customers;

-- Ejercicio 1--

WITH ClienteCompañia AS(
	SELECT customer_id, company_name
    FROM customers
)
SELECT customer_id, company_name
FROM ClienteCompañia;

-- Ejercicio 2--

WITH  ClienteCompañia AS(
	SELECT customer_id, company_name
    FROM customers
    WHERE country = 'Germany'
)
SELECT customer_id, company_name
FROM ClienteCompañia; 

-- Ejercicio 3 --

WITH Facturas AS(
	SELECT c.customer_id, c.company_name, o.order_id, o.required_date
    FROM customers AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
)
SELECT customer_id, company_name, order_id, required_date
FROM Facturas;

-- Ejercicio 4 --

WITH Facturas AS(
	SELECT c.customer_id, c.company_name, o.order_id, o.required_date
    FROM customers AS c
    JOIN orders AS o ON c.customer_id = o.customer_id
)
SELECT customer_id, company_name, COUNT(order_id) AS numero_facturas
FROM Facturas
GROUP BY customer_id, company_name;

-- Ejercicio 5 --

WITH cantidadMedia AS (
    SELECT od.product_id, SUM(od.quantity) AS TotalCantidad
    FROM order_details AS od
    GROUP BY od.product_id
)
SELECT p.product_name, AVG(cm.TotalCantidad) AS CantidadMediaPedida
FROM cantidadMedia as cm
JOIN products AS p ON cm.product_id = p.product_id
GROUP BY p.product_name;
