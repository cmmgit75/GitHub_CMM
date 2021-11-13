WITH
    source AS (
    SELECT 
        /* primary key */
        stateprovinceid
        , territoryid
        , countryregioncode
        
        , modifieddate
        , rowguid
        , name
        , isonlystateprovinceflag
        , stateprovincecode
    
        /* Stitch columns */
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','stateprovince') }}
    )

SELECT * FROM source
