USE Northwind
--23-Write a query to find the top three products with the highest total sales amount each month. 
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