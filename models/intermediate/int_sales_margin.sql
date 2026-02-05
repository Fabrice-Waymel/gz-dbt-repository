WITH sales AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__sales') }} 
), 
prod AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__product') }} 
)
SELECT 
    sales.date_date as date_date,
    sales.orders_id as orders_id,
    sales.revenue as revenue,
    sales.quantity as quantity,
    sales.quantity * prod.purchase_price AS purchase_cost,
    sales.revenue-(sales.quantity * prod.purchase_price) AS sales_margin
FROM prod
LEFT JOIN sales ON sales.pdt_id = prod.products_id