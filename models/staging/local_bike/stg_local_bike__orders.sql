select
    order_id,
    customer_id,
    order_status,
    DATETIME(order_date, "Europe/Paris") AS order_created_at,
    DATETIME(required_date, "Europe/Paris") AS delivery_expected_at,
    DATETIME(shipped_date, "Europe/Paris") AS order_shipped_at,
    store_id, 
    staff_id
from {{ source('local_bike', 'orders') }}