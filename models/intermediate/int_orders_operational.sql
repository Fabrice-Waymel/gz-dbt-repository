WITH margin AS (
    SELECT
        *
    FROM {{ ref('int_orders_margin') }}
),
ship AS (
    SELECT
        *
    FROM {{ ref('stg_raw__ship') }}
)

SELECT
    margin.orders_id as orders_id,
    margin.tot_margin as tot_margin,
    margin.tot_purchase_cost as tot_purchase_cost,
    margin.tot_margin + sum(ship.shipping_fee - ship.logcost - ship.ship_cost) as operational_margin
FROM margin
left join ship on margin.orders_id = ship.orders_id
group by orders_id,tot_margin,tot_purchase_cost