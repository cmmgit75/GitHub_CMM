with
    source as (
        select
            /* Primary Key */
            customerid
            , territoryid	
            , personid
            , storeid	
            , rowguid			
            , modifieddate	
            
            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at	
            
        from {{ source('adventure_works_etl', 'customer') }}
    )

    , source_new as (
        select
            row_number() over (order by customerid) as customer_sk
            , *
        from source
    )

select * from source_new