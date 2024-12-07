SELECT
    stocks.stock_id,
    stocks.store_id,
    stores.store_name,
    stocks.product_id,
    stocks.stock_quantity,
    products.product_name

FROM {{ ref('stg_local_bike__stocks')}} AS stocks
LEFT JOIN {{ ref('stg_local_bikes__stores')}} AS stores ON stores.store_id = stocks.store_id
LEFT JOIN {{ ref('stg_local_bike__products')}} AS products ON products.product_id = stocks.product_id