USE Northwind
--10-List products that have never been ordered.
SELECT p.ProductID, p.ProductName
FROM Products AS p
LEFT JOIN [Order Details] AS od ON p.ProductID = od.ProductID
WHERE od.OrderID IS NULL;