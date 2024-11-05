{{ config(materialized='view') }}
select
    name,
    city,
    price,
    product_id,
from {{ ref('raw_products') }}