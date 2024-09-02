with listings as (
    select * from {{ ref('stg__listings') }}
)

select
    listing_id,
    listing_name,
    room_type,
    case
        when minimum_nights = 0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    REPLACE(price_str, '$', '')::numeric as price,
    created_at,
    updated_at
from listings