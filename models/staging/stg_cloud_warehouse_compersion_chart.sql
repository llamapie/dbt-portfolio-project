with source AS (
    SELECT * FROM {{ref('Cloud_Warehouse_Compersion_Chart')}}
),
renamed AS (
    SELECT
    "index" AS item_index,
    "Shiprocket"::numeric AS shiprocket,
    "Unnamed: 1" AS description_increff,
    "INCREFF"::numeric AS increff
    FROM source
)
SELECT * FROM renamed