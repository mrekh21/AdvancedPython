{{ config(materialized='table') }}

with product_sales as (
    select
        product_id,
        count(transaction_id) as total_orders,
        sum(amount) as total_sales,
        avg(amount) as avg_sales_value,
        max(amount) as max_sales_value
    from {{ ref('stg_main') }}
    group by product_id
)

select
    p.product_id,
    p.name as product_name,
    p.city as product_city,
    p.price as product_price,
    ps.total_orders,
    ps.total_sales,
    ps.avg_sales_value,
    ps.max_sales_value
from {{ ref('stg_products') }} p
left join product_sales ps
on p.product_id = ps.product_id