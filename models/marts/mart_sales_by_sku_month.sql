SELECT
    sku,
    date_trunc('month', sale_date) AS sale_month,
    category,
    currency,
    SUM(sale_amount) AS total_sale_amount,
    COUNT(*) AS number_of_transactions
FROM {{ref('stg_amazon_sale_report')}}
WHERE sale_status NOT LIKE '%Cancelled%'
  AND sale_status NOT LIKE '%Pending%'
  AND sale_status NOT LIKE '%Shipping%'
  AND sale_status NOT LIKE '%Returned%'
  AND sale_status NOT LIKE '%Returning%'
  AND sale_status NOT LIKE '%Rejected%'
  AND sale_status NOT LIKE '%Damaged%'
  AND sale_status NOT LIKE '%Lost%'
GROUP BY sku, sale_month, category, currency