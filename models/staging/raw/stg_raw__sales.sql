with 
source as (
    select * from {{ source('raw', 'sales') }}
),
renamed as (
    select *
    from source
)
select
    date_date, orders_id, pdt_id as products_id, revenue, quantity
from renamed