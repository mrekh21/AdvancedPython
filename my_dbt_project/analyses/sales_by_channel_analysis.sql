select
    channel_name,
    total_sales,
    avg_order_value
from {{ ref('dm_channel_sales_summary') }}
order by total_sales desc
