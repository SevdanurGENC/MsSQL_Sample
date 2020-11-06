select * from sales.orders
where customer_id = 5

SELECT
    customer_id,
    YEAR (order_date),
    COUNT (order_id) order_count
FROM
    sales.orders
GROUP BY
    customer_id,
    YEAR (order_date)
HAVING
    COUNT (order_id) >= 2
ORDER BY
    customer_id;


select * from sales.order_items
SELECT
    order_id,
    SUM(quantity * list_price * (1 - discount)) net_value
FROM
    sales.order_items
GROUP BY
    order_id
HAVING
    SUM(quantity * list_price * (1 - discount)) > 20000
ORDER BY
    net_value;



select * from production.products
SELECT
    category_id, 
    MAX (list_price) max_list_price,
    MIN (list_price) min_list_price
FROM
    production.products
GROUP BY
    category_id
HAVING
    MAX (list_price) > 4000 OR MIN (list_price) < 500;


select * from production.products
SELECT
    category_id,
    AVG (list_price) avg_list_price
FROM
    production.products
GROUP BY
    category_id
HAVING
    AVG (list_price) BETWEEN 500 AND 1000