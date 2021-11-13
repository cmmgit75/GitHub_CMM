WITH
    source AS (
    SELECT 
        /* primary key */
        salesreasonid
        
        , name
        , reasontype
        , modifieddate
        
        /* Stitch columns */
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','salesreason') }}
    )

SELECT * FROM source
