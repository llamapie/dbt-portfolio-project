WITH source AS (
    SELECT * FROM {{ref('Amazon_Sale_Report')}}
), 
renamed AS (
    SELECT
    "Order ID" AS order_id,
    "Date"::date AS sale_date,
    "Status"::string AS sale_status,
    "Fulfilment"::string AS fulfilment,
    "Sales Channel " AS sales_channel,
    "ship-service-level" AS ship_service_level,
    "Style"::string AS style,
    "SKU"::string AS sku,
    "Category"::string AS category,
    "Size"::string AS product_size,
    "ASIN"::string AS asin,
    "Courier Status"::string AS courier_status,
    "Qty"::integer AS qty,
    "Currency"::string AS currency,
    "Amount"::float AS sale_amount,
    "ship-city" AS ship_city,
    "ship-state" AS ship_state,
    "ship-postal-code" AS ship_postal_code,
    "ship-country" AS ship_country,
    "promotion-ids" AS promotion_ids,
    "B2B"::boolean AS b2b,
    "fulfilled-by" AS fulfilled_by
    FROM source
) 
SELECT * FROM renamed