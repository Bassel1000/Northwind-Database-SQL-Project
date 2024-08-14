USE Northwind
--3-List the total number of orders for each customer, sorted by the number of orders in descending order. Include only customers with more than 10 orders.

SELECT c.CompanyName, COUNT(o.OrderID) AS TotalOrders
FROM Customers AS c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
HAVING COUNT(o.OrderID) > 10
ORDER BY TotalOrders DESC;