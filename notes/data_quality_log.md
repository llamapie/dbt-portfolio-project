# Data Quality Notes

## stg_amazon_sale_report
- "Sales Channel " had trailing space in raw header → caused ref failure until quoted correctly
- "Unnamed: 22" boolean column, mostly blank, referenced out-of-schema field → dropped as junk
- All columns renamed to replace spaces, capitalisation and keywords

## stg_cloud_warehouse_compersion_chart
- "Unnamed: 1" varchar column, content relating to "INCREFF" column. Kept as info seemed descriptive and non-redundant. Inferred name: ""
- Checked table data for purpose as "compersion" seems like a typo.
- "Index" column may not be required. Perform check when all tables staged and drop if unnecessary.
***
dbt show --inline "select count(*) from {{ ref('stg_other_table') }} o join {{ ref('Cloud_Warehouse_Compersion_Chart') }} c on o.some_id = c.\"index_column\""
***

