select
    staff_id,
    first_name,
    last_name,
    email, 
    phone,
    active AS is_active,
    store_id,
    manager_id -- quid d'un manager_id null ?
from {{ source('local_bike', 'staffs') }}