WITH margin AS (
    SELECT *
    FROM {{ ref('int_orders_margin') }}
),
ship AS (
    SELECT *
    FROM {{ ref('stg_raw__ship') }}
)

SELECT
    margin.orders_id AS orders_id,
    margin.date_date AS date_date,
    margin.margin AS tot_margin,
    margin.revenue AS revenue,
    margin.quantity AS quantity,
    margin.purchase_cost AS purchase_cost,
    margin.margin + (ship.shipping_fee - ship.logcost - ship.ship_cost) AS operational_margin
FROM margin
LEFT JOIN ship
    ON margin.orders_id = ship.orders_id
