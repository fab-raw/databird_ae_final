select 
    order_item_id,
    oi.order_id,
    product_id,
    quantity, 
    unit_price,
    discount_percentage,
    order_item_final_price,
    customer_id,
    order_status,
    order_created_at,
    delivery_expected_at,
    order_shipped_at
from
{{ ref('stg_local_bike__order_items') }} AS oi
INNER JOIN
{{ ref('stg_local_bike__orders') }} AS o
ON oi.order_id = o.order_id