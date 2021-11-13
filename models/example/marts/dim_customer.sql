with
    customerinfo as (
        select
            customer_sk
            , customerid
        from {{ ref('stg_customer') }}
    )

    , personinfo as (
        select
            businessentityid
            , fullname
        from {{ ref('stg_person') }}
    )

    , source as (
        select
            customerinfo.customer_sk
            , customerinfo.customerid
            , personinfo.businessentityid
            , personinfo.fullname as customername
        
        from customerinfo
        left join personinfo on customerinfo.customerid = personinfo.businessentityid
    )

select * from source