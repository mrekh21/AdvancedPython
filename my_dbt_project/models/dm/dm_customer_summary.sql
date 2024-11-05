{{ config(materialized='table') }}
select
    customer_id,
    concat(first_name, ' ', last_name) as full_name,
    count(transaction_id) as total_transactions,
    sum(amount) as total_spent
from {{ ref('stg_customers') }}
left join {{ ref('stg_main') }} using(customer_id)
group by customer_id, full_name