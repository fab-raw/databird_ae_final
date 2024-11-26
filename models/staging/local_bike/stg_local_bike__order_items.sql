select
    CONCAT(order_id, '_', item_id) AS order_item_id,
    order_id,
    item_id,
    product_id,
    quantity, 
    list_price as unit_price,
    discount as discount_percentage,
    ROUND(((quantity * list_price) * discount), 2) as order_item_final_price
from {{ source('local_bike', 'order_items') }}