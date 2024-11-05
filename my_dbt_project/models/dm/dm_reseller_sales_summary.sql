{{ config(materialized='table') }}
select
    reseller_id,
    reseller_name,
    sum(total_amount) as total_sales_amount,
    count(transaction_id) as total_transactions
from {{ ref('stg_resellers') }}
left join {{ ref('stg_resellers_type1') }} using(reseller_id)
group by reseller_id, reseller_name