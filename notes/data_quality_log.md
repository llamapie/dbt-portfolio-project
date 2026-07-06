# Data Quality Notes

## stg_amazon_sale_report
- "Sales Channel " had trailing space in raw header → caused ref failure until quoted correctly
- "Unnamed: 22" boolean column, mostly blank, referenced out-of-schema field → dropped as junk
- All columns renamed to replace spaces, capitalisation and keywords

## stg_cloud_warehouse_compersion_chart
- "Unnamed: 1" varchar column, content relating to "INCREFF" column. Kept as info seemed descriptive and non-redundant. Inferred name: "description_increff"
- Checked table data for purpose as "compersion" seems like a typo.
- "Index" column may not be required. Perform check when all tables staged and drop if unnecessary.
***
dbt show --inline "select count(*) from {{ ref('stg_other_table') }} o join {{ ref('Cloud_Warehouse_Compersion_Chart') }} c on o.some_id = c.\"index_column\""
***

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
