WITH
    source AS (
        SELECT 
        /* primary key */
        businessentityid
        , territoryid
        
        , salesquota
        , modifieddate
        , rowguid
        , saleslastyear
        , commissionpct
        , bonus
        , salesytd
    
        /* Stitch columns */
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','salesperson') }}
    )

SELECT * FROM source
