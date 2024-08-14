USE Northwind
--8-Format the order date to 'DD-MM-YYYY' format for all orders. 
SELECT OrderID, 
       CONVERT(VARCHAR(10), OrderDate, 105) AS FormattedOrderDate
FROM Orders;