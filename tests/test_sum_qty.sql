WITH
    validacao AS (
        SELECT sum(orderqty) as qte_total
        FROM {{ ref('fact_orders') }}
    )

SELECT * FROM validacao where qte_total != 274914