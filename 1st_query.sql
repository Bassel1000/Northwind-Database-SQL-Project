USE Northwind
-- 1-Retrieve the list of all products with their respective categories and suppliers. 
SELECT p.ProductName, c.CategoryName, s.CompanyName AS SupplierName
FROM Products AS p
JOIN Categories AS c ON p.CategoryID = c.CategoryID
JOIN Suppliers AS s ON p.SupplierID = s.SupplierID;