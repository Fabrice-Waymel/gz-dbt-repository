WITH margin AS (
    SELECT
        *
    FROM {{ ref('int_sales_margin') }}
)
SELECT
    orders_id,
    date_date,
    sum(revenue) as revenue,
    sum(quantity) as quantity,
    sum(sales_margin) as margin,
    sum(purchase_cost) as purchase_cost
FROM margin
group by orders_id,date_date