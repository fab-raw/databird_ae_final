select
    order_id,
    customer_id,
    order_status,
    order_date AS order_created_at,
    required_date AS delivery_expected_at,
    DATE(coalesce(shipped_date, '1900-01-01') AS order_shipped_at,
    store_id, 
    staff_id
from {{ source('local_bike', 'orders') }}