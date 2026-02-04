WITH sales AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__sales') }} 
), 
ship AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__ship') }} 
),
p AS ( 
    SELECT * 
    FROM {{ ref('stg_raw__product') }} 
)
SELECT 
    sales.date_date,
    sales.orders_id,
    sales.revenue,
    sales.quantity,
    ship.shipping_fee,
    ship.logcost,
    ship.ship_cost,
    -- purchase_cost = quantity * purchase_price 
    sales.quantity * p.purchase_price AS purchase_cost, 
    -- margin = revenue - purchase_cost 
    sales.revenue - (sales.quantity * p.purchase_price) AS margin

FROM sales
LEFT JOIN p ON sales.pdt_id = p.products_id
LEFT JOIN ship ON sales.orders_id = ship.orders_id;