with payment as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount, -- as the amount is in cents. So converting to dollars
        created as created_at
    from {{ source('stripe', 'payment') }}
)

select * from payment