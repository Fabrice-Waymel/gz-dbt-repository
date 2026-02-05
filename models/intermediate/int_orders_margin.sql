WITH orders_margin AS (
    SELECT
        *
    FROM {{ ref('int_orders_margin') }}
)
SELECT
    orders_id,
    tot_margin,
    tot_purchase_cost
FROM orders_margin
group by orders_id