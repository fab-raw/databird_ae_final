select
    order_id,
    oi.customer_id,
    c.city,
    c.state,
    order_status,
    order_date,
    store_id,
    staff_id,
    sum(item_quantity) AS total_item_quantity,
    sum(total_order_item_amount) AS total_order_amount

FROM {{ ref('int_local_bike__order_items')}} oi
LEFT JOIN {{ ref('stg_local_bike__customers')}} AS c ON c.customer_id = oi.customer_id

group by
    order_id,
    oi.customer_id,
    city,
    state,
    order_status,
    order_date,
    store_id,
    staff_id