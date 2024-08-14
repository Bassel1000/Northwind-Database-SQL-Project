USE Northwind
--19-Write a query to find all customers who have placed more than five orders in the last year. 
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > YEAR(1998)
GROUP BY c.CustomerID, c.CompanyName
HAVING COUNT(o.OrderID) > 5;
