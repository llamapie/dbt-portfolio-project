with source AS (
    SELECT * FROM {{ref('International_sale_Report')}}
),
renamed AS (
    SELECT
    "Style"::string AS style,
    "SKU"::string AS sku,
    "Size"::string AS product_size,
    strptime("Date", '%m-%d-%y')::date AS sale_date,
    "Months"::string AS sale_month,
    "CUSTOMER"::string AS customer_name,
    "PCS"::integer AS pieces_sold,
    "RATE"::float AS price_per_piece,
    "GROSS AMT"::float AS gross_sale_amount
    FROM source
)
SELECT * FROM renamed