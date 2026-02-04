WITH sales AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__sales') }} 
), 
prod AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__product') }} 
)
SELECT 
    sales.date_date,
    sales.orders_id,
    sales.revenue,
    sales.quantity,
    sales.quantity * prod.purchase_price AS purchase_cost,
    sales.revenue-(sales.quantity * prod.purchase_price) AS margin
FROM prod
LEFT JOIN sales ON sales.pdt_id = prod.products_id