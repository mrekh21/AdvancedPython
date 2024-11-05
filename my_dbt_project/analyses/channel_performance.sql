select
    channel_name,
    total_sales_amount,
    total_transactions
from {{ ref('dm_channel_sales_summary') }}
order by total_sales_amount desc