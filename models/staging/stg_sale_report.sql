with source AS (
    SELECT * FROM {{ref('Sale_Report')}}
),
renamed AS (
    SELECT
    "SKU Code"::string AS sku_code,
    "Design No."::string AS design_no,
    "Stock"::integer AS stock,
    "Category"::string AS category,
    "Size"::string AS product_size,
    "Color"::string AS color
    FROM source
)
SELECT * FROM renamed