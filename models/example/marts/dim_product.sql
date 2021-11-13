with
    source as (
        select
            product_sk
            , productid	
            , name as productname	
        from {{ ref('stg_product') }}
    )

select * from source