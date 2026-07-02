with source AS (
    SELECT * FROM {{ref('Sale_Report')}}
),
renamed AS (
    SELECT
    "SKU Code" AS sku_code,
    "Design No." AS design_no,
    "Stock" AS stock,
    "Category" AS category,
    "Size" AS product_size,
    "Color" AS color
    FROM source
)
SELECT * FROM renamed