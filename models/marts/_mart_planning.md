## Mart Planning

## Question 1 - Analyse general sales trends - What are the total sales by month, category currency, stock level, and customer for each sale? How is the business perfoming in each channel?

## Required Columns
- Date/Month
- Category
- Currency
- Stock level
- Customer

## Present in these tables
- [sale_date, category, currency](../staging/stg_amazon_sale_report.sql)
- [sale_date, customer_name](../staging/stg_international_sales.sql)
- [stock, category](../staging/stg_sale_report.sql)

## The grain
- SKU in each table but not unique
- SKU + date not unique, one row per sale not day
- Need to verify if category and currency are consistent per SKU

## Filters
- sale_status: "Shipping", "Pending", "Cancelled" and 10 variations of "Shipped" -  "Returned", "Delivered", "Returning", "Damaged", "Waiting...", "Out for delivery", "Rejected", "Lost in transit", "Picked Up", "Shipped"
- Determined that every item that is "Cancelled" is not indicative of sales trends.