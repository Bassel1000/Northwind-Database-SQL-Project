USE Northwind
--20-Write a query to find the average time (in days) between orders for each customer. 
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