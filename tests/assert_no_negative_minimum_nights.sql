-- create dbt test to see that there are no negative values in column minimum_nights
select
    listing_id
from {{ ref('stg__listings') }}
where minimum_nights < 0