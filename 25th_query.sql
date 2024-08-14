USE Northwind
--25-Write a query to find all orders where the total order amount exceeds the average order amount. 
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