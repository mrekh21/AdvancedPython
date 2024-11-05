{{ config(materialized='table') }}

with channel_sales as (
    select
        channel_id,
        count(transaction_id) as total_orders,
        sum(amount) as total_sales,
        avg(amount) as avg_order_value,
        max(amount) as max_order_value
    from {{ ref('stg_main') }}
    group by channel_id
)

select
    ch.channel_id,
    ch.channel_name,
    cs.total_orders,
    cs.total_sales,
    cs.avg_order_value,
    cs.max_order_value
from {{ ref('stg_channels') }} ch
left join channel_sales cs
on ch.channel_id = cs.channel_id