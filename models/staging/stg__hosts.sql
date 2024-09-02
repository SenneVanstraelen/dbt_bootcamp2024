with raw_hosts as (
	select * from raw.airbnb__hosts
),
final as (
	select
		id as host_id,
		name as host_name,
		is_superhost,
		created_at
		updated_at
	from
		raw_hosts
)

select * from final