# Northwind Database SQL Queries Documentation

This directory contains 27 SQL query scripts executed against the **Microsoft SQL Server Northwind Sample Database**. Below is a comprehensive guide explaining the objective, SQL logic, key T-SQL features, and code implementation for every query.

---

## 📋 Table of Contents

| # | Query Name | Key Concepts | Script File |
|---|------------|--------------|-------------|
| 01 | [Products with Categories & Suppliers](#query-01---products-with-categories--suppliers) | Multi-table `INNER JOIN` | [`01_products_categories_suppliers.sql`](01_products_categories_suppliers.sql) |
| 02 | [Orders with Customer & Employee Details](#query-02---orders-with-customer--employee-details) | `JOIN`, String Concatenation | [`02_orders_customer_employee_details.sql`](02_orders_customer_employee_details.sql) |
| 03 | [Customers with More Than 10 Orders](#query-03---customers-with-more-than-10-orders) | `GROUP BY`, `HAVING`, `COUNT()` | [`03_customers_above_10_orders.sql`](03_customers_above_10_orders.sql) |
| 04 | [Create & Populate CustomerReviews Table](#query-04---create--populate-customerreviews-table) | `CREATE TABLE`, Constraints (`FK`, `CHECK`) | [`04_create_customer_reviews_table.sql`](04_create_customer_reviews_table.sql) |
| 05 | [Update Beverage Prices by 10%](#query-05---update-beverage-prices-by-10) | `UPDATE`, Scalar Subquery | [`05_update_beverages_price.sql`](05_update_beverages_price.sql) |
| 06 | [Delete Pre-1997 Orders](#query-06---delete-pre-1997-orders) | `DELETE`, Referential Integrity Handling | [`06_delete_old_orders.sql`](06_delete_old_orders.sql) |
| 07 | [Average Unit Price per Category](#query-07---average-unit-price-per-category) | `AVG()`, `GROUP BY` | [`07_avg_price_per_category.sql`](07_avg_price_per_category.sql) |
| 08 | [Format Order Dates (DD-MM-YYYY)](#query-08---format-order-dates-dd-mm-yyyy) | `CONVERT()`, Date Formatting | [`08_format_order_dates.sql`](08_format_order_dates.sql) |
| 09 | [Total Sales Amount per Employee](#query-09---total-sales-amount-per-employee) | `SUM()`, Multi-table `JOIN` | [`09_total_sales_per_employee.sql`](09_total_sales_per_employee.sql) |
| 10 | [Products Never Ordered](#query-10---products-never-ordered) | `LEFT JOIN ... WHERE IS NULL` | [`10_unordered_products.sql`](10_unordered_products.sql) |
| 11 | [Top 5 Products by Sales Amount](#query-11---top-5-products-by-sales-amount) | Common Table Expression (CTE), `ROW_NUMBER()` | [`11_top_5_products_cte.sql`](11_top_5_products_cte.sql) |
| 12 | [Combine Customers & Suppliers List](#query-12---combine-customers--suppliers-list) | `UNION ALL` | [`12_union_customers_suppliers.sql`](12_union_customers_suppliers.sql) |
| 13 | [Top 3 Sales Employees](#query-13---top-3-sales-employees) | `SELECT TOP`, `ORDER BY DESC` | [`13_top_3_sales_employees.sql`](13_top_3_sales_employees.sql) |
| 14 | [Pivot Category Sales per Year](#query-14---pivot-category-sales-per-year) | `PIVOT` Clause | [`14_pivot_sales_by_category_year.sql`](14_pivot_sales_by_category_year.sql) |
| 15 | [Stored Procedure: Sales Report by Date Range](#query-15---stored-procedure-sales-report-by-date-range) | `CREATE PROCEDURE`, Parameters | [`15_sp_get_sales_report.sql`](15_sp_get_sales_report.sql) |
| 16 | [Generate Monthly Sales Report Table](#query-16---generate-monthly-sales-report-table) | `INSERT INTO ... SELECT`, `DATEFROMPARTS` | [`16_monthly_sales_report_table.sql`](16_monthly_sales_report_table.sql) |
| 17 | [Stored Procedure with Error Handling](#query-17---stored-procedure-with-error-handling) | `TRY...CATCH`, `THROW`, `RAISERROR` | [`17_sp_get_sales_report_error_handling.sql`](17_sp_get_sales_report_error_handling.sql) |
| 18 | [Five Most Recent Orders](#query-18---five-most-recent-orders) | `SELECT TOP 5`, `ORDER BY OrderDate DESC` | [`18_recent_5_orders.sql`](18_recent_5_orders.sql) |
| 19 | [Frequent Recent Customers](#query-19---frequent-recent-customers) | `WHERE` filtering + `HAVING` threshold | [`19_frequent_recent_customers.sql`](19_frequent_recent_customers.sql) |
| 20 | [Average Days Between Orders per Customer](#query-20---average-days-between-orders-per-customer) | CTE, `LAG()` Window Function, `DATEDIFF()` | [`20_avg_days_between_orders.sql`](20_avg_days_between_orders.sql) |
| 21 | [View: Annual Product Sales](#query-21---view-annual-product-sales) | `CREATE VIEW` | [`21_view_product_sales_per_year.sql`](21_view_product_sales_per_year.sql) |
| 22 | [Employees Handling Over $100k Sales](#query-22---employees-handling-over-100k-sales) | Aggregate Filtering (`HAVING SUM > 100000`) | [`22_high_performing_employees.sql`](22_high_performing_employees.sql) |
| 23 | [Top 3 Products by Total Sales per Month](#query-23---top-3-products-by-total-sales-per-month) | CTE, `ROW_NUMBER() OVER (PARTITION BY ...)` | [`23_top_3_products_per_month.sql`](23_top_3_products_per_month.sql) |
| 24 | [User-Defined Function: Product Total Sales](#query-24---user-defined-function-product-total-sales) | `CREATE FUNCTION` (Scalar UDF), `ISNULL` | [`24_fn_get_total_sales_for_product.sql`](24_fn_get_total_sales_for_product.sql) |
| 25 | [Orders Exceeding Average Order Amount](#query-25---orders-exceeding-average-order-amount) | CTE, Subquery CTE Aggregate Comparison | [`25_orders_above_avg_amount.sql`](25_orders_above_avg_amount.sql) |
| 26 | [Create Non-Clustered Index on OrderDate](#query-26---create-non-clustered-index-on-orderdate) | `CREATE NONCLUSTERED INDEX` | [`26_index_orders_orderdate.sql`](26_index_orders_orderdate.sql) |
| 27 | [YoY Category Sales Percentage Increase](#query-27---yoy-category-sales-percentage-increase) | CTE, Self `LEFT JOIN`, Percentage Growth Math | [`27_yoy_category_sales_increase.sql`](27_yoy_category_sales_increase.sql) |

---

## 🔍 Detailed Query Explanations

### Query 01 - Products with Categories & Suppliers
- **File**: [`01_products_categories_suppliers.sql`](01_products_categories_suppliers.sql)
- **Objective**: Retrieve the list of all products alongside their corresponding category names and supplier company names.
- **SQL Concepts**: `INNER JOIN`, Table Aliases.
- **Code**:
  ```sql
  USE Northwind;

  SELECT p.ProductName, c.CategoryName, s.CompanyName AS SupplierName
  FROM Products AS p
  JOIN Categories AS c ON p.CategoryID = c.CategoryID
  JOIN Suppliers AS s ON p.SupplierID = s.SupplierID;
  ```
- **Explanation**: Joins the `Products` table with `Categories` on `CategoryID` and with `Suppliers` on `SupplierID` to enrich product listings with relational metadata.

---

### Query 02 - Orders with Customer & Employee Details
- **File**: [`02_orders_customer_employee_details.sql`](02_orders_customer_employee_details.sql)
- **Objective**: List all orders along with company/contact names of customers and full names of handling employees.
- **SQL Concepts**: `JOIN`, String Concatenation (`+`).
- **Code**:
  ```sql
  USE Northwind;

  SELECT o.OrderID, c.CompanyName, c.ContactName, 
         e.FirstName + ' ' + e.LastName AS EmployeeName, e.EmployeeID
  FROM Orders AS o
  JOIN Customers AS c ON o.CustomerID = c.CustomerID
  JOIN Employees AS e ON o.EmployeeID = e.EmployeeID;
  ```
- **Explanation**: Links `Orders` to `Customers` and `Employees`, concatenating employee first and last names into a clean display column.

---

### Query 03 - Customers with More Than 10 Orders
- **File**: [`03_customers_above_10_orders.sql`](03_customers_above_10_orders.sql)
- **Objective**: Count the total number of orders placed by each customer, listing only customers who have placed strictly more than 10 orders, sorted in descending order.
- **SQL Concepts**: `GROUP BY`, `HAVING`, `COUNT()`, `ORDER BY DESC`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT c.CompanyName, COUNT(o.OrderID) AS TotalOrders
  FROM Customers AS c
  JOIN Orders o ON c.CustomerID = o.CustomerID
  GROUP BY c.CompanyName
  HAVING COUNT(o.OrderID) > 10
  ORDER BY TotalOrders DESC;
  ```
- **Explanation**: Groups order counts per customer company and filters out low-volume accounts using `HAVING` (since `WHERE` cannot filter aggregate function results).

---

### Query 04 - Create & Populate CustomerReviews Table
- **File**: [`04_create_customer_reviews_table.sql`](04_create_customer_reviews_table.sql)
- **Objective**: Create a new relational table `CustomerReviews` with foreign key relationships to `Customers` and `Products`, plus a domain check constraint on star ratings (1 to 5), then seed sample records.
- **SQL Concepts**: `CREATE TABLE`, `FOREIGN KEY`, `CHECK` constraint, `INSERT INTO`.
- **Code**:
  ```sql
  USE Northwind;

  CREATE TABLE CustomerReviews (
      CustomerID NCHAR(5) FOREIGN KEY REFERENCES Customers(CustomerID),
      ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
      Rating INT CHECK (Rating BETWEEN 1 AND 5),
      Comments NVARCHAR(MAX)
  );

  INSERT INTO CustomerReviews (CustomerID, ProductID, Rating, Comments)
  VALUES 
  ('ALFKI', 1, 4, 'Great product!'),
  ('ANATR', 2, 5, 'Excellent quality and fast delivery.'),
  ('ANTON', 3, 3, 'Good product but a bit pricey.');

  SELECT * FROM CustomerReviews;
  ```
- **Explanation**: Demonstrates database schema extension with data integrity guarantees (`CHECK` for valid 1-5 ratings and `FOREIGN KEY` references).

---

### Query 05 - Update Beverage Prices by 10%
- **File**: [`05_update_beverages_price.sql`](05_update_beverages_price.sql)
- **Objective**: Increase the unit price of all products belonging to the 'Beverages' category by 10%.
- **SQL Concepts**: `UPDATE`, Subquery in `WHERE` clause.
- **Code**:
  ```sql
  USE Northwind;

  UPDATE Products
  SET UnitPrice = UnitPrice * 1.10
  WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages');

  SELECT * FROM Products WHERE CategoryID = 1;
  ```
- **Explanation**: Dynamically resolves the `CategoryID` for 'Beverages' via a scalar subquery and applies an arithmetic multiplier to update product pricing in place.

---

### Query 06 - Delete Pre-1997 Orders
- **File**: [`06_delete_old_orders.sql`](06_delete_old_orders.sql)
- **Objective**: Safely delete all order records placed prior to January 1, 1997.
- **SQL Concepts**: `DELETE`, Foreign Key Cascade / Order of Deletion, Subqueries.
- **Code**:
  ```sql
  USE Northwind;

  -- 1. Remove child records first to satisfy Foreign Key constraints
  DELETE FROM [Order Details]
  WHERE OrderID IN (SELECT OrderID FROM Orders WHERE OrderDate < '1997-01-01');

  -- 2. Remove parent order records
  DELETE FROM Orders
  WHERE OrderDate < '1997-01-01';

  SELECT OrderID FROM Orders WHERE OrderDate < '1997-01-01';
  ```
- **Explanation**: Respects referential integrity by clearing dependent line items in `[Order Details]` before removing parent headers from `Orders`.

---

### Query 07 - Average Unit Price per Category
- **File**: [`07_avg_price_per_category.sql`](07_avg_price_per_category.sql)
- **Objective**: Compute the arithmetic mean of product prices for each product category.
- **SQL Concepts**: `AVG()`, `GROUP BY`, `JOIN`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT c.CategoryName, AVG(p.UnitPrice) AS AveragePrice
  FROM Products AS p
  JOIN Categories AS c ON p.CategoryID = c.CategoryID
  GROUP BY c.CategoryName;
  ```
- **Explanation**: Groups products by category name and calculates the category-level price baseline using `AVG()`.

---

### Query 08 - Format Order Dates (DD-MM-YYYY)
- **File**: [`08_format_order_dates.sql`](08_format_order_dates.sql)
- **Objective**: Convert datetime values into standard Italian/British string date representation (`DD-MM-YYYY`).
- **SQL Concepts**: T-SQL `CONVERT()` function with style code `105`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT OrderID, 
         CONVERT(VARCHAR(10), OrderDate, 105) AS FormattedOrderDate
  FROM Orders;
  ```
- **Explanation**: Uses T-SQL style code `105` in `CONVERT()` to format datetime values into explicit `DD-MM-YYYY` string representations.

---

### Query 09 - Total Sales Amount per Employee
- **File**: [`09_total_sales_per_employee.sql`](09_total_sales_per_employee.sql)
- **Objective**: Calculate the total cumulative revenue generated by each employee across all processed orders.
- **SQL Concepts**: Multi-table `JOIN`, `SUM(Quantity * UnitPrice)`, `GROUP BY`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName,
         SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
  FROM Employees AS e
  JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
  JOIN [Order Details] AS od ON o.OrderID = od.OrderID
  GROUP BY e.EmployeeID, e.FirstName, e.LastName
  ORDER BY TotalSalesAmount DESC;
  ```
- **Explanation**: Joins `Employees`, `Orders`, and `[Order Details]`, multiplying price by quantity per line item to compute total historical revenue per staff member.

---

### Query 10 - Products Never Ordered
- **File**: [`10_unordered_products.sql`](10_unordered_products.sql)
- **Objective**: Find products in the catalog that have never been placed in any customer order.
- **SQL Concepts**: `LEFT JOIN`, `IS NULL` anti-join pattern.
- **Code**:
  ```sql
  USE Northwind;

  SELECT p.ProductID, p.ProductName
  FROM Products AS p
  LEFT JOIN [Order Details] AS od ON p.ProductID = od.ProductID
  WHERE od.OrderID IS NULL;
  ```
- **Explanation**: Performs an outer join between catalog products and order details. Unordered products produce NULL order detail rows, which are isolated using `WHERE od.OrderID IS NULL`.

---

### Query 11 - Top 5 Products by Sales Amount
- **File**: [`11_top_5_products_cte.sql`](11_top_5_products_cte.sql)
- **Objective**: Use a Common Table Expression (CTE) and window functions to identify the top 5 highest-grossing products.
- **SQL Concepts**: Common Table Expression (`WITH`), `ROW_NUMBER() OVER (...)`.
- **Code**:
  ```sql
  USE Northwind;

  WITH ProductSales AS (
      SELECT p.ProductID, p.ProductName,
             SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount,
             ROW_NUMBER() OVER (ORDER BY SUM(od.Quantity * od.UnitPrice) DESC) AS SalesRank
      FROM Products p
      JOIN [Order Details] od ON p.ProductID = od.ProductID
      GROUP BY p.ProductID, p.ProductName
  )
  SELECT ProductID, ProductName, TotalSalesAmount
  FROM ProductSales
  WHERE SalesRank <= 5;
  ```
- **Explanation**: Encapsulates aggregation and product ranking inside a named CTE, then queries the CTE to filter the top 5 positions cleanly.

---

### Query 12 - Combine Customers & Suppliers List
- **File**: [`12_union_customers_suppliers.sql`](12_union_customers_suppliers.sql)
- **Objective**: Produce a unified directory listing all customer and supplier company names with an identifier column indicating entity type.
- **SQL Concepts**: `UNION ALL`, Literal column tagging.
- **Code**:
  ```sql
  USE Northwind;

  SELECT CompanyName, 'Customer' AS CompanyType
  FROM Customers
  UNION ALL
  SELECT CompanyName, 'Supplier' AS CompanyType
  FROM Suppliers;
  ```
- **Explanation**: Combines result sets from two distinct tables while preserving all rows (`UNION ALL`) and adding static type labels.

---

### Query 13 - Top 3 Sales Employees
- **File**: [`13_top_3_sales_employees.sql`](13_top_3_sales_employees.sql)
- **Objective**: Determine the top 3 revenue-generating employees in company history.
- **SQL Concepts**: `SELECT TOP 3`, `SUM()`, `GROUP BY`, `ORDER BY DESC`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT TOP 3 e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName,
         SUM(od.Quantity * od.UnitPrice) AS TotalSales
  FROM Employees AS e
  JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
  JOIN [Order Details] AS od ON o.OrderID = od.OrderID
  GROUP BY e.EmployeeID, e.FirstName, e.LastName
  ORDER BY TotalSales DESC;
  ```
- **Explanation**: Summarizes sales per employee and applies T-SQL `TOP 3` alongside `ORDER BY TotalSales DESC` to return the leading sales representatives.

---

### Query 14 - Pivot Category Sales per Year
- **File**: [`14_pivot_sales_by_category_year.sql`](14_pivot_sales_by_category_year.sql)
- **Objective**: Construct a cross-tabulation report displaying category sales totals across annual columns (1996, 1997, 1998).
- **SQL Concepts**: `PIVOT` clause, `YEAR()`, Subqueries.
- **Code**:
  ```sql
  USE Northwind;

  SELECT *
  FROM (
      SELECT 
          c.CategoryName,
          YEAR(o.OrderDate) AS OrderYear,
          od.Quantity * od.UnitPrice AS SalesAmount
      FROM Categories AS c
      JOIN Products AS p ON c.CategoryID = p.CategoryID
      JOIN [Order Details] AS od ON p.ProductID = od.ProductID
      JOIN Orders AS o ON od.OrderID = o.OrderID
  ) AS SourceTable
  PIVOT (
      SUM(SalesAmount)
      FOR OrderYear IN ([1996], [1997], [1998])
  ) AS PivotTable;
  ```
- **Explanation**: Rotates transactional row data into a matrix format where category names form rows and years form dynamic columns containing aggregate revenue.

---

### Query 15 - Stored Procedure: Sales Report by Date Range
- **File**: [`15_sp_get_sales_report.sql`](15_sp_get_sales_report.sql)
- **Objective**: Encapsulate sales reporting logic inside a parameterized stored procedure.
- **SQL Concepts**: `CREATE PROCEDURE`, Input Parameters (`@StartDate`, `@EndDate`), `BETWEEN`.
- **Code**:
  ```sql
  USE Northwind;

  CREATE PROCEDURE GetSalesReport
      @StartDate DATE,
      @EndDate DATE
  AS
  BEGIN
      SELECT 
          o.OrderID,
          o.OrderDate,
          c.CompanyName AS CustomerName,
          p.ProductName,
          od.Quantity,
          od.UnitPrice,
          od.Quantity * od.UnitPrice AS TotalAmount
      FROM Orders AS o
      JOIN Customers AS c ON o.CustomerID = c.CustomerID
      JOIN [Order Details] AS od ON o.OrderID = od.OrderID
      JOIN Products AS p ON od.ProductID = p.ProductID
      WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
      ORDER BY o.OrderDate;
  END;

  -- Execution Example:
  EXEC GetSalesReport '1997-01-01', '1998-01-01';
  ```
- **Explanation**: Creates a reusable stored procedure accepting start/end date parameters to extract detailed line item sales reports for any timeframe.

---

### Query 16 - Generate Monthly Sales Report Table
- **File**: [`16_monthly_sales_report_table.sql`](16_monthly_sales_report_table.sql)
- **Objective**: Create a physical summary table `MonthlySalesReport` and populate it with aggregated monthly sales volume and revenue metrics.
- **SQL Concepts**: `CREATE TABLE`, `INSERT INTO ... SELECT`, `DATEFROMPARTS()`, `COUNT(DISTINCT)`.
- **Code**:
  ```sql
  USE Northwind;

  CREATE TABLE MonthlySalesReport (
      ReportMonth DATE,
      TotalOrders INT,
      TotalSales DECIMAL(18,2)
  );

  INSERT INTO MonthlySalesReport (ReportMonth, TotalOrders, TotalSales)
  SELECT 
      DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS ReportMonth,
      COUNT(DISTINCT o.OrderID) AS TotalOrders,
      SUM(od.Quantity * od.UnitPrice) AS TotalSales
  FROM Orders o
  JOIN [Order Details] od ON o.OrderID = od.OrderID
  GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
  ORDER BY ReportMonth;

  SELECT * FROM MonthlySalesReport;
  ```
- **Explanation**: Builds a reporting data mart table and fills it by truncating dates to the 1st of each month via `DATEFROMPARTS` and aggregating total orders and total revenue.

---

### Query 17 - Stored Procedure with Error Handling
- **File**: [`17_sp_get_sales_report_error_handling.sql`](17_sp_get_sales_report_error_handling.sql)
- **Objective**: Enhance the `GetSalesReport` stored procedure with defensive error handling to validate date inputs.
- **SQL Concepts**: `TRY...CATCH` blocks, custom error raising (`THROW`, `RAISERROR`), system error functions.
- **Code**:
  ```sql
  USE Northwind;

  CREATE PROCEDURE GetSalesReport
      @StartDate DATE,
      @EndDate DATE
  AS
  BEGIN
      BEGIN TRY
          IF @StartDate > @EndDate
              THROW 50000, 'Start date must be earlier than or equal to end date.', 1;

          SELECT 
              o.OrderID,
              o.OrderDate,
              c.CompanyName AS CustomerName,
              p.ProductName,
              od.Quantity,
              od.UnitPrice,
              od.Quantity * od.UnitPrice AS TotalAmount
          FROM Orders AS o
          JOIN Customers AS c ON o.CustomerID = c.CustomerID
          JOIN [Order Details] AS od ON o.OrderID = od.OrderID
          JOIN Products AS p ON od.ProductID = p.ProductID
          WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
          ORDER BY o.OrderDate;
      END TRY
      BEGIN CATCH
          DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
          DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
          DECLARE @ErrorState INT = ERROR_STATE();
          RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
      END CATCH;
  END;
  ```
- **Explanation**: Wraps procedure execution in a `TRY...CATCH` block. Throws user-defined exception if `@StartDate > @EndDate` and propagates formatted error details via `RAISERROR`.

---

### Query 18 - Five Most Recent Orders
- **File**: [`18_recent_5_orders.sql`](18_recent_5_orders.sql)
- **Objective**: Fetch details for the 5 newest orders registered in the system.
- **SQL Concepts**: `SELECT TOP 5`, `ORDER BY OrderDate DESC`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT TOP 5 
      o.OrderID,
      o.OrderDate,
      c.CompanyName,
      c.ContactName,
      c.Country
  FROM Orders AS o
  JOIN Customers AS c ON o.CustomerID = c.CustomerID
  ORDER BY o.OrderDate DESC;
  ```
- **Explanation**: Sorts orders chronologically in descending order and limits output to the top 5 records.

---

### Query 19 - Frequent Recent Customers
- **File**: [`19_frequent_recent_customers.sql`](19_frequent_recent_customers.sql)
- **Objective**: Identify repeat customers who placed more than 5 orders during recent operational years.
- **SQL Concepts**: `WHERE` filtering, `GROUP BY`, `HAVING COUNT() > 5`.
- **Code**:
  ```sql
  USE Northwind;

  SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount
  FROM Customers AS c
  JOIN Orders AS o ON c.CustomerID = o.CustomerID
  WHERE o.OrderDate > YEAR(1998)
  GROUP BY c.CustomerID, c.CompanyName
  HAVING COUNT(o.OrderID) > 5;
  ```
- **Explanation**: Filters order transactions by year criterion, groups by customer, and extracts high-frequency buyer accounts via `HAVING`.

---

### Query 20 - Average Days Between Orders per Customer
- **File**: [`20_avg_days_between_orders.sql`](20_avg_days_between_orders.sql)
- **Objective**: Calculate the average interval (in days) between consecutive orders placed by individual customers.
- **SQL Concepts**: CTE, `LAG() OVER (PARTITION BY ... ORDER BY ...)`, `DATEDIFF()`, `AVG()`.
- **Code**:
  ```sql
  USE Northwind;

  WITH OrderDates AS (
      SELECT 
          CustomerID,
          OrderDate,
          LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PrevOrderDate
      FROM Orders
  )
  SELECT 
      CustomerID,
      AVG(DATEDIFF(DAY, PrevOrderDate, OrderDate)) AS AvgDaysBetweenOrders
  FROM OrderDates
  WHERE PrevOrderDate IS NOT NULL
  GROUP BY CustomerID;
  ```
- **Explanation**: Uses `LAG()` to pull each customer's preceding order date, computes elapsed days per pair with `DATEDIFF`, and calculates customer-level mean order gaps.

---

### Query 21 - View: Annual Product Sales
- **File**: [`21_view_product_sales_per_year.sql`](21_view_product_sales_per_year.sql)
- **Objective**: Create a database view `ProductSalesPerYear` summarizing product sales quantities grouped by calendar year.
- **SQL Concepts**: `CREATE VIEW`, `YEAR()`, `SUM()`.
- **Code**:
  ```sql
  USE Northwind;

  CREATE VIEW ProductSalesPerYear AS
  SELECT 
      p.ProductID,
      p.ProductName,
      YEAR(o.OrderDate) AS SalesYear,
      SUM(od.Quantity) AS TotalQuantity
  FROM Products AS p
  JOIN [Order Details] AS od ON p.ProductID = od.ProductID
  JOIN Orders AS o ON od.OrderID = o.OrderID
  GROUP BY p.ProductID, p.ProductName, YEAR(o.OrderDate);

  SELECT * FROM ProductSalesPerYear;
  ```
- **Explanation**: Encapsulates year-over-year quantity aggregations into a persistent database view for simplified downstream analytical querying.

---

### Query 22 - Employees Handling Over $100k Sales
- **File**: [`22_high_performing_employees.sql`](22_high_performing_employees.sql)
- **Objective**: Find top-performing account representatives whose total cumulative sales exceed $100,000.
- **SQL Concepts**: Multi-table `JOIN`, `SUM(Quantity * UnitPrice)`, `HAVING` threshold.
- **Code**:
  ```sql
  USE Northwind;

  SELECT 
      e.EmployeeID,
      e.FirstName + ' ' + e.LastName AS EmployeeName,
      SUM(od.Quantity * od.UnitPrice) AS TotalSales
  FROM Employees AS e
  JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
  JOIN [Order Details] AS od ON o.OrderID = od.OrderID
  GROUP BY e.EmployeeID, e.FirstName, e.LastName
  HAVING SUM(od.Quantity * od.UnitPrice) > 100000
  ORDER BY TotalSales DESC;
  ```
- **Explanation**: Aggregates gross revenue per employee and isolates representatives exceeding the $100,000 threshold.

---

### Query 23 - Top 3 Products by Total Sales per Month
- **File**: [`23_top_3_products_per_month.sql`](23_top_3_products_per_month.sql)
- **Objective**: Identify the top 3 best-selling products for every calendar month in the dataset.
- **SQL Concepts**: CTE, `DATEFROMPARTS()`, `ROW_NUMBER() OVER (PARTITION BY month ORDER BY sales DESC)`.
- **Code**:
  ```sql
  USE Northwind;

  WITH MonthlySales AS (
      SELECT 
          DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS SalesMonth,
          p.ProductID,
          p.ProductName,
          SUM(od.Quantity * od.UnitPrice) AS TotalSales,
          ROW_NUMBER() OVER (PARTITION BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) 
                             ORDER BY SUM(od.Quantity * od.UnitPrice) DESC) AS SalesRank
      FROM Products AS p
      JOIN [Order Details] AS od ON p.ProductID = od.ProductID
      JOIN Orders AS o ON od.OrderID = o.OrderID
      GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1), p.ProductID, p.ProductName
  )
  SELECT SalesMonth, ProductID, ProductName, TotalSales
  FROM MonthlySales
  WHERE SalesRank <= 3
  ORDER BY SalesMonth, SalesRank;
  ```
- **Explanation**: Ranks products independently within each month partition via `ROW_NUMBER()`, retrieving rank 1..3 products for each monthly slice.

---

### Query 24 - User-Defined Function: Product Total Sales
- **File**: [`24_fn_get_total_sales_for_product.sql`](24_fn_get_total_sales_for_product.sql)
- **Objective**: Create a scalar User-Defined Function (UDF) `dbo.GetTotalSalesForProduct` returning cumulative revenue for a specified `ProductID`.
- **SQL Concepts**: `CREATE FUNCTION`, Scalar Return Type, `ISNULL()`.
- **Code**:
  ```sql
  USE Northwind;

  CREATE FUNCTION dbo.GetTotalSalesForProduct
  (
      @ProductID INT
  )
  RETURNS DECIMAL(18,2)
  AS
  BEGIN
      DECLARE @TotalSales DECIMAL(18,2);

      SELECT @TotalSales = SUM(Quantity * UnitPrice)
      FROM [Order Details]
      WHERE ProductID = @ProductID;

      RETURN ISNULL(@TotalSales, 0);
  END;

  -- Execution Example:
  SELECT dbo.GetTotalSalesForProduct(5) AS TotalSales;
  ```
- **Explanation**: Encapsulates single-product revenue calculations into a reusable T-SQL function, handling zero-sales edge cases cleanly with `ISNULL()`.

---

### Query 25 - Orders Exceeding Average Order Amount
- **File**: [`25_orders_above_avg_amount.sql`](25_orders_above_avg_amount.sql)
- **Objective**: Find all order records whose total invoice amount is strictly greater than the overall average order value across the entire database.
- **SQL Concepts**: CTEs, `CROSS JOIN`, Aggregate comparison.
- **Code**:
  ```sql
  USE Northwind;

  WITH OrderTotals AS (
      SELECT 
          OrderID,
          SUM(UnitPrice * Quantity) AS TotalAmount
      FROM [Order Details]
      GROUP BY OrderID
  )
  SELECT 
      o.OrderID,
      o.OrderDate,
      o.CustomerID,
      ot.TotalAmount
  FROM Orders o
  JOIN OrderTotals ot ON o.OrderID = ot.OrderID
  CROSS JOIN (
      SELECT AVG(TotalAmount) AS AvgOrderAmount
      FROM OrderTotals
  ) AS AvgOrder
  WHERE ot.TotalAmount > AvgOrder.AvgOrderAmount
  ORDER BY ot.TotalAmount DESC;
  ```
- **Explanation**: Computes individual order sums in a CTE, evaluates global order average in a subquery, and returns orders exceeding that baseline.

---

### Query 26 - Create Non-Clustered Index on OrderDate
- **File**: [`26_index_orders_orderdate.sql`](26_index_orders_orderdate.sql)
- **Objective**: Optimize date-based filtering and sorting performance on the `Orders` table by creating a non-clustered index.
- **SQL Concepts**: `CREATE NONCLUSTERED INDEX`, Performance Optimization.
- **Code**:
  ```sql
  USE Northwind;

  CREATE NONCLUSTERED INDEX INDEX_Orders_OrderDate
  ON Orders (OrderDate);
  ```
- **Explanation**: Adds a non-clustered B-tree index on `Orders.OrderDate`, speeding up date-range scans and range filtering (`BETWEEN`, `>`, `<`).

---

### Query 27 - YoY Category Sales Percentage Increase
- **File**: [`27_yoy_category_sales_increase.sql`](27_yoy_category_sales_increase.sql)
- **Objective**: Compute Year-over-Year (YoY) percentage sales growth for each product category compared against the prior year.
- **SQL Concepts**: CTE, Self `LEFT JOIN` on `Year = PriorYear + 1`, `CASE` handling for zero division.
- **Code**:
  ```sql
  USE Northwind;

  WITH YearlyCategorySales AS (
      SELECT 
          c.CategoryID,
          c.CategoryName,
          YEAR(o.OrderDate) AS SalesYear,
          SUM(od.UnitPrice * od.Quantity) AS TotalSales
      FROM Categories c
      JOIN Products p ON c.CategoryID = p.CategoryID
      JOIN [Order Details] od ON p.ProductID = od.ProductID
      JOIN Orders o ON od.OrderID = o.OrderID
      GROUP BY c.CategoryID, c.CategoryName, YEAR(o.OrderDate)
  )
  SELECT 
      y1.CategoryID,
      y1.CategoryName,
      y1.SalesYear,
      y1.TotalSales,
      y0.TotalSales AS PreviousYearSales,
      CASE 
          WHEN y0.TotalSales IS NULL OR y0.TotalSales = 0 THEN NULL
          ELSE (y1.TotalSales - y0.TotalSales) / y0.TotalSales * 100 
      END AS PercentageIncrease
  FROM YearlyCategorySales y1
  LEFT JOIN YearlyCategorySales y0 ON y1.CategoryID = y0.CategoryID 
                                   AND y1.SalesYear = y0.SalesYear + 1
  ORDER BY y1.CategoryID, y1.SalesYear;
  ```
- **Explanation**: Aggregates sales per category-year inside a CTE, self-joins current year (`y1`) with prior year (`y0`), and computes growth percentage with safety checks against division-by-zero errors.
