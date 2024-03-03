USE northwind;

-- 1 -- 

SELECT c.company_name , c.customer_id,  COUNT(ord.order_id) AS num_pedidos
FROM customers AS c
INNER JOIN orders AS ord
ON c.customer_id = ord.customer_id
WHERE country = "UK"
GROUP BY c.company_name, c.customer_id

-- 2 --  Nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins.

SELECT c.company_name , YEAR(ord.order_date) AS year, SUM(od.quantity) AS cantidad_objetos
FROM orders AS ord
INNER JOIN customers AS c ON c.customer_id = ord.customer_id
INNER JOIN order_details AS od ON ord.order_id = od.order_id
INNER JOIN products AS p ON od.product_id = p.product_id
WHERE c.country = "UK"
GROUP BY c.company_name,YEAR(ord.order_date);

-- 3 -- Mejorad la query anterior: misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc. Ojo que los descuentos en nuestra tabla nos salen en porcentajes, 15% nos sale como 0.15.

SELECT c.company_name , YEAR(ord.order_date) AS year, SUM(od.quantity) AS cantidad_objetos, SUM(od.quantity* od.unit_price* (1- od.discount)) AS dinero_total
FROM orders AS ord
INNER JOIN customers AS c ON c.customer_id = ord.customer_id
INNER JOIN order_details AS od ON ord.order_id = od.order_id
INNER JOIN products AS p ON od.product_id = p.product_id
WHERE c.country = "UK"
GROUP BY c.company_name,YEAR(ord.order_date);


-- 6 --Qué empresas tenemos en la BBDD Northwind:
-- Lo primero que queremos hacer es obtener una consulta SQL que nos devuelva el nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.

SELECT c.company_name, o.order_id, o.order_date
FROM customers AS C
INNER JOIN orders AS o ON c.customer_id = o.customer_id;

-- 7-- Pedidos por cliente de UK:
-- Desde la oficina de Reino Unido (UK) nos solicitan información acerca del número de pedidos que ha realizado cada cliente del propio Reino Unido de cara a conocerlos mejor y poder adaptarse al mercado actual. Especificamente nos piden el nombre de cada compañía cliente junto con el número de pedidos

SELECT c.company_name, COUNT(o.order_id) AS NumeroPedidos
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
WHERE c.country = 'UK'
GROUP BY c.company_name;

-- 8-- Empresas de UK y sus pedidos:
-- También nos han pedido que obtengamos todos los nombres de las empresas cliente de Reino Unido (tengan pedidos o no) junto con los ID de todos los pedidos que han realizado y la fecha del pedido.

SELECT c.company_name AS NombreCliente, o.order_id, o.order_date AS FechaPedido
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
WHERE c.country = 'UK';

-- 9-- SELF JOIN no funciona - Join = Inner Join, o Left Join funciona. Todos los datos estan en la misma tabla. 
-- Ejercicio de SELF JOIN: Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, ¿sabes decir quién es el director?
-- Director Andrew -- 

SELECT e1.city AS ciudad, e1.first_name AS nombre_empleada, e1.last_name AS apellido_empleada,
       e2.city AS ciudad_jefx, e2.first_name AS nombre_jefx, e2.last_name AS apellido_jefx
FROM employees AS e1
JOIN employees AS e2 ON e1.reports_to = e2.employee_id;

-- BONUS --Pendientes 