with cte as (
    SELECT
        listing_id,
        listing_name,
        listing_url,
        {{ slash_to_or('room_type') }} as room_type,
        minimum_nights,
        host_id,
        price_str,
        created_at,
        updated_at
    FROM {{ ref('stg__listings') }}
)

select * from cte




