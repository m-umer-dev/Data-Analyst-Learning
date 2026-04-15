SELECT
	c.name as customer_name,
    c.city,
    o.product,
    o.amount
from customers as c
INNER JOIN orders as o 
on c.customer_id = o.customer_id;

SELECT
	c.name as customer_name,
    o.product,
    o.amount
from customers as c
INNER JOIN orders as o 
on c.customer_id = o.customer_id
order by o.amount DESC;

SELECT
	c.name as customer_name,
    c.city,
    o.product,
    o.amount
from customers as c
INNER JOIN orders as o 
on c.customer_id = o.customer_id
order by o.amount DESC;

SELECT
	c.name as customer_name,
    count(o.order_id) as total_orders,
    SUM(o.amount) as total_spent
from customers as c
INNER JOIN orders as o
on c.customer_id = o.customer_id
GROUP by c.name
order by total_spent DESC;

SELECT
	c.name as customer_name,
    count(o.order_id) as total_orders,
    SUM(o.amount) as total_spent
from customers as c
INNER JOIN orders as o
on c.customer_id = o.customer_id
GROUP by c.name
having total_orders > 1
order by total_spent DESC;

SELECT
    c.name AS customer_name,
    c.city,
    o.product,
    o.amount
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

SELECT
    c.name AS customer_name,
    c.city,
    c.email
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT
    c.name AS customer_name,
    o.product,
    o.amount,
    o.order_date
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id;

SELECT
    o.order_id,
    o.product,
    o.amount
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL;

SELECT
    c.name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.name, c.city
ORDER BY total_spent DESC;