WITH sales_grouped_by_product AS(
    SELECT
        product_id,
        SUM(total_sales_amount) AS total_sales_amount,
        SUM(total_items_sold) AS total_items_sold 

    FROM {{ ref('mrt_operations__store_product_stock_summary') }} as oi

    GROUP BY product_id
)

SELECT
    products.product_id,
    products.product_name,
    products.category_name,
    products.brand_name,
    sales.total_sales_amount,
    sales.total_items_sold

FROM {{ ref('int_local_bike__products')}} AS products
LEFT JOIN sales_grouped_by_product AS sales ON sales.product_id = products.product_id