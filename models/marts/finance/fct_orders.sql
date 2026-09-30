with payments as (

    select * from {{ ref('stg__stripe__payments') }}
),
orders as (
    select order_id, customer_id
    from {{ ref('stg__jaffle_shop__orders') }}
),

final as (
    select order_id, customer_id, sum(amount)
    from orders left join payments using (order_id)
    group by order_id, customer_id
)
select * from final