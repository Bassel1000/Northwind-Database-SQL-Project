USE Northwind
--12-Combine the list of customers and suppliers into a single list of companies. 
SELECT CompanyName, 'Customer' AS CompanyType
FROM Customers
UNION ALL
SELECT CompanyName, 'Supplier' AS CompanyType
FROM Suppliers;