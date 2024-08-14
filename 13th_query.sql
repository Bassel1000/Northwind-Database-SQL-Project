USE Northwind
--13-List the top 3 employees with the highest total sales.
SELECT TOP 3 e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName,
       SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] AS od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;