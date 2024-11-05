{{ config(materialized='table') }}

with reseller_sales as (
    select
        reseller_id,
        count(transaction_id) as total_orders,
        sum(total_amount) as total_sales,
        avg(total_amount) as avg_sales_value,
        max(total_amount) as max_sales_value
    from {{ ref('stg_resellers_type1') }}
    group by reseller_id
)

select
    r.reseller_id,
    r.reseller_name,
    r.commission_pct,
    rs.total_orders,
    rs.total_sales,
    rs.avg_sales_value,
    rs.max_sales_value
from {{ ref('stg_resellers') }} r
left join reseller_sales rs
on r.reseller_id = rs.reseller_id