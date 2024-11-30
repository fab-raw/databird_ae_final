select 
    oi.order_id,
    oi.order_item_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.store_id,
    o.staff_id,
    oi.product_id,
    item_quantity, 
    item_price,
    discount_percentage,
    total_order_item_amount,
FROM {{ ref('stg_local_bike__order_items') }} AS oi
LEFT JOIN {{ ref('stg_local_bike__orders') }} AS o ON oi.order_id = o.order_id