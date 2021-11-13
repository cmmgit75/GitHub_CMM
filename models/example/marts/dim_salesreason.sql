with 
    reasoninfo as (
        select
            salesreasonid
            , reasontype
            , name as reasonname
        from {{ ref('stg_salesreason') }}    
    )
    
    , salesreasoninfo as (
        select 
            salesorderid
            , salesreasonid
	    from {{ ref('stg_salesorderheadersalesreason') }}
    )
    
    , reasonperorder as (
        select
            reasoninfo.salesreasonid
            , reasoninfo.reasontype
            , reasoninfo.reasonname
            , salesreasoninfo.salesorderid
        from reasoninfo
        left join salesreasoninfo on reasoninfo.salesreasonid = salesreasoninfo.salesreasonid
        where salesorderid is not Null
    )
    
    , source as (
        select
            salesorderid,
            STRING_AGG(reasonname, ', ') as salesreasons
        from reasonperorder
        group by salesorderid
    )

select * from source