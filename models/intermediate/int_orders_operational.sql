WITH margin AS ( 
    SELECT * 
    FROM {{ ref('int_sales_margin') }} 
)
select *
from margin