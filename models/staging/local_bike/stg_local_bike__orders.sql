select
    order_id,
    customer_id,
    order_status,
    order_date,
    required_date,
    --- DATE(coalesce(shipped_date, '1900-01-01')) AS order_shipped_at,
    CASE WHEN shipped_date = 'NULL' THEN null ELSE shipped_date END AS shipped_date,
    store_id, 
    staff_id
from {{ source('local_bike', 'orders') }}