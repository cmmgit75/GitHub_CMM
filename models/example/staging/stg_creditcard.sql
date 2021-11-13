with
    source as (
        select 
            /*Primary Key*/
            creditcardid	
            , cardtype		
            , expmonth	
            , expyear	
            , modifieddate	

            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at

        from {{ source('adventure_works_etl', 'creditcard') }}
    )

    , source_new as (
        select
            row_number() over (order by creditcardid) as creditcard_sk
            , *
        from source
    )

select * from source_new