{{ config(materialized='table') }}
select * from {{ source('sales_data', 'resellers_type2') }}