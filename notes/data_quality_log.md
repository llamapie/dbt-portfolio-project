# Data Quality Notes

## All tables/columns
- Most data types were inferred as varchar when seeded. Reviewed data types in dataset. Declared specific data types for each column to avoid issues down the line.
- Perform checks on all "Index" columns to determine if required, drop if unnecessary.

## "index" column checks
- Amazon_Sale_Report: min=0, max=128974, count=128975, all unique/sequential. confirmation of row-index artifact, dropped in staging.
- Cloud_Warehouse_Compersion_Chart: min=0, max=49, count=50, all unique/sequential. confirmation of row-index artifact, dropped in staging.
- Expense_IIGF: min=0, max=16, count=17, all unique/sequential. confirmation of row-index artifact, dropped in staging.
- International_sale_Report: min=0, max=37431, count=37432, all unique/sequential. confirmation of row-index artifact, dropped in staging.
- May_2022: min=0, max=1329, count=1330, all unique/sequential. Same row count as P_L_March_2021,but records for different time periods, no documented relationship, unlikely to be positional join. Dropped in staging.
- P_L_March_2021: min=0, max=1329, count=1330, all unique/sequential. Same row count as May_2022, but records for different time periods, no documented relationship, unlikely to be positional join. Dropped in staging.
- Sale_Report: min=0, max=9270, count=9271, all unique/sequential. confirmation of row-index artifact, dropped in staging.

## stg_amazon_sale_report
- "Sales Channel " had trailing space in raw header → caused ref failure until quoted correctly
- "Unnamed: 22" boolean column, mostly blank, referenced out-of-schema field → dropped as junk
- All columns renamed to replace spaces, capitalisation and keywords

## stg_cloud_warehouse_compersion_chart
- "Unnamed: 1" varchar column, content relating to "INCREFF" column. Kept as info seemed descriptive and non-redundant. Inferred name: "description_increff"
- Checked table data for purpose as "compersion" seems like a typo.

## Expense_IIGF
- Raw CSV was actually a manually-kept ledger with merged-cell Excel headers, exported flat. Contained: a duplicate sub-header row, two unrelated ledgers (income/expense) side by side, and summary/total rows mixed in with transactions. Solution: filtered out non-transaction rows, split into two staging models by entity.

## stg_sales_received_amounts
- "Index" column may not be required. Perform same check as above when all tables staged.
- "Recived Amount" varchar column, contained sub-header "Particular" and dates. Inferred name: "received_date".
- "Unnamed: 1" varchar column, contained sub-header "Amount" and numeric data. Inferred name: "received_amount".
- Excluded sub-header rows including "Particular", "Amount" and "Total".

## stg_expenses_iigf
- "Expance" varchar column, contained sub-header "Particular" and descriptive data. Inferred name: "expense_description".
- "Unnamed: 3" varchar column, contained sub-header "Amount" and numeric data. Inferred name: "expense_amount".
- Excluded redundant data and sub-header rows including "Particular", "Amount", "Pending Amount", "Total".

## stg_international_sales

- All columns renamed to replace keywords and capitalisation - more descriptive names given.
- Excluded index column as unnecessary.

## stg_may_2022

- File contains sales data from May 2022 for product profitability optimisation.
- Dataset describes "Catalog" as Category of product, and "Category" as Type of product. This could be confusing. After checking and comparing the data of each column, renamed "Catalog" to "product_category" and "Category" to "product_type".
- "TP" column is simply described as "tp", data is numeric but not given a data type in the dataset. Could mean "Trade Price", "Total Price", "Target Price" etc. Kept as is until further investigation.
Update: In another table "TP" described as "Price of product on third-party platform", data type integer.
- "MRP Old" is the original price of the product, "Final MRP Old" is the final price of the product after.

## stg_p_l_march_2021

- Table lacks description in dataset.
- Column names almost identical to table "May_2022" which is described as sales data to optimize product profitability.
- "TP 1" and "TP 2" described as "Price of product on -- third-party platform.".