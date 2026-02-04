with 
source as (
    select * from {{ source('raw', 'ship') }}
),
renamed as (
    select *
    from source
    where shipping_fee_1 <> shipping_fee
)
select * from renamed