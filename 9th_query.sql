USE Northwind
--9-Find the total sales amount (Quantity * Unit Price) for each employee, grouped by employee. 
SELECT e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName,
       SUM(od.Quantity * od.UnitPrice) AS TotalSalesAmount
FROM Employees AS e
JOIN Orders AS o ON e.EmployeeID = o.EmployeeID
JOIN [Order Details] AS od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSalesAmount;