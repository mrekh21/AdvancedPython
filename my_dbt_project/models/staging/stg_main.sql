{{ config(materialized='view') }}
select
    transaction_id,
    customer_id,
    product_id,
    amount,
    qty,
    channel_id,
    bought_date
from {{ ref('raw_main') }}

