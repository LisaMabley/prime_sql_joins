-- Get all customers and their addresses.
SELECT customers.first_name, customers.last_name, addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type
FROM customers
RIGHT JOIN addresses
ON customers.id = addresses.customer_id;

-- Get all orders and their line items.
SELECT *
FROM line_items
RIGHT OUTER JOIN orders
ON line_items.order_id = orders.id;

-- Which warehouses have cheetos?
SELECT warehouse.warehouse
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT warehouse.warehouse
FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';

-- Get the number of orders for each customer.
-- NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(orders.id)
FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.last_name, customers.first_name;

-- How many customers do we have?
SELECT COUNT(*) FROM customers;

-- How many products do we carry?
SELECT COUNT(*) FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT sum(warehouse_product.on_hand)
FROM warehouse_product
JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi'
