WITH
    source AS (
    SELECT 
        countryregioncode
        , name
        , modifieddate

        /* Stitch Columns*/
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','countryregion') }}
    )

SELECT * FROM source