WITH sales_margin AS ( 
    SELECT * 
    FROM {{ ref('int_orders_operational') }} 
)
SELECT *
FROM sales_margin;

