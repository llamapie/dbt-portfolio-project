with source AS (
    SELECT * FROM {{ref('International_sale_Report')}}
),
renamed AS (
    SELECT
    "Style" AS style,
    "SKU" AS sku,
    "Size" AS product_size,
    "DATE" AS sale_date,
    "Months" AS sale_month,
    "CUSTOMER" AS customer_name,
    "PCS" AS pieces_sold,
    "RATE" AS price_per_piece,
    "GROSS AMT" AS gross_sale_amount
    FROM source
)
SELECT * FROM renamed