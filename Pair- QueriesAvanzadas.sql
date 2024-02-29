USE northwind;

SELECT 
	MIN(unit_price) AS lowestPrice,
    MAX(unit_price) AS highestPrice
FROM products;

SELECT
	COUNT(*) AS 'totalProductos',
    AVG(unit_price) AS 'precioMedio'
    FROM products;
    
    SELECT
		MAX(freight) AS 'maxCarga',
        MIN(freight) AS 'minCarga'
	FROM orders
    WHERE ship_country = 'UK';
    
    SELECT AVG(unit_price) AS 'PrecioMedio'
	FROM products;
    
    SELECT product_name, unit_price
    FROM products
    WHERE unit_price > (SELECT AVG(unit_price) FROM products)
    ORDER BY unit_price DESC;

    SELECT COUNT(*) AS 'ProductoDescontinuado'
    FROM products
    WHERE discontinued = 1;
    
    SELECT product_id, product_name, discontinued
    FROM products
    WHERE discontinued = 0
    ORDER BY product_id DESC
    LIMIT 10;
    
    SELECT employee_id,
		COUNT(*) AS 'NumPedidos',
        MAX(freight) AS maxCarga
	FROM orders
    GROUP BY employee_id;
    
    SELECT employee_id,
		COUNT(*) AS NumPedidos
	FROM  orders
    WHERE shipped_date IS NOT NULL
    GROUP BY employee_id
    ORDER BY employee_id;
    
    
    SELECT 
		DAY(order_date) AS Dia, 
        MONTH(order_date) AS Mes, 
        YEAR(order_date) AS Año,
		COUNT(*) AS TotalPedidos
	FROM orders
    GROUP BY  DAY(order_date), MONTH(order_date), YEAR(order_date);
    
    SELECT 
		MONTH(order_date) AS Mes, 
        YEAR(order_date) AS Año,
		COUNT(*) AS TotalPedidos
	FROM orders
	GROUP BY MONTH(order_date), YEAR(order_date);
    
    SELECT city,
		COUNT(*) AS NumEmpleadas
	FROM employees
    GROUP BY city
    HAVING COUNT(*) >= 4;


SELECT 
    order_id,
    SUM(unit_price * quantity) AS total_cantidad,
    CASE
        WHEN SUM(unit_price * quantity) >= 2000 THEN 'Alto'
        ELSE 'Bajo'
    END AS CantidadMonetaria
FROM order_details
GROUP BY order_id;


   
        