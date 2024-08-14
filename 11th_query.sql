USE Northwind
--11-Create a Common Table Expression (CTE) that lists the top 5 products by sales amount. 
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