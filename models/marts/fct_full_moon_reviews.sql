with reviews as (
    select * from {{ ref('i__reviews') }}
),
full_moon_dates as (
    select * from {{ ref('seed_full_moon_dates') }}
),
final as (
    select
    reviews.*,
    full_moon_dates.full_moon_date,
    case
        when full_moon_dates.full_moon_date is not null then true
        else false
    end as is_full_moon
    from reviews
    left join full_moon_dates
    on reviews.review_date = full_moon_dates.full_moon_date + interval '1 day'
)

select * from final