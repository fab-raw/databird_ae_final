SELECT
    customer_id,
    city,
    state, 
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) AS total_order_amount, 
    AVG(total_order_amount) AS avg_order_amount,
    DATE_DIFF(DATE(MAX(order_date)), DATE(MIN(order_date)), DAY) /365.0 AS customer_lifespan

FROM {{ ref('int_local_bike__orders')}} 

GROUP BY
    customer_id,
    city,
    state