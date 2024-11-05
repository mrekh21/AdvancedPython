select
    customer_id,
    first_name,
    last_name,
    total_sales,
    total_orders
from {{ ref('dm_customer_summary') }}
order by total_sales desc
limit 10
