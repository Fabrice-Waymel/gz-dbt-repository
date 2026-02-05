WITH margin AS (
    SELECT
        orders_id,
        purchase_cost
    FROM {{ ref('int_sales_margin') }}
)
SELECT
    sum(purchase_cost)
FROM margin

