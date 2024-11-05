{{ config(materialized='table') }}

with customer_sales as (
    select
        customer_id,
        count(transaction_id) as total_orders,
        sum(amount) as total_sales,
        avg(amount) as avg_order_value,
        max(amount) as max_order_value
    from {{ ref('stg_main') }}
    group by customer_id
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    cs.total_orders,
    cs.total_sales,
    cs.avg_order_value,
    cs.max_order_value
from {{ ref('stg_customers') }} c
left join customer_sales cs
on c.customer_id = cs.customer_id