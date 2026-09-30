  select
        id as order_id,
        customer as customer_id,
        ordered_at as order_date

    from {{ source('jaffle_shop', 'raw_orders') }}
