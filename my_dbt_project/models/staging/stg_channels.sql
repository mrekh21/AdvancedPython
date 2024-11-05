{{ config(materialized='view') }}
select
    channel_id,
    channel_name
from {{ ref('raw_channels') }}