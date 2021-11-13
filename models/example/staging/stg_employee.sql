WITH
    source AS (
    SELECT 
        /* primary key */
        id
        , businessentityid
        , loginid
        
        , birthdate
        , gender
        , nationalidnumber
        , sickleavehours
        , currentflag
        , modifieddate
        , rowguid
        , hiredate
        , salariedflag
        , maritalstatus
        , organizationnode
        , vacationhours
        , jobtitle
    
        /* Stitch columns */
        , __sdc_primary_key
        , _sdc_sequence
        , _sdc_table_version
        , _sdc_batched_at
        , _sdc_received_at

    FROM {{ source('adventure_works_etl','e') }}
    )

SELECT * FROM source
