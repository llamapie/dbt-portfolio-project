with source AS (
    SELECT * FROM {{ref('Expense_IIGF')}}
),
renamed AS (
    SELECT
    "Recived Amount"::numeric AS received_date,
    "Unnamed: 1" AS received_amount
    FROM source
    WHERE "Recived Amount" NOT IN ('Particular', 'Total')
    AND "Recived Amount" IS NOT NULL
)
SELECT * FROM renamed