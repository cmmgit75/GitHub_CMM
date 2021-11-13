with
    source as (
        select
            creditcard_sk
            , creditcardid	
            , cardtype	
            , expmonth	
            , expyear	
            , modifieddate		

        from {{ ref('stg_creditcard') }}
    )

select * from source