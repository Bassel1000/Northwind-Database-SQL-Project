USE Northwind
--6-Delete all orders placed before January 1, 1997.
DELETE FROM [Order Details]
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE OrderDate < '1997-01-01');

DELETE FROM Orders
WHERE OrderDate < '1997-01-01';

--show results
Select OrderID from Orders where OrderDate < '1997-01-01'

