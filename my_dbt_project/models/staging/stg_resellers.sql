{{ config(materialized='view') }}
select
    reseller_id,
    reseller_name,
    commission_pct
from {{ ref('raw_resellers') }}