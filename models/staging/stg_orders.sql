{{ config(schema='staging') }}

with source as (
    select * from {{ source('raw', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        product_id,
        quantity,
        order_date,
        status,
        is_completed
    from source
)

select * from renamed
