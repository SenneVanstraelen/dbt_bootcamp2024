with hosts as (
    select * from {{ ref('stg__hosts') }}
)

select
    host_id,
    coalesce(host_name, 'Anonymous') as host_name,
    is_superhost,
    updated_at
from hosts