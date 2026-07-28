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
- To define a sales trend, investigate "sale_status", determine how the categories end up: shipped or cancelled?
- sale_status = "Pending"/"Waiting"/"Shipping" excluded because pending orders are concentrated in the final month of the data. Indicative of completed sales in a later snapshot, not of June's performance. This is a data-completeness exclusion.
- Determined that every item that is "Cancelled"/"Returned"/"Returning"/"Rejected"/"Damaged"/"Lost" is not revenue.
- sale_status filter isolated to mart_sales_by_sku_month deliberately. Reason: this exclusion (cancelled/pending/returned) reflects "net completed sales" specifically for this mart's business question. Not a universal rule for all future marts. Revisit if most/all future marts end up wanting the same filter.
- "Cancelled" still being included - revisit to amend filter