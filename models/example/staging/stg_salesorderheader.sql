with
    source as (
        select
            /* Primary Key */
            salesorderid

            , customerid	
            , salespersonid	
            , territoryid
            , billtoaddressid	
            , shiptoaddressid
            , shipmethodid	
            , currencyrateid 
            , creditcardid
	        , orderdate	
            , freight	
            , duedate	
            , totaldue	
            , shipdate	
            , revisionnumber
            , status	
            , onlineorderflag	
            , purchaseordernumber	
            , accountnumber	
            , creditcardapprovalcode	
            , subtotal	
            , taxamt	
            , rowguid	
            , modifieddate

            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at	

        from {{ source('adventure_works_etl', 'salesorderheader') }}
    )

    , source_new as (
        select
            row_number() over (order by salesorderid) as orderheader_sk
            , *
        from source
    )

select * from source_new