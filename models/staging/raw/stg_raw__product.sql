with 
source as (
    select * from {{ source('raw', 'product') }}
),
renamed as (
    select 
        ALTER COLUMN purchSE_PRICE TYPE float64;
        purchSE_PRICE as purchase_price  
    from source
)
select * from renamed