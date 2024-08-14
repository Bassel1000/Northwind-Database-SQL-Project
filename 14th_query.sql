USE Northwind
--14-Create a pivot table that shows the total sales amount for each category per year. 
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