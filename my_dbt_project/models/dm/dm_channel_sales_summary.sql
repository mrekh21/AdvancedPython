{{ config(materialized='table') }}
select
    channel_id,
    channel_name,
    sum(amount) as total_sales_amount,
    count(transaction_id) as total_transactions
from {{ ref('stg_channels') }}
left join {{ ref('stg_main') }} using(channel_id)
group by channel_id, channel_name