with source AS (
    SELECT * FROM {{ref('Expense_IIGF')}}
),
renamed AS (
    SELECT
    "Expance" AS expense_description,
    "Unnamed: 3" AS expense_amount
    FROM source
    WHERE "Expance" NOT IN ('Particular', 'Pending Amount', 'Total')
    AND "Expance" IS NOT NULL
)
SELECT * FROM renamed