{{
    config(
        materialized='view'
    )
}}

with 

ref as (

    select * from {{ ref('fct_vancouver_sales') }}

),

renamed as (

    SELECT
        timestamp,
        total_sold
    FROM
        ref
    WHERE
        menu_item_name LIKE 'Lobster Mac & Cheese'

)

select * from renamed