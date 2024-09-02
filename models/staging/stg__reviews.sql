with raw_reviews as (
	select * from raw.airbnb__reviews
),
final as (
    select
        listing_id,
        date as review_date,
        reviewer_name,
        comments as review_text,
        sentiment as review_sentiment
    from
	    raw_reviews
)

select * from final