USE Northwind
--22-Write a query to find the employees who have handled orders totaling more than $100,000 in sales. 
SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] AS od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING SUM(od.Quantity * od.UnitPrice) > 100000
ORDER BY TotalSales DESC;