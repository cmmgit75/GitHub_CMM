with
    source as (
        select
            /* Primary Key */
            productid	

            , productsubcategoryid	
            , productmodelid
            , sizeunitmeasurecode
            , weightunitmeasurecode	
            
            , name
            , productnumber	
            , sellenddate	
            , safetystocklevel	
            , finishedgoodsflag	
            , class	
            , makeflag	
            , reorderpoint	
            , standardcost	
            , style	
            , listprice	
            , daystomanufacture	
            , productline	
            , size		
            , color	
            , sellstartdate	
            , weight
            , modifieddate	
            , rowguid	

            /* Stitch Columns*/
            , _sdc_table_version
            , _sdc_received_at	
            , _sdc_sequence	
            , _sdc_batched_at	
            
        from {{ source('adventure_works_etl', 'product') }}
    )

    , source_new as (
        select
            row_number() over (order by productid) as product_sk
            , *
        from source
    )

select * from source_new