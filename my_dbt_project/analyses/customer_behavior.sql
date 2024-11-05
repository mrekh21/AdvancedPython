select
    customer_id,
    count(*) as purchases,
    max(amount) as max_purchase
from {{ ref('dm_customer_summary') }}
group by customer_id