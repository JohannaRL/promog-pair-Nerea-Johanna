USE northwind;

-- 1 -- Extraed los pedidos con el máximo "order_date" para cada empleado.
-- Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.

SELECT employee_id, order_id , order_date
FROM orders AS o1
WHERE o1.order_date = ( 
	SELECT MAX(o2.order_date)
    FROM orders AS o2
    WHERE o1.employee_id = o2.employee_id

);

-- 2 -- Extraed el precio unitario máximo (unit_price) de cada producto vendido.
-- Supongamos que ahora nuestro jefe quiere un informe de los productos vendidos y su precio unitario. De nuevo lo tendréis que hacer con queries correlacionadas.





-- 3 --Extraed información de los productos "Beverages"
-- En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.

SELECT p.category_id, p.product_name, p.product_id
FROM products AS p
INNER JOIN categories AS cat ON p.category_id = cat.category_id
WHERE cat.category_name = "Beverages";

-- 4 -- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país.
-- Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales

SELECT DISTINCT c.country
FROM customers AS c
WHERE NOT EXISTS (
	SELECT s.country
    FROM suppliers AS s
    WHERE c.country = s.country
    );
    
-- 5 -- Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
-- Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

SELECT o.order_id, o.customer_id
FROM orders AS o
INNER JOIN customers AS c ON c.customer_id = o.customer_id 
INNER JOIN order_details AS od ON o.order_id = od.order_id
WHERE od.product_id = '6' AND od.quantity > 20;

-- 6 --  Extraed los 10 productos más caros
-- Nos siguen pidiendo más queries correlacionadas. En este caso queremos saber cuáles son los 10 productos más caros.

SELECT product_name AS ten_expensive_prod, unit_price 
FROM products AS p 
WHERE (
	SELECT COUNT(*)
	FROM products AS p1 
	WHERE p.unit_price > p1.unit_price
	LIMIT 10)
ORDER BY unit_price DESC;


