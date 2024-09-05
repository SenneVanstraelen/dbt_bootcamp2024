-- query with Jinja

{% set sentiment_types = ['negative', 'neutral', 'positive'] -%}

with reviews as (
    select * from {{ ref('i__reviews') }}
),

final as (
    select
        listing_id,
        {% for sentiment_type in sentiment_types -%}
            sum(case when review_sentiment = '{{ sentiment_type }}' then 1 else 0 end) as {{ sentiment_type }}_amount

        {%- if not loop.last -%}
            ,
        {% endif -%}
        {% endfor %}
    from reviews
    group by 1
)

select * from final


-- -- query without Jinja
-- with reviews as (
--     select * from {{ ref('i__reviews') }}
-- ),

-- final as (
--     select
--         listing_id,
--         sum(case when review_sentiment = 'negative' then 1 else 0 end) as negative_amount,
--         sum(case when review_sentiment = 'neutral' then 1 else 0 end) as neutral_amount,
--         sum(case when review_sentiment = 'positive' then 1 else 0 end) as positive_amount
--     from reviews
--     group by 1
-- )

-- select * from final
