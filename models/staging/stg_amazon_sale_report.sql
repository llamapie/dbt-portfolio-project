WITH source AS (
    SELECT * FROM {{ref('Amazon_Sale_Report')}}
), 
renamed AS (
    SELECT
    "index" AS index_no,
    "Order ID" AS order_id,
    "Date" AS sale_date,
    "Status" AS sale_status,
    "Fulfilment" AS fulfilment,
    "Sales Channel " AS sales_channel,
    "ship-service-level" AS ship_service_level,
    "Style" AS style,
    "SKU" AS sku,
    "Category" AS category,
    "Size" AS product_size,
    "ASIN" AS asin,
    "Courier Status" AS courier_status,
    "Qty" AS qty,
    "Currency" AS currency,
    "Amount" AS sale_amount,
    "ship-city" AS ship_city,
    "ship-state" AS ship_state,
    "ship-postal-code" AS ship_postal_code,
    "ship-country" AS ship_country,
    "promotion-ids" AS promotion_ids,
    "B2B" AS b2b,
    "fulfilled-by" AS fulfilled_by
    FROM source
) 
SELECT * FROM renamed