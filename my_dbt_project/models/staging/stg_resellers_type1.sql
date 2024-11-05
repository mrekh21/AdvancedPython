{{ config(materialized='view') }}
select
    "Product Name" as product_name,
    "Quantity" as quantity,
    "Total amount" as total_amount,
    "Sales Channel" as sales_channel,
    "Customer First Name" as customer_first_name,
    "Customer Last Name" as customer_last_name,
    "Customer Email" as customer_email,
    "Series City" as series_city,
    "Created Date" as created_date,
    "Reseller ID" as reseller_id,
    "Transaction ID" as transaction_id
from {{ ref('raw_resellers_type1') }}