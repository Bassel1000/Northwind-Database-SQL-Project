USE Northwind
--21-Create a view that shows the total quantity of each product sold per year. 
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

--See the results
select * from ProductSalesPerYear