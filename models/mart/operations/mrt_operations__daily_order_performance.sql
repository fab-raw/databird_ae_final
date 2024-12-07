-- suivre les tendances de vente par temporalité, avec dimension date

SELECT
    order_date,
    city,
    state,
    COUNT(order_id) as total_orders,
    sum(total_order_amount) as total_order_amount,
    AVG(total_order_amount) as average_order_amount

FROM {{ ref('int_local_bike__orders')}}

GROUP by
    order_date,
    city,
    state