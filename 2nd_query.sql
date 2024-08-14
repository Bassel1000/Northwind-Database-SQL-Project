USE Northwind
-- 2-List all orders along with customer and employee details. 
SELECT o.OrderID, c.CompanyName , c.ContactName, 
       e.FirstName + ' ' + e.LastName AS EmployeeName, e.EmployeeID
FROM Orders AS o
JOIN Customers AS c ON o.CustomerID = c.CustomerID
JOIN Employees AS e ON o.EmployeeID = e.EmployeeID;

