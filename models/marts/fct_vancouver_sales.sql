{{
    config(
        materialized='table'
    )
}}

with 

ref as (

    select * from {{ ref('stg_tasty_byte__TASTY_BYTE_SALES') }}

),

renamed as (

    SELECT
        to_timestamp_ntz(date) AS timestamp,
        primary_city,
        menu_item_name,
        total_sold
    FROM
        ref
    WHERE
        date > (SELECT max(date) - interval '1 year' FROM ref)
    GROUP BY
        all

)

select * from renamed