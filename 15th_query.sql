USE Northwind
--15-Write a stored procedure to retrieve the sales report for a given date range. 
CREATE PROCEDURE GetSalesReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        c.CompanyName AS CustomerName,
        p.ProductName,
        od.Quantity,
        od.UnitPrice,
        od.Quantity * od.UnitPrice AS TotalAmount
    FROM Orders AS o
    JOIN Customers AS c ON o.CustomerID = c.CustomerID
    JOIN [Order Details] AS od ON o.OrderID = od.OrderID
    JOIN Products AS p ON od.ProductID = p.ProductID
    WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
    ORDER BY o.OrderDate;
END;



DECLARE @StartDate DATE = '1997-01-01';
DECLARE @EndDate DATE = '1998-01-01';

EXEC GetSalesReport @StartDate, @EndDate;
