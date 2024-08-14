USE Northwind
--18-Retrieve the details of the five most recent orders, including order date and customer details. 
SELECT TOP 5 
    o.OrderID,
    o.OrderDate,
    c.CompanyName,
    c.ContactName,
    c.Country
FROM Orders AS o
JOIN Customers AS c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;