{{ config(materialized='view') }}
select
    "date" as date,
    "reseller-id" as reseller_id,
    "productName" as product_name,
    "qty" as quantity,
    "totalAmount" as total_amount,
    "salesChannel" as sales_channel,
    "customer" as customer,
    "dateCreated" as date_created,
    "seriesCity" as series_city,
    "Created Date" as created_date
from {{ ref('raw_resellers_type2') }}