with
    customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , salesreason as (
        select *
        from {{ ref('dim_salesreason') }}
    )

    , dim_address as (
        select *
        from {{ ref('dim_address') }}
    )

    , product as (
        select *
        from {{ ref('dim_product') }}
    )

    , creditcard as (
        select *
        from {{ ref('dim_creditcard') }}
    )

    , orderheader_with_sk as (
        select
            customer.customer_sk as customer_fk
            , customer.customername
            , salesreason.salesreasons
            , oh.creditcardid
            , oh.billtoaddressid
            , oh.salesorderid
            , oh.orderdate
            , oh.status
            , oh.subtotal
            , oh.taxamt
            , oh.freight
            , oh.totaldue

        from {{ ref('stg_salesorderheader') }} as oh
        left join salesreason on oh.salesorderid = salesreason.salesorderid
        left join customer on oh.customerid = customer.customerid
        
    )

    , orderdetail_with_sk as (
        select
            product.product_sk as product_fk
            , product.productname
            , od.salesorderid
            , od.salesorderdetailid
            , od.orderqty
            , od.unitprice
            , od.unitpricediscount
        from {{ ref('stg_salesorderdetail') }} as od
        left join product on od.productid = product.productid
    )

    , Orders as (
        select
            orderheader_with_sk.customer_fk
            , orderheader_with_sk.customername
            , orderheader_with_sk.salesreasons
            , orderheader_with_sk.salesorderid
            , orderheader_with_sk.orderdate
            , orderheader_with_sk.status
            , orderdetail_with_sk.salesorderdetailid
            , orderdetail_with_sk.product_fk
            , orderdetail_with_sk.productname
            , orderdetail_with_sk.orderqty
            , orderdetail_with_sk.unitprice
            , orderdetail_with_sk.unitpricediscount
            , orderheader_with_sk.subtotal
            , orderheader_with_sk.taxamt
            , orderheader_with_sk.freight
            , orderheader_with_sk.totaldue
            , dim_address.city
            , dim_address.statename
            , dim_address.countryname
            , creditcard.cardtype

        from orderheader_with_sk
        left join orderdetail_with_sk on orderheader_with_sk.salesorderid = orderdetail_with_sk.salesorderid
        left join dim_address on orderheader_with_sk.billtoaddressid = dim_address.addressid
        left join creditcard on orderheader_with_sk.creditcardid = creditcard.creditcardid
    )

select * from Orders