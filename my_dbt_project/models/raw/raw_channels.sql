{{ config(materialized='table') }}
select * from {{ source('sales_data', 'channels') }}