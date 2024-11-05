{{ config(materialized='table') }}
select
    product_id,
    name,
    sum(qty) as total_quantity_sold,
    sum(amount) as total_sales_amount
from {{ ref('stg_products') }}
left join {{ ref('stg_main') }} using(product_id)
group by product_id, name