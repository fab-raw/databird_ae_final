WITH products_sold AS (

SELECT 
    store_id,
    product_id,
    SUM(item_quantity) AS total_items_sold,
    SUM(total_order_item_amount) AS total_sales_amount

FROM {{ ref('int_local_bike__order_items')}}

GROUP BY
    store_id,
    product_id
)

SELECT
    stocks.store_id,
    stocks.product_id,
    stocks.store_name,
    stocks.product_name,
    stocks.stock_quantity,
    products_sold.total_items_sold,
    products_sold.total_sales_amount

FROM {{ ref('int_local_bike__stocks')}} AS stocks
LEFT JOIN products_sold ON products_sold.store_id = stocks.store_id AND products_sold.product_id = stocks.product_id