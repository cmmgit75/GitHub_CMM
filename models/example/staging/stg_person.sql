WITH
    source AS (
    SELECT 
        /* primary key */
        businessentityid
        , title
        , CONCAT(firstname,' ', lastname) as fullname
        , firstname
        , middlename
        , lastname
        , persontype
        , namestyle
        , suffix
        , modifieddate
        , rowguid
        , emailpromotion
        
        /* Stitch columns */
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','person') }}
    )

SELECT * FROM source