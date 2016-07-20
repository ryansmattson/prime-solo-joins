-- 1. Get all customers and their addresses.
SELECT * FROM customers LEFT OUTER JOIN addresses ON customers.id = addresses.customer_id;

or

SELECT * FROM customers INNER JOIN addresses ON customers.id = addresses.customer_id;


-- 2. Get all orders and their line items.
SELECT * FROM orders LEFT OUTER JOIN line_items ON orders.id = line_items.order_id;


-- 3. Which warehouses have cheetos?
SELECT products.description, warehouse.warehouse FROM products LEFT OUTER
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';


-- 4. Which warehouses have diet pepsi?
SELECT products.description, warehouse.warehouse FROM products LEFT OUTER
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT * FROM orders INNER JOIN addresses ON orders.address_id = addresses.customer_id
JOIN customers ON addresses.customer_id = customers.id;


-- 6. How many customers do we have?
SELECT count(*) FROM customers;


-- 7. How many products do we carry?
SELECT count(*) FROM products;


-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT sum(wp.on_hand) FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
WHERE p.description = 'diet pepsi';
