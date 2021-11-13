with
    source as (
        select
            /* Primary Key */
            addressid
            , stateprovinceid
            , addressline1	
            , addressline2	
            , city		
            , postalcode	
            , spatiallocation	
            , rowguid	
            , modifieddate

            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at	

        from {{ source('adventure_works_etl', 'address') }}
    )

select * from source