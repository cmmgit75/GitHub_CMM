with
    source as (
        select 
            /* Primary Key */
            salesorderdetailid

            , salesorderid
            , productid
            , specialofferid
	
            , orderqty			
            , unitprice	
            , unitpricediscount	
            , carriertrackingnumber
            , rowguid	
            , modifieddate

            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at	

        from {{ source('adventure_works_etl', 'salesorderdetail') }}
    )

    , source_new as (
        select
            row_number() over (order by salesorderdetailid) as orderdetail_sk
            , *
        from source
    )

select * from source_new