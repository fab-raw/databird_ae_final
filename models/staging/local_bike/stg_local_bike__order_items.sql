select
    CONCAT(order_id, '_', item_id) AS order_item_id,
    order_id,
    item_id,
    product_id,
    quantity AS item_quantity, 
    list_price as item_price,
    discount as discount_percentage,
    ROUND(quantity * (list_price * (1 -discount)), 2) as total_order_item_amount
from {{ source('local_bike', 'order_items') }}