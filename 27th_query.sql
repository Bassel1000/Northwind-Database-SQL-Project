USE Northwind
--27-Write a query to find the percentage increase in total sales for each category from the previous year
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