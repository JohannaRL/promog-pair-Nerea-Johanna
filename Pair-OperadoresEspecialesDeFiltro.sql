USE northwind;

SELECT  'Hola!'  AS tipo_nombre
FROM customers;

SELECT city, company_name, contact_name
FROM customers
WHERE city
LIKE 'A%' OR city LIKE 'B%';

SELECT c.city, c.company_name, c.contact_name, COUNT(order_id) AS PedidosTotales
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
WHERE c.city LIKE 'L%'
GROUP BY c.city, c.company_name, c.contact_name;

SELECT contact_name, company_name, contact_title
FROM customers
WHERE contact_title NOT LIKE '%sales%';

SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_A&';

SELECT city, company_name, contact_name, 'customers' AS Relationship
FROM customers
UNION 
SELECT city, company_name, contact_name, 'suppliers' AS Relationship
FROM suppliers;

SELECT *
FROM categories
WHERE description LIKE '%sweet%' AND description LIKE '%Sweet%';

SELECT contact_name AS NombreCompleto
FROM customers
UNION
SELECT CONCAT(last_name, ' ', first_name) AS NombreCompleto
FROM employees;

