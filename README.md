# 📊 Northwind Database SQL Analysis & Development Project

![SQL Server](https://img.shields.io/badge/Database-MS%20SQL%20Server-red?style=flat&logo=microsoftsqlserver)
![T-SQL](https://img.shields.io/badge/Language-T--SQL-blue?style=flat)
![Queries](https://img.shields.io/badge/Queries-27%20Scripts-brightgreen?style=flat)
![License](https://img.shields.io/badge/License-MIT-orange?style=flat)

Welcome to the **Northwind Database SQL Project**. This repository contains a curated collection of 27 T-SQL queries and database development scripts executed on Microsoft's classic **Northwind Sample Database** using **Microsoft SQL Server Management Studio (SSMS)**. 

The project ranges from basic multi-table joins and aggregation queries to complex analytical tasks involving Common Table Expressions (CTEs), Window Functions, Dynamic Pivoting, Stored Procedures with custom Error Handling, User-Defined Functions (UDFs), and Indexing optimizations.

---

## 📁 Repository Structure

```
Northwind-Database-SQL-Project/
│
├── docs/
│   ├── Requirements.pdf                # Official project task specifications
│   └── SQL_Project_Documentation.pdf   # Complete project documentation & query execution results
│
├── queries/
│   ├── 01_products_categories_suppliers.sql
│   ├── 02_orders_customer_employee_details.sql
│   ├── 03_customers_above_10_orders.sql
│   ├── 04_create_customer_reviews_table.sql
│   ├── 05_update_beverages_price.sql
│   ├── 06_delete_old_orders.sql
│   ├── 07_avg_price_per_category.sql
│   ├── 08_format_order_dates.sql
│   ├── 09_total_sales_per_employee.sql
│   ├── 10_unordered_products.sql
│   ├── 11_top_5_products_cte.sql
│   ├── 12_union_customers_suppliers.sql
│   ├── 13_top_3_sales_employees.sql
│   ├── 14_pivot_sales_by_category_year.sql
│   ├── 15_sp_get_sales_report.sql
│   ├── 16_monthly_sales_report_table.sql
│   ├── 17_sp_get_sales_report_error_handling.sql
│   ├── 18_recent_5_orders.sql
│   ├── 19_frequent_recent_customers.sql
│   ├── 20_avg_days_between_orders.sql
│   ├── 21_view_product_sales_per_year.sql
│   ├── 22_high_performing_employees.sql
│   ├── 23_top_3_products_per_month.sql
│   ├── 24_fn_get_total_sales_for_product.sql
│   ├── 25_orders_above_avg_amount.sql
│   ├── 26_index_orders_orderdate.sql
│   ├── 27_yoy_category_sales_increase.sql
│   └── README.md                       # 📖 Detailed Query Documentation & Manual
│
└── README.md                           # Front Page Overview & Index
```

---

## 🗄️ Database Domain Overview

The **Northwind database** simulates the commercial sales operations of "Northwind Traders", an international specialty food import/export merchant. Key database entities analyzed in this project include:

- **`Customers`**: Client profiles, contact persons, locations, and countries.
- **`Employees`**: Sales team hierarchy, names, and titles.
- **`Orders` & `[Order Details]`**: Header and line-item records covering order dates, products, unit prices, and quantities sold.
- **`Products` & `Categories`**: Merchandise catalog, category classifications, and pricing.
- **`Suppliers`**: Vendor partner company details.

---

## 📑 SQL Query Directory

For step-by-step code breakdowns, problem statements, and SQL logic explanations, refer to the [queries/README.md](queries/README.md) manual.

| # | Query Goal | Key SQL Concepts | Script File | Detailed Explanation |
|---|------------|------------------|-------------|----------------------|
| **01** | List products with category & supplier names | `INNER JOIN` | [`queries/01_products_categories_suppliers.sql`](queries/01_products_categories_suppliers.sql) | [View Explanation](queries/README.md#query-01---products-with-categories--suppliers) |
| **02** | List orders with customer & employee details | Multi-table `JOIN`, Concatenation | [`queries/02_orders_customer_employee_details.sql`](queries/02_orders_customer_employee_details.sql) | [View Explanation](queries/README.md#query-02---orders-with-customer--employee-details) |
| **03** | Customers with strictly > 10 orders | `GROUP BY`, `HAVING COUNT() > 10` | [`queries/03_customers_above_10_orders.sql`](queries/03_customers_above_10_orders.sql) | [View Explanation](queries/README.md#query-03---customers-with-more-than-10-orders) |
| **04** | Create & populate `CustomerReviews` table | `CREATE TABLE`, `FK`, `CHECK` | [`queries/04_create_customer_reviews_table.sql`](queries/04_create_customer_reviews_table.sql) | [View Explanation](queries/README.md#query-04---create--populate-customerreviews-table) |
| **05** | Update Beverage prices by 10% | `UPDATE`, Scalar Subquery | [`queries/05_update_beverages_price.sql`](queries/05_update_beverages_price.sql) | [View Explanation](queries/README.md#query-05---update-beverage-prices-by-10) |
| **06** | Delete orders placed before 1997-01-01 | `DELETE`, Referential Integrity | [`queries/06_delete_old_orders.sql`](queries/06_delete_old_orders.sql) | [View Explanation](queries/README.md#query-06---delete-pre-1997-orders) |
| **07** | Average product price per category | `AVG()`, `GROUP BY` | [`queries/07_avg_price_per_category.sql`](queries/07_avg_price_per_category.sql) | [View Explanation](queries/README.md#query-07---average-unit-price-per-category) |
| **08** | Format order dates to `DD-MM-YYYY` | `CONVERT(VARCHAR, date, 105)` | [`queries/08_format_order_dates.sql`](queries/08_format_order_dates.sql) | [View Explanation](queries/README.md#query-08---format-order-dates-dd-mm-yyyy) |
| **09** | Total sales revenue per employee | `SUM(Quantity * UnitPrice)` | [`queries/09_total_sales_per_employee.sql`](queries/09_total_sales_per_employee.sql) | [View Explanation](queries/README.md#query-09---total-sales-amount-per-employee) |
| **10** | Find products that were never ordered | `LEFT JOIN ... WHERE IS NULL` | [`queries/10_unordered_products.sql`](queries/10_unordered_products.sql) | [View Explanation](queries/README.md#query-10---products-never-ordered) |
| **11** | Top 5 products by sales volume | CTE, `ROW_NUMBER() OVER (...)` | [`queries/11_top_5_products_cte.sql`](queries/11_top_5_products_cte.sql) | [View Explanation](queries/README.md#query-11---top-5-products-by-sales-amount) |
| **12** | Combined company directory (Customers & Suppliers) | `UNION ALL` | [`queries/12_union_customers_suppliers.sql`](queries/12_union_customers_suppliers.sql) | [View Explanation](queries/README.md#query-12---combine-customers--suppliers-list) |
| **13** | Top 3 revenue-generating employees | `SELECT TOP 3`, `ORDER BY DESC` | [`queries/13_top_3_sales_employees.sql`](queries/13_top_3_sales_employees.sql) | [View Explanation](queries/README.md#query-13---top-3-sales-employees) |
| **14** | Annual category sales cross-tabulation | `PIVOT` clause | [`queries/14_pivot_sales_by_category_year.sql`](queries/14_pivot_sales_by_category_year.sql) | [View Explanation](queries/README.md#query-14---pivot-category-sales-per-year) |
| **15** | Stored Procedure: Date-range sales report | `CREATE PROCEDURE`, Params | [`queries/15_sp_get_sales_report.sql`](queries/15_sp_get_sales_report.sql) | [View Explanation](queries/README.md#query-15---stored-procedure-sales-report-by-date-range) |
| **16** | Monthly sales report table & data load | `INSERT INTO ... SELECT` | [`queries/16_monthly_sales_report_table.sql`](queries/16_monthly_sales_report_table.sql) | [View Explanation](queries/README.md#query-16---generate-monthly-sales-report-table) |
| **17** | Stored Procedure with defensive error handling | `TRY...CATCH`, `THROW`, `RAISERROR` | [`queries/17_sp_get_sales_report_error_handling.sql`](queries/17_sp_get_sales_report_error_handling.sql) | [View Explanation](queries/README.md#query-17---stored-procedure-with-error-handling) |
| **18** | Fetch 5 most recent orders | `SELECT TOP 5`, `ORDER BY DESC` | [`queries/18_recent_5_orders.sql`](queries/18_recent_5_orders.sql) | [View Explanation](queries/README.md#query-18---five-most-recent-orders) |
| **19** | High-frequency recent customers (> 5 orders) | `WHERE` + `HAVING` threshold | [`queries/19_frequent_recent_customers.sql`](queries/19_frequent_recent_customers.sql) | [View Explanation](queries/README.md#query-19---frequent-recent-customers) |
| **20** | Average days between orders per customer | CTE, `LAG()` Window Function | [`queries/20_avg_days_between_orders.sql`](queries/20_avg_days_between_orders.sql) | [View Explanation](queries/README.md#query-20---average-days-between-orders-per-customer) |
| **21** | View: Annual product sales totals | `CREATE VIEW` | [`queries/21_view_product_sales_per_year.sql`](queries/21_view_product_sales_per_year.sql) | [View Explanation](queries/README.md#query-21---view-annual-product-sales) |
| **22** | Employees handling over $100,000 in sales | `HAVING SUM > 100000` | [`queries/22_high_performing_employees.sql`](queries/22_high_performing_employees.sql) | [View Explanation](queries/README.md#query-22---employees-handling-over-100k-sales) |
| **23** | Top 3 products per month by revenue | CTE, `ROW_NUMBER() PARTITION BY` | [`queries/23_top_3_products_per_month.sql`](queries/23_top_3_products_per_month.sql) | [View Explanation](queries/README.md#query-23---top-3-products-by-total-sales-per-month) |
| **24** | Scalar UDF: Product total sales calculation | `CREATE FUNCTION`, `ISNULL()` | [`queries/24_fn_get_total_sales_for_product.sql`](queries/24_fn_get_total_sales_for_product.sql) | [View Explanation](queries/README.md#query-24---user-defined-function-product-total-sales) |
| **25** | Orders exceeding global average order value | CTE, `CROSS JOIN` Aggregate | [`queries/25_orders_above_avg_amount.sql`](queries/25_orders_above_avg_amount.sql) | [View Explanation](queries/README.md#query-25---orders-exceeding-average-order-amount) |
| **26** | Non-clustered index on `Orders.OrderDate` | `CREATE NONCLUSTERED INDEX` | [`queries/26_index_orders_orderdate.sql`](queries/26_index_orders_orderdate.sql) | [View Explanation](queries/README.md#query-26---create-non-clustered-index-on-orderdate) |
| **27** | Year-over-Year (YoY) category sales percentage increase | CTE, Self `LEFT JOIN`, Growth % | [`queries/27_yoy_category_sales_increase.sql`](queries/27_yoy_category_sales_increase.sql) | [View Explanation](queries/README.md#query-27---yoy-category-sales-percentage-increase) |

---

## 🛠️ How to Setup & Run

### Prerequisites
- **Database Management System**: Microsoft SQL Server 2016 or newer (Express, Developer, or Enterprise edition).
- **Client IDE**: Microsoft SQL Server Management Studio (SSMS) or Azure Data Studio.
- **Database**: The standard **Northwind** sample database installed on your SQL instance.

### Execution Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Bassel1000/Northwind-Database-SQL-Project.git
   cd Northwind-Database-SQL-Project
   ```
2. **Open SQL Server Management Studio (SSMS)** and connect to your SQL Server instance.
3. Ensure the `Northwind` database is attached/active.
4. Navigate to the `queries/` directory and open any query script (`.sql`).
5. Execute the script (`F5` or click **Execute**).

---

## 📄 Documentation & References

- 📋 [**Requirements.pdf**](docs/Requirements.pdf): The original project requirement specification sheet.
- 📖 [**SQL_Project_Documentation.pdf**](docs/SQL_Project_Documentation.pdf): PDF version containing full query execution output screenshots and reports.
- 💡 [**queries/README.md**](queries/README.md): Detailed T-SQL code manual breaking down logic, syntax, and concepts for each query.
