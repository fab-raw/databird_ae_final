select
    staff_id,
    first_name,
    last_name,
    email, 
    phone,
    active AS is_active,
    store_id,
    cast(coalesce(manager_id, '0') as int) as manager_id -- cast(coalesce(manager_id,'-1') as int)
from {{ source('local_bike', 'staffs') }}