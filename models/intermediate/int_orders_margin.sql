WITH margin AS (
    SELECT
        *
    FROM {{ ref('int_sales_margin') }}
)
SELECT
    orders_id,
    sum(sales_margin) as tot_margin,
    sum(purchase_cost) as tot_purchase_cost
FROM margin
group by orders_id