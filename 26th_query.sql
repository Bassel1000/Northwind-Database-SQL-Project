USE Northwind
--26-Create an index to optimize the query performance for retrieving order details based on order date. 
CREATE NONCLUSTERED INDEX INDEX_Orders_OrderDate
ON Orders (OrderDate);

