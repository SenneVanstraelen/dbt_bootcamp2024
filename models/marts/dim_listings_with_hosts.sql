with listings as (
    select * from {{ ref('i__listings') }}
),
hosts as (
    select * from {{ ref('i__hosts') }}
),
final as (
    select
    listings.*,
    hosts.host_name,
    hosts.is_superhost
    from listings
    left join hosts
    on listings.host_id = hosts.host_id
)
select * from final