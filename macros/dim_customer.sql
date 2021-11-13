/* Aqui é criada a 'Dimensão Customers'com os dados da tabela Costumers */
WITH
    selected AS (
    SELECT
        customerid
        , personid
        , territoryid
        , storeid
        , modifieddate
        , rowguid

    FROM {{ ref('stg_customer') }}
    )
    , transformed as (
        SELECT 
            row_number() over (order by customerid) as customer_sk
            , *
        from selected
    )

    SELECT * 
    FROM transformed