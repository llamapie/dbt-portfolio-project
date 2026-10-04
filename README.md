# E-Commerce Sales & Profitability Analytics (dbt + DuckDB)

Analysing sales and profitability data to identify drivers behind performance trends.

## Overview
Answering business questions:
- Analyse general sales trends - What are the total sales by month, category currency, stock level, and customer for each sale? How is the business performing in each channel?
- Cross-channel price comparison - Which sales channels (Amazon, Myntra, Ajio, etc.) offer the best margins, using MRP vs. TP1/TP2 cost-per-piece data?

## Dataset
- Source: https://data.world/anilsharma87
- Size/scope: row counts per table, number of tables, time period, granularity
- Notable characteristics:

## Data Quality

The source data needed significant cleaning before it was usable: row-index artifacts, a ledger exported with merged-cell headers, ambiguous column names, and date parsing errors. Every issue and the decision made is recorded in the [data quality log](notes/data_quality_log.md).

Highlights:
- Verified 7 "index" columns were row-number artifacts before dropping them
- Split a combined income/expense ledger into two staging models
- Resolved ambiguous column definitions by comparing data across tables

Status: in progress. Automated dbt tests for these checks are planned.


## Tech Stack
- dbt-core
- DuckDB
- VS Code
- Git / GitHub

## Project Structure
- mart_sales_by_sku_month.sql: This mart measures net completed sales, excluding cancelled, pending, and returned orders
