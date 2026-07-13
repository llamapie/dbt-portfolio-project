with source AS (
    SELECT * FROM {{ref('May_2022')}}
),
renamed AS (
    SELECT
    "Sku"::string AS sku,
    "Style Id" AS style_id,
    "Catalog"::string AS product_category,
    "Category"::string AS product_type,
    "Weight"::integer AS product_weight,
    "TP" AS tp,
    "MRP Old"::integer AS old_product_price,
    "Final MRP Old"::integer AS final_product_price,
    "Ajio MRP"::integer AS ajio_product_price,
    "Amazon MRP"::integer AS amazon_product_price,
    "Amazon FBA MRP"::integer AS amazon_fba_product_price,
    "Flipkart MRP"::integer AS flipkart_product_price,
    "Limeroad MRP"::integer AS limeroad_product_price,
    "Myntra MRP"::integer AS myntra_product_price,
    "Paytm MRP"::integer AS paytm_product_price,
    "Snapdeal MRP"::integer AS snapdeal_product_price
    FROM source
)
SELECT * FROM renamed