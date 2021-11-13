with
    addressinfo as (
        select
            addressid
            , stateprovinceid	
            , city
        from {{ ref('stg_address') }}
    )

 , countryinfo as (
        select
            countryregioncode
            , name as countryname
        from {{ ref('stg_countryregion') }}
    )
    , stateinfo as (
        select 
            stateprovinceid
            , countryregioncode
            , name as statename
        from {{ ref('stg_stateprovince') }}
    )

    , source as (
        select
            addressinfo.addressid
            , addressinfo.city
            , stateinfo.stateprovinceid
            , stateinfo.statename
            , countryinfo.countryregioncode
            , countryinfo.countryname
        
        from stateinfo
        left join addressinfo on stateinfo.stateprovinceid = addressinfo.stateprovinceid
        left join countryinfo on stateinfo.countryregioncode = countryinfo.countryregioncode
    )

select * from source