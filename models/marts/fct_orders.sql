{{ config(schema='marts') }}

with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

final as (
    select
        o.order_id,
        o.order_date,
        o.status,
        c.customer_id,
        c.full_name,
        c.email,
        p.product_id,
        p.product_name,
        p.category,
        o.quantity,
        p.price,
        o.quantity * p.price as total_amount
    from orders o
    left join customers c on o.customer_id = c.customer_id
    left join products p on o.product_id = p.product_id
)

select * from final
