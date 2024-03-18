with 

source as (

    select * from {{ source('tasty_byte', 'TASTY_BYTE_SALES') }}

),

renamed as (

    select
        date,
        primary_city,
        menu_item_name,
        total_sold

    from source

)

select * from renamed
