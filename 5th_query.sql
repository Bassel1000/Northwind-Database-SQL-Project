USE Northwind
--5-Update the unit price of all products in the 'Beverages' category by 10%. 
UPDATE Products
SET UnitPrice = UnitPrice * 1.10
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages');

select * from Products where CategoryID = 1