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

select 
    p.*,
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
from p 
LEFT JOIN sales on p.products_id = sales.pdt_id
LEFT JOIN ship on sales.orders_id = ship.orders_id

